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
    var result : Double = 0.0
    @IBAction func onPlusClicked(_ sender: Any) {
        addChar(value: "+")
        
        
    }
    
    @IBAction func onSubstractClicked(_ sender: Any) {
        addChar(value: "-")
        
        //12+5
        
    }
    
    
    @IBAction func allClearClicked(_ sender: Any) {
        label.text = ""
        
        
    }
    
    @IBAction func reversePNClicked(_ sender: Any) {
        reversePositiveNegative()
    }
    
    
    @IBAction func percentClicked(_ sender: Any) {
        
    }
    @IBAction func multiplicationClicked(_ sender: Any) {
        addChar(value: "X")
    }
    @IBAction func division(_ sender: Any) {
        addChar(value: "/")
    }
    
    @IBAction func onResaultClicked(_ sender: Any) {
        
        calculateResult()
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
        label.text = label.text! + value
        
    }
    func calculateResult() {
        
        if let text = label.text {
            var numbers = text.components(separatedBy: ["+", "-","X","/"])
            var operators = text.filter { $0 == "+" || $0 == "-" || $0 == "X" || $0 == "/" }.map { String($0) }
            
            var result: [String] = []
            for (index, number) in numbers.enumerated() {
                result.append(number)
                if index < operators.count {
                    result.append(operators[index])
                }
            }
            while numbers.count > 1 && operators.count >= 1 {
                 
                if operators.count > 1 && operators[1] == "X"{
                    var result = Double(numbers[1])! * Double(numbers[2])!
                    numbers.remove(at: 2)
                    numbers.remove(at: 1)
                    operators.remove(at: 1)
                    numbers.insert(String(result), at: 1)
                }
                
                
                if  operators.count > 0 && operators[0] == "X"{
                    var result = Double(numbers[0])! * Double(numbers[1])!
                    numbers.removeFirst(2)
                    operators.removeFirst()
                    numbers.insert(String(result), at: 0)
                }
                if operators.count > 1 && operators[1] == "/"{
                    var result = Double(numbers[1])! / Double(numbers[2])!
                    numbers.remove(at: 2)
                    numbers.remove(at: 1)
                    operators.remove(at: 1)
                    numbers.insert(String(result), at: 1)
                }
                if  operators.count > 0 && operators[0] == "/"{
                    var result = Double(numbers[0])! / Double(numbers[1])!
                    numbers.removeFirst(2)
                    operators.removeFirst()
                    numbers.insert(String(result), at: 0)
                }
                
                
                if  operators.count > 0 && operators[0] == "+"{
                    var result = Double(numbers[0])! + Double(numbers[1])!
                    numbers.removeFirst(2)
                    operators.removeFirst()
                    numbers.insert(String(result), at: 0)
                }
                if operators.count > 0 && operators[0] == "-"{
                    var result = Double(numbers[0])! - Double(numbers[1])!
                    numbers.removeFirst(2)
                    operators.removeFirst()
                    numbers.insert(String(result), at: 0)
                }

            }
            label.text = numbers.first

        }
        
        
    }
    
    
}
