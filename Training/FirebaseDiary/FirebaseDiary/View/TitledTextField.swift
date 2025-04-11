//
//  TitledTextField.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

struct TitledTextField: View {
  
  @Binding private var text: String
  private let title: String
  
  init(title: String, text: Binding<String>) {
    self.title = title
    self._text = text
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.system(size: 18, weight: .regular))
      TextField(title + "를 입력해주세요.", text: $text)
        .autocorrectionDisabled()
        .textFieldStyle(OutlinedTextFieldStyle())
    }
  }
}

// MARK: - 텍스트 필드 스타일
struct OutlinedTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(10)
      .overlay {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .stroke(Color(UIColor.systemGray4), lineWidth: 2)
      }
  }
}

#Preview {
  TitledTextField(
    title: "아이디",
    text: .constant("")
  )
}
