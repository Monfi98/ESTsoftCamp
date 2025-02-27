//
//  ContentView.swift
//  CalculatorCombine
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct ContentView: View {
  
  private var viewModel = ViewModel()
  @State var number = 0.0
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.gray02.ignoresSafeArea()
        
        VStack(alignment: .trailing, spacing: 10) {
          
          Spacer()
          
          Text("\(viewModel.state.resultNumber)")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(.gray05)
            .padding(.trailing, 10)
          
          Spacer().frame(height: 10)
          
          Text(viewModel.state.expressionText)
            .font(.system(size: 30, weight: .regular))
            .frame(height: 30)
            .foregroundStyle(.gray04)
            .padding(.trailing, 10)
          
          Spacer().frame(height: 20)
          
          HStack(spacing: 0) {
            Button("AC", action: {
              
            })
              .buttonStyle(CalculatorButton(type: .special))
            Button("+/-", action: {})
              .buttonStyle(CalculatorButton(type: .special))
            Button("%", action: {})
              .buttonStyle(CalculatorButton(type: .special))
            Button("÷", action: {})
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("7", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("8", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("9", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("x", action: {})
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("4", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("5", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("6", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("-", action: {})
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("1", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("2", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("3", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button("+", action: {})
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("0", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button(".", action: {})
              .buttonStyle(CalculatorButton(type: .number))
            Button {
              print("action")
            } label: {
              Image(systemName: "delete.left")
                .font(.system(size: 28, weight: .light))
            }.buttonStyle(CalculatorButton(type: .number))
            Button("=", action: {})
              .buttonStyle(CalculatorButton(type: .delete))
          }
        }.padding(25)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: { print("menu") }) {
            Image(systemName: "line.3.horizontal")
              .resizable()
              .frame(width: 23, height: 20)
              .foregroundStyle(.gray05)
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
