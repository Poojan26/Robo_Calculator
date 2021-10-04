//
// Name: Poojan Patel
// Student ID- 301228811
// Course: MAPD 714


import UIKit

class ViewController: UIViewController {
    
    // Variable declsration
    var operand1:String = ""
    var operand2:String = ""
    var used_operator:String = ""
    
    // Answer label outlet
    @IBOutlet weak var AnswerLabel: UILabel!
    
    // Lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // Actions
    @IBAction func OnNumbersPress(_ sender: UIButton) {
        var answer_text = sender.titleLabel!.text!
        
        switch answer_text {
        case ".":
            if !operand1.contains(".")
            {
                operand1.append(answer_text)
            }
        case "0":
            if operand1 != "0"
            {
                operand1.append(answer_text)
            }
        case "+":
            if self.used_operator == ""
            {
                used_operator.append("+")
                operand1.append("+")
            }
        case "-":
            if self.used_operator == ""
            {
                used_operator.append("-")
                operand1.append("-")
            }
            
        case "x":
            if self.used_operator == ""
            {
                used_operator.append("x")
                operand1.append("x")
            }
        
        case "/":
            if self.used_operator == ""
            {
                used_operator.append("/")
                operand1.append("/")
            }
        default:
            operand1.append(answer_text)
        }

        AnswerLabel.text = (operand1)
    }
  
    // Plus minus button
    @IBAction func PlusMinusButton(_ sender: UIButton) {
        print(AnswerLabel.text!.prefix(1))
        if AnswerLabel.text!.prefix(1) != "-"{
            AnswerLabel.text!.insert("-", at: AnswerLabel.text!.startIndex)
        }
        else{
             var result = AnswerLabel.text!.dropFirst()
            AnswerLabel.text = String(result)
        }
    }
    
    // Clear button
    @IBAction func ClearButton(_ sender: UIButton) {
        AnswerLabel.text = "0"
        operand1 = ""
        operand2 = "0"
        used_operator = ""
        
    }
    
    @IBAction func BackspaceButton(_ sender: UIButton) {
        var text = AnswerLabel.text
        // Used droplast function to drop last character
        text = String(text!.dropLast())
        AnswerLabel.text = text
        // If the last number from answer is removed then replace with 0
        if AnswerLabel.text == "" {
            AnswerLabel.text?.append("0")
        }
    }
    
    // Percentage button
    @IBAction func PercentageButton(_ sender: UIButton) {
        var output = percentage(a: operand1)
        AnswerLabel.text = output
        print(output)
    }
    
    
    // Equal button calculations
    @IBAction func EqualButtonPress(_ sender: UIButton) {
        if operand1.contains("+"){
            var answer_var = operand1.components(separatedBy: "+")
            operand1 = answer_var[0]
            operand2 = answer_var[1]
            
            var output = add(a: operand1, b: operand2)
            AnswerLabel.text = output
            print(AnswerLabel.text )
        }
        
        if operand1.contains("-"){
            var answer_var = operand1.components(separatedBy: "-")
            operand1 = answer_var[0]
            operand2 = answer_var[1]
            
            var output = subtract(a: operand1, b: operand2)
            AnswerLabel.text = output
            print(AnswerLabel.text )
        }
        
        if operand1.contains("x"){
            var answer_var = operand1.components(separatedBy: "x")
            operand1 = answer_var[0]
            operand2 = answer_var[1]
            
            var output = multiply(a: operand1, b: operand2)
            AnswerLabel.text = output
            print(AnswerLabel.text )
        }
        
        if operand1.contains("/"){
            var answer_var = operand1.components(separatedBy: "/")
            operand1 = answer_var[0]
            operand2 = answer_var[1]
            
            var output = divide(a: operand1, b: operand2)
            AnswerLabel.text = output
            print(AnswerLabel.text )
        }
      
        
    }
}

// Functions of Mathematical operations
func add(a:String, b:String) -> String{
    var result: Float = Float(a)! + Float(b)!
    var answer = String(format: "%.8f" ,result)
    return answer
    
}

func subtract(a:String, b:String) -> String{
    var result: Float = Float(a)! - Float(b)!
    var answer = String(format: "%.8f" ,result)
    return answer
    
}

func multiply(a:String, b:String) -> String{
    var result: Float = Float(a)! * Float(b)!
    var answer = String(format: "%.8f" ,result)
    return answer
    
}

func divide(a:String, b:String) -> String{
    var result: Float = Float(a)! / Float(b)!
    var answer = String(format: "%.8f" ,result)
    return answer
    
}

func percentage(a:String) -> String{
    var result: Float = Float(a)! / 100
    var answer = String(format: "%.8f" ,result)
    return answer
}




