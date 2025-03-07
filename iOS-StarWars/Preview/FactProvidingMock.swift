//
//  FactProviderMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

class FactProvidingMock: FactProviding {
    func fetchCharacters() async throws(CommonError) -> FactListResponse<Character> {
        FactListResponse(results: [PreviewData.character])
    }
    
    func fetchCharacter(named: String) async throws(CommonError) -> Character {
        PreviewData.character
    }
    
    func fetchFilms() async throws(CommonError) -> FactListResponse<Film> {
        FactListResponse(results: [PreviewData.film])
    }
    
    func fetchFilm(named: String) async throws(CommonError) -> Film {
        PreviewData.film
    }
    
    func fetchPlanets() async throws(CommonError) -> FactListResponse<Planet> {
        FactListResponse(results: [PreviewData.planet])
    }
    
    func fetchPlanet(named: String) async throws(CommonError) -> Planet {
        PreviewData.planet
    }
    
    func fetchAllSpecies() async throws(CommonError) -> FactListResponse<Species> {
        FactListResponse(results: [PreviewData.species])
    }
    
    func fetchSpecies(named: String) async throws(CommonError) -> Species {
        PreviewData.species
    }
    
    func fetchStarships() async throws(CommonError) -> FactListResponse<Starship> {
        FactListResponse(results: [PreviewData.starship])
    }
    
    func fetchStarship(named: String) async throws(CommonError) -> Starship {
        PreviewData.starship
    }
    
    func fetchVehicles() async throws(CommonError) -> FactListResponse<Vehicle> {
        FactListResponse(results: [PreviewData.vehicle])
    }
    
    func fetchVehicle(named: String) async throws(CommonError) -> Vehicle {
        PreviewData.vehicle
    }

    func fetchFact<Response>(for url: URL) async throws(CommonError) -> Response where Response : PresentableModel {
        PreviewData.planet as! Response
    }
}
