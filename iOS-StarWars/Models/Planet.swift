//
//  Planet.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//


import Foundation

struct Planet: Codable {
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [URL]
    let films: [URL]
    let url: URL
    let created: Date
    let edited: Date

    enum CodingKeys: String, CodingKey {
        case name
        case diameter
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case gravity
        case population
        case climate
        case terrain
        case surfaceWater = "surface_water"
        case residents
        case films
        case url
        case created
        case edited
    }
}
