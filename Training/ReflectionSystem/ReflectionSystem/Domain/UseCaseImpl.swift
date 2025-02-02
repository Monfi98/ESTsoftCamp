//
//  UseCaseImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

final class UseCaseImpl: UseCase {
  
  let repository: Repository
  
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
      try repository.deleteReflectionByDate(stringDate.toDate!)
      print("회고가 삭제되었습니다.")
    } catch {
      print(error.localizedDescription)
    }
  }

  func listAllReflections() -> [Reflection]? {
    do {
      return try repository.getAllReflections()
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
}
