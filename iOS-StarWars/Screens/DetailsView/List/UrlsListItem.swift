//
//  UrlsListItem.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

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
    List {
        UrlsListItem(key: "Links", urls: [URL(string: "https://www.swapi.com")!])
    }
}
