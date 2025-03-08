//
//  FilmListInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

@Observable class FilmListInteractingMock: FilmPagerInteracting {
    let navigationTitle = "Star Wars Films"
    var state: FilmPagerState
    var factProvider: any FactProviding

    init(
        state: FilmPagerState = .loaded(PreviewData.films),
        factProvider: any FactProviding = FactProvidingMock()
    ) {
        self.state = state
        self.factProvider = factProvider
    }

    @MainActor
    func fetchFilms() async {}
}
