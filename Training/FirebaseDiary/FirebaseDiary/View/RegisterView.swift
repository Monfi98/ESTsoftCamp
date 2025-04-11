//
//  RegisterView.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

struct RegisterView: View {
  
  @Environment(Coordinator<Destination>.self) private var coordinator: Coordinator<Destination>
  
  @StateObject var viewModel = RegisterViewModel()
  
  @State private var idText: String = ""
  @State private var idStatus: VerifyType = .none
  @State private var passwordText: String = ""
  @State private var repasswordText: String = ""
  
  @FocusState private var focusedField: Field?
  
  var body: some View {
    VStack {
      
      TitledTextField(title: "아이디", text: $idText)
        .focused($focusedField, equals: .idField)
        .onSubmit { focusedField = .passwordField }
        .padding(.top, 30)
      
      warningText(
        text: "사용할 수 없는 아이디입니다.",
        type: viewModel.idStatus
      )
      
      TitledTextField(title: "비밀번호", text: $passwordText)
        .focused($focusedField, equals: .passwordField)
        .onSubmit { focusedField = .repasswordField }
        .padding(.top, 15)
      
      TitledTextField(title: "비밀번호 재입력", text: $repasswordText)
        .focused($focusedField, equals: .repasswordField)
        .padding(.top, 30)
      
      Button {
        viewModel.send(.registerButtonTapped)
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .frame(width: 162, height: 45)
          if viewModel.isLoading {
            ProgressView()
          } else {
            Text("가입하기")
              .foregroundStyle(.white)
              .font(.system(size: 18))
          }
        }
      }.padding(.top, 40)
      
      Spacer()
      
    }
    .padding(.horizontal, 24)
    .toolbarTitleDisplayMode(.inline)
    .navigationTitle("회원가입")
    .onChange(of: focusedField) { prevField, curField in
      if prevField == .idField {
        viewModel.send(.idEditingEnd(id: idText))
      }
    }
  }
  
  @ViewBuilder
  private func warningText(text: String, type: VerifyType) -> some View {
    HStack {
      switch type {
      case .warning:
        Text("❌ \(text)")
          .foregroundStyle(.red)
      case .loading:
        ProgressView().scaleEffect(0.8)
        Text("확인중 ...")
          .foregroundStyle(.gray)
      case .approve:
        Text("✅ 사용가능 합니다!")
          .foregroundStyle(.green)
      case .none:
        Text(" ")
      }
    }
    .padding(.leading, 10)
    .font(.system(size: 12))
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

enum Field: Hashable {
  case idField
  case passwordField
  case repasswordField
}

enum VerifyType {
  case warning
  case loading
  case approve
  case none
}

#Preview {
  RegisterView()
    .environment(Coordinator<Destination>())
}
