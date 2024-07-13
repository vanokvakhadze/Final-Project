//
//  detailsCell.swift
//  workout
//
//  Created by vano Kvakhadze on 12.07.24.
//

import UIKit

class detailsCell: UITableViewCell {
    
    let descriptionText = UILabel.customLabel()
   
    
    let view = UIView.customView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        contentView.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.addSubview(view)
        contentView.clipsToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .clear
        
     
       
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        setUpUDescription()
        
    }
    
    func setUpUDescription(){
        view.addSubview(descriptionText)
        
        descriptionText.textAlignment = .left
        descriptionText.font = .systemFont(ofSize: 14)
        descriptionText.textColor = .systemGroupedBackground
        descriptionText.lineBreakMode = .byWordWrapping
        descriptionText.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
   
    
    func updateCells(text: String){
        descriptionText.text = text
    }
    
   
    
    
}



