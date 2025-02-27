//
//  ViewController.swift
//  Day20
//
//  Created by 신승재 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var number1TextField: UITextField!
  @IBOutlet weak var operatorTextField: UITextField!
  @IBOutlet weak var number2TextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func resultButtonTapped(_ sender: Any) {
    guard let number1Texfield = number1TextField.text else { return }
    guard let operatorTextField = operatorTextField.text else { return }
    guard let number2Texfield = number1TextField.text else { return }
    let result = performOperation(
      operand1: Int(number1Texfield)!,
      operand2: Int(number2Texfield)!,
      operation: operatorTextField
    )
    resultLabel.text = "결과: \(result)"
    
    
  }

  private func performOperation(
    operand1: Int,
    operand2: Int,
    operation: String
  ) -> Int {
    switch operation {
    case "+": return operand1 + operand2
    case "-": return operand1 - operand2
    case "*": return operand1 * operand2
    case "/": return operand1 / operand2
    default: return 0
    }
  }
}

