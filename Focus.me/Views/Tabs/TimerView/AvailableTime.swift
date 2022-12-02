//
//  AvailableTime.swift
//  Focus.me
//
//  Created by Kirill Kornev on 02.12.2022.
//

import Foundation

enum AvailableTime: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3

    var stringValue: String {
        String(self.rawValue)
    }

    var inSeconds: Int {
        self.rawValue * 60
    }
}
