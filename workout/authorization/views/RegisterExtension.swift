//
//  RegisterExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 24.07.24.
//

import Foundation
import UIKit

extension RegisterVC:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            height.text = String(numbers[row])
        case 2:
            weight.text = String(numbers[row])
        default:
            return
        }
        pickerView.resignFirstResponder()
        view.endEditing(true)
    }
}
