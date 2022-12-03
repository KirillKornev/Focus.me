//
//  TasksListViewModel.swift
//  Focus.me
//
//  Created by Kirill Kornev on 04.12.2022.
//

import Foundation

final class TasksListViewModel: ObservableObject {

    @Published var tasks: [Task] = [.init(id: 1, title: "Task 1", time: 24),
                                    .init(id: 2, title: "Task 2", time: 24),
                                    .init(id: 3, title: "Task 3", time: 24)]

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func removeTask(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
    }
}
