//
//  FoodCell.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import UIKit

class FoodCell: UITableViewCell {

    
    
    let foodImage = UIImageView()
    let foodType = UILabel.customLabel()
    
    let view = UIView.customView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        addSubview(view)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .secondarySystemBackground
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            view.heightAnchor.constraint(equalToConstant: 140),
        ])
        
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(foodImage)
        view.addSubview(foodType)
        foodImage.clipsToBounds = true
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.layer.cornerRadius = 20
        foodImage.contentMode = .scaleAspectFill
        foodType.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.5)

        foodType.clipsToBounds = true
        foodType.textAlignment = .center
        foodType.layer.cornerRadius = 10
        foodType.font =  .monospacedSystemFont(ofSize: 20, weight: .semibold)
        foodType.lineBreakMode = .byWordWrapping
        foodType.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: view.topAnchor),
            foodImage.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            foodImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            foodImage.widthAnchor.constraint(equalToConstant: 200),
            foodType.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -8),
            foodType.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 20),
            foodType.widthAnchor.constraint(equalToConstant: 120),
            foodType.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    
    func updateCells(image: String, text: String){
        foodImage.image = UIImage(named: image)
        foodType.text = text
    }

}
