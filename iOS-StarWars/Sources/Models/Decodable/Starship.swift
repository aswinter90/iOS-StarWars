//
//  Starship.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

struct Starship: PresentableModel {
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case starshipClass = "starship_class"
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case crew
        case passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case cargoCapacity = "cargo_capacity"
        case consumables
        case films
        case pilots
        case url
        case created
        case edited
    }

    var id: URL { url }

    let name: String
    let model: String
    let starshipClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let hyperdriveRating: String
    let mglt: String
    let cargoCapacity: String
    let consumables: String
    let films: [URL]
    let pilots: [URL]
    let url: URL
    let created: Date
    let edited: Date
}
