//
//  main.swift
//  Day03_01
//
//  Created by 신승재 on 1/24/25.
//

// Step 01
// 시스템이 1~100 사이의 난수를 발생.
// 사용자가 정답을 입력해서 맞추는 프로그램.
// 6회 시도 안에 맞추는 프로그램.
// Step 02
// 한 게임이 끝나면 재시도 여부 물어 보기
// 재시도 하면 모든 변수가 초기화 되면서 다시 시작.

import Foundation

let randNumber = Int.random(in: (1...100))
var count = 0

while true {
  if  count != 6{
    let userNumber = Int(readLine() ?? "0") ?? 0
    
    if(userNumber > randNumber){
      print("Down")
    }else if(userNumber < randNumber){
      print("Up")
    }else{
      print("정답 입니다")
      break
    }
    count += 1
  }else{
    print("정답은 \(randNumber) 입니다")
    break
  }
}
