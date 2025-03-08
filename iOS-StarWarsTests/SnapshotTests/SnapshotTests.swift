//
//  FilmPagerViewSnapshotTests.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 08.03.25.
//

@testable import iOS_StarWars
import SnapshotTesting
import XCTest
import SwiftUI

class FilmPagerViewSnapshotTests: XCTestCase {
    let deviceSize = CGSize(width: 375, height: 667)

    func testFilmPagerView() {
        let view = FilmPagerView(filmPagerInteractor: FilmPagerInteractingMock())
            .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }

    func testDetailsView() {
        let view = DetailsView(
            viewModel: DetailsViewModel(
                model: PreviewData.film,
                factProvider: FactProvidingMock()
            )
        )
        .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }

    func testLinkListItem() {
        let view = List {
            LinkListItem(viewModel: LinkListItemInteractingMock())
        }
        .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }

    func testTextListItem() {
        let view = List {
            TextListItem(key: "Name", value: "Han Solo")
        }
        .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }

    func testErrorView() {
        let view = ErrorView(error: .connectionIssue, onRetry: {})
            .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }

    func testLightsaberIndicator() {
        let view = LightsaberIndicator()
            .frame(size: deviceSize)

        assertSnapshot(of: view, as: .image)
    }
}

extension View {
    func frame(size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
}
