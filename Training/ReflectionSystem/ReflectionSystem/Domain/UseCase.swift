//
//  UseCase.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

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
