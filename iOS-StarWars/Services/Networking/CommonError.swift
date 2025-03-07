//
//  NetworkServiceError.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum CommonError: Error {
    case connectionIssue
    case timeout
    case decodingFailed(description: String)
    case generic(description: String = "")

    var description: String {
        switch self {
        case .connectionIssue:
            "Please check your internet connection and try again."
        case .timeout:
            "The request timed out. Please try again later."
        case let .decodingFailed(description):
            "Failed to decode data from the server. Error: \(description)"
        case let .generic(description):
            "An unexpected error occurred: \(description). Please try again later."
        }
    }
}
