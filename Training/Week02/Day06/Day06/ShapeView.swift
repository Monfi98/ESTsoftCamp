//
//  ShapeView.swift
//  Day06
//
//  Created by 신승재 on 2/6/25.
//

import Foundation

class ShapeView {

  var shapeList: [Shape]
  
  init() {
    shapeList = [Circle(), Rectangle()]
  }
  
  func showList() {
    for shape in shapeList {
      shape.draw()
    }
  }
  
  func appendShape(choice: Int) {
    if choice == 1 {
      shapeList.append(Circle())
    } else {
      shapeList.append(Rectangle())
    }
    
  }
  
  func main() {
    
    // 5회 반복 Shape 생성
    // 1번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 1
    // 리스트에 Circle 객체 추가 완료!
    // 2번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 2
    // 리스트에 Rectangle 객체 추가 완료!
    // 3번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle:
    
    for i in 1...5 {
      print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle", terminator: ": ")
      let choice: Int = Int(readLine() ?? "") ?? 0
      appendShape(choice: choice)
    }
    
    showList()
    
  }
}
