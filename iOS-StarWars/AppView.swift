//
//  ContentView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

public struct AppView: View {
    @State private var navigationPath = [Film]()

    public var body: some View {
        NavigationStack {
            FilmPagerView(
                filmListInteractor: FilmPagerViewModel(
                    factProvider: FactProvider(
                        endpointFactory: .init(),
                        networkService: NetworkService()
                    )
                )
            )
            .navigationTitle("Star Wars Films")
        }
    }
}

#Preview {
    AppView()
}
