//
//  Profile.swift
//  iChat
//
//  Created by Mohamed Ibrahem on 7/7/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import ProgressHUD

class Profile: UIViewController {
    
    var email: String!
    var password: String!
    var imageView: UIImage?
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    let topTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    let seperateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let profileImage: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "avatarPlaceholder"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 4
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    let name: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Name"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        return text
    }()
    
    let surename: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Surename"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        return text
    }()
    
    let country: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Country"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        return text
    }()
    
    let city: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "City"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        return text
    }()
    
    let phone: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Phone number"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        return text
    }()
    
    let fieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        

        print(email, password)
        
        view.addSubview(topView)
        topView.addSubview(topTitle)
        topView.addSubview(doneButton)
        topView.addSubview(cancelButton)
        topView.addSubview(seperateView)
        view.addSubview(profileImage)
        view.addSubview(fieldsStack)
        fieldsStack.addArrangedSubview(name)
        fieldsStack.addArrangedSubview(surename)
        fieldsStack.addArrangedSubview(country)
        fieldsStack.addArrangedSubview(city)
        fieldsStack.addArrangedSubview(phone)
        


        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            
            topTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            doneButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            
            cancelButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            
            seperateView.heightAnchor.constraint(equalToConstant: 1),
            seperateView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            seperateView.widthAnchor.constraint(equalTo: topView.widthAnchor)
            ])
        
        NSLayoutConstraint.activate([
            
            profileImage.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            
            
            fieldsStack.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            fieldsStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            fieldsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fieldsStack.heightAnchor.constraint(equalToConstant: 220)
            
            
            ])
    }
    
    
    func cleanTextFields(){
        name.text = ""
        surename.text = ""
        country.text = ""
        city.text = ""
        phone.text = ""
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    
    
    @objc func cancelAction(sender: UIButton){
        
        cleanTextFields()
        dismissKeyboard()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneAction(sender: UIButton){
        print("done")
        ProgressHUD.show("Registering...")
        FUser.registerUserWith(email: email, password: password, firstName: name.text!, lastName: surename.text!) { (err) in
            if err != nil{
                ProgressHUD.showError(err!.localizedDescription)
            }
        }
        
        
        let fullName = name.text! + " " + surename.text!
        
        var tempDictionary: Dictionary = [
            kFIRSTNAME : name.text!,
            kLASTNAME : surename.text!,
            kFULLNAME : fullName,
            kCOUNTRY : country.text!,
            kCITY : city.text!,
            kPHONE : phone.text!
            
        ] as [String : Any]
        
        if imageView == nil {
            imageFromInitials(firstName: name.text!, lastName: surename.text!) { (imageInitials) in
                let avatarImg = imageInitials.jpegData(compressionQuality: 0.7)
                let avatar = avatarImg!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
                
                
                tempDictionary[kAVATAR] = avatar
                
                self.finishRegisteration(withValues: tempDictionary)
                
            }
        } else {
            let avatarImg = imageView?.jpegData(compressionQuality: 0.7)
            let avatar = avatarImg!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            
            
            tempDictionary[kAVATAR] = avatar
            
            self.finishRegisteration(withValues: tempDictionary)
            
        }
        
        
    }
    
    
    
    func finishRegisteration(withValues: [String : Any]){
        updateCurrentUserInFirestore(withValues: withValues) { (err) in
            if err != nil {
                DispatchQueue.main.async {
                    ProgressHUD.showError(err!.localizedDescription)
                    print(err!.localizedDescription)
                }
                return
            }
            ProgressHUD.dismiss()
            self.goToApp()
        }
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
