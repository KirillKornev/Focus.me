//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var isRunning = false
    @Published var timeRemaining = 30
    @Published var fullTime = 30

    func run() {
        isRunning.toggle()
    }
}
