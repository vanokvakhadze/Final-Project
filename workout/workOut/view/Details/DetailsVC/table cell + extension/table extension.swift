//
//  table extension.swift
//  workout
//
//  Created by vano Kvakhadze on 12.07.24.
//

import Foundation
import UIKit

extension exerciseDetailsVC: UITableViewDataSource, UITableViewDelegate {
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.details.instructions.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "details") as? detailsCell
        let item = viewModel.details.instructions[indexPath.row]
        cell?.updateCells(text: item)
        cell?.backgroundColor = .clear
        return cell ?? UITableViewCell()
    }
    
}
