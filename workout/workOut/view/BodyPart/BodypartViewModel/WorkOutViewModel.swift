//
//  WorkOutViewModel.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func fetchBodyPart(muscles: [String])
    func navigationToExerciseVC(with viewModel:  exerciseViewModel)
   
}

class WorkoutViewModel {
    
    
    var bodyPart: [String] = ["back", "chest", "lower arms", "neck", "shoulders", "upper arms", "upper legs", "lower legs", "waist", "cardio"]
    
    var bodyPartCount: Int {
        bodyPart.count
    }
    
    var selectedIndex = 0
    
    weak var delegate: ViewModelDelegate?
   
    func getMuscles(){
        delegate?.fetchBodyPart(muscles: bodyPart)
    }
    
    func fetchExercise(for index: Int){
        selectedIndex = index
        let selectedBodyPart = bodyPart[selectedIndex]
        let VM = exerciseViewModel(bodyPart: selectedBodyPart)
        delegate?.navigationToExerciseVC(with: VM)
    }
    
}
