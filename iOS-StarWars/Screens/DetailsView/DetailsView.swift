//
//  DetailsView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

// swiftlint:disable:next generic_type_name
struct DetailsView<DetailsViewInteractor: DetailsViewInteracting>: View {
    let viewModel: DetailsViewInteractor

    var body: some View {
        List {
            ForEach(viewModel.listFields, id: \.key) { field in
                switch field.value {
                case let .string(text):
                    TextListItem(key: field.key, value: text)
                case let .urls(urls):
                    if urls.isEmpty {
                        EmptyView()
                    } else {
                        LinkListItem(
                            viewModel: LinkListItemViewModel(
                                key: field.key,
                                urls: urls,
                                factProvider: viewModel.factProvider
                            )
                        )
                    }
                }
            }
        }
        .navigationTitle(viewModel.navigationTitle)
    }
}

#Preview {
    NavigationStack {
        DetailsView(viewModel: DetailsViewInteractingMock())
    }
    .preferredColorScheme(.dark)
}
