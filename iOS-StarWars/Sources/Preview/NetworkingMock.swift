//
//  NetworkingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 08.03.25.
//

import Foundation

class NetworkingMock: Networking {
    var fetchResult: Any?
    var fetchError: CommonError?

    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws(CommonError) -> T {
        if let error = fetchError {
            throw error
        }
        if let result = fetchResult as? T {
            return result
        }

        throw CommonError.generic()
    }
}
