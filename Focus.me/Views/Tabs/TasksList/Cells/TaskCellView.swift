//
//  TaskCellView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI
import UIKit

struct TaskCellView: View {

    var task: Task

    var body: some View {
        VStack {
            HStack {
                Image(systemName: ImageConstant.cardAlarm)
                    .padding(5)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    .font(.title2)

                Spacer(minLength: 16)

                Text(task.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.primary)
                    .font(.title2)

                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))

            HStack {
                Text("00.06")
                    .foregroundColor(Color.primary)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))


        }
        .background(Color.gray)
        .cornerRadius(16)
        .padding()

        .tappable()
    }
}
