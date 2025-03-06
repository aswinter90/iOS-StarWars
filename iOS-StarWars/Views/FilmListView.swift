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
        Group {
            switch viewModel.state {
            case .loading:
                LightsaberIndicator()
            case let .loaded(films):
                filmPager(for: films)
            case let .error(error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.fetchFilms()
        }
    }

    func filmPager(for films: [Film]) -> some View {
        GeometryReader { proxy in
            TabView {
                ForEach(films) { film in
                    Text(film.title)
                        .foregroundStyle(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.blue)
                                .frame(width: proxy.size.width - 16, height: proxy.size.height - 16)
                                .padding(.horizontal)
                        }
                }
            }
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    FilmListView(filmListInteractor: FilmListInteractingMock())
}
