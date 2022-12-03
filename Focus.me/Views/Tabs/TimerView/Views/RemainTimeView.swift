//
//  RemainTimeView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 02.12.2022.
//

import SwiftUI

extension String {
    static let font = "Avenir Next"
}

struct RemainTimeView: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(countToMinutes(timeRemaining: vm.timeRemaining))")
                .padding()
                .onReceive(timer) { _ in
                    if vm.timeRemaining > 0 && vm.state == .run {
                        vm.timeRemaining -= 1
                    }
                }
                .font(.custom(.font, size: 60))
                .fontWeight(.black)
        }
    }

    // MARK: - Private

    private func countToMinutes(timeRemaining: Int) -> String {
        let minutes = Int(timeRemaining / 60)
        let seconds = timeRemaining % 60

        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}
