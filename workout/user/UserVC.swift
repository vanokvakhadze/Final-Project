//
//  UserVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit
import SwiftUI
import Firebase

class UserVC: UIViewController {
    private var viewModel = PlaningViewModel.shared
    let numbers = Array(0...300)
    
    
    private let safeZone = UIView.customView()
    private let userView = UIView.customView()
    private let infoView = UIView.customView()
    private let bottomView = UIView.customView()
    
    private let backgroundImageView = UIImageView.customNamedImage(named: "backGR2")
    
    private let userImage = UIImageView.customSystemView(imageName: "figure.strengthtraining.traditional")
    
    private let heightImage = UIImageView.customNamedImage(named: "heightImage")
    
    private let weightImage = UIImageView.customNamedImage(named: "scaleImage")
    
    private let user = CustomTextField(fieldType: .edit)
    let height = CustomTextField(fieldType: .edit)
    let weight = CustomTextField(fieldType: .edit)
    private let profileText = UILabel.customLabel()
    
    private let logOut = UIButton.customButton(width: 200, height: 50)
    private let delete = UIButton.customButton(width: 130, height: 50)
    private let edit = UIButton.customButton(width: 60, height: 30)
    
    let heightPicker = UIPickerView()
    let weightPicker = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()
        updateUserInfo()
        setUpSwiftView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUserInfo()
    }
    
    func setUpUI(){
        setUpSafeArea()
        addUserView()
        addDetailsView()
        buttonViews()
        
    }
    
    func setUpSafeArea(){
        view.addSubview(safeZone)
        let safeView = view.safeAreaLayoutGuide
        safeZone.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeZone.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeZone.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeZone.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
       
      
    }
    
    func addUserView(){
        safeZone.addSubview(userView)
        safeZone.addSubview(profileText)
        profileText.font = .boldSystemFont(ofSize: 26)
        profileText.text = "User Details"
       
        
        userView.backgroundColor = .tertiarySystemGroupedBackground
        
        NSLayoutConstraint.activate([
            profileText.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 5),
            profileText.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 25),
            userView.topAnchor.constraint(equalTo: profileText.bottomAnchor, constant: 20),
            userView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            userView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            userView.heightAnchor.constraint(equalToConstant: 110)
        ])
        addUser()
        addEditButton()
        
    }
    
    
    func addUser(){
        
        userView.addSubview(userImage)
        userView.addSubview(user)
        
        user.font = .boldSystemFont(ofSize: 22)
        user.layer.cornerRadius = 10
        
        userImage.tintColor = .black
        userImage.backgroundColor = .white
        userImage.layer.cornerRadius = 35
        
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: userView.centerXAnchor, constant: -145),
            userImage.centerYAnchor.constraint(equalTo: userView.centerYAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 70),
            userImage.heightAnchor.constraint(equalToConstant: 70),
            user.topAnchor.constraint(equalTo: userImage.centerYAnchor, constant: -10),
            user.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 25),
            user.widthAnchor.constraint(equalToConstant: 190)])
        
    }
    
    func addEditButton(){
        safeZone.addSubview(edit)
        edit.setTitle("Edit", for: .normal)
        edit.titleLabel?.font = .boldSystemFont(ofSize: 18)
        edit.backgroundColor = .systemCyan
      
        
        
        edit.addAction(UIAction(handler: {[weak self] _ in
            self?.userEdit()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            edit.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 10),
            edit.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -8)
           ])
    }
    
    func addDetailsView(){
        
        safeZone.addSubview(infoView)
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 15
        infoView.layer.shadowColor = UIColor.systemGray.cgColor
        infoView.layer.shadowOpacity = 0.2
        infoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        infoView.layer.shadowRadius = 4
        infoView.layer.masksToBounds = false
        infoView.backgroundColor = .progres
        
        
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 25),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            infoView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        addUserDetails()
    }
    
    func addUserDetails(){
        infoView.addSubview(heightImage)
        infoView.addSubview(height)
        infoView.addSubview(weightImage)
        infoView.addSubview(weight)
        
      
        weightImage.tintColor = .green
        height.font = .systemFont(ofSize: 20)
        height.layer.cornerRadius = 10
        
       
        weight.font = .systemFont(ofSize: 20)
        weight.layer.cornerRadius = 10
    
        height.setPickerView(heightPicker, target: self)
        weight.setPickerView(weightPicker, target: self)
        
        heightPicker.tag = 1
        weightPicker.tag = 2
    
        
        NSLayoutConstraint.activate([
            heightImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 35),
            heightImage.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            heightImage.widthAnchor.constraint(equalToConstant: 30),
            heightImage.heightAnchor.constraint(equalToConstant: 30),
            height.leadingAnchor.constraint(equalTo: heightImage.trailingAnchor, constant: 8),
            height.centerYAnchor.constraint(equalTo: heightImage.centerYAnchor),
            height.widthAnchor.constraint(equalToConstant: 80),
            weight.widthAnchor.constraint(equalToConstant: 80),
            
            weight.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -35),
            weight.centerYAnchor.constraint(equalTo: weightImage.centerYAnchor),
            weightImage.trailingAnchor.constraint(equalTo: weight.leadingAnchor, constant: -8),
            weightImage.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            weightImage.widthAnchor.constraint(equalToConstant: 30),
            weightImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func buttonViews(){
        safeZone.addSubview(bottomView)
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30
        bottomView.layer.shadowColor = UIColor.white.cgColor
        bottomView.layer.shadowOpacity = 0.5
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 2)
        bottomView.layer.shadowRadius = 4
        bottomView.layer.masksToBounds = false
    
        
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: safeZone.bottomAnchor, constant: -100),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
           
        ])
        addButtons()
    }
    
    func addButtons(){
        bottomView.addSubview(logOut)
        bottomView.addSubview(delete)
        
        logOut.setTitle("Log Out", for: .normal)
        logOut.backgroundColor = .systemBlue
        
        delete.setTitle("Delete", for: .normal)
        delete.backgroundColor = .systemRed
        
        logOut.addAction(UIAction(handler: { _ in
            self.userLogOut() }), for: .touchUpInside)
        
        delete.addAction(UIAction(handler: { _ in
            self.userDelete()}), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logOut.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            logOut.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            delete.topAnchor.constraint(equalTo: logOut.topAnchor),
            delete.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10)])
        
    }
    
    
    func updateUserInfo(){
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.user.text = "\(user.username)"
                self.height.text = "\(user.height)"
                self.weight.text = "\(user.weight)"
                self.viewModel.setUserInfo(height: user.height, weight: user.weight)
            }
        }

    }
    
    
    func userLogOut(){
        AuthService.shared.logOut() { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    
    func userDelete(){
        self.showConfirmationAlert(title: "Delete Account", message: "Are you sure you want to delete your account? This action cannot be undone.", confirmActionHandler: {
            AuthService.shared.deleteUser(from: self) { success, error in
                if let error = error {
                    print("Failed to delete user: \(error.localizedDescription)")
                    AlertManager.deleteUser(on: self, with: error)
                } else if success {
                    DispatchQueue.main.async {
                        let VC = LoginVC()
                        let navigationController = UINavigationController(rootViewController: VC)
                        navigationController.modalPresentationStyle = .fullScreen
                        self.present(navigationController, animated: true, completion: nil)
                        AlertManager.deletedUser(on: navigationController)
                    }
                    
                }
            }
        })
        
    }
    
    
    
    func userEdit(){
        if viewModel.isEditing  {
            guard let username = user.text, !username.isEmpty,
                          let heightText = height.text, let height = Double(heightText),
                          let weightText = weight.text, let weight = Double(weightText) else {
                        let alert = UIAlertController(title: "Invalid Input", message: "Please fill in all fields correctly.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true)
                        return
                    }
                   
                   AuthService.shared.updateUser(username: username, height: height, weight: weight) { [weak self] success, error in
                       if let error = error {
                           print(error)
                       } else if success {
                           self?.viewModel.setUserInfo(height: Double(height), weight: Double(weight))
                           self?.viewModel.reset()
                           self?.height.isEnabled = false
                           self?.weight.isEnabled = false
                           self?.user.isEnabled = false
                           self?.edit.setTitle("Edit", for: .normal)
                       }
                   }
               } else {
                   
                   height.isEnabled = true
                   weight.isEnabled = true
                   user.isEnabled = true
                   user.backgroundColor = .tertiaryLabel
                   height.backgroundColor = .tertiaryLabel
                   weight.backgroundColor = .tertiaryLabel
                   height.placeholder = " CM"
                   weight.placeholder = " KG"
                   edit.setTitle("Done", for: .normal)
               }
               
            viewModel.toggleEditing()
    }
    
    
    private func setUpSwiftView() {
        let swiftView = TrainingInfo(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftView)
    
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        safeZone.addSubview(hostingController.view)
        addChild(hostingController)
       
 
        hostingController.view.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 10).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -15).isActive = true
        
        hostingController.view.backgroundColor = .clear
        hostingController.view.layer.cornerRadius = 10
        hostingController.view.layer.shadowColor = UIColor.white.cgColor
        hostingController.view.layer.shadowOpacity = 0.5
        hostingController.view.layer.shadowOffset = CGSize(width: 0, height: -4)
        hostingController.view.layer.shadowRadius = 4
        hostingController.view.layer.masksToBounds = false
    
        hostingController.didMove(toParent: self)
  
    }
    
 
}

#Preview{
    UserVC()
}
