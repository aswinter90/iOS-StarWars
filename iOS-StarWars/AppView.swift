//
//  AppView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import SwiftUI

public struct AppView: View {
    let factProvider = FactProvider(
        endpointProvider: EndpointFactory(),
        networkService: NetworkService()
    )

    public var body: some View {
        NavigationStack {
            FilmPagerView(filmListInteractor: FilmPagerViewModel(factProvider: factProvider))
        }
    }
}

#Preview {
    AppView()
        .preferredColorScheme(.dark)
}
