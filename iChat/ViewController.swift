//
//  ViewController.swift
//  iChat
//
//  Created by Mohamed Ibrahem on 7/6/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class ViewController: UIViewController {
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to iChat"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let emailTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Email"
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 4
        text.clipsToBounds = true
        text.layer.borderColor = UIColor.lightGray.cgColor
        return text
    }()
    
    let passwordTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true
        text.placeholder = "Password"
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 4
        text.clipsToBounds = true
        text.layer.borderColor = UIColor.lightGray.cgColor
        return text
    }()
    
    let repeatPasswordTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true
        text.placeholder = "Reapeat Password"
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 4
        text.clipsToBounds = true
        text.layer.borderColor = UIColor.lightGray.cgColor
        return text
    }()
    
    let textFieldStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 30
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    
    @objc func loginAction(){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
                login()
        } else {
            ProgressHUD.showError("email & password fields required")
        }
        
        dismissKeyboard()
        cleanTextFields()
    }

    
    @objc func registerAction(){
        
        if emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != "" {
            
            if passwordTextField.text == repeatPasswordTextField.text {
                register()
            } else {
                ProgressHUD.showError("password Doesn't match.")
            }
        } else {
            ProgressHUD.showError("All fields required")
        }
        dismissKeyboard()
//        cleanTextFields()
    }
    
    fileprivate func setupView(){
    
        view.backgroundColor = .white
        
        view.addSubview(welcomeLabel)
        view.addSubview(textFieldStack)
        textFieldStack.addArrangedSubview(emailTextField)
        textFieldStack.addArrangedSubview(passwordTextField)
        textFieldStack.addArrangedSubview(repeatPasswordTextField)
        view.addSubview(buttonStack)
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(registerButton)
    }
    
    fileprivate func setupConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            textFieldStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldStack.heightAnchor.constraint(equalToConstant: 140)
            ])
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 40),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonStack.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    
    func cleanTextFields(){
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }

    func login(){
    
    FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (err) in
        if err != nil{
            ProgressHUD.showError(err?.localizedDescription)
        } else {
            self.goToApp()
        }
        }
    }
    
    func register(){
        
        let vc = Profile()
        vc.email = self.emailTextField.text!
        vc.password = self.passwordTextField.text!
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func goToApp(){
        ProgressHUD.dismiss()
        cleanTextFields()
        dismissKeyboard()
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: USER_DID_LOGIN_NOTIFICATION), object: nil, userInfo: [kUSERID : FUser.currentId()])
        
        let vc = TapBarController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

