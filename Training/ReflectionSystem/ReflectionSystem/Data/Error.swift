//
//  Error.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/30/25.
//

import Foundation
enum DomainError: Error {
  
  case dataAlreadyExists(String)  // 중복된 데이터
  case dataNotFound(String)       // 특정 데이터를 찾을 수 없음
  case noDataStored       // 저장된 데이터가 없음
}
