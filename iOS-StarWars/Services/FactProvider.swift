//
//  FactProvider.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol FactProviding {
    func fetchCharacters() async throws -> FactListResponse<Character>
    func fetchCharacter(named: String) async throws -> Character
    func fetchFilms() async throws -> FactListResponse<Film>
    func fetchFilm(named: String) async throws -> Film
    func fetchPlanets() async throws -> FactListResponse<Planet>
    func fetchPlanet(named: String) async throws -> Planet
    func fetchAllSpecies() async throws -> FactListResponse<Species>
    func fetchSpecies(named: String) async throws -> Species
    func fetchStarships() async throws -> FactListResponse<Starship>
    func fetchStarship(named: String) async throws -> Starship
    func fetchVehicles() async throws -> FactListResponse<Vehicle>
    func fetchVehicle(named: String) async throws -> Vehicle

    func fetchFact<Response: PresentableModel>(for url: URL) async throws -> Response
}

class FactProvider: FactProviding {
    private let endpointFactory: EndpointFactory
    private let networkService: Networking

    init(endpointFactory: EndpointFactory, networkService: Networking) {
        self.endpointFactory = endpointFactory
        self.networkService = networkService
    }

    func fetchCharacters() async throws -> FactListResponse<Character> {
        try await fetchResponse(fact: .people)
    }

    func fetchCharacter(named: String) async throws -> Character {
        try await fetchResponse(fact: .people, named: named)
    }

    func fetchFilms() async throws -> FactListResponse<Film> {
        try await fetchResponse(fact: .films)
    }

    func fetchFilm(named: String) async throws -> Film {
        try await fetchResponse(fact: .films, named: named)
    }

    func fetchPlanets() async throws -> FactListResponse<Planet> {
        try await fetchResponse(fact: .planets)
    }

    func fetchPlanet(named: String) async throws -> Planet {
        try await fetchResponse(fact: .planets, named: named)
    }

    func fetchAllSpecies() async throws -> FactListResponse<Species> {
        try await fetchResponse(fact: .species)
    }

    func fetchSpecies(named: String) async throws -> Species {
        try await fetchResponse(fact: .species, named: named)
    }

    func fetchStarships() async throws -> FactListResponse<Starship> {
        try await fetchResponse(fact: .starships)
    }

    func fetchStarship(named: String) async throws -> Starship {
        try await fetchResponse(fact: .starships, named: named)
    }

    func fetchVehicles() async throws -> FactListResponse<Vehicle> {
        try await fetchResponse(fact: .vehicles)
    }

    func fetchVehicle(named: String) async throws -> Vehicle {
        try await fetchResponse(fact: .vehicles, named: named)
    }

    func fetchFact<Response: PresentableModel>(for url: URL) async throws -> Response {
        try await networkService.fetch(Response.self, from: url)
    }
}

private extension FactProvider {
    func fetchResponse<T: Decodable>(fact: Fact, named: String? = nil) async throws -> T {
        let url = endpointFactory.makeURL(for: fact, queryParameter: named)
        return try await networkService.fetch(T.self, from: url)
    }
}
