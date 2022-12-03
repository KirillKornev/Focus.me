//
//  TasksListView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

struct TasksListView: View {

    // View model
    @StateObject private var viewModel = TasksListViewModel()

    var body: some View {

        List(viewModel.tasks) { task in
            TaskCellView(task: task).tappable() { viewModel.removeTask(task) }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}
