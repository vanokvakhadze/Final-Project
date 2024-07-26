//
//  DayManager.swift
//  workout
//
//  Created by vano Kvakhadze on 25.07.24.
//

import Foundation

class DayManager {
    static let shared = DayManager()
    
    func moveToNextDay(in viewModel: PlaningViewModel) {
        if viewModel.allExercisesCompletedForCurrentDay {
            viewModel.currentDay += 1
            viewModel.completed.removeAll()
        }
    }
    
    func moveToNextChallenge(in viewModel: PlaningViewModel) {
        viewModel.isNextMonth = true
        viewModel.nextMonthExercises.removeAll()
        viewModel.completed.removeAll()
        viewModel.currentDay = 1
    }
}
