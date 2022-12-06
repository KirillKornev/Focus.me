//
//  LoadingProgressView.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import SwiftUI

struct LoadingProgressView: View {
    var progress: CGFloat

    @State var rotationAngle: Double = 0
    var fillColor: Color = .red
    var count: Int = 20

    var body: some View {
        GeometryReader { bounds in
            ZStack {
                ForEach(0..<count, id: \.self) { i in
                    Circle()
                        .fill(fillColor.opacity(0.2))
                        .frame(width: getDotSize(i), height: getDotSize(i), alignment: .center)
                        .offset(x: (bounds.size.width / 2) - 10)
                        .rotationEffect(.degrees(.pi * 2 * Double(i * 3)))
                }


                ForEach(0..<count, id: \.self) { i in
                    Circle()
                        .fill(fillColor)
                        .frame(width: getDotSize(i), height: getDotSize(i), alignment: .center)
                        .offset(x: (bounds.size.width / 2) - 10)
                        .rotationEffect(.degrees(.pi * 2 * Double(i * 3)))
                        .opacity(CGFloat(i) < CGFloat(count) * progress ? 1 : 0)
                }
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            .rotationEffect(.degrees(-90))
        }
    }

    private func getDotSize(_ index: Int) -> CGFloat {
        CGFloat(index)
    }
}
