//
//  ExerciseManager.swift
//  workout
//
//  Created by vano Kvakhadze on 25.07.24.
//

import Foundation

class ExerciseManager {
    static let shared = ExerciseManager()
    
    func toggleExerciseCompletion(_ exercise: Exercise, in viewModel: PlaningViewModel) {
        if viewModel.completed.contains(exercise.id) {
            viewModel.completed.remove(exercise.id)
            viewModel.nextMonthExercises.removeAll { $0.id == exercise.id }
        } else {
            viewModel.completed.insert(exercise.id)
            if !viewModel.nextMonthExercises.contains(where: { $0.id == exercise.id }) {
                viewModel.nextMonthExercises.append(exercise)
            }
        }
    }
    
    func completeAllExercisesForCurrentDay(in viewModel: PlaningViewModel) {
        let exercisesForDay = viewModel.allExercises(for: viewModel.currentDay)
        for exercise in exercisesForDay {
            if !viewModel.completed.contains(exercise.id) {
                viewModel.completed.insert(exercise.id)
                if !viewModel.nextMonthExercises.contains(where: { $0.id == exercise.id }) {
                    viewModel.nextMonthExercises.append(exercise)
                }
            }
        }
    }
    
    func allExercisesCompletedForCurrentDay(for currentDay: Int, in viewModel: PlaningViewModel) -> Bool {
        let exercisesForDay = viewModel.allExercises(for: currentDay)
        return exercisesForDay.allSatisfy { viewModel.completed.contains($0.id) }
    }
}
