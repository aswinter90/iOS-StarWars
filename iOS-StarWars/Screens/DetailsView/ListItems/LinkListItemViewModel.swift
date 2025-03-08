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

    @MainActor func fetchModels() async {
        state = .loading(placeholders: urls.map { $0.absoluteString })

        guard let firstURL = urls.first else {
            state = .error(.generic(description: "Invalid resource URL"))
            return
        }

        // For simplicity we assume that all URLs in the list point to the same resource type
        guard let fact = StarWarsFact(from: firstURL) else {
            // swiftlint:disable:next line_length
            debugPrint("Error: Failed to determine response model from URL: \(firstURL). Second to last path component does not match any known `StarWarsFact`")
            state = .error(.unsupportedResourceURL(url: firstURL))
            return
        }

        // swiftlint:disable line_length
        // After trying to make this huge statement more generic, I decided to go with a pragmatic approach.
        // Task Groups are difficult to handle and do not lightly accept protocols like the `PresentableModel` as a result type, which would save a lot of redundancy here.
        // Specific errors thrown inside the task groups are also ignored on purpose.
        // swiftlint:enable line_length
        let models: [(any PresentableModel)?] = switch fact {
        case .films:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Film]
        case .people:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Character]
        case .planets:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Planet]
        case .species:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Species]
        case .starships:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Starship]
        case .vehicles:
            await TaskBundler.taskGroup(resourceUrls: urls, fetchingTask: { url in
                try await self.factProvider.fetchFact(for: url)
            }) as [Vehicle]
        }

        if models.isEmpty {
            state = .error(.emptyResponse)
        } else {
            state = .loaded(models: models.compactMap { $0 })
        }
    }
}
