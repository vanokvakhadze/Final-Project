//
//  TabBarVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import Foundation
import UIKit


class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        createTabBarController()
    }
    
    override func viewDidLayoutSubviews() {
        configuration()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.animation(item)
    }
    
    func createTabBarController(){
        
        
        let workOutVC = WorkOutVC()
        let workOutPlanVC = WorkOutPlanVC()
        let foodVC = FoodVC()
        let userVC = UserVC()
        
        workOutVC.tabBarItem = UITabBarItem(title: "Workout", image: UIImage(systemName: "dumbbell"), tag: 0)
        workOutPlanVC.tabBarItem = UITabBarItem(title: "Challenge", image: UIImage(systemName: "figure.strengthtraining.traditional"), tag: 1)
        foodVC.tabBarItem = UITabBarItem(title: "Food", image: UIImage(systemName: "fork.knife"), tag: 2)
        userVC.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person.fill"), tag: 3)
        
        let nav1 = UINavigationController(rootViewController: workOutVC)
        let nav2 = UINavigationController(rootViewController: workOutPlanVC)
        let nav3 = UINavigationController(rootViewController: foodVC)
        let nav4 = UINavigationController(rootViewController: userVC)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
        
        tabBar.tintColor = .tabBarTint
        tabBar.backgroundColor = .tabBackground
        tabBar.barTintColor = .tabBackground
        tabBar.unselectedItemTintColor = .unSelected
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        
        
        
        
        
    }
    
    func configuration(){
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.size.height - 100
        
        
        
    }
    
    func animation(_ item: UITabBarItem){
        guard let tabItem = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.5
        
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            tabItem.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        
        propertyAnimator.addAnimations({tabItem.transform = .identity}, delayFactor: timeInterval)
        propertyAnimator.startAnimation()
    }
    
    
}

#Preview{
    TabBarVC()
}
