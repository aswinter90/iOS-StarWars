//
//  FactProvider.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol FactProviding {
    func fetchFilms() async throws -> [Film]
    func fetchFilm(title: String) async throws -> Film
    func fetchCharacters() async throws -> [Character]
    func fetchCharacter(name: String) async throws -> Character
    func fetchStarships() async throws -> [Starship]
    func fetchStarShip(name: String) async throws -> Starship
    func fetchVehicles() async throws -> [Vehicle]
    func fetchVehicle(name: String) async throws -> Vehicle
    func fetchSpecies() async throws -> [Species]
    func fetchSpecies(name: String) async throws -> Species
    func fetchPlanets() async throws -> [Planet]
    func fetchPlanet(name: String) async throws -> Planet
}

class FactProvider: FactProviding {
    private let networkService: Networking

    init(networkService: Networking) {
        self.networkService = networkService
    }

    func fetchFilms() async throws -> [Film] {
        try await fetchResponse([Film].self, from: .allFilms)
    }

    func fetchFilm(title: String) async throws -> Film {
        try await fetchResponse(Film.self, from: .film(title: title))
    }

    func fetchCharacters() async throws -> [Character] {
        try await fetchResponse([Character].self, from: .allCharacters)
    }

    func fetchCharacter(name: String) async throws -> Character {
        try await fetchResponse(Character.self, from: .character(name: name))
    }

    func fetchStarships() async throws -> [Starship] {
        try await fetchResponse([Starship].self, from: .allStarships)
    }

    func fetchStarShip(name: String) async throws -> Starship {
        try await fetchResponse(Starship.self, from: .starship(name: name))
    }

    func fetchVehicles() async throws -> [Vehicle] {
        try await fetchResponse([Vehicle].self, from: .allVehicles)
    }

    func fetchVehicle(name: String) async throws -> Vehicle {
        try await fetchResponse(Vehicle.self, from: .vehicle(name: name))
    }

    func fetchSpecies() async throws -> [Species] {
        try await fetchResponse([Species].self, from: .allSpecies)
    }

    func fetchSpecies(name: String) async throws -> Species {
        try await fetchResponse(Species.self, from: .species(name: name))
    }

    func fetchPlanets() async throws -> [Planet] {
        try await fetchResponse([Planet].self, from: .allPlanets)
    }

    func fetchPlanet(name: String) async throws -> Planet {
        try await fetchResponse(Planet.self, from: .planet(name: name))
    }

    private func fetchResponse<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        try await networkService.fetch(T.self, from: endpoint.url)
    }
}
