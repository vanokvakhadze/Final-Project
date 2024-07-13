//
//  extension.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import Foundation
import UIKit

extension ExerciseVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercise.exerciseCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercise") as? ExerciseCell
        let item = exercise.exercise[indexPath.row]
        cell?.updateCells(image: item.gifUrl, nameExercise: item.name, targetMuscle: item.target, equipmentExercise: item.equipment)
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exercise.selectExercise(for: indexPath.row)
    }
}
