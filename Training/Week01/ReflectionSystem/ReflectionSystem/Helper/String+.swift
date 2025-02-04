//
//  String+.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/30/25.
//

import Foundation

extension String {
    var toDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX") // 일관된 형식 유지
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC 기준
        
        return formatter.date(from: self)
    }
}
