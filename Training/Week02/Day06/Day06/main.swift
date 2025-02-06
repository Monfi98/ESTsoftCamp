//
//  main.swift
//  Day06
//
//  Created by 신승재 on 2/6/25.
//

import Foundation

// 객체 지향 개념을 활용하여 "도형 그리기 프로그램을 구현하시오"
class Shape {
  func draw() {
    print("도형을 그립니다.")
  }
}

class Circle: Shape {
  override func draw() {
    print("원을 그립니다.")
  }
}

class Rectangle: Shape {
  override func draw() {
    print("사각형을 그립니다.")
  }
}

let circle = Circle()
let rectangle = Rectangle()

var shapes: [Shape] = [circle, rectangle]

for shape in shapes {
  shape.draw()
}
