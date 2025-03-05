//
//  ViewModel.swift
//  CalculatorCombine
//
//  Created by 신승재 on 2/27/25.
//

import Foundation

@Observable
final class LegacyViewModel {
  
  struct State {
    var resultNumber: String = "0"
    var expressionText = ""
  }
  
  private(set) var state: State = .init()
  private var recentInput = ""
  
  enum Action {
    case number(String)
    case dot
    case operation(OperationType)
    case switchOperator
    case delete
    case allClear
    case equal
  }
  
  func send(_ action: Action) {
    switch action {
    case .number(let number):
      handleNumberInput(number)
      
    case .operation(let type):
      handleOperationInput(type)
      
    case .switchOperator:
      print("switch")
      
    case .delete:
      if !state.expressionText.isEmpty {
        state.expressionText.removeLast()
        recentInput = state.expressionText.last.map { String($0) } ?? ""
      }
      
    case .dot:
      print("dot")
      
    case .allClear:
      state.expressionText = ""
      state.resultNumber = "0"
      recentInput = ""
      
    case .equal:
      calculateExpression()
    }
  }
  
  private func handleNumberInput(_ number: String) {
    if state.expressionText == "0" {
      state.expressionText = number
    } else {
      state.expressionText += number
    }
    recentInput = number
  }
  
  
  private func handleOperationInput(_ type: OperationType) {
    if recentInput.isEmpty || isOperator(recentInput) {
      return
    }
    
    state.expressionText += type.rawValue
    recentInput = type.rawValue
  }
  
  private func calculateExpression() {
    if state.expressionText.isEmpty || isOperator(recentInput) {
      return
    }
    
    let modifiedExpression = state.expressionText
      .replacingOccurrences(of: "(?<=\\d)(?=\\D)", with: ".0", options: .regularExpression)
    
    let expression = NSExpression(format: modifiedExpression)
    
    if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
      state.resultNumber = String(format: "%.2f", result.doubleValue)
    } else {
      state.resultNumber = "0"
    }
  }
  
  private func isOperator(_ text: String) -> Bool {
    return ["+", "-", "*", "/"].contains(text)
  }
}

// 연산자 타입 정의
enum OperationType: String {
  case add = "+"
  case subtract = "-"
  case multiply = "*"
  case divide = "/"
  case percent = "1"
  case toggle = "2"
}

