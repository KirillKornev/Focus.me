//
//  Tappable.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

private extension Double {
    static let response = 0.4
    static let dampingFraction = 0.6
}

struct TapModifier: ViewModifier {

    @State private var tapped: Bool = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(tapped ? 0.95 : 1)
            .animation(.spring(response: .response, dampingFraction: .dampingFraction), value: tapped)

            .gesture(
                DragGesture(minimumDistance: .zero)
                    .onChanged({ _ in
                        tapped = true
                    })

                    .onEnded({ _ in
                        tapped = false
                    })
            )
    }
}

extension View {
    
    func tappable() -> some View {
        modifier(TapModifier())
    }
}
