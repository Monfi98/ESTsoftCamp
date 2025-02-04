//
//  main.swift
//  Day03_01
//
//  Created by 신승재 on 2/3/25.
//

import Foundation

// 1 + 1 + 2 + 3 + 5 + 8 + 13 + 21 = 54?
// 1 + 1 - 2 + 3 - 5 + 8 - 13 + 21 = 13?
let MAX = 21
var cur = 1

var next = 1
var prev = 0
var total = 0

var flag = false

while cur <= MAX {
  
  if flag || prev == 0 {
    total += cur
  } else {
    total -= cur
  }
  
  flag.toggle()
  
  prev = cur
  cur = next
  next = prev + cur
  
}

print(total)

// next = cur + prev

// cur -> 1일때, prev = 0, next = 1
// cur -> 1(이전 next)일때, prev = 1(이전 cur), next = 2(현재 cur + 현재 prev)
// cur -> 2일때, prev = 1, next = 3
// cur -> 3일때, prev = 2, next = 5
