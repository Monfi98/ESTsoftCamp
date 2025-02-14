//
//  Reflection.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import Foundation

struct Reflection: Identifiable, Codable {
  var id: UUID = UUID()
  let date: Date
  var content: String
}
