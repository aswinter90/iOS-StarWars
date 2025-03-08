//
//  FilmPagerViewModelTests.swift
//  iOS-StarWarsTests
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation
import Testing
@testable import iOS_StarWars

@Suite("FilmPageViewModelTests")
struct FilmPagerViewModelTests {
    var factProvidingMock = FactProvidingMock()

    var subject: FilmPagerViewModel {
        FilmPagerViewModel(factProvider: factProvidingMock)
    }

    @Test func testFetchFilmsSuccess() async throws {
        let subject = subject

        let expectedResult = [PreviewData.film]

        factProvidingMock.fetchFilmsReturnValue = .init(results: expectedResult)

        await subject.fetchFilms()

        assert(subject.state == .loaded(expectedResult))
    }

    @Test func testFetchFilmsError() async throws {
        let subject = subject

        let expectedError = CommonError.emptyResponse

        factProvidingMock.fetchFilmsError = expectedError

        await subject.fetchFilms()

        assert(subject.state == .error(expectedError))
    }
}
