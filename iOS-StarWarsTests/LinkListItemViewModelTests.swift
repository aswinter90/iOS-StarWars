//
//  LinkListItemViewModelTests.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 08.03.25.
//

import Foundation
import Testing
@testable import iOS_StarWars

@Suite("LinkListItemViewModelTests")
struct LinkListItemViewModelTests {
    var factProvidingMock = FactProvidingMock()

    func makeSubject(key: String, urls: [URL]) -> LinkListItemViewModel {
        LinkListItemViewModel(key: key, urls: urls, factProvider: factProvidingMock)
    }

    @Test func testFetchModelsSuccess() async throws {
        let subject = makeSubject(
            key: "Pilots",
            urls: [.init(string: "https://swapi.dev/api/people/1")!]
        )

        factProvidingMock.fetchFactReturnValue = PreviewData.character

        await subject.fetchModels()

        switch subject.state {
        case let .loaded(models):
            if let model = models.first as? Character {
                assert(model == PreviewData.character)
            } else {
                Issue.record("Test failed: Unexpected case")
            }
        default:
            Issue.record("Test failed: Unexpected case")
        }
    }

    @Test func testFetchModelsErrorWithUnsupportedURL() async throws {
        let url = URL(string: "https://google.com")!

        let subject = makeSubject(
            key: "Pilots",
            urls: [url]
        )

        factProvidingMock.fetchFactReturnValue = PreviewData.character

        await subject.fetchModels()

        switch subject.state {
        case let .error(error):
            assert(error == CommonError.unsupportedResourceURL(url: url))
        default:
            Issue.record("Test failed: Unexpected case: \(subject.state)")
        }
    }

    @Test func testFetchModelsErrorWithEmptyResponse() async throws {
        let url = URL(string: "https://swapi.dev/api/vehicles/1")!

        let subject = makeSubject(
            key: "Vehicles",
            urls: [url]
        )

        factProvidingMock.fetchFactError = CommonError.emptyResponse

        await subject.fetchModels()

        switch subject.state {
        case let .error(error):
            assert(error == CommonError.emptyResponse)
        default:
            Issue.record("Test failed: Unexpected case: \(subject.state)")
        }
    }
}
