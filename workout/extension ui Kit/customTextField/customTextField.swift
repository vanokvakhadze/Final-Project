//
//  customTextField.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case email
        case password
        case height
        case weight
        case none
        case edit
      
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
        case .height:
            self.placeholder = "181cm"
            self.textColor = .brown
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        case .weight:
            self.placeholder = "83 kg"
            self.textColor = .brown
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
            
        case .none:
            self.placeholder = ""
          
        case .edit:
            self.isEnabled = false
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
            self.backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(with text: String, andRightImage image: UIImage) {
            self.placeholder = text
 
            let imageView = UIImageView(image: image)
      
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: -10, y: -8, width: 18, height: 18)
            imageView.tintColor = .gray
   
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.size.height))
            containerView.addSubview(imageView)
            
            self.rightView = containerView
            self.rightViewMode = .always
        }
}
