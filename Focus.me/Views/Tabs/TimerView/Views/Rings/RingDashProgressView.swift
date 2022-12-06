//
//  RingDashProgressView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import SwiftUI

struct RingDashProgressView: View {
    let progress: CGFloat

    private let bgColor = Color.red.opacity(0.2)
    private let fillColor = Color.red

    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .butt, miterLimit: 0, dash: [10, 5], dashPhase: 0))
            .foregroundColor(bgColor)
            .overlay {
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .butt, miterLimit: 0, dash: [10, 5], dashPhase: 0))
                    .foregroundColor(fillColor)
            }
            .rotationEffect(.degrees(-90))
            .clipShape(Circle())
    }
}
