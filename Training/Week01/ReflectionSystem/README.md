## 🤟 프로젝트 설명
CRUD를 InMemory로 구현해보자.(with Clean Architecture)

### 파일 구조

크게 `App`, `Data`, `Domain`, `Presentation`, `Helper`로 나눠져있다.

- `App` → 앱 시작시에 초기화 하는 코드가 들어있음
- `Presentation` → UI 레이어
- `Domain` → 애플리케이션의 핵심 비즈니스 로직을 정의하는 레이어
- `Data` → 실제 레포지토리의 구현체가 들어있는 레이어
- `Helper` → Extension

```
ReflectionSystem
│── 📂 App
│   ├── 📄 DIContainer.swift
│   ├── 📄 main.swift
│
│── 📂 Data
│   ├── 📄 Error.swift
│   ├── 📄 InMemoryRepositoryImpl.swift
│
│── 📂 Domain
│   ├── 📄 Model
│   ├── 📄 Repository
│   ├── 📄 UseCase
│   ├── 📄 UseCaseImpl
│
│── 📂 Helper
│   ├── 📄 Date+.swift
│   ├── 📄 String+.swift
│
│── 📂 Presentation
    ├── 📄 ConsoleView.swift
```

### UseCase Protocol

```swift
protocol UseCase {
  /// 새로운 회고 데이터를 추가합니다.
  /// - Parameter reflection
  func addReflection(stringDate: String, content: String)
  
  /// 특정 날짜의 회고 데이터를 조회합니다.
  /// - Parameter stringDate: 문자열로 이루어진 date
  /// - Returns: Reflection
  func getReflection(stringDate: String) -> Reflection?
  
  /// 기존 회고 데이터를 수정합니다.
  /// - Parameter reflection
  func updateReflection(stringDate: String, content: String)
  
  /// 특정 날짜의 회고 데이터를 삭제합니다.
  /// - Parameter stringDate: 문자열로 이루어진 date
  func deleteReflection(stringDate: String)
  
  /// 모든 회고 데이터를 날짜별로 출력합니다.
  /// - Returns: [Reflection]
  func listAllReflections() -> [Reflection]?
}
```

### Repository Protocol

```swift
protocol Repository {
  /// 새로운 회고를 추가합니다.
  /// - Parameter reflection
  func createReflection(_ reflection: Reflection) throws
  
  /// 특정 날짜의 회고를 가져옵니다.
  /// - Parameter date
  /// - Returns Reflection
  func getReflectionByDate(_ date: Date) throws -> Reflection
  
  /// 모든 회고들을 가져옵니다.
  /// - Returns [Reflection]
  func getAllReflections() throws -> [Reflection]
  
  /// 기존 회고를 업데이트 합니다.
  /// - Parameter reflection
  func updateReflection(_ reflection: Reflection) throws
  
  /// 기존 회고를 삭제합니다.
  /// - Parameter date
  func deleteReflectionByDate(_ date: Date) throws
}
```

### 핵심 코드

### `ConsoleView.swift`

```swift
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

```

### `UseCaseImpl.swift`

유즈케이스 프로토콜을 채택한 실체 구현체이다. 

| 메서드 이름 | 설명 |
| --- | --- |
| `addReflection()` | 새로운 회고 데이터를 추가합니다. |
| `getReflection()` | 특정 날짜의 회고 데이터를 조회합니다. |
| `updateReflection()` | 기존 회고 데이터를 수정합니다. |
| `deleteReflection()` | 특정 날짜의 회고 데이터를 삭제합니다. |
| `listAllReflections()` | 모든 회고 데이터를 날짜별로 출력합니다. |

```swift
//
//  UseCaseImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

final class UseCaseImpl: UseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
  func addReflection(stringDate: String, content: String) {
    do {
      let newReflection = Reflection(
        date: stringDate.toDate!,
        content: content
      )
      try repository.createReflection(newReflection)
      print("회고가 추가되었습니다.")
    } catch {
      print(error.localizedDescription)
    }
  }

  func getReflection(stringDate: String) -> Reflection? {
    do {
      return try repository.getReflectionByDate(stringDate.toDate!)
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }

  func updateReflection(stringDate: String, content: String) {
    do {
      let newReflection = Reflection(
        date: stringDate.toDate!,
        content: content
      )
      try repository.updateReflection(newReflection)
      print("회고가 수정되었습니다.")
    } catch {
      print(error.localizedDescription)
    }
  }

  func deleteReflection(stringDate: String) {
    do {
      try repository.deleteReflectionByDate(date: stringDate.toDate!)
      print("회고가 삭제되었습니다.")
    } catch {
      print(error.localizedDescription)
    }
  }

  func listAllReflections() -> [Reflection]? {
    do {
      return try repository.readAllReflections()
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
}

```

### `InMemoryRepositoryImpl.swift`

실제 CRUD를 관장하고 있는 레포지토리의 구현체이다.

| 메서드 이름 | 설명 |
| --- | --- |
| `createReflection()` | 새로운 회고 데이터를 생성합니다. |
| `getReflectionByDate()` | 특정 날짜의 회고 데이터를 가져옵니다. |
| `updateReflection()` | 기존 회고 데이터를 수정합니다. |
| `deleteReflectionByDate()` | 특정 날짜의 회고 데이터를 삭제합니다. |
| `getAllReflections()` | 모든 회고 데이터를 가져옵니다. |

```swift
//
//  RepositoryImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

final class InMemoryRepositoryImpl: Repository {
  
  private var reflections: [Date: Reflection] = [:]

  func createReflection(_ reflection: Reflection) throws {
    print("Impl: \(#function)")
    
    let key = reflection.date
    
    if reflections[key] != nil {
      throw DomainError.dataAlreadyExists(key.yyyyMMddString)
    }
    
    reflections[key] = reflection
  }

  func getReflectionByDate(_ date: Date) throws -> Reflection {
    print("Impl: \(#function)")
    
    let key = date
    
    if let reflection = reflections[key] {
      return reflection
    } else {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
  }
  
  func getAllReflections() throws -> [Reflection] {
    print("Impl: \(#function)")
    
    if reflections.isEmpty {
      throw DomainError.noDataStored
    }
    
    let reflectionArray = Array(reflections.values)
    
    return reflectionArray
  }

  func updateReflection(_ reflection: Reflection) throws {
    print("Impl: \(#function)")
    
    let key = reflection.date
    
    if reflections[key] == nil {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
    
    reflections[key] = reflection
  }

  func deleteReflection(date: Date) throws {
    print("Impl: \(#function)")
    
    let key = date
    
    if reflections[key] != nil {
      reflections.removeValue(forKey: key)
    } else {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
  }
}

```