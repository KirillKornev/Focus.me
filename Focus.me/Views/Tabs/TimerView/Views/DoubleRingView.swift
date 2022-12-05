//
//  DoubleRingView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let padding: CGFloat = 10
}

struct DoubleRingView: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel

    // Computed
    private var progress: CGFloat {
        let fullTime = vm.fullTimePeriod.inSeconds
        return (CGFloat(fullTime - vm.timeRemaining) / CGFloat(fullTime))
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    ring(for: ColorConstant.strawberry)
                        .frame(width: geometry.size.width * 0.7)
                    Spacer()
                }
                .frame(height: geometry.size.width)
                .animation(.linear(duration: vm.state == .stop ? 0 : 1), value: progress)

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ring(for: ColorConstant.lime)
                            .frame(width: geometry.size.width * 0.7 - .padding - 2 * 20)
                            .animation(.linear(duration: vm.state == .stop ? 0 : 1), value: progress)
                        Spacer()
                    }
                    Spacer()
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
//                        RemainTimeView()
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width)
    }

    // MARK: - Private

    private func ring(for color: Color) -> some View {
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
