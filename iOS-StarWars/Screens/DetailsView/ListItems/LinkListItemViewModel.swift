//
//  LinkListItemViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import Foundation

enum LinkListItemState {
    case loading(placeholders: [String])
    case loaded(models: [any PresentableModel])
    case error(CommonError)
}

protocol LinkListItemInteracting {
    var state: LinkListItemState { get }
    var key: String { get }
    var factProvider: FactProviding { get }
    func fetchModels() async
}

@Observable class LinkListItemViewModel: LinkListItemInteracting {
    private(set) var state: LinkListItemState
    let key: String
    let factProvider: FactProviding

    private let urls: [URL]

    init(key: String, urls: [URL], factProvider: FactProviding) {
        self.state = .loading(placeholders: urls.map { $0.absoluteString })
        self.key = key
        self.urls = urls
        self.factProvider = factProvider
    }

    func fetchModels() async {
        await MainActor.run {
            state = .loading(placeholders: urls.map { $0.absoluteString })
        }

        guard let firstURL = urls.first else {
            return
        }

        // For simplicity we assume that all URLs in the list point to the same resource type
        guard let fact = StarWarsFact(from: firstURL) else {
            debugPrint("Error: Failed to determine response model from URL: \(firstURL). Second to last path component does not match any known `StarWarsFact`")
            return
        }

        // After trying to make this huge statement more generic, I decided to go with a pragmatic approach.
        // Task Groups are difficult to handle and do not lightly accept protocols like the `PresentableModel` as result type, which would save a lot of redundancy here.
        // Specific errors thrown inside the task groups are also ignored on purpose.
        let models: [(any PresentableModel)?] = switch fact {
        case .films:
            await withTaskGroup(of: Film?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Film]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        case .people:
            await withTaskGroup(of: Character?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Character]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        case .planets:
            await withTaskGroup(of: Planet?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Planet]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        case .species:
            await withTaskGroup(of: Species?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Species]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        case .starships:
            await withTaskGroup(of: Starship?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Starship]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        case .vehicles:
            await withTaskGroup(of: Vehicle?.self) { taskGroup in
                urls.forEach { url in
                    taskGroup.addTask {
                        try? await self.factProvider.fetchFact(for: url)
                    }
                }

                var results = [Vehicle]()
                for await value in taskGroup {
                    value.map { results.append($0) }
                }

                return results
            }
        }

        await MainActor.run {
            if models.isEmpty {
                state = .error(.generic(description: "Failed to load data for \(key) section."))
            } else {
                state = .loaded(models: models.compactMap { $0 })
            }
        }
    }
}
