//
//  LinkListItem.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct LinkListItem<LinkListInteractor: LinkListItemInteracting>: View {
    @ObservedObject private var viewModel: LinkListInteractor
    @State private var isExpanded = true

    init(viewModel: LinkListInteractor, isExpanded: Bool = false) {
        self.viewModel = viewModel
        _isExpanded = State(initialValue: isExpanded)
    }

    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            switch viewModel.state {
            case let .loading(placeholders):
                loadingView(for: placeholders)
            case let .loaded(models):
                resultView(for: models)
            case let .error(error):
                ErrorView.init(
                    error: error,
                    onRetry: viewModel.fetchModels
                )
            }
        } label: {
            Text(viewModel.key.capitalized)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    func loadingView(for placeholders: [String]) -> some View {
        VStack(alignment: .leading) {
            ForEach(placeholders, id: \.self) {
                Text($0)
                    .font(.subheadline)
                    .redacted(reason: .placeholder)
            }
        }
        .task {
            await viewModel.fetchModels()
        }
    }

    func resultView(for models: [any PresentableModel]) -> some View {
        ForEach(models, id: \.name) { model in
            NavigationLink {
                DetailsView(
                    viewModel: DetailsViewModel(
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
    }
}

#Preview("Results") {
    NavigationStack {
        List {
            LinkListItem(viewModel: LinkListItemInteractingMock(), isExpanded: true)
        }
    }
}

#Preview("Loading") {
    NavigationStack {
        List {
            LinkListItem(
                viewModel:LinkListItemInteractingMock(
                    state: .loading(placeholders: ["This steak is a little on the chewier side"])
                ),
                isExpanded: true
            )
        }
    }
}

#Preview("Error") {
    NavigationStack {
        List {
            LinkListItem(
                viewModel:LinkListItemInteractingMock(
                    state: .error(.generic(description: "These are not the droids you are looking for"))
                ),
                isExpanded: true
            )
        }
    }
    .preferredColorScheme(.dark)
}
