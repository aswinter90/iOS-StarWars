//
//  FactListViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum FilmListState {
    case loading
    case loaded([Film])
    case error(Error)
}

protocol FilmListInteracting: ObservableObject {
    var state: FilmListState { get }

    func fetchFilms() async
}

class FilmListViewModel: FilmListInteracting {
    private let factProvider: FactProviding

    @Published private(set) var state: FilmListState = .loading

    init(factProvider: FactProviding) {
        self.factProvider = factProvider
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
