//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var isRunning = false
    @Published var timeRemaining = 0
    @Published var fullTimePeriod: AvailableTime = .one

    func setPeriod(_ period: AvailableTime) {
        timeRemaining = period.inSeconds
    }

    func run() {
        isRunning.toggle()
    }
}
