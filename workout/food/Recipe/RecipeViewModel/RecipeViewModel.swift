//
//  RecipeViewModel.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import Foundation

protocol RecipeDelegate {
    func updateCollection(recipe: Food)
    func navigationToRecipeDetails(with viewModel: RecipeDetailViewModel)
}

class RecipeViewModel {
    
    var foodType: String = ""
    
    var diet = ["balanced", "high-fiber", "high-protein", "low-carb", "low-fat", "low-sodium"]
    
    var health = ["celery-free", "crustacean-free", "dairy-fresh", "egg-free", "fish-free", "gluten-free", "keto-friendly", "low-fat-abs", "low-sugar", "lupine-free", "mustard-free", "no-oil-added", "mollusk-free", "pork-free", "red-meat-free", "sugar-conscious", "vegan", "vegetarian"]
    
    var country = [ "American", "Asian", "British", "Caribbean", "Chinese", "French", "Italian", "Indian", "Japanese", "Mexican"]
    
    var dishType = [ "Bread", "Cereals", "Desserts", "Drinks", "Pancake", "Preps", "Preserve", "Salad", "Sandwiches", "Side dish", "Soup", "Starter", "Sweet"]
    
    var selectedDiet: String?
    var selectedHealth: String?
    var selectedCountry: String?
    var selectedDishType: String?
    
    var hasPlayedAnimation = false
    
   var recipe:  Food?
    
    
    init(foodType: String) {
        self.foodType = foodType
    }
    
    var dietCount: Int {
        diet.count
    }
    
    var healthCount: Int {
        health.count
    }
    
    var countryCount: Int {
        country.count
    }
    
    var dishTypeCount: Int {
        dishType.count
    }
    
    var recipeCount: Int {
        recipe?.hits.count ?? 0
    }
    
    
    var delegate: RecipeDelegate?
    
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
            guard let diet = selectedDiet,
                  let health = selectedHealth,
                  let country = selectedCountry,
                  let dishType = selectedDishType else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "All filters must be selected."])))
                return
            }
            
            let urlString = "https://api.edamam.com/api/recipes/v2?type=public&app_id=4fd600be&app_key=af4093cdb6e509a06b863ea4e194b180&diet=\(diet)&health=\(health)&cuisineType=\(country)&mealType=\(foodType)&dishType=\(dishType)&calories=100-400&imageSize=REGULAR&random=true"
            
        NetworkService().requestData(urlString: urlString) { [weak self] (result: Food?, error) in
            if let result = result {
                DispatchQueue.main.async {
                    self?.recipe = result
                    self?.delegate?.updateCollection(recipe: result)
                }
            } else if let error = error {
                print("Failed to fetch exercises: \(error.localizedDescription)")
            }
        }
    }
    
    func selectedFood(for index: Int){
        let selectedFood = recipe?.hits[index].recipe
        let VM = RecipeDetailViewModel(details: selectedFood!)
        delegate?.navigationToRecipeDetails(with: VM)
    }
}
