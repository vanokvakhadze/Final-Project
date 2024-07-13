//
//  RegisterVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit

class RegisterVC: UIViewController {
    
    
    private let safeZones = UIView.customView()
    
    private let backgroundView = UIView.customView()
    private let backgroundImageView = UIImageView.customNamedImage(named: "backGR5")
    
    private let titleText = UILabel.customLabel()
    private let titleText1 = UILabel.customLabel()
    
    private let username = CustomTextField(fieldType: .username)
    private let email = CustomTextField(fieldType: .email)
    private let password = CustomTextField(fieldType: .password)
    
    private let height = CustomTextField(fieldType: .height)
    private let weight = CustomTextField(fieldType: .weight)
    
    private let cm = UILabel.customLabel()
    private let kg = UILabel.customLabel()
    
    private let registerButton = UIButton.customButton(width: 180, height: 40)
    
    private let textQuestion = UILabel.customLabel()
    
    private let singUp = UILabel.customLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        setUpUi()
        navigationItem.hidesBackButton = true
    }
    
    func addBackGroundImage(){
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
        setBackgroundVIew()
        
    }
    
    func setBackgroundVIew(){
        safeZones.addSubview(backgroundView)
        backgroundView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.2)
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 30
        backgroundView.layer.shadowColor = UIColor.systemMint.cgColor
        backgroundView.layer.shadowOpacity = 0.4
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: -2)
        backgroundView.layer.shadowRadius = 4
        backgroundView.layer.masksToBounds = false
        
        
        backgroundView.topAnchor.constraint(equalTo: safeZones.centerYAnchor, constant: -120).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: safeZones.widthAnchor, constant: -20).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor, constant: -10).isActive = true
        addUserAndPassword()
        addRegisterButton()
        navigateToLogin()
    }
    
    func addUserAndPassword() {
        backgroundView.addSubview(titleText)
        backgroundView.addSubview(titleText1)
        backgroundView.addSubview(username)
        backgroundView.addSubview(email)
        backgroundView.addSubview(password)
        backgroundView.addSubview(height)
        backgroundView.addSubview(weight)
        backgroundView.addSubview(cm)
        backgroundView.addSubview(kg)
        
        backgroundView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.4)
        
        
        titleText.text = "Sign Up"
        titleText.font = .systemFont(ofSize: 24)
        titleText1.text = "Create your account"
        titleText1.font = .systemFont(ofSize: 12)
        titleText1.textColor = .systemGroupedBackground
        cm.text = "CM"
        kg.text = "KG"
        cm.textAlignment = .center
        kg.textAlignment = .center
        cm.textColor = .white
        kg.textColor = .white
        
        cm.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cm.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        kg.widthAnchor.constraint(equalToConstant: 40).isActive = true
        kg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        kg.layer.cornerRadius = 10
        cm.layer.cornerRadius = 10
        kg.layer.masksToBounds = true
        cm.layer.masksToBounds = true
        kg.backgroundColor = .systemCyan
        cm.backgroundColor = .systemCyan
        
        
        
        
        
        NSLayoutConstraint.activate([
            titleText.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleText.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            titleText1.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleText1.centerYAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10),
            username.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            username.topAnchor.constraint(equalTo: titleText1.bottomAnchor, constant: 25),
            username.widthAnchor.constraint(equalToConstant:  280),
            username.heightAnchor.constraint(equalToConstant:  50),
            height.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 8),
            height.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: 10),
            height.widthAnchor.constraint(equalToConstant: 120),
            height.heightAnchor.constraint(equalToConstant:  40),
            cm.topAnchor.constraint(equalTo: height.topAnchor),
            cm.leadingAnchor.constraint(equalTo: height.trailingAnchor, constant: 20),
            weight.topAnchor.constraint(equalTo: height.bottomAnchor, constant: 8),
            weight.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: 10),
            weight.widthAnchor.constraint(equalToConstant: 120),
            weight.heightAnchor.constraint(equalToConstant:  40),
            kg.topAnchor.constraint(equalTo: weight.topAnchor),
            kg.leadingAnchor.constraint(equalTo: weight.trailingAnchor, constant: 20),
            email.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 17),
            email.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            email.widthAnchor.constraint(equalToConstant:  280),
            email.heightAnchor.constraint(equalToConstant:  50),
            password.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            password.widthAnchor.constraint(equalToConstant:  280),
            password.heightAnchor.constraint(equalToConstant:  50),
        ])
    }
    
    func addRegisterButton(){
        view.addSubview(registerButton)
        
        registerButton.setTitle("Sign up", for: .normal)
        registerButton.backgroundColor = .systemBlue
        
        registerButton.addAction(UIAction(title: "", handler: { _ in
            self.registration()}), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20)
        ])
    }
    
    func navigateToLogin(){
        view.addSubview(textQuestion)
        view.addSubview(singUp)
        
        textQuestion.text = "already have account?"
        textQuestion.textColor = .systemGroupedBackground
        textQuestion.font = .systemFont(ofSize: 14)
        
        singUp.text = "Sing In"
        singUp.textColor = .systemBlue
        singUp.font = .systemFont(ofSize: 16)
        
        textQuestion.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10).isActive = true
        textQuestion.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor, constant: -50).isActive = true
        
        singUp.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10).isActive = true
        singUp.leadingAnchor.constraint(equalTo: textQuestion.trailingAnchor, constant: 5).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(moveToLoginVC))
        
        singUp.isUserInteractionEnabled = true
        singUp.addGestureRecognizer(tapGesture)
    }
    
    @objc func moveToLoginVC(){
        navigationController?.popViewController(animated: true)
        
    }
    
    func registration() {
        let registerUserRequest = RegisterUserRequest(
            username: username.text ?? "",
            email: email.text ?? "",
            password: password.text ?? "",
            height: Double(height.text ?? "") ?? 0.0,
            weight: Double(weight.text ?? "") ?? 0.0)
        
        
        if !ValidateInfo.isValidUsername(for: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        
        if !ValidateInfo.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        
        if !ValidateInfo.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
}



#Preview{
    RegisterVC()
}
