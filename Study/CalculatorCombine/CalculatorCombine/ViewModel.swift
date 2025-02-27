//
//  ViewModel.swift
//  CalculatorCombine
//
//  Created by 신승재 on 2/27/25.
//

import Foundation

@Observable
final class ViewModel {
  
  struct State {
    var resultNumber = 0
    var expressionText = ""
  }
  
  private(set) var state: State = .init()

  
  enum Action {
    
  }
  
  func send(_ action: Action) {
    switch action {
      
    }
  }
  
}
