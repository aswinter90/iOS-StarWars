//
//  NetworkService.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol Networking {
    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T
}

class NetworkService {
    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws(NetworkServiceError) -> T {
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)

            guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
                throw NetworkServiceError.generic
            }

            switch httpURLResponse.statusCode {
            case 200...299:
                let response = try JSONDecoder().decode(T.self, from: data)
                return response
            default:
                throw NetworkServiceError.generic
            }
        } catch let error as URLError {
            switch error.code {
            case .timedOut:
                throw NetworkServiceError.timeout
            case .networkConnectionLost, .notConnectedToInternet:
                throw NetworkServiceError.connectionIssue
            default:
                throw NetworkServiceError.generic
            }
        } catch let error as DecodingError {
            debugPrint(error)
            throw NetworkServiceError.decodingFailed(description: error.localizedDescription)
        } catch {
            throw NetworkServiceError.generic
        }
    }
}

enum NetworkServiceError: LocalizedError {
    case connectionIssue
    case timeout
    case decodingFailed(description: String)
    case generic
}
