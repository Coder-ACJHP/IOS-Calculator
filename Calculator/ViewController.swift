//
//  ViewController.swift
//  Calculator
//
//  Created by Coder ACJHP on 14.06.2018.
//  Copyright © 2018 Coder ACJHP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operation:Int = 0
    var handledNumber: Double = 0.0
    var previousNumber: Double = 0.0
    var doingMathOP: Bool = false
    @IBOutlet weak var screen: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.text = ""
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if doingMathOP == true {
            screen.text = String(sender.tag-1)
            handledNumber = Double(screen.text)!
            doingMathOP = false
        } else {
            screen.text = screen.text! + String(sender.tag-1)
            handledNumber = Double(screen.text)!
        }
    }
    
    
    @IBAction func operationButtons(_ sender: UIButton) {
        if sender.tag != 19 && sender.tag != 20 && screen.text != "" {
            
            previousNumber = Double(screen.text!)!
            
            switch sender.tag {
            case 11: // Plus
                screen.text = "+"
            case 12: // Minus
                screen.text = "-"
            case 13: // Multiply
                screen.text = "x"
            case 14: // Devide
                screen.text = "/"
            case 15: // Mod
                screen.text = "%"
            default:
                print("Empty")
            }
            operation = sender.tag
            doingMathOP = true
            
        } else if sender.tag == 20 {
            switch operation {
            case 11:
                screen.text = String(previousNumber + handledNumber)
            case 12:
                screen.text = String(previousNumber - handledNumber)
            case 13:
                screen.text = String(previousNumber * handledNumber)
            case 14:
                if previousNumber == 0 || handledNumber == 0 {
                    let alert = UIAlertController(title: "Warning!", message: "Cannot devide number by zero!", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction(title: "Dismiss", style: .default)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    screen.text = String(previousNumber / handledNumber)
                }
            case 15:
                screen.text = String(Int(previousNumber) % Int(handledNumber))
            default:
                print("Empty")
            }
        }
        else if sender.tag == 19 {
            screen.text = ""
            previousNumber = 0
            handledNumber = 0
            operation = 0
        }
    }

}

