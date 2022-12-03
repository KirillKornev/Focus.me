//
//  TimerButton.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let playSize: CGFloat = 50
    static let stopSize: CGFloat = playSize / 2
    static let stopOffsetX: CGFloat = 100
}

struct TimerButton: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel

    @State var offsetX: CGFloat = .zero
    @State var isHidden: Bool = true

    var body: some View {

        ZStack {
            // first button
            Button(action: {
                switch vm.state {
                case .run:
                    vm.state = .pause
                case .pause:
                    vm.state = .run
                case .stop:
                    vm.state = .run
                }
            }) {
                Image(systemName: vm.state == .run ? ImageConstant.pause : ImageConstant.play)
                    .frame(width: .playSize, height: .playSize)
                    .padding(20)
                    .background(Color.red)
                    .clipShape(Circle())
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }

            // second button
            Button(action: {
                vm.state = .stop
            }) {
                Image(systemName: ImageConstant.stop)
                    .frame(width: .stopSize, height: .stopSize)
                    .padding(20)
                    .background(Color.red)
                    .clipShape(Circle())
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .offset(x: offsetX)
            .isHidden(isHidden)

            .onChange(of: vm.state, perform: { newValue in
                let shouldHideStopButton = shouldHideStopButton(state: newValue)
                let offsetX: CGFloat = shouldHideStopButton ? .zero : .stopOffsetX

                withAnimation(.easeIn(duration: 0.05)) {
                    self.offsetX = offsetX
                    self.isHidden = shouldHideStopButton
                }
            })
        }
    }

    // MARK: - Private

    private func shouldHideStopButton(state: TimerState) -> Bool {
        switch state {
        case .run, .stop:
            return true
        case .pause:
            return false
        }
    }
}
