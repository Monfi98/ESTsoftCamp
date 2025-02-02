//
//  ConsoleView.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

enum MenuOption: Int {
  case addReflection = 1
  case viewReflection
  case editReflection
  case deleteReflection
  case listAllReflections
  case exit
}

final class ConsoleView {
  private let useCase: UseCase
  
  init(useCase: UseCase) {
    self.useCase = useCase
  }
  
  private var selectedMenu: MenuOption?
  
  func start() {
    repeat {
      selectMenu()
      if let selectedMenu = selectedMenu {
        handleMenuSelection(selectedMenu)
      }
    } while selectedMenu != .exit
  }
  
  // 메뉴 선택
  private func selectMenu() {
    let menuText =
      """
      === 회고 시스템 ===
      1. 회고 추가
      2. 회고 조회
      3. 회고 수정
      4. 회고 삭제
      5. 전체 회고 목록 출력
      6. 종료
      
      메뉴를 선택하세요: 
      """
    
    repeat {
      print(menuText, terminator: "")
      let input = Int(readLine() ?? "") ?? -1
      selectedMenu = MenuOption(rawValue: input)
      
      if selectedMenu == nil {
        print("\n1~6 사이의 숫자를 입력해주세요.\n")
      }
    } while selectedMenu == nil
  }
  
  
  private func handleMenuSelection(_ menu: MenuOption) {
    switch menu {
    case .addReflection:
      addReflection()
    case .viewReflection:
      viewReflection()
    case .editReflection:
      editReflection()
    case .deleteReflection:
      deleteReflection()
    case .listAllReflections:
      listAllReflections()
    case .exit:
      exit()
    }
  }
  
  private func addReflection() {
    let inputDate = askForDate(text: "날짜를 입력하세요 (예: 2024-12-25):")
    let inputContent = askForContent(text: "회고 내용을 입력하세요:")
    useCase.addReflection(stringDate: inputDate, content: inputContent)
  }
  
  private func viewReflection() {
    let inputDate = askForDate(text: "조회할 날짜를 입력하세요:")
    if let reflection = useCase.getReflection(stringDate: inputDate) {
      print("\n날짜: \(reflection.date.yyyyMMddString)")
      print("회고: \(reflection.content)")
    } else {
      print("날짜에 해당하는 회고가 존재하지 않습니다!")
    }
  }
  
  private func editReflection() {
    let inputDate = askForDate(text: "수정할 날짜를 입력하세요:")
    let inputContent = askForContent(text: "새로운 회고 내용을 입력하세요:")
    useCase.updateReflection(stringDate: inputDate, content: inputContent)
    
  }
  
  private func deleteReflection() {
    let inputDate = askForDate(text: "삭제할 날짜를 입력하세요:")
    useCase.deleteReflection(stringDate: inputDate)
  }
  
  private func listAllReflections() {
    print("=== 저장된 회고 목록 ===")
    
    guard let reflections = useCase.listAllReflections() else {
      print("저장된 회고 목록이 없습니다.")
      return
    }
    
    for reflection in reflections {
      print("\n날짜: \(reflection.date.yyyyMMddString)")
      print("회고: \(reflection.content)")
    }
  }
  
  private func exit() {
    print("프로그램을 종료합니다.")
  }
}

extension ConsoleView {
  
  private func askForDate(text: String) -> String {
    var inputDate: String
    repeat {
      print(text, terminator: " ")
      inputDate = readLine() ?? ""
    } while !isValidDate(inputDate)
    return inputDate
  }
  
  private func askForContent(text: String) -> String {
    var inputContent: String
    print(text, terminator: " ")
    inputContent = readLine() ?? ""
    return inputContent
  }
  
  private func isValidDate(_ dateString: String) -> Bool {
    
    // String 유효성 검사
    let datePattern = #"^\d{4}-\d{2}-\d{2}$"#
    let regex = try! NSRegularExpression(pattern: datePattern)
    let range = NSRange(location: 0, length: dateString.utf16.count)
    guard regex.firstMatch(in: dateString, options: [], range: range) != nil
    else { return false }
    
    // 실제로 있는 날짜인지 검사
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let date = dateFormatter.date(from: dateString) else { return false }
    return dateFormatter.string(from: date) == dateString
  }
}
