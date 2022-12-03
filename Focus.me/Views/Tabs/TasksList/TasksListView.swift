//
//  TasksListView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

struct TasksListView: View {

    var tasks: [Task] = [.init(id: 1, title: "Task 1", time: 24),
                         .init(id: 2, title: "Task 2", time: 24),
                         .init(id: 3, title: "Task 3", time: 24)]

    var isPressed: Bool = false

    var body: some View {

        List {
            ForEach(tasks) { task in
                Button {
//                    print("task \(task.title)")
                } label: {
                    TaskCellView(task: task)
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}
