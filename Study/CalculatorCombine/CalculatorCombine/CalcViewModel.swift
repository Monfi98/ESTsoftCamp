//
//  CalcViewModel.swift
//  CalculatorCombine
//
//  Created by 신승재 on 3/5/25.
//

import Foundation
import Combine

// 사칙연산 구현만을 중심으로 다시 짭니다.
// 이유: 좀더 가독성 높이고 Combine학습에 좀 더 초점을 둬보기 위해서
final class CalcViewModel: ObservableObject {
  @Published var previewText = ""
  @Published var resultNumberText = ""
  
  private var operators: Set<Character> = ["+", "-", "*", "/"]
  
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
      if !previewText.isEmpty { previewText.removeLast() }
      
    case .allClearTapped:
      resultNumberText = ""
      previewText = ""
    case .equalTapped:
      handleEqual()
    }
  }
}

extension CalcViewModel {
  
  private func handleNumber(_ numberText: String) {
    if numberText == "0" {
      
      if let lastText = previewText.last, !operators.contains(lastText) {
        previewText += numberText
      }
    } else {
      previewText += numberText
    }
  }
  
  private func handleOperator(_ operatorText: String) {
    if let lastText = previewText.last, !operators.contains(lastText) {
      previewText += operatorText
    }
  }
  
  private func handleEqual() {
    guard let lastText = previewText.last, !operators.contains(lastText)
    else { return }
    
    if let expression = NSExpression(format: previewText) as NSExpression?,
       let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
      resultNumberText = result.stringValue
    }
    
  }
}
