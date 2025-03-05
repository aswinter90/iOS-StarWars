//
//  Person.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//


import Foundation

struct Character: Codable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: String
    let mass: String
    let skinColor: String
    let homeworld: URL
    let films: [URL]
    let species: [URL]
    let starships: [URL]
    let vehicles: [URL]
    let url: URL
    let created: Date
    let edited: Date

    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case gender
        case hairColor = "hair_color"
        case height
        case mass
        case skinColor = "skin_color"
        case homeworld
        case films
        case species
        case starships
        case vehicles
        case url
        case created
        case edited
    }
}
