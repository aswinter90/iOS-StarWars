//
//  FilmPagerView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

struct FilmPagerView<FilmPagerInteractor: FilmPagerInteracting>: View {
    private var viewModel: FilmPagerInteractor

    init(filmPagerInteractor: FilmPagerInteractor) {
        self.viewModel = filmPagerInteractor
        updatePageControlStyle()
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
        .navigationTitle(viewModel.navigationTitle)
        .onFirstAppearance {
            Task { await viewModel.fetchFilms() }
        }
    }

    private func filmPager(for films: [Film]) -> some View {
        TabView {
            ForEach(films) { film in
                filmTile(for: film)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }

    private func filmTile(for film: Film) -> some View {
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

    private func updatePageControlStyle() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
    }
}

#Preview("Results") {
    FilmPagerView(filmPagerInteractor: FilmPagerInteractingMock())
        .preferredColorScheme(.dark)
}

#Preview("Loading") {
    FilmPagerView(filmPagerInteractor: FilmPagerInteractingMock(state: .loading))
        .preferredColorScheme(.dark)
}

#Preview("Error") {
    FilmPagerView(
        filmPagerInteractor: FilmPagerInteractingMock(state: .error(CommonError.connectionIssue))
    )
    .preferredColorScheme(.dark)
}
