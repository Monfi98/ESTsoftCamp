//
//  FirestoreService.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/4/25.
//

import FirebaseCore
import FirebaseFirestore

final class FirestoreService {
  
  static let shared = FirestoreService()
  
  private init() {}
  
  let db = Firestore.firestore()
  
  func createUserInfo(_ userInfo: User) async {
    print(#function)
    
    do {
      try await db.collection("user")
        .document(userInfo.id)
        .setData(userInfo.toDict())
    } catch {
      print("user 저장 실패 \(error)")
    }
  }
  
  
  func checkUserId(id: String) async -> Bool {
    print(#function)
    
    do {
      let document = try await db.collection("users")
        .document(id)
        .getDocument()
      return !document.exists
    } catch {
      print("유저 아이디 체크 실패 \(error)")
      return false
    }
  }
  
}
