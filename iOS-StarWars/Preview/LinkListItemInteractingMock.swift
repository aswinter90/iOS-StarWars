//
//  LinkListItemInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import Foundation

class LinkListItemInteractingMock: LinkListItemInteracting {
    var state: LinkListItemState
    var key: String
    var factProvider: any FactProviding = FactProvidingMock()

    init(
        state: LinkListItemState = .loaded(models: [PreviewData.species]),
        key: String = "Species"
    ) {
        self.state = state
        self.key = key
    }

    func fetchModels() async {
        state = .loading(placeholders: ["https://swapi.dev/api/species/1/"])

        try? await Task.sleep(nanoseconds: 1_000_000)

        state = .loaded(models: [PreviewData.species])
    }
}
