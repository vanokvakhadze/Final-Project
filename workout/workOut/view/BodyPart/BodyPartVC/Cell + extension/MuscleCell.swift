//
//  MuscleCell.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import UIKit

class MuscleCell: UITableViewCell {
    let bodyPartImage = UIImageView()
    let backgroundImage = UIImageView.customNamedImage(named: "backGR1")
    let muscle = UILabel.customLabel()
    
    let view = UIView.customView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        contentView.backgroundColor = UIColor(named: "backColor3")!.withAlphaComponent(0.6)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.addSubview(view)
        view.addSubview(backgroundImage)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .secondarySystemBackground
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            view.heightAnchor.constraint(equalToConstant: 140),
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(bodyPartImage)
        view.addSubview(muscle)
        bodyPartImage.clipsToBounds = true
        bodyPartImage.translatesAutoresizingMaskIntoConstraints = false
        bodyPartImage.layer.cornerRadius = 20
        bodyPartImage.contentMode = .scaleAspectFill
        muscle.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        muscle.textColor = .systemGroupedBackground
        muscle.clipsToBounds = true
        muscle.textAlignment = .center
        muscle.layer.cornerRadius = 10
        muscle.font =  .monospacedSystemFont(ofSize: 20, weight: .semibold)
        muscle.lineBreakMode = .byWordWrapping
        muscle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            bodyPartImage.topAnchor.constraint(equalTo: view.topAnchor),
            bodyPartImage.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            bodyPartImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bodyPartImage.widthAnchor.constraint(equalToConstant: 200),
            muscle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -8),
            muscle.leadingAnchor.constraint(equalTo: bodyPartImage.trailingAnchor, constant: 20),
            muscle.widthAnchor.constraint(equalToConstant: 120),
            muscle.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    
    func updateCells(image: String, muscles: String){
        bodyPartImage.image = UIImage(named: image)
        muscle.text = muscles
    }
    
}
