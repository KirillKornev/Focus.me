//
//  Tappable.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

extension View {

    /// Create an tap scale effect
    func tappable(closure: (() -> Void)? = nil) -> some View {
        modifier(TappableModifier(closure: closure))
    }
}

struct TappableModifier: ViewModifier {

    @State private var tapped = false
    var closure: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .modifier(TapCircleAnimatableModifier(tapped: tapped))
            .gesture(DragGesture(minimumDistance: .zero)
                .onChanged { _ in
                    tapped = true
                }

                .onEnded{ _ in
                    tapped = false
                    closure?()
                }
            )
    }
}
