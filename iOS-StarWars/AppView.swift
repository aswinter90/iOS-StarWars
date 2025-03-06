//
//  ContentView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

public struct AppView: View {
    @State private var tabSelection = 0
    @State private var navigationPath = [Film]()

    public var body: some View {
        NavigationStack {
            TabView(selection: $tabSelection) {
                Group {
                    FilmListView(
                        filmListInteractor: FilmListViewModel(
                            factProvider: FactProvider(
                                endpointFactory: .init(),
                                networkService: NetworkService()
                            )
                        )
                    )
                    .navigationTitle("Films")
                    .tabItem { Label("Films", systemImage: "film") }
                    .tag(0)
//                        .overlay {
//                            NavigationLink("Films", value: StaticFacts.film)
//                        }
//                        .navigationDestination(for: Film.self) { film in
//                            Text(film.title)
//                        }

                    Color.green
                        .tabItem { Label("Characters", systemImage: "person") }
                        .tag(1)

                    Color.blue
                        .tabItem { Label("Planets", systemImage: "globe.americas") }
                        .tag(2)

                    Color.yellow
                        .tabItem { Label("Ships & more", systemImage: "paperplane") }
                        .tag(3)

                    Color.purple
                        .tabItem { Label("Species", systemImage: "dog") }
                        .tag(4)
                }
                .styleTabBarForIOS16Plus()
            }
        }
    }
}

extension View {
    @ViewBuilder func styleTabBarForIOS16Plus() -> some View {
        if #available(iOS 16.0, *) {
            self
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.primary, for: .tabBar)
        } else {
            self
        }
    }
}


#Preview {
    AppView()
}
