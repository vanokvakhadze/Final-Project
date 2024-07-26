//
//  PlaningViewModel.swift
//  workout
//
//  Created by vano Kvakhadze on 14.07.24.
//
import Foundation
import Firebase

enum Day {
    case day1, day2, day3
}


class PlaningViewModel: ObservableObject {
    static let shared = PlaningViewModel()
    
    @Published var allExercise: [Exercise] = []
    @Published var completed: Set<String> = []
    @Published var nextMonthExercises: [Exercise] = []
    @Published var bodyType: BodyType = .normal
    @Published var userHeight: Double = 181.5
    @Published var userWeight: Double = 85.3
    @Published var currentDay: Int = 1
    @Published var isNextMonth: Bool = false
    @Published var accepted: Bool = false
    @Published var isEditing = false
    @Published var showAlert = false
    
    init(){
        loadUserData()
        fetchExercise()
    }
    
    
    func setUserInfo(height: Double, weight: Double) {
        self.userHeight = height
        self.userWeight = weight
        self.bodyType = BodyType.categorize(height: height, weight: weight)
    }
    
    
    func loadUserData() {
        AuthService.shared.fetchUser { [weak self] user, error in
            if let user = user {
                self?.userHeight = user.height
                self?.userWeight = user.weight
                self?.bodyType = BodyType.categorize(height: user.height, weight: user.weight)
            }
        }
    }
    
    
    var day1: [Exercise] {
        return ExerciseFilter.filterExercises(for: .day1, bodyType: .categorize(height: userHeight, weight: userWeight), exercises: exercisesInRange)
    }
    
    var day2: [Exercise] {
        return ExerciseFilter.filterExercises(for: .day2, bodyType: .categorize(height: userHeight, weight: userWeight), exercises: exercisesInRange)
    }
    
    var day3: [Exercise] {
        return ExerciseFilter.filterExercises(for: .day3, bodyType: .categorize(height: userHeight, weight: userWeight), exercises: exercisesInRange)
    }
    
    var currentDayExerciseCount: Int {
        return allExercises(for: currentDay).count
    }
    
    var monthExerciseCount: Int {
        day1.count + day2.count + day3.count
    }
    
    
    var exercisesInRange: [Exercise] {
        guard !allExercise.isEmpty else { return [] }
        
        let startIndex = isNextMonth ? 200 : 0
        let endIndex = min(allExercise.count, isNextMonth ? 400 : 200)
        
        return Array(allExercise[startIndex..<endIndex])
    }
    
    
    func toggleEditing() {
        isEditing.toggle()
    }
    
    
    func reset() {
        loadUserData()
        allExercise = []
        completed = []
        nextMonthExercises = []
        bodyType = .normal
        userHeight = 181.5
        userWeight = 85.3
        currentDay = 1
        isNextMonth = false
        isEditing = false
    }
    
    
}


extension PlaningViewModel {
    
    
    var allExercisesCompletedForCurrentDay: Bool {
        return ExerciseManager.shared.allExercisesCompletedForCurrentDay(for: currentDay, in: self)
    }
    
    
    func moveToNextDay() {
        DayManager.shared.moveToNextDay(in: self)
    }
    
    func moveToNextChallenge() {
        DayManager.shared.moveToNextChallenge(in: self)
    }
    
    func toggleExerciseCompletion(_ exercise: Exercise) {
        ExerciseManager.shared.toggleExerciseCompletion(exercise, in: self)
    }
    
    func completeAllExercisesForCurrentDay() {
        ExerciseManager.shared.completeAllExercisesForCurrentDay(in: self)
    }
    
    
    func uniqueExercises(for day: Int) -> [Exercise] {
        return ExerciseService.shared.uniqueExercises(for: day, in: self)
    }
    
    func allExercises(for day: Int) -> [Exercise] {
        return ExerciseService.shared.allExercises(for: day, in: self)
    }
    
    func fetchExercise() {
        ExerciseService.shared.fetchExercise { [weak self] result in
            DispatchQueue.main.async {
                self?.allExercise = result
            }
        }
    }
    
    
    enum Day {
        case day1, day2, day3
    }
    
}
