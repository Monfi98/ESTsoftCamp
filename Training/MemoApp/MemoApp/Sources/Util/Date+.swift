//
//  Date+.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import Foundation

extension Date {
  var formattedDate: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 M월 d일 HH시 mm분"
    return formatter.string(from: self)
  }
}
