//
//  EdgeInsets+Extensions.swift
//  Focus.me
//
//  Created by Kirill Kornev on 05.12.2022.
//

import SwiftUI

extension EdgeInsets {

    static func sideEdgeInsets(value: CGFloat) -> EdgeInsets {

        /// Make an equal padding from left and right sides
        EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
    }
}
