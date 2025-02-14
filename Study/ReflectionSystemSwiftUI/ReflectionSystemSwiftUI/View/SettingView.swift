//
//  SettingView.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct SettingView: View {
  
  @Environment(MainViewModel.self) var viewModel
  @State private var isToggleOn: Bool = false
  
  var body: some View {
    List {
      Toggle(isOn: $isToggleOn) {
        Text("알림 설정")
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("설정")
    .onChange(of: isToggleOn) { _, newValue in
      viewModel.effect(.changeNotificationStatus(status: newValue))
    }
  }
}

#Preview {
  SettingView()
    .environment(MainViewModel())
}
