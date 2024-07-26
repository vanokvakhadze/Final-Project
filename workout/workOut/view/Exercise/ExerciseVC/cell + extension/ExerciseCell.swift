//
//  ExerciseCell.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import UIKit

class ExerciseCell: UITableViewCell {

    
    let muscleGif = GIFImageView()
    let equipmentImage = UIImageView.customSystemView(imageName: "dumbbell")
    let targetImage = UIImageView.customSystemView(imageName: "arrowshape.forward")

    let name = UILabel.customLabel()
    let target = UILabel.customLabel()
    let equipment = UILabel.customLabel()
    let view = UIView.customView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .tertiarySystemBackground
        configure()
        setUpUI()
        setUpImage()
       
        
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        muscleGif.stopAnimating()
        muscleGif.isPlaying = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.addSubview(view)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .exerciseRow2
      
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setUpImage(){
        view.addSubview(targetImage)
        view.addSubview(equipmentImage)
        targetImage.tintColor = .systemGreen
        equipmentImage.tintColor = .systemMint
        
        NSLayoutConstraint.activate([
            equipmentImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            equipmentImage.leadingAnchor.constraint(equalTo: muscleGif.trailingAnchor, constant: 25),
            equipmentImage.widthAnchor.constraint(equalToConstant: 20),
            equipmentImage.heightAnchor.constraint(equalToConstant: 20),
            targetImage.topAnchor.constraint(equalTo: equipmentImage.bottomAnchor, constant: 5),
            targetImage.leadingAnchor.constraint(equalTo: muscleGif.trailingAnchor, constant: 25),
            targetImage.widthAnchor.constraint(equalToConstant: 20),
            targetImage.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
    
    func setUpUI(){
        view.addSubview(muscleGif)
        view.addSubview(name)
        view.addSubview(target)
        view.addSubview(equipment)
        muscleGif.clipsToBounds = true
        muscleGif.translatesAutoresizingMaskIntoConstraints = false
        muscleGif.layer.cornerRadius = 10
        muscleGif.contentMode = .scaleAspectFill
       
        name.textAlignment = .center

        name.numberOfLines = 1
        name.font = .boldSystemFont(ofSize: 14)
       
        target.font = .systemFont(ofSize: 8)
        
        equipment.font = .systemFont(ofSize: 10)
        
        NSLayoutConstraint.activate([
            muscleGif.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            muscleGif.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            muscleGif.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            muscleGif.widthAnchor.constraint(equalToConstant: 100),
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: muscleGif.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            equipment.leadingAnchor.constraint(equalTo: muscleGif.trailingAnchor, constant: 65),
            equipment.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            target.leadingAnchor.constraint(equalTo: muscleGif.trailingAnchor, constant: 65),
            target.topAnchor.constraint(equalTo: equipment.bottomAnchor, constant:  14)
        ])
        
        
    }
    
    
    func updateCells(image: String, nameExercise: String, targetMuscle: String, equipmentExercise: String){
        guard let gifURL = URL(string: image) else {
            print("Invalid URL")
            return
        }
        muscleGif.loadGIF(from: gifURL)
        name.text = nameExercise
        target.text = targetMuscle
        equipment.text = equipmentExercise
    }
    
   
    
    
}

