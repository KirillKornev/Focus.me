//
//  TimerViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

final class TimerViewModel: ObservableObject {

    @Published var isRunning = false
    @Published var timeRemaining = 10

    func run() {
        isRunning.toggle()
    }
}
