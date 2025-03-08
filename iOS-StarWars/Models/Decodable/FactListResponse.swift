//
//  FactResponse.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

struct FactListResponse<T: PresentableModel>: Decodable {
    let results: [T]
}
