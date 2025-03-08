//
//  FactListView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

struct FilmPagerView<FilmPagerInteractor: FilmPagerInteracting>: View {
    private var viewModel: FilmPagerInteractor

    init(filmListInteractor: FilmPagerInteractor) {
        self.viewModel = filmListInteractor

        UIPageControl.appearance().currentPageIndicatorTintColor = .red
    }

    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                LightsaberIndicator()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case let .loaded(films):
                filmPager(for: films)
            case let .error(error):
                ErrorView(error: error, onRetry: viewModel.fetchFilms)
            }
        }
    }

    func filmPager(for films: [Film]) -> some View {
        GeometryReader { proxy in
            TabView {
                ForEach(films) { film in
                    filmTile(for: film)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }

    func filmTile(for film: Film) -> some View {
        NavigationLink {
            DetailsView(
                viewModel: DetailsViewModel(
                    model: film,
                    factProvider: viewModel.factProvider
                )
            )
        } label: {
            film.image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal)
        }
    }
}

#Preview("Results") {
    FilmPagerView(filmListInteractor: FilmListInteractingMock())
        .preferredColorScheme(.dark)
}

#Preview("Loading") {
    FilmPagerView(filmListInteractor: FilmListInteractingMock(state: .loading))
        .preferredColorScheme(.dark)
}

#Preview("Error") {
    FilmPagerView(
        filmListInteractor: FilmListInteractingMock(state: .error(CommonError.connectionIssue))
    )
    .preferredColorScheme(.dark)
}
