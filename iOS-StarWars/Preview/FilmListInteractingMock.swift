//
//  FilmListInteractingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

class FilmListInteractingMock: FilmListInteracting {
    @Published var state: FilmListState = .loading

    @MainActor
    func fetchFilms() async {
        state = .loading
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        state = .loaded(PreviewData.films)
    }
}
