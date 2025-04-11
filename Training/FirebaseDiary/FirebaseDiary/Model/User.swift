//
//  User.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/4/25.
//

import Foundation

struct User: Encodable {
  let id: String
  let password: String
  var diaryId: String = ""
}
