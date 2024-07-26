//
//  ImageExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 23.07.24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL){
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,  error == nil, let img = UIImage(data: data) else {return}
           
            DispatchQueue.main.async {
                self?.image = img
            }
        }.resume()
    }
}
