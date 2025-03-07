//
//  DetailsView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct DetailsView: View {
    let model: any PresentableModel

    var body: some View {
        List {
            ForEach(model.fields, id: \.0) { key, value in
                HStack(alignment: .top) {
                    DetailsListItem(key: key, value: "\(value)")
                }
            }
        }
        .navigationTitle("Details")
    }
}

struct DetailsListItem: View {
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

                Text("\(value)")
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

#Preview {
    NavigationStack {
        DetailsView(model: PreviewData.film)
    }
}
