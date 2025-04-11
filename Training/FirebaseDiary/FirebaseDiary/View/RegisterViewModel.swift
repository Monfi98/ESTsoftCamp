//
//  RegisterViewModel.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/4/25.
//

import Foundation
import Combine

final class RegisterViewModel: ObservableObject {
  
  @Published var idStatus: VerifyType = .none
  @Published var isLoading = false
  
  let firestoreService = FirestoreService.shared
  
  init() {
    bind()
  }
  
  // MARK: - Action
  enum Action {
    case idEditingEnd(id: String)
    case registerButtonTapped
  }
  
  func send(_ action: Action) {
    switch action {
    case .idEditingEnd(let id):
      self.verifyId(id: id)
    case .registerButtonTapped:
      self.registerUserInfo()
    }
  }
  
  func bind() {
    // 컴파인 쓰고 십다,,
  }
}

extension RegisterViewModel {
  private func registerUserInfo() {
    Task {
      await MainActor.run { isLoading = true }
      try? await Task.sleep(nanoseconds: 4 * 1_000_000_000)
      await MainActor.run { isLoading = false }
    }
  }
  
  private func verifyId(id: String) {
    Task {
      await MainActor.run { idStatus = .loading }
      let status = await firestoreService.checkUserId(id: id)
      await MainActor.run {
        if status { idStatus = .approve }
        else { idStatus = .warning }
      }
    }
  }
}
