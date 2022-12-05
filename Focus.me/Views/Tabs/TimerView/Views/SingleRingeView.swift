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

private extension Double {
    static let circlePadding: Double = 100
}

struct SingleRingeView: View {

    @State private var scale = false

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
                HStack(alignment: .center) {
                    Spacer()
                    ring(for: ColorConstant.strawberry)
                    Spacer()
                }
                .frame(height: geometry.size.width - .circlePadding)
                .animation(.linear(duration: vm.state == .stop ? 0 : 1), value: progress)

                HStack {
                    Spacer()
                    RemainTimeView()
                    Spacer()
                }
                .frame(height: geometry.size.width - .circlePadding)
            }
            .frame(height: UIScreen.main.bounds.width)
        }
        .contentShape(Rectangle())
        .tappable { result in
            switch result {
            case .shortTap:
                vm.isPaused.toggle()
            case .longTap:
                vm.state = .stop
            }
        }
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
