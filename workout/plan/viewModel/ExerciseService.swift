//
//  ExerciseService.swift
//  workout
//
//  Created by vano Kvakhadze on 25.07.24.
//

import Foundation

class ExerciseService {
    static let shared = ExerciseService()
    
    func uniqueExercises(for day: Int, in viewModel: PlaningViewModel) -> [Exercise] {
        var seenBodyParts = Set<String>()
        let exercisesForDay: [Exercise]
        
        switch day % 3 {
        case 1:
            exercisesForDay = viewModel.day1
        case 2:
            exercisesForDay = viewModel.day2
        case 0:
            exercisesForDay = viewModel.day3
        default:
            exercisesForDay = []
        }
        
        var uniqueExercises = [Exercise]()
        for exercise in exercisesForDay {
            if !seenBodyParts.contains(exercise.bodyPart) {
                uniqueExercises.append(exercise)
                seenBodyParts.insert(exercise.bodyPart)
            }
        }
        return uniqueExercises
    }
    
    func allExercises(for day: Int, in viewModel: PlaningViewModel) -> [Exercise] {
        switch day % 3 {
        case 1:
            return viewModel.day1
        case 2:
            return viewModel.day2
        case 0:
            return viewModel.day3
        default:
            return []
        }
    }
    
    func fetchExercise(completion: @escaping ([Exercise]) -> Void) {
        let headers = [
            "x-rapidapi-key": "a52af755b4mshab61eb4577404fdp152921jsn45df7bd71eff",
            "x-rapidapi-host": "exercisedb.p.rapidapi.com"
        ]
        
        let urlString = "https://exercisedb.p.rapidapi.com/exercises?limit=250&offset=0"
        
        NetworkService().requestData(urlString: urlString, headers: headers) { (result: [Exercise]?, error) in
            if let result = result {
                completion(result)
            } else if let error = error {
                print("Failed to fetch exercises: \(error.localizedDescription)")
            }
        }
    }
}
