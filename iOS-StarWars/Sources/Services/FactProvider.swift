//
//  FactProvider.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol FactProviding: Sendable {
    func fetchFilms() async throws(CommonError) -> FactListResponse<Film>
    func fetchFact<Response: PresentableModel>(for url: URL) async throws(CommonError) -> Response
}

final class FactProvider: FactProviding {
    private let endpointProvider: EndpointProviding
    private let networkService: Networking

    init(endpointProvider: EndpointProviding, networkService: Networking) {
        self.endpointProvider = endpointProvider
        self.networkService = networkService
    }

    func fetchFilms() async throws(CommonError) -> FactListResponse<Film> {
        let url = endpointProvider.makeURL(for: .films)
        return try await networkService.fetch(FactListResponse<Film>.self, from: url)
    }

    func fetchFact<Response: PresentableModel>(for url: URL) async throws(CommonError) -> Response {
        try await networkService.fetch(Response.self, from: url)
    }
}
