//
//  RingProgressView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import SwiftUI

struct RingProgressView: View {
    var progress: CGFloat

    private let bgColor = Color.orange.opacity(0.2)
    private let fillColor = Color.orange

    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 40))
            .foregroundColor(bgColor)
            .overlay {
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 40))
                    .foregroundStyle(AngularGradient(colors: [fillColor, fillColor.opacity(0.5)], center: .center))
            }
            .rotationEffect(.degrees(-90))
            .clipShape(Circle())
    }
}
