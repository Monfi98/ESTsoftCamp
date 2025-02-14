//
//  UserDefaultManager.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import Foundation

final class UserDefaultManager {
  
  static let shared = UserDefaultManager()
  
  private init() { }
  
  private enum Keys {
    static let reflectionKey = "reflections"
  }
  
  private let userDefaults = UserDefaults.standard
  
  func saveReflections(_ reflections: [Reflection]) {
    if let encodedData = try? JSONEncoder().encode(reflections) {
      userDefaults.set(encodedData, forKey: Keys.reflectionKey)
    }
  }
  
  func readReflections() -> [Reflection] {
    if let savedData = userDefaults.data(forKey: Keys.reflectionKey),
       let loadedReflections = try? JSONDecoder().decode([Reflection].self, from: savedData) {
      return loadedReflections
    }
    return []
  }
}
