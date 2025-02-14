//
//  ReflectionSystemSwiftUIApp.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

@main
struct ReflectionSystemSwiftUIApp: App {
  @State private var mainViewModel = MainViewModel()
  var body: some Scene {
    WindowGroup {
      MainView()
        .environment(mainViewModel)
    }
  }
}
