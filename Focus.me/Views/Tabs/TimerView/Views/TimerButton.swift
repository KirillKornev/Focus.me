//
//  TimerButton.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import Foundation
import SwiftUI

struct TimerButton: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel

    var body: some View {
        VStack {
            Button {
                switch vm.state {
                case .run:
                    vm.state = .pause
                case .pause:
                    vm.state = .run
                case .stop:
                    vm.state = .run
                }
            } label: {
                if vm.state == .run {
                    Text("Pause")
                        .padding(20)
                } else {
                    Text("Run")
                        .padding(20)
                }
            }
            .contentShape(Rectangle())
        }

        Button {
            vm.state = .stop
        } label: {
            Text("Stop")
        }
        .isHidden(shouldHideStopButton(state: vm.state))
        .contentShape(Rectangle())
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
