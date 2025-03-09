//
//  FilmPagerViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum FilmPagerState: Equatable {
    case loading
    case loaded([Film])
    case error(CommonError)
}

protocol FilmPagerInteracting {
    var state: FilmPagerState { get }
    var navigationTitle: String { get }
    var factProvider: FactProviding { get }
    @MainActor func fetchFilms() async
}

@Observable class FilmPagerViewModel: FilmPagerInteracting {
    private(set) var state: FilmPagerState = .loading
    let navigationTitle: String = "Star Wars Films"
    let factProvider: FactProviding

    init(factProvider: FactProviding) {
        self.factProvider = factProvider
    }

    @MainActor
    func fetchFilms() async {
        state = .loading

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
