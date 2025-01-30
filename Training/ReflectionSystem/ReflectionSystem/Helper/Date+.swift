//
//  Date+.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/30/25.
//

import Foundation

extension Date {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var yyyyMMddString: String {
        return Date.dateFormatter.string(from: self)
    }
}
