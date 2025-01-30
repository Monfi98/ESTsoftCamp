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
    repository.createReflection(reflection)
  }

  func getReflection(stringDate: String) -> Reflection {
    return repository.getReflectionByDate(Date())
  }

  func updateReflection(reflection: Reflection) {
    repository.updateReflection(reflection)
  }

  func deleteReflection(stringDate: String) {
    repository.deleteReflection(date: Date())
  }

  func listAllReflections() -> [Reflection] {
    return repository.readAllReflections()
  }
}
