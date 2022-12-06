//
//  Tappable.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

extension View {

    /// Create an tap scale effect
    func tappable(closure: ((TappableModifier.Result) -> Void)? = nil) -> some View {
        modifier(TappableModifier(closure: closure))
    }
}

struct TappableModifier: ViewModifier {

    enum Result {
        case shortTap
        case longTap
    }

    @State private var isTapped = false
    @State private var isStopped: Bool = false
    @State var state: TimerState = .run

    var closure: ((Result) -> Void)?


    func body(content: Content) -> some View {
        let dragGesture = DragGesture(minimumDistance: .zero)
        let longGesture = LongPressGesture(minimumDuration: 0.5)

        content
            .modifier(TapCircleAnimatableModifier(tapped: isTapped))

            .gesture(dragGesture
                .onChanged { _ in
                    isStopped = false
                    isTapped = true
                }

                .onEnded{ _ in
                    guard !isStopped else { return }

                    isTapped = false
                    closure?(.shortTap)
                }
            )

            .simultaneousGesture(longGesture
                .onEnded { _ in
                    isStopped = true
                    closure?(.longTap)
                }
            )
    }
}
