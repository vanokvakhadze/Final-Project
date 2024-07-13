//
//  exerciseViewModel.swift
//  workout
//
//  Created by vano Kvakhadze on 13.07.24.
//

import UIKit

protocol ExerciseViewModelDelegate: AnyObject {
    func updateView(exercise: [Exercise])
    func navigateToDetails(with viewModel: ExerciseDetailsViewModel)
}

class exerciseViewModel {
    
    var bodyPart: String
    var exercise: [Exercise] = []
    
    var exerciseCount: Int  {
        exercise.count
    }
    
    weak var delegate: ExerciseViewModelDelegate?
    
    init(bodyPart: String) {
        self.bodyPart = bodyPart
        getExercise(for: bodyPart)
    }
    
    
    func  getExercise(for bodyPart: String){
        let headers = [
                   "x-rapidapi-key": "12cced9067mshc5f9538fa3a5fbbp133134jsn81fc7f6513a4",
                   "x-rapidapi-host": "exercisedb.p.rapidapi.com"
               ]
               
               let urlString = "https://exercisedb.p.rapidapi.com/exercises/bodyPart/\(bodyPart)?/limit=20&offset=0"
               
               NetworkService().requestData(urlString: urlString, headers: headers) { [weak self] (result: [Exercise]?, error) in
                   if let result = result {
                       DispatchQueue.main.async {
                           self?.exercise = result
                           self?.delegate?.updateView(exercise: result)
                       }
                   } else if let error = error {
                       print("Failed to fetch exercises: \(error.localizedDescription)")
                   }
               }
           }
    
    func selectExercise(for index: Int){
        let selectedExercise = exercise[index]
        let VM = ExerciseDetailsViewModel(details: selectedExercise)
        delegate?.navigateToDetails(with: VM)
    }
    
}
