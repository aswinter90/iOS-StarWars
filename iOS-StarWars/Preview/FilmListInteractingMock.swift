//
//  FilmListInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

@Observable class FilmListInteractingMock: FilmPagerInteracting {
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
    func fetchFilms() async {
        state = .loading
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        state = .loaded(PreviewData.films)
    }
}
