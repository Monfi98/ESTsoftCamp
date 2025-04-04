//
//  Coordinator.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI
import Combine

enum Destination: Hashable {
  case loginView
  case registerView
}

@Observable
final class Coordinator<T: Hashable> {
  var paths: [T] = []
  
  @ViewBuilder
  func view(for destination: Destination) -> some View {
    switch destination {
    case .loginView:
      LoginView()
    case .registerView:
      RegisterView()
    }
  }
  
  func push(_ path: T) {
    paths.append(path)
  }
  
  func pop() {
    paths.removeLast()
  }
  
  func pop(to: T) {
    guard let found = paths.firstIndex(where: { $0 == to }) else { return }
    
    let numToPop = (found..<paths.endIndex).count - 1
    paths.removeLast(numToPop)
  }
  
  func popToRoot() {
    paths.removeAll()
  }
}




