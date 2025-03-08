//
//  EndpointFactory.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol EndpointProviding {
    func makeURL(for fact: StarWarsFact) -> URL
}

struct EndpointFactory: EndpointProviding {
    private let baseURL: URL = {
        guard let url = URL(string: "https://swapi.dev/api/") else {
            fatalError("Could not create base URL for Star Wars API. Shutting down.")
        }
        return url
    }()

    func makeURL(for fact: StarWarsFact) -> URL {
        baseURL.appendingPathComponent(fact.rawValue)
    }
}
