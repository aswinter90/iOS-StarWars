//
//  FactListViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum FilmPagerState {
    case loading
    case loaded([Film])
    case error(Error)
}

protocol FilmPagerInteracting: ObservableObject {
    var state: FilmPagerState { get }
    var factProvider: FactProviding { get }
    func fetchFilms() async
}

class FilmPagerViewModel: FilmPagerInteracting {
    let factProvider: FactProviding

    @Published private(set) var state: FilmPagerState = .loading

    init(factProvider: FactProviding) {
        self.factProvider = factProvider

        Task { await fetchFilms() }
    }

    @MainActor
    func fetchFilms() async {
        state = .loading

        do {
            let factResponse: FactListResponse<Film> = try await factProvider.fetchFilms()
            state = .loaded(factResponse.results)
        } catch {
            state = .error(error)
        }
    }
}
