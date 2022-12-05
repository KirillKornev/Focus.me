//
//  MainTimerView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 01.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let progressViewPaddings: CGFloat = 50
    static let imageSide: CGFloat = 40
}

struct MainTimerView: View {

    @StateObject private var viewModel = TimerViewModel()
    @State var isPresentedAlert = false

    var body: some View {
        ZStack {
            if viewModel.state == .pause {
                Image(systemName: ImageConstant.pause)
                    .resizable()
                    .frame(width: .imageSide, height: .imageSide)
            } else {
                RemainTimeView(timeRemaining: viewModel.timeRemaining)
            }

            RingProgressView(progress: viewModel.progress)
                .padding(.sideEdgeInsets(value: .progressViewPaddings))
        }
        .alert(isPresented: $isPresentedAlert, content: {
            Alert(title: Text("Остановить таймер"),
                  primaryButton: .default(Text("Продолжить")),
                  secondaryButton: .destructive(Text("Сбросить")) {
                viewModel.state = .stop
            })
        })
        .contentShape(Rectangle())

        .tappable { result in
            switch result {
            case .shortTap:
                viewModel.isPaused.toggle()
            case .longTap:
                isPresentedAlert = true
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
