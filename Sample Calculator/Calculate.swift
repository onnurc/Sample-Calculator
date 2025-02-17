
class Calculate {

    func calculateResult(text : String) -> String {
            var numbers = text.components(separatedBy: ["+", "-","X","/"])
            var operators = text.filter { $0 == MathOperator.plus || $0 == MathOperator.minus || $0 == MathOperator.multiple || $0 == MathOperator.division }.map { String($0) }
            
            var result: [String] = []
            for (index, number) in numbers.enumerated() {
                result.append(number)
                if index < operators.count {
                    result.append(operators[index])
                }
            }
        
            while numbers.count > 1 && operators.count >= 1 {
                
                while numbers.count > 1 && operators.count >= 1 {
                    
                    
                    if operators.count > 1 && operators[1] == String(MathOperator.multiple){
                        if Double(numbers[1]) == 0 && Double(numbers[2]) == 0 {
                            return "Undefined"
                        }
                        var result = Double(numbers[1])! * Double(numbers[2])!
                        numbers.remove(at: 2)
                        numbers.remove(at: 1)
                        operators.remove(at: 1)
                        numbers.insert(String(result), at: 1)
                    }
                    if  operators.count > 0 && operators[0] == String(MathOperator.multiple) {
                        if Double(numbers[0]) == 0 && Double(numbers[1]) == 0 {
                            return "Undefined"
                        }
                        var result = Double(numbers[0])! * Double(numbers[1])!
                        numbers.removeFirst(2)
                        operators.removeFirst()
                        numbers.insert(String(result), at: 0)
                    }
                    if operators.count > 1 && operators[1] == String(MathOperator.division) {
                        if Double(numbers[2])! == 0 {
                            return "Undefined"
                        }
                        var result = Double(numbers[1])! / Double(numbers[2])!
                        numbers.remove(at: 2)
                        numbers.remove(at: 1)
                        operators.remove(at: 1)
                        numbers.insert(String(result), at: 1)
                    }
                    if  operators.count > 0 && operators[0] == String(MathOperator.division){
                        if Double(numbers[1])! == 0 {
                            return "Undefined"
                        }
                        var result = Double(numbers[0])! / Double(numbers[1])!
                        numbers.removeFirst(2)
                        operators.removeFirst()
                        numbers.insert(String(result), at: 0)
                    }
                    if  operators.count > 0 && operators[0] == String(MathOperator.plus){
                        let result = Double(numbers[0])! + Double(numbers[1])!
                        numbers.removeFirst(2)
                        operators.removeFirst()
                        numbers.insert(String(result), at: 0)
                    }
                    if operators.count > 0 && operators[0] == String(MathOperator.minus){
                        var result = Double(numbers[0])! - Double(numbers[1])! //- ile başlayınca hata veriyor fix etmen lazım 
                        numbers.removeFirst(2)
                        operators.removeFirst()
                        numbers.insert(String(result), at: 0)
                    }
                }
                return numbers.first ?? ""
        }
        return text
    }
}
