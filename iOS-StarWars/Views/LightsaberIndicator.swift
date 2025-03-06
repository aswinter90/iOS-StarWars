//
//  LightsaberIndicator.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 06.03.25.
//

import SwiftUI

struct LightsaberIndicator: View {
    @State private var rotationDegrees = 0.0

    var body: some View {
        Image(.lightsaber)
            .resizable()
            .frame(width: 80, height: 80)
            .rotationEffect(.degrees(rotationDegrees))
            .onAppear {
                withAnimation(
                    .bouncy(duration: 0.5)
                    .repeatForever(autoreverses: false)
                ) {
                    rotationDegrees = 360.0
                }
            }
    }
}

#Preview {
    LightsaberIndicator()
}
