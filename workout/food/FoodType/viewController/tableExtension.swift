//
//  tableExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import Foundation
import UIKit

extension FoodVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.foodCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food") as? FoodCell
        let item = viewModel.foodType[indexPath.row]
        cell?.updateCells(image: item, text: item)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.fetchFood(for: indexPath.row)
    }
}
