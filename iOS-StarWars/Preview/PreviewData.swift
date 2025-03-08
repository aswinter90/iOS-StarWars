//
//  PreviewData.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

// swiftlint:disable line_length type_body_length
enum PreviewData {
    static let character: Character = """
        {
            "name": "Luke Skywalker",
            "height": "172",
            "mass": "77",
            "hair_color": "blond",
            "skin_color": "fair",
            "eye_color": "blue",
            "birth_year": "19BBY",
            "gender": "male",
            "homeworld": "https://swapi.dev/api/planets/1/",
            "films": [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/2/",
                "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/6/"
            ],
            "species": [],
            "vehicles": [
                "https://swapi.dev/api/vehicles/14/",
                "https://swapi.dev/api/vehicles/30/"
            ],
            "starships": [
                "https://swapi.dev/api/starships/12/",
                "https://swapi.dev/api/starships/22/"
            ],
            "created": "2014-12-09T13:50:51.644000Z",
            "edited": "2014-12-20T21:17:56.891000Z",
            "url": "https://swapi.dev/api/people/1/"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Character.self)

    static let film = """
       {
           "title": "A New Hope",
           "episode_id": 4,
           "opening_crawl": "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....",
           "director": "George Lucas",
           "producer": "Gary Kurtz, Rick McCallum",
           "release_date": "1977-05-25",
           "characters": [
               "https://swapi.dev/api/people/1/",
               "https://swapi.dev/api/people/2/",
               "https://swapi.dev/api/people/3/",
               "https://swapi.dev/api/people/4/",
               "https://swapi.dev/api/people/5/",
               "https://swapi.dev/api/people/6/",
               "https://swapi.dev/api/people/7/",
               "https://swapi.dev/api/people/8/",
               "https://swapi.dev/api/people/9/",
               "https://swapi.dev/api/people/10/",
               "https://swapi.dev/api/people/12/",
               "https://swapi.dev/api/people/13/",
               "https://swapi.dev/api/people/14/",
               "https://swapi.dev/api/people/15/",
               "https://swapi.dev/api/people/16/",
               "https://swapi.dev/api/people/18/",
               "https://swapi.dev/api/people/19/",
               "https://swapi.dev/api/people/81/"
           ],
           "planets": [
               "https://swapi.dev/api/planets/1/",
               "https://swapi.dev/api/planets/2/",
               "https://swapi.dev/api/planets/3/"
           ],
           "starships": [
               "https://swapi.dev/api/starships/2/",
               "https://swapi.dev/api/starships/3/",
               "https://swapi.dev/api/starships/5/",
               "https://swapi.dev/api/starships/9/",
               "https://swapi.dev/api/starships/10/",
               "https://swapi.dev/api/starships/11/",
               "https://swapi.dev/api/starships/12/",
               "https://swapi.dev/api/starships/13/"
           ],
           "vehicles": [
               "https://swapi.dev/api/vehicles/4/",
               "https://swapi.dev/api/vehicles/6/",
               "https://swapi.dev/api/vehicles/7/",
               "https://swapi.dev/api/vehicles/8/"
           ],
           "species": [
               "https://swapi.dev/api/species/1/",
               "https://swapi.dev/api/species/2/",
               "https://swapi.dev/api/species/3/",
               "https://swapi.dev/api/species/4/",
               "https://swapi.dev/api/species/5/"
           ],
           "created": "2014-12-10T14:23:31.880000Z",
           "edited": "2014-12-20T19:49:45.256000Z",
           "url": "https://swapi.dev/api/films/1/"
       }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Film.self)

    static let film2 = """
        {
            "title": "The Empire Strikes Back",
            "episode_id": 5,
            "opening_crawl": "It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....",
            "director": "Irvin Kershner",
            "producer": "Gary Kurtz, Rick McCallum",
            "release_date": "1980-05-17",
            "characters": [
                "https://swapi.dev/api/people/1/",
                "https://swapi.dev/api/people/2/",
                "https://swapi.dev/api/people/3/",
                "https://swapi.dev/api/people/4/",
                "https://swapi.dev/api/people/5/",
                "https://swapi.dev/api/people/10/",
                "https://swapi.dev/api/people/13/",
                "https://swapi.dev/api/people/14/",
                "https://swapi.dev/api/people/18/",
                "https://swapi.dev/api/people/20/",
                "https://swapi.dev/api/people/21/",
                "https://swapi.dev/api/people/22/",
                "https://swapi.dev/api/people/23/",
                "https://swapi.dev/api/people/24/",
                "https://swapi.dev/api/people/25/",
                "https://swapi.dev/api/people/26/"
            ],
            "planets": [
                "https://swapi.dev/api/planets/4/",
                "https://swapi.dev/api/planets/5/",
                "https://swapi.dev/api/planets/6/",
                "https://swapi.dev/api/planets/27/"
            ],
            "starships": [
                "https://swapi.dev/api/starships/3/",
                "https://swapi.dev/api/starships/10/",
                "https://swapi.dev/api/starships/11/",
                "https://swapi.dev/api/starships/12/",
                "https://swapi.dev/api/starships/15/",
                "https://swapi.dev/api/starships/17/",
                "https://swapi.dev/api/starships/21/",
                "https://swapi.dev/api/starships/22/",
                "https://swapi.dev/api/starships/23/"
            ],
            "vehicles": [
                "https://swapi.dev/api/vehicles/8/",
                "https://swapi.dev/api/vehicles/14/",
                "https://swapi.dev/api/vehicles/16/",
                "https://swapi.dev/api/vehicles/18/",
                "https://swapi.dev/api/vehicles/19/",
                "https://swapi.dev/api/vehicles/20/"
            ],
            "species": [
                "https://swapi.dev/api/species/1/",
                "https://swapi.dev/api/species/2/",
                "https://swapi.dev/api/species/3/",
                "https://swapi.dev/api/species/6/",
                "https://swapi.dev/api/species/7/"
            ],
            "created": "2014-12-12T11:26:24.656000Z",
            "edited": "2014-12-15T13:07:53.386000Z",
            "url": "https://swapi.dev/api/films/2/"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Film.self)

    static let films = [Self.film, Self.film2]

    static let starship: Starship = """
        {
            "name": "Death Star",
            "model": "DS-1 Orbital Battle Station",
            "manufacturer": "Imperial Department of Military Research, Sienar Fleet Systems",
            "cost_in_credits": "1000000000000",
            "length": "120000",
            "max_atmosphering_speed": "n/a",
            "crew": "342,953",
            "passengers": "843,342",
            "cargo_capacity": "1000000000000",
            "consumables": "3 years",
            "hyperdrive_rating": "4.0",
            "MGLT": "10",
            "starship_class": "Deep Space Mobile Battlestation",
            "pilots": [],
            "films": [
                "https://swapi.dev/api/films/1/"
            ],
            "created": "2014-12-10T16:36:50.509000Z",
            "edited": "2014-12-20T21:26:24.783000Z",
            "url": "https://swapi.dev/api/starships/9/"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Starship.self)

    static let vehicle: Vehicle = """
        {
            "cargo_capacity": "50000",
            "consumables": "2 months",
            "cost_in_credits": "150000",
            "created": "2014-12-10T15:36:25.724000Z",
            "crew": "46",
            "edited": "2014-12-20T21:30:21.661000Z",
            "films": [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/5/"
            ],
            "length": "36.8 ",
            "manufacturer": "Corellia Mining Corporation",
            "max_atmosphering_speed": "30",
            "model": "Digger Crawler",
            "name": "Sand Crawler",
            "passengers": "30",
            "pilots": [
            ],
            "url": "https://swapi.dev/api/vehicles/4/",
            "vehicle_class": "wheeled"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Vehicle.self)

    static let species: Species = """
        {
            "average_height": "210",
            "average_lifespan": "400",
            "classification": "mammal",
            "created": "2014-12-10T16:44:31.486000Z",
            "designation": "sentient",
            "edited": "2014-12-20T21:36:42.142000Z",
            "eye_colors": "blue, green, yellow, brown, golden, red",
            "films": [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/2/",
                "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/6/"
            ],
            "hair_colors": "black, brown",
            "homeworld": "https://swapi.dev/api/planets/14/",
            "language": "Shyriiwook",
            "name": "Wookie",
            "people": [
                "https://swapi.dev/api/people/13/",
                "https://swapi.dev/api/people/80/"
            ],
            "skin_colors": "gray",
            "url": "https://swapi.dev/api/species/3/"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Species.self)

    static let planet: Planet = """
        {
            "climate": "arid",
            "created": "2014-12-09T13:50:49.641000Z",
            "diameter": "10465",
            "edited": "2014-12-20T20:58:18.411000Z",
            "films": [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/4/",
                "https://swapi.dev/api/films/5/",
                "https://swapi.dev/api/films/6/"
            ],
            "gravity": "1 standard",
            "name": "Tatooine",
            "orbital_period": "304",
            "population": "200000",
            "residents": [
                "https://swapi.dev/api/people/1/",
                "https://swapi.dev/api/people/2/",
                "https://swapi.dev/api/people/4/",
                "https://swapi.dev/api/people/6/",
                "https://swapi.dev/api/people/7/",
                "https://swapi.dev/api/people/8/",
                "https://swapi.dev/api/people/9/",
                "https://swapi.dev/api/people/11/",
                "https://swapi.dev/api/people/43/",
                "https://swapi.dev/api/people/62/"
            ],
            "rotation_period": "23",
            "surface_water": "1",
            "terrain": "desert",
            "url": "https://swapi.dev/api/planets/1/"
        }
    """
        .removingNewLineControlCharacters
        .data(using: .utf8)!
        .decoded(to: Planet.self)
}

private extension Data {
    // swiftlint:disable:next identifier_name
    func decoded<Response: Decodable>(to: Response.Type) -> Response {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Formatters.iso8601Formatter)
        // swiftlint:disable:next force_try
        return try! decoder.decode(Response.self, from: self)
    }
}
// swiftlint:enable line_length type_body_length
