//
//  RemainTimeView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 02.12.2022.
//

import SwiftUI

struct RemainTimeView: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(vm.timeRemaining)")
                .padding()
                .onReceive(timer) { _ in
                    if vm.timeRemaining > 0 && vm.isRunning {
                        vm.timeRemaining -= 1
                    }
                }
                .font(.system(size: 40, weight: .bold))
        }
    }
}
