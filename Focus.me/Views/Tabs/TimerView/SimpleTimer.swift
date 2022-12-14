//
//  SimpleTimer.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import Combine
import Foundation

final class SimpleTimer {
  // the interval at which the timer ticks
  let interval: TimeInterval
  // the action to take when the timer ticks
  let onTick: () -> Void

  private var timer: Publishers.Autoconnect<Timer.TimerPublisher>? = nil
  private var subscription: AnyCancellable? = nil

  init(interval: TimeInterval, onTick: @escaping () -> Void) {
    self.interval = interval
    self.onTick = onTick
  }

  var isRunning: Bool {
    timer != nil
  }

  // start the timer and begin ticking
  func start() {
    timer = Timer.publish(every: interval, on: .main, in: .common).autoconnect()
    subscription = timer?.sink(receiveValue: { _ in
       self.onTick()
    })
  }

  // cancel the timer and clean up its resources
  func cancel() {
    timer?.upstream.connect().cancel()
    timer = nil
    subscription = nil
  }
}
