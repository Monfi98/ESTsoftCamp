//
//  Model.swift
//  Day06
//
//  Created by 신승재 on 2/6/25.
//

import Foundation


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
