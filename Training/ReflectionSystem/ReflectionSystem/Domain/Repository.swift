//
//  Repository.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

protocol Repository {
  /// 새로운 회고를 추가합니다.
  /// - Parameter reflection
  func createReflection(reflection: Reflection)
  
  /// 모든 회고들을 불러옵니다.
  /// - Returns [Reflection]
  func readAllReflections() -> [Reflection]
  
  /// 기존 회고를 업데이트 합니다.
  /// - Parameter reflection
  func updateReflection(reflection: Reflection)
  
  /// 기존 회고를 삭제합니다.
  func deleteReflection(reflection: Reflection)
}
