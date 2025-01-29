//
//  Helper.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

// 날짜 유효성 검사
struct Helper {
  static func isValidDate(_ dateString: String) -> Bool {
    
    // String 유효성 검사
    let datePattern = #"^\d{4}-\d{2}-\d{2}$"#
    let regex = try! NSRegularExpression(pattern: datePattern)
    let range = NSRange(location: 0, length: dateString.utf16.count)
    guard regex.firstMatch(in: dateString, options: [], range: range) != nil
    else { return false }
    
    // 실제로 있는 날짜인지 검사
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let date = dateFormatter.date(from: dateString) else { return false }
    return dateFormatter.string(from: date) == dateString
  }
}
