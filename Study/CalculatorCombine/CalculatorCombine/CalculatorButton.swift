//
//  CalculatorButton.swift
//  CalculatorCombine
//
//  Created by 신승재 on 2/27/25.
//

import SwiftUI

struct CalculatorButton: ButtonStyle {
  
  let type: KeyType
  
  var labelColor: Color {
    switch type {
    case .number, .operation, .special:
        return .gray05
    case .delete:
        return .gray01
    }
  }
  
  var backgroundColor: Color {
    switch type {
    case .number:
        return .gray01
    case .operation:
      return .gray04
    case .delete:
      return .red01
    case .special:
      return .gray03
    }
  }
  
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.system(size: 25, weight: .regular))
      .frame(maxWidth: .infinity)
      .padding(23)
      .background(backgroundColor)
      .foregroundStyle(labelColor)
      .clipShape(Circle())
  }
}

#Preview {
  Button("=", action: {
    print("AC")
  }).buttonStyle(CalculatorButton(type: .special))
}
