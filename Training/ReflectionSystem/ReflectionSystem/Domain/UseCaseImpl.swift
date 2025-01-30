//
//  UseCaseImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

class UseCaseImpl: UseCase {
  
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
    } catch {
      print(error.localizedDescription)
    }
  }

  func getReflection(stringDate: String) -> Reflection? {
    do {
      return try repository.getReflectionByDate(Date())
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
    } catch {
      print(error.localizedDescription)
    }
  }

  func deleteReflection(stringDate: String) {
    do {
      try repository.deleteReflection(date: Date())
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
