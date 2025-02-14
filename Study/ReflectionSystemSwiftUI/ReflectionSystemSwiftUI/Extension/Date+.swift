//
//  Date+.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import Foundation

extension Date {
  var formattedString: String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy년 MM월 dd일 (E)"
    return formatter.string(from: self)
  }
}
