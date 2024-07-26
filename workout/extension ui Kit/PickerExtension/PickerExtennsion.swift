//
//  PickerExtennsion.swift
//  workout
//
//  Created by vano Kvakhadze on 25.07.24.
//

import Foundation
import UIKit

extension UITextField {
    
    func setPickerView(_ picker: UIPickerView, target: Any) {
     
        picker.delegate = target as? UIPickerViewDelegate
        picker.dataSource = target as? UIPickerViewDataSource
        self.inputView = picker

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPicker))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        self.inputAccessoryView = toolbar
    }
    
    @objc func dismissPicker() {
        self.resignFirstResponder()
    }
}
