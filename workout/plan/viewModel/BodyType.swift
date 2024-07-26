//
//  BodyType.swift
//  workout
//
//  Created by vano Kvakhadze on 15.07.24.
//

import Foundation

enum BodyType {
    case thin
    case normal
    case weight
    case overweight

    static func categorize(height: Double, weight: Double) -> BodyType {
        switch (height, weight) {
        case (..<165, ..<45), (168..<175, ..<55), (175..<181, ..<65), (181..<190, ..<75), (190..., ..<85):
            return .thin
        case (..<165, 45..<55), (168..<175, 55..<65), (175..<181, 65..<75), (181..<190, 75..<85), (190..., 85..<110):
            return .normal
        case (..<165, 65..<80), (168..<175, 65..<90), (175..<181, 75..<110), (181..<190, 85..<120), (190..., 110..<160):
            return .weight
        case (..<165, 80...), (168..<175, 85...), (175..<181, 110...), (181..<190, 120...), (190..., 160...):
            return .overweight
        default:
            return .normal
        }
    }
}
