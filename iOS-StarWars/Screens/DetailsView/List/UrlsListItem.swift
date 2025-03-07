//
//  UrlsListItem.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct UrlsListItem: View {
    @ObservedObject private var viewModel: UrlsListItemViewModel

    init(viewModel: UrlsListItemViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        DisclosureGroup {
            switch viewModel.state {
            case .loading:
                VStack(alignment: .leading) {
                    ForEach(viewModel.urls, id: \.absoluteString) { url in
                        Text(url.absoluteString)
                            .font(.subheadline)
                            .redacted(reason: .placeholder)
                    }
                }
                .task {
                    await viewModel.fetchModels()
                }
            case let .loaded(models):
                ForEach(models, id: \.name) { model in
                    NavigationLink {
                        DetailsView(
                            viewModel: .init(
                                model: model,
                                factProvider: viewModel.factProvider
                            )
                        )
                    } label: {
                        Text(model.name)
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }
                }
            case let .error(error):
                Text(error.localizedDescription)
            }
        } label: {
            Text(viewModel.key.capitalized)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    List {
        UrlsListItem(
            viewModel: .init(
                key: "Planets",
                urls: [URL(string: "https://swapi.dev/api/planets/1/")!],
                factProvider: FactProvidingMock()
            )
        )
    }
}

class UrlsListItemViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(models: [any PresentableModel])
        case error(Error)
    }

    let factProvider: FactProviding

    let key: String
    let urls: [URL]
    @Published var state = State.loading

    init(key: String, urls: [URL], factProvider: FactProviding) {
        self.key = key
        self.urls = urls
        self.factProvider = factProvider
    }

    func fetchModels() async {
        await MainActor.run {
            state = .loading
        }

        // We assume that all URLs in the list point to the same resource type
        guard let firstURL = urls.first, let fact = fact(from: firstURL) else {
            return
        }

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
                state = .error(NSError(domain: "URLListItemViewModelErrorDomain", code: -1))
            } else {
                state = .loaded(models: models.compactMap { $0 })
            }
        }
    }

    private func fact(from url: URL) -> Fact? {
        let pathComponents = url.pathComponents.filter { $0 != "/" }

        guard pathComponents.count >= 2 else {
            return nil
        }

        let resource = pathComponents[pathComponents.count - 2]

        guard let fact = Fact(rawValue: resource) else {
            debugPrint("Error: Failed to determine response model from URL: \(url). Second to last path component does not match any known `Fact` case")
            return nil
        }

        return fact
    }
}
