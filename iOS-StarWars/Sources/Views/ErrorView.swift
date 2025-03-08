//
//  ErrorView.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import SwiftUI

struct ErrorView: View {
    let error: CommonError
    let onRetry: () async -> Void

    var body: some View {
        VStack(spacing: 32) {
            Text("Error")
                .font(.largeTitle)
                .foregroundColor(.red)

            Text(error.description)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Button("Retry") {
                Task { await onRetry() }
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView(error: .connectionIssue) {}
        .preferredColorScheme(.dark)
}
