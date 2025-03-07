//
//  FactListView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

struct FilmPagerView<FilmPagerInteractor: FilmPagerInteracting>: View {
    @ObservedObject private var viewModel: FilmPagerInteractor

    init(filmListInteractor: FilmPagerInteractor) {
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
        .background(.black)
        .task {
            await viewModel.fetchFilms()
        }
    }

    func filmPager(for films: [Film]) -> some View {
        GeometryReader { proxy in
            TabView {
                ForEach(films) { film in
                    NavigationLink {
                        DetailsView(model: film)
                    } label: {
                        filmTile(for: film, size: proxy.size)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }

    func filmTile(for film: Film, size: CGSize) -> some View {
        VStack {
            Text(film.title)
                .foregroundStyle(.white)
                .font(.title)

            film.image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .frame(width: size.width - 16)
                .padding(.horizontal)
        }
    }
}

#Preview {
    FilmPagerView(filmListInteractor: FilmListInteractingMock())
}
