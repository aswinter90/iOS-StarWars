//
//  NetworkServiceError.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum NetworkServiceError: LocalizedError {
    case connectionIssue
    case timeout
    case decodingFailed(description: String)
    case generic
}
