//
//  Species.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//


import Foundation

struct Species: Codable {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let averageLifespan: String
    let eyeColors: String
    let hairColors: String
    let skinColors: String
    let language: String
    let homeworld: URL?
    let people: [URL]
    let films: [URL]
    let url: URL
    let created: Date
    let edited: Date

    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case language
        case homeworld
        case people
        case films
        case url
        case created
        case edited
    }
}
