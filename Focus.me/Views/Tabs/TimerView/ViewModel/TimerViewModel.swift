//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var fullTimePeriod: AvailableTime = .one
    @Published var timeRemaining: Int = AvailableTime.one.inSeconds {
        didSet {
            if timeRemaining == 0 {
                state = .stop
            }
        }
    }

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

    var progress: CGFloat {
        let fullTime = fullTimePeriod.inSeconds
        let result = (CGFloat(fullTime - timeRemaining) / CGFloat(fullTime))
        return result
    }

    var isPaused: Bool {
        get { state == .pause }

        set {
            if newValue {
                state = .pause
            } else {
                state = .run
            }
        }
    }

    func setNewPeriod(_ period: AvailableTime) {
        timeRemaining = period.inSeconds
        fullTimePeriod = period
    }
}
