//
//  InMemoryRepositoryImpl.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

final class InMemoryRepositoryImpl: Repository {
  
  private var reflections: [Date: Reflection] = [:]

  func createReflection(_ reflection: Reflection) throws {
//    print("Impl: \(#function)")
    
    let key = reflection.date
    
    if reflections[key] != nil {
      throw DomainError.dataAlreadyExists(key.yyyyMMddString)
    }
    
    reflections[key] = reflection
  }

  func getReflectionByDate(_ date: Date) throws -> Reflection {
//    print("Impl: \(#function)")
    
    let key = date
    
    if let reflection = reflections[key] {
      return reflection
    } else {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
  }
  
  func getAllReflections() throws -> [Reflection] {
//    print("Impl: \(#function)")
    
    if reflections.isEmpty {
      throw DomainError.noDataStored
    }
    
    let reflectionArray = Array(reflections.values)
    
    return reflectionArray
  }

  func updateReflection(_ reflection: Reflection) throws {
//    print("Impl: \(#function)")
    
    let key = reflection.date
    
    if reflections[key] == nil {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
    
    reflections[key] = reflection
  }

  func deleteReflectionByDate(_ date: Date) throws {
//    print("Impl: \(#function)")
    
    let key = date
    
    if reflections[key] != nil {
      reflections.removeValue(forKey: key)
    } else {
      throw DomainError.dataNotFound(key.yyyyMMddString)
    }
  }
}
