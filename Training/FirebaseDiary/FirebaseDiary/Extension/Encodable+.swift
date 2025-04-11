//
//  Encodable+.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/4/25.
//

import Foundation

extension Encodable {
  func toDict() -> [String: Any] {
    
    do {
      let object = try JSONEncoder().encode(self)
      guard let dict = try JSONSerialization.jsonObject(with: object) as? [String: Any]
      else { return [:] }
      
      return dict
    } catch {
      print("Dictionary 변환 에러")
      return [:]
    }
    
  }
}
