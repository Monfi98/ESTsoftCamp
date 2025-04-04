//
//  FirebaseDiaryApp.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

@main
struct FirebaseDiaryApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      AppCoordinator{
        LoginView()
      }
    }
  }
}
