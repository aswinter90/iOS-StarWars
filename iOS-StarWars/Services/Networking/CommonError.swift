//
//  CommonError.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum CommonError: Error, Equatable {
    case connectionIssue
    case timeout
    case decodingFailed(description: String)
    case emptyResponse
    case unsupportedResourceURL(url: URL)
    case generic(description: String = "")

    var description: String {
        switch self {
        case .connectionIssue:
            "Please check your internet connection and try again."
        case .timeout:
            "The request timed out. Please try again later."
        case let .decodingFailed(description):
            "Failed to decode data from the server. Error: \(description)"
        case .emptyResponse:
            "The server returned no data. Please try again later."
        case let .unsupportedResourceURL(url):
            "The format or content of the provided resource URL is unexpected: \(url.absoluteString)"
        case let .generic(description):
            "An unexpected error occurred: \(description). Please try again later."
        }
    }
}
