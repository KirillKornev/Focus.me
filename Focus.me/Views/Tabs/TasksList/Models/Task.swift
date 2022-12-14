//
//  Task.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import Foundation

struct Task: Identifiable {
    let id: Int
    let title: String
    let time: Int
}

extension Task: Equatable {

    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }
}
