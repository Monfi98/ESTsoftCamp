//
//  CalcViewModel.swift
//  CalculatorCombine
//
//  Created by 신승재 on 3/5/25.
//

import Foundation
import Combine

final class CalcViewModel {
  
  let previewTextPublisher = CurrentValueSubject<String, Never>("")
  let resultNumberPublisher = PassthroughSubject<Int, Never>()
  
  private let operators: Set<Character> = ["+", "-", "*", "/"]
  
  enum Action {
    case numberTapped(String)
    case operatorTapped(String)
    case deleteTapped
    case allClearTapped
    case equalTapped
  }
  
  func send(_ action: Action) {
    switch action {
    case .numberTapped(let numberText):
      handleNumber(numberText)
      
    case .operatorTapped(let operatorText):
      handleOperator(operatorText)
      
    case .deleteTapped:
      if !previewTextPublisher.value.isEmpty {
        previewTextPublisher.value.removeLast()
      }
      
    case .allClearTapped:
      previewTextPublisher.send("")
      resultNumberPublisher.send(0)
      
    case .equalTapped:
      handleEqual()
    }
  }
}

extension CalcViewModel {
  
  private func handleNumber(_ numberText: String) {
    if numberText == "0" {
      if let lastText = previewTextPublisher.value.last, !operators.contains(lastText) {
        previewTextPublisher.value += numberText
      }
    } else {
      previewTextPublisher.value += numberText
    }
  }
  
  private func handleOperator(_ operatorText: String) {
    if let lastText = previewTextPublisher.value.last, !operators.contains(lastText) {
      previewTextPublisher.value += operatorText
    }
  }
  
  private func handleEqual() {
    guard let lastText = previewTextPublisher.value.last, !operators.contains(lastText) else { return }
    
    if let expression = NSExpression(format: previewTextPublisher.value) as NSExpression?,
       let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
      resultNumberPublisher.send(result.intValue)
    }
  }
}
