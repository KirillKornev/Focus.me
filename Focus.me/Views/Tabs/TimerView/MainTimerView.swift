//
//  MainTimerView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let progressViewPaddings: CGFloat = 50
}

struct MainTimerView: View {

    @StateObject private var viewModel = TimerViewModel()

    var body: some View {
        ZStack {
            if viewModel.state == .pause {
                Image(systemName: ImageConstant.pause)
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
            } else {
                RemainTimeView(timeRemaining: viewModel.timeRemaining)
            }

            RingProgressView(progress: viewModel.progress)
                .padding(.sideEdgeInsets(value: .progressViewPaddings))
        }
        .contentShape(Rectangle())

        .tappable { result in
            switch result {
            case .shortTap:
                viewModel.isPaused.toggle()
            case .longTap:
                viewModel.state = .stop
            }
        }
        .environmentObject(viewModel)
    }
}

struct MainTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MainTimerView()
    }
}
