//
//  DetailsViewInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import Foundation

class DetailsViewInteractingMock: DetailsViewInteracting {
    var navigationTitle: String = "Details"

    var listFields: [DetailsListField]

    var factProvider: any FactProviding
    
    init(
        listFields: [DetailsListField] = [
            .init(key: "Name", value: .string("Luke Skywalker")),
            .init(key: "People", value: .urls([.init(string: "https://swapi.dev/api/people/1/")!]))
        ],
        factProvider: any FactProviding = FactProvidingMock()
    ) {
        self.listFields = listFields
        self.factProvider = factProvider
    }
}
