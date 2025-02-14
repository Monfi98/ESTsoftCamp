//
//  AddView.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct AddView: View {
  @Environment(MainViewModel.self) var viewModel
  @Environment(\.dismiss) var dismiss
  @State private var text: String = ""
  
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
        viewModel.effect(.addButtonTapped(content: text))
        dismiss()
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 15)
            .background(.blue)
          Text("저장하기")
            .frame(height: 20)
            .foregroundStyle(.white)
        }.frame(height: 80)
      }
      
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("회고 추가하기")
  }
}

#Preview {
  AddView().environment(MainViewModel())
}
