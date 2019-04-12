//
//  MainViewController.swift
//  b4
//
//  Created by cuonghx on 4/12/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
        let bg = UIImageView()
        bg.contentMode = .scaleAspectFill
        bg.image = UIImage(named: "bg")
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupview()
    }
    
    private func setupview(){
        self.view.addSubview(backgroundImage)
        self.view.addSubview(container)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.backgroundImage]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.backgroundImage]))
        
        self.container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[v0]-32-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.container]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.container]))
        
        let emailTextfield = UITextField()
        emailTextfield.placeholder = "Email"
        emailTextfield.layer.cornerRadius = 5
        emailTextfield.backgroundColor = UIColor.white
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false
        emailTextfield.addLeftIcon(UIImage(named: "email")!, 8)
        
        let passwordTextfield = UITextField()
        passwordTextfield.placeholder = "Password"
        passwordTextfield.backgroundColor = UIColor.white
        passwordTextfield.layer.cornerRadius = 5
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.addLeftIcon(UIImage(named: "lock")!, 8)
        
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        
        self.container.addSubview(emailTextfield)
        self.container.addSubview(passwordTextfield)
        self.container.addSubview(buttonView)
        
        self.container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0(30)]-16-[v1(30)]-16-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : emailTextfield, "v1" : passwordTextfield, "v2" : buttonView]))
        self.container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : emailTextfield]))
        self.container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : passwordTextfield]))
        // Constrain buttonView
        self.container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : buttonView]))
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.tintColor = UIColor.white
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let registerButton = UIButton(type: .system)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.tintColor = UIColor.white
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.cornerRadius = 10
        
        buttonView.addSubview(loginButton)
        buttonView.addSubview(registerButton)
        
        buttonView.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width , relatedBy: .equal, toItem: buttonView , attribute: .width, multiplier: 2/5, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top , relatedBy: .equal, toItem: buttonView , attribute: .top, multiplier: 1, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .leading , relatedBy: .equal, toItem: buttonView , attribute: .leading, multiplier: 1, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width , relatedBy: .equal, toItem: registerButton , attribute: .width, multiplier: 1, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: registerButton, attribute: .trailing , relatedBy: .equal, toItem: buttonView , attribute: .trailing, multiplier: 1, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top , relatedBy: .equal, toItem: buttonView , attribute: .top, multiplier: 1, constant: 0))
        buttonView.addConstraint(NSLayoutConstraint(item: registerButton, attribute: .bottom , relatedBy: .equal, toItem: buttonView , attribute: .bottom, multiplier: 1, constant: -16))
        buttonView.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .bottom , relatedBy: .equal, toItem: buttonView , attribute: .bottom, multiplier: 1, constant: -16))
        
    }
}
