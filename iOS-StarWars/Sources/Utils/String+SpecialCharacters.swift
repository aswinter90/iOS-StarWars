//
//  String+SpecialCharacters.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

extension String {
    var removingNewLineControlCharacters: String {
        self.replacingOccurrences(of: "\r\n", with: " ")
    }
}
