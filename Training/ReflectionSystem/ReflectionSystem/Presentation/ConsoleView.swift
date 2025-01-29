//
//  ConsoleView.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

class ConsoleView {
  private let useCase: UseCase
  
  init(useCase: UseCase) {
    self.useCase = useCase
  }
  
  private var inputNum: Int = 0
  
  func start() {
    repeat {
      print(Constants.menu, terminator: "")
      inputNum = Int(readLine() ?? "") ?? -1
      
      if inputNum < 1 || inputNum > 5 { print("\n1~6 사이의 숫자를 입력해주세요.\n") }
    } while inputNum != 6 && (inputNum < 1 || inputNum > 5)
    
    switch inputNum {
    case 1:
      var inputDate: String = ""
      repeat {
        print("날짜를 입력하세요 (예: 2024-12-25):", terminator: " ")
        inputDate = readLine() ?? ""
      } while !Helper.isValidDate(inputDate)
      
      print("회고 내용을 입력하세요:", terminator: " ")
      let inputContent = readLine() ?? ""
      
      let newReflection = Reflection(date: inputDate, content: inputContent)
      useCase.addReflection(reflection: newReflection)
    default:
      break
    }
  }
}
