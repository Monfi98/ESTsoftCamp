//
//  main.swift
//  Day02_02
//
//  Created by 신승재 on 1/23/25.
//

import Foundation

let size = 10
var total: Int = 0

for num in 1...size{
  if num == size {
    print("=")
    break
  }
  print("\(num)", terminator: " + ")
  total += num
} 

print(total)
