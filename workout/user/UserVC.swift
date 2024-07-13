//
//  UserVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit

class UserVC: UIViewController {
    
    private let safeZone = UIView.customView()
    private let userView = UIView.customView()
    private let infoView = UIView.customView()
    private let bottomView = UIView.customView()
    
    private let backgroundImageView = UIImageView.customNamedImage(named: "backGR2")
    
    private let userImage = UIImageView.customSystemView(imageName: "figure.strengthtraining.traditional")
    
    private let heightImage = UIImageView.customNamedImage(named: "heightImage")
    
    private let weightImage = UIImageView.customNamedImage(named: "scaleImage")
    
    private let user = UILabel.customLabel()
    private let height = UILabel.customLabel()
    private let weight = UILabel.customLabel()
    private let profileText = UILabel.customLabel()
    
    private let logOut = UIButton.customButton(width: 200, height: 50)
    private let delete = UIButton.customButton(width: 150, height: 50)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor3")
        setUpUI()
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
                self.height.text = " \(user.height) cm"
                self.weight.text = " \(user.weight) kg"
            }
        }

    }
    
    func setUpUI(){
        view.addSubview(safeZone)
        let safeView = view.safeAreaLayoutGuide
        safeZone.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeZone.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeZone.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeZone.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
        addUserView()
        addDetailsView()
        buttonViews()
        updateUserInfo()
    }
    
    func addUserView(){
        safeZone.addSubview(userView)
        safeZone.addSubview(profileText)
        profileText.font = .boldSystemFont(ofSize: 26)
        profileText.text = "User Details"
       
        
        userView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.5)
        
        NSLayoutConstraint.activate([
            profileText.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 10),
            profileText.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 25),
            userView.topAnchor.constraint(equalTo: profileText.bottomAnchor, constant: 30),
            userView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            userView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            userView.heightAnchor.constraint(equalToConstant: 140)
        ])
        addUser()
    }
    
    
    func addUser(){
        
        userView.addSubview(userImage)
        userView.addSubview(user)
        
        user.font = .boldSystemFont(ofSize: 24)
        userImage.tintColor = .black
        userImage.backgroundColor = .white
        userImage.layer.cornerRadius = 40
        
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: userView.centerXAnchor, constant: -120),
            userImage.topAnchor.constraint(equalTo: userView.topAnchor, constant: 25),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            userImage.heightAnchor.constraint(equalToConstant: 80),
            user.topAnchor.constraint(equalTo: userImage.centerYAnchor, constant: -10),
            user.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 25)])
        
    }
    
    func addDetailsView(){
        
        safeZone.addSubview(infoView)
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 30
        infoView.layer.shadowColor = UIColor.gray.cgColor
        infoView.layer.shadowOpacity = 0.2
        infoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        infoView.layer.shadowRadius = 4
        infoView.layer.masksToBounds = false
        infoView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.6)
        
        
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 50),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            infoView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        addUserDetails()
    }
    
    func addUserDetails(){
        infoView.addSubview(heightImage)
        infoView.addSubview(height)
        infoView.addSubview(weightImage)
        infoView.addSubview(weight)
        
      
        weightImage.tintColor = .green
        height.font = .systemFont(ofSize: 24)
        
        weight.font = .systemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
            heightImage.centerXAnchor.constraint(equalTo: infoView.centerXAnchor, constant: -55),
            heightImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 40),
            heightImage.widthAnchor.constraint(equalToConstant: 35),
            heightImage.heightAnchor.constraint(equalToConstant: 35),
            height.leadingAnchor.constraint(equalTo: heightImage.trailingAnchor, constant: 8),
            height.centerYAnchor.constraint(equalTo: heightImage.centerYAnchor),
            weightImage.centerXAnchor.constraint(equalTo: infoView.centerXAnchor, constant: -55),
            weightImage.topAnchor.constraint(equalTo: heightImage.bottomAnchor, constant: 30),
            weightImage.widthAnchor.constraint(equalToConstant: 35),
            weightImage.heightAnchor.constraint(equalToConstant: 35),
            weight.leadingAnchor.constraint(equalTo: weightImage.trailingAnchor, constant: 8),
            weight.centerYAnchor.constraint(equalTo: weightImage.centerYAnchor)
        ])
    }
    
    func buttonViews(){
        safeZone.addSubview(bottomView)
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30
        bottomView.layer.shadowColor = UIColor.white.cgColor
        bottomView.layer.shadowOpacity = 0.5
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -4)
        bottomView.layer.shadowRadius = 4
        bottomView.layer.masksToBounds = false
        bottomView.backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.2)
        
        
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
    

}

#Preview{
    UserVC()
}
