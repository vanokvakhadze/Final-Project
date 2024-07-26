//
//  gifExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 12.07.24.
//

import Foundation
import UIKit
import SDWebImage


class GIFImageView: SDAnimatedImageView {
    
    var isPlaying: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func setup() {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePlayPause))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func togglePlayPause() {
        if isPlaying {
            self.stopAnimating()
        } else {
            self.startAnimating()
            
        }
        isPlaying.toggle()
    }
    
    func loadGIF(from url: URL, completion: (() -> Void)? = nil) {
        self.sd_setImage(with: url) { [weak self] (image, error, cacheType, url) in
            if let animatedImage = image as? SDAnimatedImage {
                self?.image = animatedImage
                self?.stopAnimating()  
                self?.isPlaying = false
                completion?()
            } else if let error = error {
                print("Failed to load GIF: \(error.localizedDescription)")
                completion?()
            }
        }
    }
}
