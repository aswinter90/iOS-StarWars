//
//  FactListView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

struct FilmListView<FilmListInteractor: FilmListInteracting>: View {
    @ObservedObject private var viewModel: FilmListInteractor

    init(filmListInteractor: FilmListInteractor) {
        self.viewModel = filmListInteractor
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
                Text(error.localizedDescription)
            }
        }
        .background(.primary)
        .task {
            await viewModel.fetchFilms()
        }
    }

    func filmPager(for films: [Film]) -> some View {
        GeometryReader { proxy in
            TabView {
                ForEach(films) { film in
                    filmTile(for: film, size: proxy.size)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }

    func filmTile(for film: Film, size: CGSize) -> some View {
        film.image
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
            .frame(width: size.width - 16, height: size.height - 16)
            .padding(.horizontal)
    }
}

#Preview {
    FilmListView(filmListInteractor: FilmListInteractingMock())
}
