//
//  PickerView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 02.12.2022.
//

import SwiftUI

struct PickerView: View {

    // View model
    @EnvironmentObject var vm: TimerViewModel

    @State private var selection: AvailableTime = .one

    var body: some View {
        VStack {
            Text("Period of time")
            Picker("", selection: $selection) {
                ForEach(AvailableTime.allCases, id: \.self) { item in
                    Text(item.stringValue.capitalized)
                }
            }
            .onAppear {
                vm.setNewPeriod(selection)
            }
            .onChange(of: selection) { newValue in
                vm.setNewPeriod(newValue)
            }
        }
    }
}
