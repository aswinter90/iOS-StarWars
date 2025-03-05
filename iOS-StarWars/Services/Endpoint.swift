//
//  Endpoint.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum Endpoint {
    case allFilms
    case film(title: String)
    case allCharacters
    case character(name: String)
    case allStarships
    case starship(name: String)
    case allVehicles
    case vehicle(name: String)
    case allSpecies
    case species(name: String)
    case allPlanets
    case planet(name: String)

    var url: URL {
        baseURL.appendingPathComponent(path)
    }

    private var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api/") else {
            fatalError("Could not create base URL for Star Wars API. Shutting down.")
        }
        return url
    }

    private var path: String {
        switch self {
        case .allFilms:
            "films"
        case let .film(title):
            "films/\(title)"
        case .allCharacters:
            "people"
        case let .character(name):
            "people/\(name)"
        case .allStarships:
            "starships"
        case let .starship(name):
            "starships/\(name)"
        case .allVehicles:
            "vehicles"
        case let .vehicle(name):
            "vehicles/\(name)"
        case .allSpecies:
            "species"
        case let .species(name):
            "species/\(name)"
        case .allPlanets:
            "planets"
        case let .planet(name):
            "planets/\(name)"
        }
    }
}
