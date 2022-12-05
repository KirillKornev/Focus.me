//
//  MainTimerView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

struct MainTimerView: View {

    @StateObject private var viewModel = TimerViewModel()

    var body: some View {
        VStack {
            Spacer()
            SingleRingeView(progress: viewModel.progress)
                .tappable { result in
                    switch result {
                    case .shortTap:
                        viewModel.isPaused.toggle()
                    case .longTap:
                        viewModel.state = .stop
                    }
                }

            TimerButton()
            Spacer()
            PickerView().isHidden(viewModel.state != .stop)
        }
        .environmentObject(viewModel)
    }
}

struct MainTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MainTimerView()
    }
}
