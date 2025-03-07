//
//  TextListItem.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct TextListItem: View {
    let key: String
    let value: String

    var body: some View {
        LabeledContent {
            Text(value)
                .font(.subheadline)
        } label: {
            Text(key.capitalized)
                .font(.headline)
        }
    }
}

#Preview {
    List {
        TextListItem(key: "Author", value: "George Lucas")
    }
}
