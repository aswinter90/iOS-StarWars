//
//  FactProvider.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol FactProviding {
    func fetchFilms() async throws(CommonError) -> FactListResponse<Film>
    func fetchFact<Response: PresentableModel>(for url: URL) async throws(CommonError) -> Response
}

class FactProvider: FactProviding {
    private let endpointProvider: EndpointProviding
    private let networkService: Networking

    init(endpointProvider: EndpointProviding, networkService: Networking) {
        self.endpointProvider = endpointProvider
        self.networkService = networkService
    }

    func fetchFilms() async throws(CommonError) -> FactListResponse<Film> {
        try await fetchResponse(fact: .films)
    }

    func fetchFact<Response: PresentableModel>(for url: URL) async throws(CommonError) -> Response {
        try await networkService.fetch(Response.self, from: url)
    }
}

private extension FactProvider {
    func fetchResponse<T: Decodable>(fact: StarWarsFact, named: String? = nil) async throws(CommonError) -> T {
        let url = endpointProvider.makeURL(for: fact, queryParameter: named)
        return try await networkService.fetch(T.self, from: url)
    }
}
