//
//  RingAnimation.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let padding: CGFloat = 10
}

struct RingAnimation: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel
    @State var isRunning = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack {
                    Spacer(minLength: 0)
                    ring(for: ColorConstant.strawberry)
                        .frame(width: geometry.size.width * 0.7)
                    Spacer(minLength: 0)
                }
                .frame(height: geometry.size.width)

                VStack {
                    Spacer()
                    HStack {
                        Spacer(minLength: 0)
                        ring(for: ColorConstant.lime)
                            .frame(width: geometry.size.width * 0.7 - .padding - 2 * 20)
                        Spacer(minLength: 0)
                    }
                    Spacer()
                }
                .frame(height: geometry.size.width)
            }
        }
        .onChange(of: vm.isRunning) { newValue in
            if newValue {
                withAnimation(Animation.animation(with: vm.timeRemaining)) {
                    self.isRunning = true
                }
            }
        }
    }

    func ring(for color: Color) -> some View {
        // Background ring
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 20))
            .foregroundStyle(.tertiary)
            .overlay {
                // Foreground ring
                Circle()
                    .trim(from: 0, to: isRunning ? 1 : 0)
                    .stroke(color.gradient,
                            style: StrokeStyle(lineWidth: 20, lineCap: .round))
            }
            .rotationEffect(.degrees(-90))
    }
}

private extension Animation {

    static func animation(with duration: Int) -> Animation {
        Animation
            .linear(duration: Double(duration))
    }
}
