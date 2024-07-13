//
//  customSystemImage.swift
//  workout
//
//  Created by vano Kvakhadze on 10.07.24.
//

import Foundation
import UIKit

extension UIImageView {
    static func customSystemView(imageName: String) -> UIImageView{
        let image = UIImage(systemName: imageName)
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }
}
