//
//  Diary.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/4/25.
//

import Foundation

struct Diary: Encodable {
  var id: String = UUID().uuidString
  var lastUpdated: Date
  var imageURL: String
  var content: String
}
