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
            RingAnimation().environmentObject(viewModel)
            Spacer()
            TimerButton().environmentObject(viewModel)
            Spacer(minLength: 100)
        }
        .padding()
    }
}

struct MainTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MainTimerView()
    }
}
