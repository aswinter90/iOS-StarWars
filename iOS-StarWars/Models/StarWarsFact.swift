//
//  StarWarsFact.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum StarWarsFact: String {
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

extension StarWarsFact {
    init?(from resourceURL: URL) {
        let pathComponents = resourceURL.pathComponents.filter { $0 != "/" }

        guard pathComponents.count >= 2 else {
            return nil
        }

        let resource = pathComponents[pathComponents.count - 2]
        self.init(rawValue: resource)
    }
}
