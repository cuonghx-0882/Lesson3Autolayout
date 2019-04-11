//
//  MainUIViewController.swift
//  b2
//
//  Created by cuonghx on 4/11/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

class MainUIViewController: UIViewController {
    
    let arrayButton = ["AC", "+/-", "%", "/", "7", "8","9", "X", "4", "5", "6", "-", "1", "2" , "3", "+", "0" , ".", "="]
    
    var numberResult = "0" {
        didSet {
            labelNumber.text = String(numberResult)
        }
    }
    var numberCaculate = "0" {
        didSet {
            labelNumber.text = String(numberCaculate)
        }
    }
    var computingButton: UIButton?
    var calculated = false
    
    lazy var labelNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor.white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackView1: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackView2: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackView3: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackView4: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackView5: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    private func setupView(){
        self.view.addSubview(self.labelNumber)
        self.view.addSubview(self.stackView1)
        self.view.addSubview(self.stackView2)
        self.view.addSubview(self.stackView3)
        self.view.addSubview(self.stackView4)
        self.view.addSubview(self.stackView5)
        
        self.view.backgroundColor = Color.background
        
        for index in 1..<20{
            let button = UIButton(type: .system)
            button.tag = index
            button.backgroundColor = Color.gray
            button.setBackgroundColor(color: UIColor(displayP3Red: 100/256, green: 100/256, blue: 100/256, alpha: 1), forState: .highlighted)
            button.setTitle(arrayButton[index-1], for: .normal)
            switch index {
            case 1...4:
                self.stackView1.addArrangedSubview(button)
                break
            case 5...8:
                self.stackView2.addArrangedSubview(button)
                break
            case 9...12:
                self.stackView3.addArrangedSubview(button)
                break
            case 13...16:
                self.stackView4.addArrangedSubview(button)
                break
            case 17...19:
                self.stackView5.addArrangedSubview(button)
                break
            default:
                break
            }
             button.tintColor = UIColor.black
            if index == 4 || index == 8 || index == 12 || index == 16 || index == 19{
                button.backgroundColor = Color.orange
                button.tintColor = UIColor.white
            }
            button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
           
        }
        // Using constrain
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.labelNumber]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.stackView1]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.stackView2]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.stackView3]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.stackView4]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : self.stackView5]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1]-1-[v2]-1-[v3]-1-[v4]-1-[v5]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": self.labelNumber, "v1" : self.stackView1, "v2" : self.stackView2, "v3" : self.stackView3, "v4" : self.stackView4, "v5" : self.stackView5]))
        
        let heightConstraint = NSLayoutConstraint(item: self.labelNumber, attribute: .height, relatedBy: .equal, toItem: self.stackView1, attribute: .height, multiplier: 1, constant: 0)
        let heightConstraint1 = NSLayoutConstraint(item: self.stackView1, attribute: .height, relatedBy: .equal, toItem: self.stackView2, attribute: .height, multiplier: 1, constant: 0)
        let heightConstraint2 = NSLayoutConstraint(item: self.stackView2, attribute: .height, relatedBy: .equal, toItem: self.stackView3, attribute: .height, multiplier: 1, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.stackView3, attribute: .height, relatedBy: .equal, toItem: self.stackView4, attribute: .height, multiplier: 1, constant: 0)
        let heightConstraint4 = NSLayoutConstraint(item: self.stackView4, attribute: .height, relatedBy: .equal, toItem: self.stackView5, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: self.stackView5.arrangedSubviews[0], attribute: .width, relatedBy: .equal, toItem: self.stackView5, attribute: .width, multiplier: 0.5, constant: 0)
        
        addConstrainStack(self.stackView1.arrangedSubviews)
        addConstrainStack(self.stackView2.arrangedSubviews)
        addConstrainStack(self.stackView3.arrangedSubviews)
        addConstrainStack(self.stackView4.arrangedSubviews)
        self.view.addConstraint(NSLayoutConstraint(item: self.stackView5.arrangedSubviews[1], attribute: .width, relatedBy: .equal, toItem: self.stackView5.arrangedSubviews[2], attribute: .width, multiplier: 1, constant: 0))
        
        self.view.addConstraints([heightConstraint, heightConstraint1, heightConstraint2, heightConstraint3, heightConstraint4, widthConstraint])
        
    }
    private func addConstrainStack(_ arrary: [UIView]){
        for element in arrary{
            if element !== arrary.last{
                let elementAfter = arrary[arrary.index(after: arrary.index(of: element)!)]
                let constrain = NSLayoutConstraint(item: element, attribute: .width, relatedBy: .equal, toItem: elementAfter, attribute: .width, multiplier: 1, constant: 0)
                self.view.addConstraint(constrain)
            }
        }
    }
    
    // MARK: Button Action
    @objc private func handleButton(_ sender: UIButton){
        var tmp : Double = 0
        switch sender.tag {
        case 1:
            self.computingButton?.backgroundColor = Color.orange
            self.computingButton = nil
            numberCaculate = "0"
            numberResult = "0"
            break
        case 5, 6, 7, 9, 10 ,11 ,13, 14 , 15, 17:
            if self.computingButton != nil {
                if Double(numberCaculate) == 0 || calculated{
                    calculated = false
                    numberCaculate = ""
                }
                numberCaculate = numberCaculate + sender.currentTitle!
            }else {
                if Double(numberResult) == 0 || calculated {
                    calculated = false
                    numberResult = ""
                }
                numberResult = numberResult + sender.currentTitle!
            }
            break
            
        case 4, 8, 12, 16:
            if let btn = self.computingButton {
                btn.backgroundColor = Color.orange
                if sender !== self.computingButton && !calculated{
                    var s = numberResult + btn.currentTitle!  + numberCaculate
                    s = s.replacingOccurrences(of: "X", with: "*")
                    let expn = NSExpression(format:s)
                    self.numberCaculate = "0"
                    self.numberResult = "\(expn.expressionValue(with: nil, context: nil) ?? "NA")"
                }
            }
            self.computingButton = sender
            sender.backgroundColor = UIColor(displayP3Red: 100/256, green: 100/256, blue: 100/256, alpha: 1)
            break
        case 18:
            numberResult += "."
            break
        case 19:
            if let button = self.computingButton {
                var num: Double = 0
                
                switch button.currentTitle! {
                case "+" :
                    num = Double(numberResult)! + Double(numberCaculate)!
                    break
                case "-" :
                    num = Double(numberResult)! - Double(numberCaculate)!
                    break
                case "X" :
                    num = Double(numberResult)! * Double(numberCaculate)!
                    break
                case "/" :
                    num = Double(numberResult)! / Double(numberCaculate)!
                    break
                default :
                    break
                }
                self.numberResult = num.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", num) : String(num)
                self.computingButton?.backgroundColor = Color.orange
                //                self.computingButton = nil
                self.calculated = true
            }else {
                calculated = false
            }
            break
        case 2:
            numberResult = (-Double(numberResult)!).toString()
            break
        case 3:
            tmp = Double(numberResult)!
            numberResult = (tmp / 100).toString()
        default:
            break
        }
    }
}
