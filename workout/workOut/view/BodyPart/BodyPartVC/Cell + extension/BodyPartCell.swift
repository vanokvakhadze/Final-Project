//
//  BodyPartCell.swift
//  workout
//
//  Created by vano Kvakhadze on 21.07.24.
//

import UIKit

class BodyPartCell: UICollectionViewCell {
    
    let backgroundImage = UIImageView()
    let muscle = UILabel.customLabel()
    
    let view = UIView.customView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(){
        contentView.addSubview(view)
        view.addSubview(backgroundImage)
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(muscle)
        muscle.backgroundColor = .black.withAlphaComponent(0.5)
        muscle.textColor = .white
        muscle.clipsToBounds = true
        muscle.textAlignment = .center
        muscle.font =  .monospacedSystemFont(ofSize: 14, weight: .semibold)
        muscle.lineBreakMode = .byWordWrapping
        muscle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            muscle.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 2),
            muscle.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 5)
            
        ])
        
        
    }
    
    func updateCells(image: String, muscles: String){
        backgroundImage.image = UIImage(named: image)
        muscle.text = muscles
    }
}
