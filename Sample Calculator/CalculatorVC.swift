//
//  ViewController.swift
//  Sample Calculator
//
//  Created by Onur ÇETİNKAYA on 12.01.2025.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let viewModel = CalculatorViewModel()

    private var result : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
    initSwipeAction()
    }

    
     func initSwipeAction() {
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

    
    private func addOperator(_operator: Character) {
        if let text = label.text {
            label.text = viewModel.addOperator(text: text, _operator: _operator)
        }
       
    }
  
    
    @IBAction func onSubstractClicked(_ sender: Any) {
        if let text = label.text {
            label.text = viewModel.addOperator(text: text, _operator: MathOperator.minus)
        }
    }
    
    @IBAction func allClearClicked(_ sender: Any) {
        label.text = Constants.empty
    }
    
    @IBAction func reversePNClicked(_ sender: Any) {
        if let t = label.text {
            label.text = viewModel.reversePositiveNegative(text: t)
        }
    }
    
    @IBAction func modulos(_ sender: Any) {
        if let text = label.text {
            label.text = viewModel.addOperator(text: text, _operator: MathOperator.modulos)
        }    }
    
    @IBAction func multiplicationClicked(_ sender: Any) {
        if let text = label.text {
            label.text = viewModel.addOperator(text: text, _operator: MathOperator.multiple)
        }    }
    
    @IBAction func division(_ sender: Any) {
        if let text = label.text {
            label.text = viewModel.addOperator(text: text, _operator: MathOperator.division)
        }    }
    
    @IBAction func onResultClicked(_ sender: Any) {
        if let text = label.text{
            label.text = viewModel.onResultClicked(text: label.text ?? "")
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
