//
//  ContentView.swift
//  CalculatorCombine
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct ContentView: View {
  @State var number = 0.0
  var body: some View {
    GeometryReader { proxy in
      VStack {
        Text("\(number)")
        HStack {
          Button("AC", action: {})
          Button("+/-", action: {})
          Button("%", action: {})
          Button("÷", action: {})
        }
        
        HStack {
          Button("7", action: {})
          Button("8", action: {})
          Button("9", action: {})
          Button("✕", action: {})
        }
        
        HStack {
          Button("4", action: {})
          Button("5", action: {})
          Button("6", action: {})
          Button("-", action: {})
        }
        
        HStack {
          Button("1", action: {})
          Button("2", action: {})
          Button("3", action: {})
          Button("+", action: {})
        }
        
        HStack {
          Button("0", action: {})
          Button(".", action: {})
          Button("=", action: {})
        }
      }
      .frame(width: proxy.size.width)
      .background(.red)
    }
  }
}

#Preview {
  ContentView()
}
