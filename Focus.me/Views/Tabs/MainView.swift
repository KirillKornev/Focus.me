//
//  MainView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let minDragTranslationForSwipe: CGFloat = 50
}

struct MainView: View {

    @State private var selectedTab: Int = .zero

    // Computed
    private var numTabs: Int {
        return 2
    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            NavigationView{
                MainTimerView()
            }.tabItem {
                Image(systemName: "timer")
            }.tag(0)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            NavigationView{
                Text("Here is tasks screen")
            }.tabItem {
                Image(systemName: "gearshape.fill")
            }.tag(1)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
        }
    }

    // MARK: - Private

    private func handleSwipe(translation: CGFloat) {
        if translation > .minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -.minDragTranslationForSwipe && selectedTab < numTabs - 1 {
            selectedTab += 1
        }
    }
}
