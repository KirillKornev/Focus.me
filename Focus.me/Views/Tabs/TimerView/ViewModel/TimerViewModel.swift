//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var timeRemaining: Int = AvailableTime.one.inSeconds
    @Published var fullTimePeriod: AvailableTime = .one

    var count: Int = 0

    @Published var state: TimerState = .stop {
        didSet {
            switch state {
            case .run, .pause:
                break
            case .stop:
                timeRemaining = fullTimePeriod.inSeconds
            }
        }
    }

    func setNewPeriod(_ period: AvailableTime) {
        timeRemaining = period.inSeconds
        fullTimePeriod = period
    }
}
