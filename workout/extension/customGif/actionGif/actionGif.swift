//
//  actionGif.swift
//  workout
//
//  Created by vano Kvakhadze on 12.07.24.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadingGIF(from url: URL) {
        self.sd_setImage(with: url, completed: nil)
    }
}
