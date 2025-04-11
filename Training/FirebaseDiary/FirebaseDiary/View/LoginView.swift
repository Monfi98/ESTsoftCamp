//
//  LoginView.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

struct LoginView: View {
  
  @Environment(Coordinator<Destination>.self) private var coordinator: Coordinator<Destination>
  
  @State var idText: String = ""
  @State var passwordText: String = ""
  
  var body: some View {
    NavigationStack {
      
      VStack {
        TitledTextField(title: "아이디", text: $idText)
          .padding(.top, 60)
        
        TitledTextField(title: "비밀번호", text: $passwordText)
          .padding(.top, 40)
        
        Button {
          coordinator.push(.registerView)
        } label: {
          Text("회원 가입하기")
            .underline()
        }.padding(.top, 90)
        
        Button {
          print("로그인 버튼")
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .frame(width: 162, height: 45)
            Text("로그인")
              .foregroundStyle(.white)
              .font(.system(size: 18))
          }
        }.padding(.top, 10)
        
      }
      .padding(.horizontal, 24)
      .navigationTitle("로그인")
      
      Spacer()
    }
  }
}

#Preview {
  LoginView()
    .environment(Coordinator<Destination>())
}
