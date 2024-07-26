//
//  WorkOutPlanVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit
import SwiftUI

class WorkOutPlanVC: UIViewController {
    
    private var viewModel = PlaningViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSwiftView()
        navigationController?.navigationBar.isHidden = true
    }
    

    private func setUpSwiftView() {
        let swiftView = PlaningView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftView)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        addChild(hostingController)
        
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
 
        
        hostingController.didMove(toParent: self)
    }
    
    
}

#Preview{
    WorkOutPlanVC()
}
