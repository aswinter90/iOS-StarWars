//
//  FactProviderMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

class FactProvidingMock: FactProviding {
    func fetchCharacters() async throws -> FactListResponse<Character> {
        FactListResponse(results: [PreviewData.character])
    }
    
    func fetchCharacter(named: String) async throws -> Character {
        PreviewData.character
    }
    
    func fetchFilms() async throws -> FactListResponse<Film> {
        FactListResponse(results: [PreviewData.film])
    }
    
    func fetchFilm(named: String) async throws -> Film {
        PreviewData.film
    }
    
    func fetchPlanets() async throws -> FactListResponse<Planet> {
        FactListResponse(results: [PreviewData.planet])
    }
    
    func fetchPlanet(named: String) async throws -> Planet {
        PreviewData.planet
    }
    
    func fetchAllSpecies() async throws -> FactListResponse<Species> {
        FactListResponse(results: [PreviewData.species])
    }
    
    func fetchSpecies(named: String) async throws -> Species {
        PreviewData.species
    }
    
    func fetchStarships() async throws -> FactListResponse<Starship> {
        FactListResponse(results: [PreviewData.starship])
    }
    
    func fetchStarship(named: String) async throws -> Starship {
        PreviewData.starship
    }
    
    func fetchVehicles() async throws -> FactListResponse<Vehicle> {
        FactListResponse(results: [PreviewData.vehicle])
    }
    
    func fetchVehicle(named: String) async throws -> Vehicle {
        PreviewData.vehicle
    }
}
