//
//  TimerButton.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import Foundation
import SwiftUI

struct TimerButton: View {

    @EnvironmentObject var vm: TimerViewModel

    var body: some View {
        Button {
            vm.run()
        } label: {
            if vm.isRunning {
                Text("Pause")
                    .padding(20)
            } else {
                Text("Run")
                    .padding(20)
            }
        }
        .contentShape(Rectangle())
    }
}
