//
//  customImage.swift
//  workout
//
//  Created by vano Kvakhadze on 10.07.24.
//

import Foundation
import UIKit

extension UIImageView {
    static func customNamedImage(named: String) -> UIImageView{
        let image = UIImage(named: named)
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
    }
}
