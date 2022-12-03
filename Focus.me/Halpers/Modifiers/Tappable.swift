//
//  Tappable.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

struct TapModifier: ViewModifier {

    private enum ButtonState: Int {
        case pressed
        case free

        var scale: Double {
            switch self {
            case .pressed:
                return 0.99
            case .free:
                return 1
            }
        }
    }

    let closure: (() -> Void)?

    @State private var state: ButtonState = .pressed

    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: .zero)
                    .onChanged({ _ in
                        state = .pressed
                        closure?()
                    })

                    .onEnded({ _ in
                        state = .free
                    })
            )

            .scaleEffect(state.scale)
            .animation(.easeIn(duration: 6), value: state)
    }
}

extension View {

    /// Create an tap scale effect
    func tappable(closure: (() -> Void)? = nil) -> some View {
        modifier(TapModifier(closure: closure))
    }
}
