//
//  TapCircleAnimatableModifier.swift
//  Focus.me
//
//  Created by Kirill Kornev on 04.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let freeState: CGFloat = 1
    static let tappedState: CGFloat = 0.95
}

private extension Double {
    static let animationDuration: Double = 0.1
}

struct TapCircleAnimatableModifier: AnimatableModifier {

    var tapped: Bool

    func body(content: Content) -> some View {
        content.scaleEffect(tapped ? .tappedState : .freeState)
            .animation(.easeIn(duration: .animationDuration), value: tapped)
    }
}
