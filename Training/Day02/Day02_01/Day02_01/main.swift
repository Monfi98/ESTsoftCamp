//
//  main.swift
//  Day02_01
//
//  Created by 신승재 on 1/24/25.
//

// 누적일 구하기
// - 월 입력받기
// - 일 입력받기
// - 누적 날짜 수 구하기

import Foundation

let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var inputMonth: Int = 0
var inputDay: Int = 0
var totalDays: Int = 0

// MARK: - 유효성 검사
repeat {
  print("월 입력: ", terminator: "")
  inputMonth = Int(readLine() ?? "") ?? -1
} while inputMonth < 1 || inputMonth > 12

repeat {
  print("일 입력: ", terminator: "")
  inputDay = Int(readLine() ?? "") ?? -1
} while inputDay < 1 || inputDay > monthDays[inputMonth - 1] + 1

// MARK: - 누적 합
for i in 0..<inputMonth - 1 {
  totalDays += monthDays[i]
}

totalDays += inputDay

print("1월 1일 부터 \(inputMonth)월 \(inputDay)일까지의 누적일은 \(totalDays)")
