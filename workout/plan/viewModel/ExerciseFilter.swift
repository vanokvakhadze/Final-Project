//
//  ExerciseFilter.swift
//  workout
//
//  Created by vano Kvakhadze on 15.07.24.
//

import Foundation

class ExerciseFilter {
    static func filterExercises(for day: PlaningViewModel.Day, bodyType: BodyType, exercises: [Exercise]) -> [Exercise] {
        var filteredExercises: [Exercise] = []
        
        switch bodyType {
        case .thin:
            filteredExercises = filterForThin(day: day, exercises: exercises)
        case .normal:
            filteredExercises = filterForNormal(day: day, exercises: exercises)
        case .weight:
            filteredExercises = filterForWeight(day: day, exercises: exercises)
        case .overweight:
            filteredExercises = filterForOverweight(day: day, exercises: exercises)
        }
        
        return filteredExercises
    }
    
    private static func filterForThin(day: PlaningViewModel.Day, exercises: [Exercise]) -> [Exercise] {
        switch day {
        case .day1:
            return Array(exercises.filter { $0.bodyPart == "upper arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "back" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "shoulders" }.prefix(2))
        case .day2:
            return Array(exercises.filter { $0.bodyPart == "neck" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "lower arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "chest" }.prefix(2))
            
        case .day3:
            return Array(exercises.filter { $0.bodyPart == "waist" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "lower legs" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "upper legs" }.prefix(1))
        }
    }
    
    private static func filterForNormal(day: PlaningViewModel.Day, exercises: [Exercise]) -> [Exercise] {
        switch day {
        case .day1:
            return Array(exercises.filter { $0.bodyPart == "upper arms" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "back" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "shoulders" }.prefix(2))
            
        case .day2:
            return Array(exercises.filter { $0.bodyPart == "neck" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "lower arms" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "chest" }.prefix(1))
            
            
        case .day3:
            return Array(exercises.filter { $0.bodyPart == "waist" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "lower legs" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "upper legs" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
        }
    }
    
    private static func filterForWeight(day: PlaningViewModel.Day, exercises: [Exercise]) -> [Exercise] {
        switch day {
        case .day1:
            return Array(exercises.filter { $0.bodyPart == "upper arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "back" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "shoulders" }.prefix(1))
           
            
        case .day2:
            return Array(exercises.filter { $0.bodyPart == "neck" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "lower arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
            
        case .day3:
            return Array(exercises.filter { $0.bodyPart == "lower legs" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "upper legs" }.prefix(2)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
        }
    }
    
    private static func filterForOverweight(day: PlaningViewModel.Day, exercises: [Exercise]) -> [Exercise] {
        switch day {
        case .day1:
            return Array(exercises.filter { $0.bodyPart == "upper arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "back" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "shoulders" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
            
        case .day2:
            return Array(exercises.filter { $0.bodyPart == "lower arms" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "chest" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
            
        case .day3:
            return Array(exercises.filter { $0.bodyPart == "lower legs" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "upper legs" }.prefix(1)) +
            Array(exercises.filter { $0.bodyPart == "cardio" }.prefix(1))
        }
    }
}
