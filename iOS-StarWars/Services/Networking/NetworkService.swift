//
//  NetworkService.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

protocol Networking {
    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws(CommonError) -> T
}

class NetworkService {
    private static let maxNumberOfRetries = 3
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Formatters.iso8601Formatter)
        return decoder
    }()

    func fetch<T: Decodable>(_ type: T.Type, from url: URL, attempt: Int) async throws(CommonError) -> T {
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)

            guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
                throw CommonError.generic()
            }

            switch httpURLResponse.statusCode {
            case 200...299:
                let response = try decoder.decode(T.self, from: data)
                return response
            default:
                throw CommonError.generic()
            }
        } catch let error as URLError {
            if attempt < NetworkService.maxNumberOfRetries {
                return try await fetch(type, from: url, attempt: attempt + 1)
            }

            switch error.code {
            case .timedOut:
                throw CommonError.timeout
            case .networkConnectionLost, .notConnectedToInternet:
                throw CommonError.connectionIssue
            default:
                throw CommonError.generic()
            }
        } catch let error as DecodingError {
            debugPrint(error)
            throw CommonError.decodingFailed(description: error.localizedDescription)
        } catch {
            throw CommonError.generic()
        }
    }
}

extension NetworkService: Networking {
    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws(CommonError) -> T {
        try await fetch(T.self, from: url, attempt: 0)
    }
}
