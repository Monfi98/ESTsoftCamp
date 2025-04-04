//
//  AppCoodinator.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

struct AppCoordinator<Content: View>: View {
  @State private var coordinator = Coordinator<Destination>()
  private let content: () -> Content
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  
  var body: some View {
    NavigationStack(path: $coordinator.paths) {
      content()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationDestination(for: Destination.self) { destination in
          coordinator.view(for: destination)
        }
    }
    .environment(coordinator)
  }
}
