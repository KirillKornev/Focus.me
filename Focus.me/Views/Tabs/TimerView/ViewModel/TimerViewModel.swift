//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    private lazy var timer = SimpleTimer(interval: 1) {
        guard self.state == .run else { return }
        self.timeRemaining -= 1
    }

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
                timer.start()
            case .stop:
                timeRemaining = fullTimePeriod.inSeconds
            }
        }
    }

    /// Progress of timer view
    var progress: CGFloat {
        let fullTime = fullTimePeriod.inSeconds
        let result = (CGFloat(fullTime - timeRemaining) / CGFloat(fullTime))
        return result
    }

    /// Change timer state
    func toggleState() {
        if state == .stop {
            state = .run
        } else {
            let nextState: TimerState = state == .pause ? .run : .pause
            state = nextState
        }
    }

    func setNewPeriod(_ period: AvailableTime) {
        timeRemaining = period.inSeconds
        fullTimePeriod = period
    }
}
