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
            .background {
                Circle()
                    .fill(radialGradient)
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                withAnimation(
                    .bouncy(duration: 0.4)
                    .repeatForever(autoreverses: false)
                ) {
                    rotationDegrees = 360.0
                }
            }
    }

    let radialGradient = RadialGradient(
        gradient: Gradient(
            colors: [Color.red, Color.red.opacity(0.5), Color.clear]
        ),
        center: .center,
        startRadius: 0,
        endRadius: 75
    )
}

#Preview {
    LightsaberIndicator()
        .preferredColorScheme(.dark)
}
