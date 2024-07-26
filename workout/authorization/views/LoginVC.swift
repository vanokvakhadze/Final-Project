//
//  LoginVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit

class LoginVC: UIViewController {

    private let safeZones = UIView.customView()
    private let backgroundView = UIView.customView()
    private let backgroundImageView = UIImageView.customNamedImage(named: "backGR5")
    private let logo = UIImageView.customNamedImage(named: "logo4")
    
    private let titleText = UILabel.customLabel()
    private let titleText1 = UILabel.customLabel()
    
    private let email = CustomTextField(fieldType: .email)
    private let password = CustomTextField(fieldType: .password)
    
    private let loginButton = UIButton.customButton(width: 180, height: 40)

    private let textQuestion = UILabel.customLabel()
    
    private let singUp = UILabel.customLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        addbackGroundImage()
        logoConfigure()
        setUpUi()
    }
    func addbackGroundImage(){
       view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setUpUi(){
        view.addSubview(safeZones)
        let safeView = view.safeAreaLayoutGuide
        safeZones.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeZones.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeZones.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeZones.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
        setUpBackground()
    }
    
    func logoConfigure(){
        safeZones.addSubview(logo)
        logo.layer.cornerRadius = 75
        logo.alpha = 0.8
        logo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logo.topAnchor.constraint(equalTo: safeZones.topAnchor, constant: 35).isActive = true
        logo.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor).isActive = true
    }
    
    func setUpBackground(){
        safeZones.addSubview(backgroundView)
        backgroundView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.5)
        backgroundView.alpha = 3
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 30
        backgroundView.layer.shadowColor = UIColor.systemMint.cgColor
        backgroundView.layer.shadowOpacity = 0.5
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: -4)
        backgroundView.layer.shadowRadius = 4
        backgroundView.layer.masksToBounds = false
        
        backgroundView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 35).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: safeZones.widthAnchor, constant: -20).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor, constant: -190).isActive = true
        addUserAndPassword()
        addLoginButton()
        navigateToRegister()
    }
    
    func addUserAndPassword() {
        backgroundView.addSubview(titleText)
        backgroundView.addSubview(titleText1)
        backgroundView.addSubview(email)
        backgroundView.addSubview(password)
        
        titleText.text = "Sign in"
      
        titleText.font = .systemFont(ofSize: 26)
     
        titleText1.text = "Sign in your account"
        
        titleText1.font = .systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            titleText.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleText.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            titleText1.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleText1.centerYAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10),
            email.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            email.centerYAnchor.constraint(equalTo: titleText1.bottomAnchor, constant: 45),
            email.widthAnchor.constraint(equalToConstant:  280),
            email.heightAnchor.constraint(equalToConstant:  50),
            password.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            password.widthAnchor.constraint(equalToConstant:  280),
            password.heightAnchor.constraint(equalToConstant:  50)
        ])
    }

    func addLoginButton(){
        view.addSubview(loginButton)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.addAction(UIAction(handler:  {  _ in
            self.loginUser()}), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20)
        ])
    }
    
    func loginUser(){
        let loginRequest = LoginUserRequest(
            email: self.email.text ?? "",
            password: self.password.text ?? ""
        )
        
        
        if !ValidateInfo.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        
        if !ValidateInfo.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.loginUser(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
        
    }
    
    func navigateToRegister(){
        view.addSubview(textQuestion)
        view.addSubview(singUp)
        
        textQuestion.text = "don't have account?"
        textQuestion.font = .systemFont(ofSize: 16)
        
        singUp.text = "Sing Up"
        singUp.textColor = .systemBlue
        singUp.font = .systemFont(ofSize: 18)
        
        textQuestion.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        textQuestion.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor, constant: -50).isActive = true
        
        singUp.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        singUp.leadingAnchor.constraint(equalTo: textQuestion.trailingAnchor, constant: 5).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(moveToRegisterVC))
        
        singUp.isUserInteractionEnabled = true
        singUp.addGestureRecognizer(tapGesture)
    }
    
    @objc func moveToRegisterVC(){
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

#Preview{
    LoginVC()
}
