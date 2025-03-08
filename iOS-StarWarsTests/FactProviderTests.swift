//
//  FactProviderTests.swift
//  iOS-StarWarsTests
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation
import Testing
@testable import iOS_StarWars

@Suite("FactProviderTests")
struct FactProviderTests {
    static let exampleResourceURL = URL(string: "https://swapi.dev/api/starships/21")!

    var endpointProvider = EndpointFactory()
    var networkServiceMock = NetworkingMock()

    var subject: FactProvider {
        FactProvider(endpointProvider: endpointProvider, networkService: networkServiceMock)
    }

    @Test
    func testFetchFilmsSuccess() async throws {
        let expectedResponse = FactListResponse(results: [PreviewData.film])

        networkServiceMock.fetchResult = expectedResponse

        let response: FactListResponse<Film> = try await subject.fetchFilms()

        assert(response == expectedResponse)
    }

    @Test
    func testFetchFilmsFailure() async throws {
        let expectedError = CommonError.decodingFailed(description: "The response body is malformed.")

        networkServiceMock.fetchError = expectedError

        do {
            _ = try await subject.fetchFilms()
        } catch  {
            assert(error == expectedError)
        }
    }

    @Test
    func testFetchFactSuccess() async throws {
        let expectedResponse = PreviewData.starship

        networkServiceMock.fetchResult = expectedResponse

        let response: Starship = try await subject.fetchFact(for: Self.exampleResourceURL)

        assert(response == expectedResponse)
    }

    @Test
    func testFetchFactFailure() async throws {
        let expectedError = CommonError.connectionIssue

        networkServiceMock.fetchError = expectedError

        do {
            _ = try await subject.fetchFact(for: Self.exampleResourceURL) as Starship
        } catch  {
            assert(error == expectedError)
        }
    }
}
