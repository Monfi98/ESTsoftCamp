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
          
          Text(viewModel.state.resultNumber)
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
              viewModel.send(.allClear)
            })
              .buttonStyle(CalculatorButton(type: .special))
            Button("+/-", action: {
              viewModel.send(.operation(.toggle))
            })
              .buttonStyle(CalculatorButton(type: .special))
            Button("%", action: {
              viewModel.send(.operation(.percent))
            })
              .buttonStyle(CalculatorButton(type: .special))
            Button("÷", action: {
              viewModel.send(.operation(.divide))
            })
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("7", action: {
              viewModel.send(.number("7"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("8", action: {
              viewModel.send(.number("8"))
              
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("9", action: {
              viewModel.send(.number("9"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("×", action: {
              viewModel.send(.operation(.multiply))
            })
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("4", action: {
              viewModel.send(.number("4"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("5", action: {
              viewModel.send(.number("5"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("6", action: {
              viewModel.send(.number("6"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("-", action: {
              viewModel.send(.operation(.subtract))
            })
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("1", action: {
              viewModel.send(.number("1"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("2", action: {
              viewModel.send(.number("2"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("3", action: {
              viewModel.send(.number("3"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button("+", action: {
              viewModel.send(.operation(.add))
            })
              .buttonStyle(CalculatorButton(type: .operation))
          }
          
          HStack(spacing: 0) {
            Button("0", action: {
              viewModel.send(.number("0"))
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button(".", action: {
              viewModel.send(.dot)
            })
              .buttonStyle(CalculatorButton(type: .number))
            Button {
              viewModel.send(.delete)
            } label: {
              Image(systemName: "delete.left")
                .font(.system(size: 28, weight: .light))
            }.buttonStyle(CalculatorButton(type: .number))
            Button("=", action: {
              viewModel.send(.equal)
            })
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
