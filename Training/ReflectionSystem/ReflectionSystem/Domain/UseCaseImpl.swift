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
  
  func addReflection(reflection: Reflection) {
    print(#function)
  }

  func getReflection(stringDate: String) -> Reflection {
    print(#function)
    return Reflection(date: "2024-05-12", content: "test content")
  }

  func updateReflection(reflection: Reflection) {
    print(#function)
  }

  func deleteReflection(stringDate: String) {
    print(#function)
  }

  func listAllReflections() -> [Reflection] {
    print(#function)
    return []
  }
}
