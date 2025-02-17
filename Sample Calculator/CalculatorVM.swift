//
//  CalculatorViewModel.swift
//  Sample Calculator
//
//  Created by Onur ÇETİNKAYA on 11.02.2025.
//

import Foundation
import UIKit

class CalculatorViewModel{
    
    
    
    
    func addOperator(text : String, _operator : Character) -> String {
        if(text.isEmpty) { return "" }
        if let lastChar = text.last, lastChar == MathOperator.plus || lastChar == MathOperator.minus || lastChar == MathOperator.multiple || lastChar == MathOperator.division {
            return String(text.dropLast()) + String(_operator)
        } else {
            return String(text) + String(_operator)
        }
    }
    
    func reversePositiveNegative(text : String) -> String{
        if let number = Double(text) {
            let reversedNumber = -number
            return String(reversedNumber)
        }
        return text
    }
    
    func onResultClicked(text : String) -> String{
        
        let myTextArray = Array(text).map { String($0) }
            if myTextArray.last == String(MathOperator.plus) || myTextArray.last == String(MathOperator.minus) || myTextArray.last == String(MathOperator.multiple) || myTextArray.last == String(MathOperator.division) {
                return text
            }
        return Calculate().calculateResult(text: text ?? "")

        }

    }
    

