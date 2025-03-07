//
//  Fact.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

enum Fact: String {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles

    var responseModelType: any PresentableModel.Type {
        switch self {
        case .films:
            Film.self
        case .people:
            Character.self
        case .planets:
            Planet.self
        case .species:
            Species.self
        case .starships:
            Starship.self
        case .vehicles:
            Vehicle.self
        }
    }
}
