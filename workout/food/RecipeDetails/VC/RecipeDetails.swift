//
//  RecipeDetails.swift
//  workout
//
//  Created by vano Kvakhadze on 23.07.24.
//

import UIKit
import SwiftUI

class RecipeDetails: UIViewController {
    
    var details: RecipeDetailViewModel
    
    
    
    init(details: RecipeDetailViewModel) {
        self.details = details
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPSwiftUi()
      
    }
    

    func setUPSwiftUi(){
        let swiftUIView = detailsWithSwift(viewModel: details)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }


}

