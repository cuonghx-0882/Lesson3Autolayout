//
//  ViewController.swift
//  b3
//
//  Created by cuonghx on 4/11/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var redView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var redView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var redView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var redView4: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var redView5: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var spaceView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var spaceView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var spaceView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var spaceView4: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView(){
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(redView1)
        self.stackView.addArrangedSubview(spaceView1)
        self.stackView.addArrangedSubview(redView2)
        self.stackView.addArrangedSubview(spaceView2)
        self.stackView.addArrangedSubview(redView3)
        self.stackView.addArrangedSubview(spaceView3)
        self.stackView.addArrangedSubview(redView4)
        self.stackView.addArrangedSubview(spaceView4)
        self.stackView.addArrangedSubview(redView5)
        
        // Anchor
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        self.stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/10).isActive = true
        
        // Constraint
        
        let constrainwidth1 = NSLayoutConstraint(item: self.redView1, attribute: .width, relatedBy: .equal, toItem: self.spaceView1, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth2 = NSLayoutConstraint(item: self.spaceView1, attribute: .width, relatedBy: .equal, toItem: self.redView2, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth3 = NSLayoutConstraint(item: self.redView2, attribute: .width, relatedBy: .equal, toItem: self.spaceView2, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth4 = NSLayoutConstraint(item: self.spaceView2, attribute: .width, relatedBy: .equal, toItem: self.redView3, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth5 = NSLayoutConstraint(item: self.redView3, attribute: .width, relatedBy: .equal, toItem: self.spaceView3, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth6 = NSLayoutConstraint(item: self.spaceView3, attribute: .width, relatedBy: .equal, toItem: self.redView4, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth7 = NSLayoutConstraint(item: self.redView4, attribute: .width, relatedBy: .equal, toItem: self.spaceView4, attribute: .width, multiplier: 1, constant: 0)
        let constrainwidth8 = NSLayoutConstraint(item: self.spaceView4, attribute: .width, relatedBy: .equal, toItem: self.redView5, attribute: .width, multiplier: 1, constant: 0)
        
        self.view.addConstraints([constrainwidth1, constrainwidth2, constrainwidth3, constrainwidth4, constrainwidth5, constrainwidth6, constrainwidth7, constrainwidth8])
        
    }
    private func setEqualWidth(_ first : UIView, _ second : UIView){
        
    }

}

