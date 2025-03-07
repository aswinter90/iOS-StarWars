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

struct TextListItem: View {
    private static let verticalLayoutThreshold: CGFloat = 20

    let key: String
    let value: String

    @State private var shouldBeVerticalLayout = false

    var body: some View {
        detailsStack {
            Group {
                Text(key.capitalized)
                    .font(.headline)

                Spacer()

                Text(value)
                    .font(.subheadline)
                    .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
                    } action: { newSize in
                        shouldBeVerticalLayout = newSize.height > Self.verticalLayoutThreshold
                    }
            }
        }
    }

    @ViewBuilder
    private func detailsStack<Content: View>(_ content: () -> Content) -> some View {
        if shouldBeVerticalLayout {
            VStack(alignment: .leading) {
                content()
            }
            .padding(.vertical, 4)
        } else {
            HStack(alignment: .top) {
                content()
            }
        }
    }
}

struct UrlsListItem: View {
    let key: String
    let urls: [URL]

    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup {
            ForEach(urls, id: \.absoluteString) { url in
                Text(url.absoluteString)
                    .font(.subheadline)
            }
            .transition(.opacity)
        } label: {
            Text(key.capitalized)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NavigationStack {
        DetailsView(viewModel: .init(model: PreviewData.film, factProvider: FactProvidingMock()))
    }
}
