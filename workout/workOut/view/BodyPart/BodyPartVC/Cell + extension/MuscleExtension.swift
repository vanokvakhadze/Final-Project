//
//  MuscleExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import Foundation
import UIKit

extension WorkOutVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.bodyPartCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "muscle") as? MuscleCell
        let item = viewModel.bodyPart[indexPath.row]
        cell?.updateCells(image: item, muscles: item)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.fetchExercise(for: indexPath.row)
    }
}
