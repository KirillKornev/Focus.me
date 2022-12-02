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

    @State var counter: Int = 0

    // View model
    @EnvironmentObject var vm: TimerViewModel

    @State var isRunning = false
    @State var timeRemaining: CGFloat = 0

    // Computed
    private var progress: CGFloat {
        return (CGFloat(counter) / CGFloat(vm.fullTime))
    }

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
        .onChange(of: vm.timeRemaining) { _ in
            withAnimation(Animation.linear) {
                counter += 1
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
                    .trim(from: 0, to: progress)
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
