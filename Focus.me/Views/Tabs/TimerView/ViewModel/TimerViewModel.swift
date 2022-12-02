//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var isRunning = false
    @Published var isStopped = false
    @Published var timeRemaining: Int = .zero
    @Published var fullTimePeriod: AvailableTime = .one

    func setNewPeriod(_ period: AvailableTime) {
        timeRemaining = period.inSeconds
        fullTimePeriod = period
    }

    func stop() {
        timeRemaining = fullTimePeriod.inSeconds
        isRunning = false
    }
}
