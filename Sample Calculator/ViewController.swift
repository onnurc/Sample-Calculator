//
//  ViewController.swift
//  Sample Calculator
//
//  Created by Onur ÇETİNKAYA on 12.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPlusClicked(_ sender: Any) {
        addChar(value: "+")
        
    }
    
    @IBAction func onResultClicked(_ sender: Any) {
        calculateResult()
    }
    
    @IBAction func allClearClicked(_ sender: Any) {
        label.text = ""
    }
    
    @IBAction func reversePNClicked(_ sender: Any) {
        reversePositiveNegative()
    }

    
    @IBAction func percentClicked(_ sender: Any) {
        
    }
    
    @IBAction func digitZeroClicked(_ sender: Any) {
        addChar(value: "0")
    }
    @IBAction func digitOneClicked(_ sender: Any) {
        addChar(value: "1")
        
    }
    @IBAction func digitTwoClicked(_ sender: Any) {
        addChar(value: "2")
    }
    
    @IBAction func digitThreeClicked(_ sender: Any) {
        addChar(value: "3")
    }
    
    @IBAction func digitFourClicked(_ sender: Any) {
        addChar(value: "4")
    }
    
    @IBAction func digitFiveClicked(_ sender: Any) {
        addChar(value: "5")
    }
    
    @IBAction func digitSixClicked(_ sender: Any) {
        addChar(value: "6")
    }
    @IBAction func digitSevenClicked(_ sender: Any) {
        addChar(value: "7")
    }
    
    @IBAction func digitEightClicked(_ sender: Any) {
        addChar(value: "8")
    }
    
    @IBAction func digitNineClicked(_ sender: Any) {
        addChar(value: "9")
    }
    
    
    func reversePositiveNegative() {
        if let currentText = label.text, let number = Double(currentText){ // convert text to double
            let reservedNumber = -number
            label.text = String(reservedNumber) // convert double to text again
        }else{
            print("There is no valid number")
        }
    }
    
    func addChar(value: String) {
        label.text = (label.text ?? "") + value
    }

    
    
    func calculateResult() {
        if let text = label.text {
            var result = 0
            text.split(separator: "+").forEach {
                if let value = Int($0) {
                    result += value
                }
            }
            label.text = String(result)
            
        } else {
            print("optionalValue is nil")
        }
    }
}

