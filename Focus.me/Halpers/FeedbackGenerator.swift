//
//  FeedbackGenerator.swift
//  Focus.me
//
//  Created by Kirill Kornev on 03.12.2022.
//

import UIKit

final class FeedbackGenerator {

    func generate() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}
