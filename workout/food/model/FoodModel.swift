//
//  FoodModel.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import Foundation

struct Food: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let label: String
    let image: String
    let images: RegularSize
    let dietLabels: [String]
    let ingredients: [Ingredient]
    let calories: Double
    let cuisineType: [String]
    let mealType: [String]
}

struct RegularSize: Decodable {
    var regular: ImageDetails
    
    enum CodingKeys: String, CodingKey {
            case regular = "REGULAR"
        }
    
    struct ImageDetails: Decodable {
        var url: String
    }
}

struct Ingredient: Decodable {
    let text: String
    let foodId: String
    let image: String?
}
