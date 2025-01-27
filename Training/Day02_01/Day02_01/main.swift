//
//  main.swift
//  Day02_01
//
//  Created by 신승재 on 1/24/25.
//

import Foundation

let randomInt = Int.random(in: (1...100))
var isRepeat = ""

repeat {
  var count = 0
  while count < 6 {
    print("\(count + 1)회차 시도 난수?:", terminator: " ")
    let input = Int(readLine() ?? "")
    
    if let input = input {
      
      if input == randomInt {
        print("맞췄습니다!")
        break
      }
      
      if input > randomInt {
        print("Down")
      } else if input < randomInt {
        print("Up")
      }
      
      count += 1
    } else { print("제대로 숫자를 입력해주세요 !") }
  }
  
  print("재시도 하시겠습니까?(Y/N)", terminator: "")
  isRepeat = readLine() ?? "n"
  
} while isRepeat == "y" || isRepeat == "Y"

