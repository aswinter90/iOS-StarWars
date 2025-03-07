//
//  NameContaining.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol PresentableModel: Codable, Hashable, Identifiable {}

extension PresentableModel {
    var fields: [(String, Any)] {
        Mirror(reflecting: self)
            .children
            .compactMap { child in
                (child.label ?? "", child.value)
            }
    }
}
