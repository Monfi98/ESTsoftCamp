//
//  RegisterView.swift
//  FirebaseDiary
//
//  Created by 신승재 on 4/3/25.
//

import SwiftUI

struct RegisterView: View {
  
  @Environment(Coordinator<Destination>.self) private var coordinator: Coordinator<Destination>
  
  @State private var idText: String = ""
  @State private var passwordText: String = ""
  @State private var repasswordText: String = ""
  
    var body: some View {
      VStack {
        
        TitledTextField(title: "아이디", text: $idText)
          .padding(.top, 30)
        
        TitledTextField(title: "비밀번호", text: $passwordText)
          .padding(.top, 30)
        
        TitledTextField(title: "비밀번호 재입력", text: $repasswordText)
          .padding(.top, 30)
        
        Button {
          print("가입하기 버튼")
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .frame(width: 162, height: 45)
            Text("가입하기")
              .foregroundStyle(.white)
              .font(.system(size: 18))
          }
        }.padding(.top, 40)
        
        Spacer()
        
      }
      .padding(.horizontal, 24)
      .toolbarTitleDisplayMode(.inline)
      .navigationTitle("회원가입") 
    }
}

#Preview {
    RegisterView()
}
