//
//  View+OnFirstAppearance.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 08.03.25.
//

import SwiftUI

struct ViewOnFirstAppearanceModifier: ViewModifier {
    @State private var didAppear = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didAppear == false {
                didAppear = true
                action?()
            }
        }
    }
}

public extension View {
    func onFirstAppearance(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewOnFirstAppearanceModifier(perform: action))
    }
}
