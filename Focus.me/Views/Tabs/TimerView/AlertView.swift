//
//  AlertView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import SwiftUI

struct AlertView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
