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
    
    // Lifecylce function
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
  
    
    @IBAction func PlusMinusButton(_ sender: UIButton) {
        
        
    }
    
    // Clear button
    @IBAction func ClearButton(_ sender: UIButton) {
        AnswerLabel.text = "0"
        operand1 = ""
        operand2 = "0"
        used_operator = ""
        
    }
    
    
    @IBAction func BackSpaceButtonPressed(_ sender: UIButton) {
        AnswerLabel.text?.removeLast()
    }
    
    @IBAction func OnSpecialButtonPress(_ sender: UIButton) {
        
    }
    
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
    var answer = String(result)
    return answer
    
}

func subtract(a:String, b:String) -> String{
    var result: Float = Float(a)! - Float(b)!
    var answer = String(result)
    return answer
    
}

func multiply(a:String, b:String) -> String{
    var result: Float = Float(a)! * Float(b)!
    var answer = String(result)
    return answer
    
}

func divide(a:String, b:String) -> String{
    var result: Float = Float(a)! / Float(b)!
    var answer = String(result)
    return answer
    
}

