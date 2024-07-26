//
//  RecipeCell.swift
//  workout
//
//  Created by vano Kvakhadze on 23.07.24.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    let FoodImage = UIImageView()
    let mealTitle = UILabel.customLabel()
    let calories = UILabel.customLabel()
    let imageCalories = UIImageView()
    
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

        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = .tertiarySystemGroupedBackground
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
         
        ])
        
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(mealTitle)
        view.addSubview(FoodImage)
        view.addSubview(calories)
        mealTitle.font =  .monospacedSystemFont(ofSize: 12, weight: .regular)
        mealTitle.numberOfLines = 2
        FoodImage.translatesAutoresizingMaskIntoConstraints = false
        FoodImage.clipsToBounds = true
        FoodImage.layer.cornerRadius = 16
        FoodImage.contentMode = .scaleAspectFill
        calories.font = .systemFont(ofSize: 10)
        calories.clipsToBounds = true
        calories.backgroundColor = .systemOrange
        calories.layer.cornerRadius = 10
        calories.textAlignment = .center
        view.addSubview(imageCalories)
        imageCalories.image = UIImage(systemName: "flame")
        imageCalories.tintColor = .systemRed.withAlphaComponent(0.7)
        imageCalories.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            FoodImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            FoodImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            FoodImage.widthAnchor.constraint(equalToConstant: 150),
            FoodImage.heightAnchor.constraint(equalToConstant: 130),
            mealTitle.topAnchor.constraint(equalTo: FoodImage.bottomAnchor, constant: 10),
            mealTitle.leadingAnchor.constraint(equalTo: FoodImage.leadingAnchor, constant: 10),
            mealTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            calories.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            calories.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calories.widthAnchor.constraint(equalToConstant: 55),
            calories.heightAnchor.constraint(equalToConstant: 20),
            imageCalories.centerYAnchor.constraint(equalTo: calories.centerYAnchor),
            imageCalories.trailingAnchor.constraint(equalTo: calories.leadingAnchor, constant: -8),
            imageCalories.widthAnchor.constraint(equalToConstant: 16),
            imageCalories.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        
    }
    
    func updateCells(name: String, image: String, calory: Double){
        if let imgURl = URL(string: image){
            FoodImage.loadImage(from: imgURl)
        }
        mealTitle.text = name
        calories.text = "\(String(format: "%0.f", calory)) cal"
    }
}
