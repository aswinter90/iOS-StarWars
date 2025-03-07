//
//  DetailsView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct DetailsView: View {
    let viewModel: DetailsViewModel

    var body: some View {
        List {
            ForEach(viewModel.listFields, id: \.key) { field in
                switch field.value {
                case let .string(text):
                    TextListItem(key: field.key, value: text)
                case let .urls(urls):
                    UrlsListItem(key: field.key, urls: urls)
                }
            }
        }
        .navigationTitle("Details")
    }
}

#Preview {
    NavigationStack {
        DetailsView(viewModel: .init(model: PreviewData.film, factProvider: FactProvidingMock()))
    }
}
