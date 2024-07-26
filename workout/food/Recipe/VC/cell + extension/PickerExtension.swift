//
//  PickerExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import Foundation
import UIKit

extension RecipeVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return viewModel.dietCount
        case 2:
            return viewModel.countryCount
        case 3:
            return viewModel.dishTypeCount
        case 4:
            return viewModel.healthCount
        default:
            return 1
        
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return viewModel.diet[row]
        case 2:
            return viewModel.country[row]
        case 3:
            return viewModel.dishType[row]
        case 4:
            return viewModel.health[row]
        default:
            return "not found"
        
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            viewModel.selectedDiet = viewModel.diet[row]
            dietField.text = viewModel.diet[row]
        case 2:
            viewModel.selectedCountry = viewModel.country[row]
            countryField.text = viewModel.country[row]
        case 3:
            viewModel.selectedDishType = viewModel.dishType[row]
            dishTypeField.text = viewModel.dishType[row]
        case 4:
            viewModel.selectedHealth = viewModel.health[row]
            healthField.text = viewModel.health[row]
        default:
            return
        
        }
        pickerView.resignFirstResponder()
        view.endEditing(true)
    }
    
    
}
