//
//  ConsoleView.swift
//  ContactBook
//
//  Created by 신승재 on 2/5/25.
//

import Foundation


enum MenuOption: Int {
  case input = 1
  case output
  case search
  case edit
  case delete
  case end
}


final class ContactBook {
  
  private var contact: [String: String] = [:]
  
  func start() {
    
    var inputMenuNum: Int?
    print(":::: 전화 번호부 ::::")
    repeat {
      
      repeat {
        inputMenuNum = selectMenu()
      } while inputMenuNum == nil
      
      menu(menu: MenuOption(rawValue: inputMenuNum!)!)
    } while inputMenuNum != 6
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
      delete()
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
    print("이름: ", terminator: "")
    let name = readLine() ?? ""
    
    if let phoneNum = contact[name] {
      print("전화번호는 \(phoneNum)입니다.")
    } else {
      print("해당하는 전화번호가 없습니다.")
    }
  }
  
  private func edit() {
    print("----- 수정 기능 -----")
    print("전화 번호 수정 기능입니다.")
    print("수정하고 싶은 이름: ", terminator: "")
    let name = readLine() ?? ""
    
    guard contact[name] != nil else {
      print("해당하는 이름이 없습니다.")
      return
    }
    
    print("전화번호: ", terminator: "")
    let phoneNum = readLine() ?? ""
    
    contact[name] = phoneNum
    
  }
  
  private func delete() {
    print("----- 삭제 기능 -----")
    print("전화번호부 삭제 기능입니다.")
    
    print("삭제하고 싶은 전화번호부 이름: ", terminator: "")
    let name = readLine() ?? ""
    
    guard contact[name] != nil else {
      print("해당하는 이름이 없습니다.")
      return
    }
    
    contact.removeValue(forKey: name)
    
  }
  
  private func end() {
    print("---- 종료 -----")
    print("수고하셨습니다. 다음 기회에 또 만나요 ^^")
  }
}
