//
//  MainViewModel.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import Foundation

@Observable
final class MainViewModel {
  struct State {
    var reflections: [Reflection] = []
    var notificationPermission = false
  }
  
  enum Action {
    case updateButtonTapped(Reflection, content: String)
    case addButtonTapped(content: String)
    case changeNotificationStatus(status: Bool)
  }
  
  private(set) var state: State = .init()
  private let reflectionManager: UserDefaultManager
  private let notificationManager: NotificationManager
  
  init() {
    self.reflectionManager = UserDefaultManager.shared
    self.notificationManager = NotificationManager.shared
    loadReflections()
  }
  
  func effect(_ action: Action) {
    switch action {
    case .updateButtonTapped(let reflection, let content):
      if let index = self.state.reflections.firstIndex(
        where: { $0.id == reflection.id }
      ) {
        self.state.reflections[index].content = content
      }
      reflectionManager.saveReflections(self.state.reflections)
      
    case .addButtonTapped(let content):
      let newReflection = Reflection(
        date: .now,
        content: content
      )
      self.state.reflections.append(newReflection)
      reflectionManager.saveReflections(self.state.reflections)
      
    case .changeNotificationStatus(let status):
      if status {
        notificationManager.checkPermission { result in
          switch result {
          case true:
            self.notificationManager.setLocalNotification()
          case false:
            self.notificationManager.requestPermission()
          }
        }
      } else {
        notificationManager.deleteLocalNotification()
      }
    }
  }
}

extension MainViewModel {
  private func loadReflections() {
    let loadedReflections = reflectionManager.readReflections()
    self.state.reflections = loadedReflections
  }
}
