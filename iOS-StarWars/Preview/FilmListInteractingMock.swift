//
//  FilmListInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

class FilmListInteractingMock: FilmPagerInteracting {
    @Published var state: FilmPagerState
    var factProvider: FactProviding = FactProvidingMock()

    init(state: FilmPagerState = .loaded(PreviewData.films)) {
        self.state = state
    }

    @MainActor
    func fetchFilms() async {
        state = .loading
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        state = .loaded(PreviewData.films)
    }
}
