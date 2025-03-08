//
//  FactProvidingMock.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import Foundation

class FactProvidingMock: FactProviding {
    func fetchFilms() async throws(CommonError) -> FactListResponse<Film> {
        FactListResponse(results: [PreviewData.film])
    }

    func fetchFact<Response>(for url: URL) async throws(CommonError) -> Response where Response: PresentableModel {
        // swiftlint:disable:next force_cast
        PreviewData.planet as! Response
    }
}
