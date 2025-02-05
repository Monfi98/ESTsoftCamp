//
//  ConsoleView.swift
//  ContactBook
//
//  Created by 신승재 on 2/5/25.
//

import Foundation

/*
----- MENU -----
1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
Choice: 1

----- 입력 기능 ----

 
 ----- MENU -----
 1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
 Choice: 2
 
 ----- 목록 출력 기능 ----
 
 
 ----- MENU -----
 1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
 Choice: 3
 
 ----- 입름 검색 기능 ----
*/

enum MenuOption {
  case input
  case output
  case search
  case edit
  case delete
  case end
}


final class ContactBook {
  
  private var contact: [String: String] = [:]
  
  func start() {
    
    print(":::: 전화 번호부 ::::")
    var inputMenuNum: Int?
    repeat {
      inputMenuNum = selectMenu()
    } while inputMenuNum == nil
    
  }
  
  private func selectMenu() -> Int? {
    let menuText = """

----- MENU -----
1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
 Choice: 
"""
    print(menuText, terminator: "")
    guard let input = Int(readLine() ?? "") else { return nil }
    
    if input <= 6 && input >= 1 {
      return input
    } else {
      return nil
    }
  }
  
  private func menu(menu: MenuOption) {
    switch menu {
    case .input:
      input()
    case .output:
      output()
    case .search:
      search()
    case .edit:
      edit()
    case .delete:
      delet()
    case .end:
      end()
    }
  }
}

extension ContactBook {
  private func input() {
    print("----- 입력 기능 -----")
    print("새로운 친구를 등록합니다.")
    print("이름: ", terminator: "")
    let name = readLine() ?? ""
    print("전화번호: ", terminator: "")
    let phoneNum = readLine() ?? ""
    
    contact[name] = phoneNum
  }
  
  private func output() {
    print("----- 목록 출력 기능 -----")
    print("친구 연락처 목록을 출력합니다.")
    let keyArr = Array(contact.keys)
    for key in keyArr {
      print("이름: \(key)")
      print("번호:", contact[key]!)
    }
  }
  
  private func search() {
    print("----- 검색 기능 -----")
    print("이름 검색 기능입니다.")
  }
  
  private func edit() {
    print("----- 수정 기능 -----")
    print("전화 번호 수정 기능입니다.")
  }
  
  private func delete() {
    print("----- 삭제 기능 -----")
    print("전화번호부 삭제 기능입니다.")
  }
  
  private func end() {
    print("---- 종료 -----")
    print("수고하셨습니다. 다음 기회에 또 만나요 ^^")
  }
}
