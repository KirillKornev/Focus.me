//
//  SingleRingeView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 02.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let padding: CGFloat = 10
}

struct SingleRingeView: View {

    @State var counter: Int = 0

    // View model
    @EnvironmentObject var vm: TimerViewModel

    @State var isRunning = false
    @State var timeRemaining: CGFloat = 0

    // Computed
    private var progress: CGFloat {
        let fullTime = vm.fullTimePeriod.inSeconds
        return (CGFloat(fullTime - vm.timeRemaining) / CGFloat(fullTime))
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
            }
        }
//        onChange(of: progress) { newValue in
//            if vm.isRunning {
//                withAnimation(.linear(duration: 1)) {
//
//                }
//            }
//        }
        .animation(.linear(duration: vm.isStopped ? 0 : 1), value: progress)
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
