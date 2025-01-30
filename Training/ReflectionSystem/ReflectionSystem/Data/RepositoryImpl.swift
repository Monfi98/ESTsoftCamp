//
//  RepositoryImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

final class RepositoryImpl: Repository {
  
  private var reflections: [String: Reflection] = [:]

  func createReflection(_ reflection: Reflection) throws {
    print("RepositoryImpl: \(#function)")
    
    let key = reflection.date.yyyyMMddString
    
    if reflections[key] != nil {
      throw DomainError.dataAlreadyExists(key)
    }
    
    reflections[key] = reflection
  }

  func getReflectionByDate(_ date: Date) throws -> Reflection {
    print(#function)
    
    let key = date.yyyyMMddString
    
    if let reflection = reflections[key] {
      return reflection
    } else {
      throw DomainError.dataNotFound(key)
    }
  }
  
  func readAllReflections() throws -> [Reflection] {
    print(#function)
    
    if reflections.isEmpty {
      throw DomainError.noDataStored
    }
    
    let reflectionArray = Array(reflections.values)
    
    return reflectionArray
  }

  func updateReflection(_ reflection: Reflection) throws {
    print(#function)
    
    let key = reflection.date.yyyyMMddString
    
    if reflections[key] == nil {
      throw DomainError.dataNotFound(key)
    }
    
    reflections[key] = reflection
  }

  func deleteReflection(date: Date) throws {
    print(#function)
    
    let key = date.yyyyMMddString
    
    if let reflection = reflections[key] {
      reflections.removeValue(forKey: key)
    } else {
      throw DomainError.dataNotFound(key)
    }
    
  }
}
