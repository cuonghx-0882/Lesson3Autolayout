//
//  ViewController.swift
//  b2
//
//  Created by cuonghx on 4/10/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNumber: UILabel!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK:
    @IBAction func handleButton(_ sender: UIButton) {
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

