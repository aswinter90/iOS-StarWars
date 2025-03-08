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
}

extension StarWarsFact {
    /// Try to create a StarWarsFact from a URL path. The path should have the following format: `/api/films/1/`
    init?(from resourceURL: URL) {
        let pathComponents = resourceURL.pathComponents.filter { $0 != "/" }

        guard pathComponents.count >= 2 else {
            return nil
        }

        let resource = pathComponents[pathComponents.count - 2]
        self.init(rawValue: resource)
    }
}
