//
//  ViewController.swift
//  Bai1
//
//  Created by cuonghx on 4/10/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 252/256, green: 57/256, blue: 43/256, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 67/256, green: 171/256, blue: 241/256, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 249/256, green: 165/256, blue: 85/256, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 98/256, green: 248/256, blue: 94/256, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    private func setupView(){
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(orangeView)
        self.view.addSubview(greenView)
        // Anchor
        self.redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // Constraint
        let topContraint = NSLayoutConstraint(item: self.redView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self.redView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.redView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self.redView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1/2, constant: 0)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1]|", options: NSLayoutFormatOptions() , metrics: nil, views: ["v0" : self.redView, "v1" : self.blueView]))
        let widthConstrainBlue = NSLayoutConstraint(item: self.blueView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1/2, constant: 0)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1]|", options: NSLayoutFormatOptions() , metrics: nil, views: ["v0" : self.blueView, "v1" : self.orangeView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1][v2]|", options: NSLayoutFormatOptions() , metrics: nil, views: ["v0" : self.redView, "v1" : self.orangeView, "v2" : self.greenView ]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0][v1]", options: NSLayoutFormatOptions() , metrics: nil, views: ["v0" : self.blueView, "v1" : self.greenView]))
        
        let heightConstraintOrange = NSLayoutConstraint(item: self.orangeView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1/4, constant: 0)
        let widthConstraintGreen = NSLayoutConstraint(item: self.greenView
            , attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1/4, constant: 0)
        
        let constraints = [topContraint, leadingConstraint, trailingConstraint, heightConstraint, widthConstrainBlue, heightConstraintOrange, widthConstraintGreen]
        self.view.addConstraints(constraints)
    }
    
}

