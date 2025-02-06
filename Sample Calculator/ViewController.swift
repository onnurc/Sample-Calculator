//
//  ViewController.swift
//  Sample Calculator
//
//  Created by Onur ÇETİNKAYA on 12.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    private var result : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        initSwipeAction()
    }
    private func initSwipeAction() {
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired))
        gestureRecognizer.direction = .left
        gestureRecognizer.numberOfTouchesRequired = 1
        label.addGestureRecognizer(gestureRecognizer)
        label.isUserInteractionEnabled = true
    }
    @objc func gestureFired(_ gesture: UISwipeGestureRecognizer){
        if let swipedLabel = gesture.view {
            if let currentText = label.text, !currentText.isEmpty {
                var characters = Array(currentText)
                characters.removeLast()
                label.text = String(characters)
            }
        }
    }
    @IBAction func onPlusClicked(_ sender: Any) {
        addOperator(_operator: MathOperator.plus)
    }
    
    private func addOperator(_operator : Character) {
        if let text = label.text {
            if(text.isEmpty) { return } // Boşsa yazmaz
            if let lastChar = text.last, lastChar == MathOperator.plus || lastChar == MathOperator.minus || lastChar == MathOperator.multiple || lastChar == MathOperator.division {
                label.text = String(text.dropLast()) + String(_operator)
            } else {
                label.text = String(text) + String(_operator)
            }
        }
    }
    @IBAction func onSubstractClicked(_ sender: Any) {
        addOperator(_operator: MathOperator.minus)
    }
    @IBAction func allClearClicked(_ sender: Any) {
        label.text = Constants.empty
    }
    @IBAction func reversePNClicked(_ sender: Any) {
        reversePositiveNegative()
    }
    @IBAction func modulos(_ sender: Any) {
        addOperator(_operator: MathOperator.modulos)
    }
    @IBAction func multiplicationClicked(_ sender: Any) {
        addOperator(_operator: MathOperator.multiple)
    }
    @IBAction func division(_ sender: Any) {
        addOperator(_operator: MathOperator.division)
    }
    @IBAction func onResultClicked(_ sender: Any) {
        let myText = label.text
        let myTextArray = Array(myText!).map { String($0) }
        if myTextArray.last == "+" || myTextArray.last == "-" || myTextArray.last == "X" || myTextArray.last == "/" {
            return
        }
        label.text = Calculate().calculateResult(text: label.text ?? "")
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
    
    @IBAction func digitZeroClicked(_ sender: Any) {
        addChar(value: Constants.zero)
    }
    @IBAction func digitOneClicked(_ sender: Any) {
        addChar(value: Constants.one)
    }
    @IBAction func digitTwoClicked(_ sender: Any) {
        addChar(value: Constants.two)
    }
    @IBAction func digitThreeClicked(_ sender: Any) {
        addChar(value: Constants.three)
    }
    @IBAction func digitFourClicked(_ sender: Any) {
        addChar(value: Constants.four)
    }
    @IBAction func digitFiveClicked(_ sender: Any) {
        addChar(value: Constants.five)
    }
    @IBAction func digitSixClicked(_ sender: Any) {
        addChar(value: Constants.six)
    }
    @IBAction func digitSevenClicked(_ sender: Any) {
        addChar(value: Constants.seven)
    }
    @IBAction func digitEightClicked(_ sender: Any) {
        addChar(value: Constants.eight)
    }
    @IBAction func digitNineClicked(_ sender: Any) {
        addChar(value: Constants.nine)
    }

}
