//
//  Vehicle.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

struct Vehicle: PresentableModel {
    var id: URL { url }

    let name: String
    let model: String
    let vehicleClass: String
    let manufacturer: String
    let length: String
    let costInCredits: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let cargoCapacity: String
    let consumables: String
    let films: [URL]
    let pilots: [URL]
    let url: URL
    let created: Date
    let edited: Date

    enum CodingKeys: String, CodingKey {
        case name
        case model
        case vehicleClass = "vehicle_class"
        case manufacturer
        case length
        case costInCredits = "cost_in_credits"
        case crew
        case passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case consumables
        case films
        case pilots
        case url
        case created
        case edited
    }
}
