//
//  main.swift
//  Day02_02
//
//  Created by 신승재 on 1/24/25.
//

import Foundation

let menuString = """
=== 회고 시스템 ===
1. 회고 추가
2. 회고 조회
3. 회고 수정
4. 회고 삭제
5. 전체 회고 목록 출력
6. 종료
"""

while true {
  print(menuString)
  print("메뉴를 선택하세요: ", terminator: "")
  
  let selectedMenu = readLine()
  if let selectedMenu = selectedMenu {
    switch selectedMenu {
    case "1":
      print("날짜를 입력하세요 (예: 2024-12-25):")
    default:
      print("이외의 번호를 입력하셨습니다.")
    }
    
  } else {
    print("숫자를 정확히 입력해 주세요 !")
  }
}

private func addRetrospect() {
  
}
