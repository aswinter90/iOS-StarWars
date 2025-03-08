//
//  FilmPagerViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum FilmPagerState {
    case loading
    case loaded([Film])
    case error(CommonError)
}

protocol FilmPagerInteracting {
    var state: FilmPagerState { get }
    var navigationTitle: String { get }
    var factProvider: FactProviding { get }
    func fetchFilms() async
}

@Observable class FilmPagerViewModel: FilmPagerInteracting {
    private(set) var state: FilmPagerState = .loading
    let navigationTitle: String = "Star Wars Films"
    let factProvider: FactProviding

    init(factProvider: FactProviding) {
        self.factProvider = factProvider

        Task { await fetchFilms() }
    }

    @MainActor
    func fetchFilms() async {
        state = .loading

        // Min duration for loading indicator to be displayed
        try? await Task.sleep(seconds: 1)

        do {
            let filmResponse: FactListResponse<Film> = try await factProvider.fetchFilms()

            if filmResponse.results.isEmpty {
                state = .error(.emptyResponse)
            } else {
                state = .loaded(filmResponse.results)
            }
        } catch {
            state = .error(error)
        }
    }
}
