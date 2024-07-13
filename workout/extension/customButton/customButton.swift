//
//  customButton.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import Foundation
import UIKit

extension UIButton {
    static func customButton(width: CGFloat, height: CGFloat) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }
}
