//
//  collectionCell.swift
//  workout
//
//  Created by vano Kvakhadze on 13.07.24.
//

import UIKit

class collectionCell: UICollectionViewCell {
    
   
    var muscles = UILabel.customLabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func setUpUI(){
            contentView.addSubview(muscles)
            muscles.textAlignment = .center
            muscles.clipsToBounds = true
            muscles.backgroundColor = .systemCyan
            muscles.layer.cornerRadius = 16
            muscles.textColor = .white
            
            
            NSLayoutConstraint.activate([
                muscles.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                muscles.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                muscles.widthAnchor.constraint(equalToConstant: 120),
                muscles.heightAnchor.constraint(equalToConstant: 40)
            ])
      }
}
