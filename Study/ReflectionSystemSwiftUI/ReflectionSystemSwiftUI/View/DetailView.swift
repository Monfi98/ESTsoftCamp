//
//  DetailView.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct DetailView: View {
  @Environment(MainViewModel.self) var viewModel
  @Environment(\.dismiss) var dismiss
  @State private var isEnabled: Bool = false
  @State private var text: String
  private let reflection: Reflection
  
  init(reflection: Reflection) {
    self.reflection = reflection
    self.text = reflection.content
  }
  
  var body: some View {
    VStack {
      TextEditor(text: $text)
        .foregroundStyle(.gray)
        .padding()
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(
          RoundedRectangle(cornerRadius: 15)
            .stroke(Color.gray.opacity(0.5), lineWidth: 1.5)
        )
        .padding()
        
      
      Spacer()
      
      Button {
        viewModel.effect(
          .updateButtonTapped(reflection, content: text)
        )
        dismiss()
      } label: {
        ZStack {
          Text("저장하기")
            .frame(height: 70)
            .foregroundStyle(.white)
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? .blue : .gray)
      }.disabled(!isEnabled)
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle(reflection.date.formattedString)
    .onChange(of: text) { _, newValue in
      if newValue == reflection.content {
        isEnabled = false
      } else {
        isEnabled = true
      }
    }
  }
}

#Preview {
  DetailView(
    reflection: Reflection(
      date: .now,
      content: "Hello World"
    )
  )
  .environment(MainViewModel())
}
