//
//  Film.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

struct Film: PresentableModel {
    var name: String { title }
    var id: URL { url }

    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let species: [URL]
    let starships: [URL]
    let vehicles: [URL]
    let characters: [URL]
    let planets: [URL]
    let url: URL
    let created: Date
    let edited: Date

    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case vehicles
        case characters
        case planets
        case url
        case created
        case edited
    }
}
