//
//  SetGradientColor.swift
//  workout
//
//  Created by vano Kvakhadze on 21.07.24.
//

import Foundation
import UIKit

extension UIView {
    func setGradientColor(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, locations: [NSNumber]? = nil) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.locations = locations
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.frame = self.bounds
            gradientLayer.masksToBounds = true
            
            if let oldLayer = self.layer.sublayers?.first as? CAGradientLayer {
                self.layer.replaceSublayer(oldLayer, with: gradientLayer)
            } else {
                self.layer.insertSublayer(gradientLayer, at: 0)
            }
        }
}


