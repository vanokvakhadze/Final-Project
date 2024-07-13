//
//  TabBarVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import Foundation
import UIKit

class TabBarVC {
    static func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers =  [WorkOutVC(), WorkOutPlanVC(),  FoodVC(), UserVC()]
        
        tabBarController.tabBar.items?[0].image = UIImage(systemName: "dumbbell")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "figure.strengthtraining.traditional")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "fork.knife")
        tabBarController.tabBar.items?[3].image = UIImage(systemName: "person.fill")
    
        tabBarController.tabBar.tintColor = .systemCyan
        tabBarController.tabBar.backgroundColor = .secondarySystemGroupedBackground
        
       
        
        return tabBarController
    }
}
