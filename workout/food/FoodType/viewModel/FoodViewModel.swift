//
//  FoodViewModel.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import Foundation

protocol FoodDelegate: AnyObject {
    func fetchFoodType(food: [String])
    func navigationToExerciseVC(with viewModel:  RecipeViewModel)
   
}

class FoodViewModel{
    
    var foodType = ["Breakfast", "Dinner", "Lunch", "Snack", "Teatime"]
    
    var foodCount: Int {
        foodType.count
    }
    
    var selectedIndex = 0
    
    weak var delegate: FoodDelegate?
   
    func getMuscles(){
        delegate?.fetchFoodType(food: foodType)
    }
    
    func fetchFood(for index: Int){
        selectedIndex = index
        let selectedFood = foodType[selectedIndex]
        let VM = RecipeViewModel(foodType: selectedFood)
        delegate?.navigationToExerciseVC(with: VM)
    }
    
}
