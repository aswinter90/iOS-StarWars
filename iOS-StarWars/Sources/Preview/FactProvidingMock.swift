//
//  FactProvidingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

final class FactProvidingMock: FactProviding, @unchecked Sendable {
    var fetchFilmsReturnValue: FactListResponse<Film> = FactListResponse(results: [PreviewData.film])
    var fetchFilmsError: CommonError?

    func fetchFilms() async throws(CommonError) -> FactListResponse<Film> {
        if let fetchFilmsError {
            throw fetchFilmsError
        } else {
            return fetchFilmsReturnValue
        }
    }

    var fetchFactReturnValue: any PresentableModel = PreviewData.planet
    var fetchFactError: CommonError?

    func fetchFact<Response>(for url: URL) async throws(CommonError) -> Response where Response: PresentableModel {
        if let fetchFactError {
            throw fetchFactError
        } else {
            // swiftlint:disable:next force_cast
            return fetchFactReturnValue as! Response
        }
    }
}
