//
//  ContentView.swift
//  Day011
//
//  Created by 신승재 on 2/12/25.
//

import SwiftUI

@Observable
class CntClass {
  var name: String = ""
  var count: Int
  
  init(count: Int = 0){
    self.count = count
  }
}

struct ContentView: View {
  @State var cntObj: CntClass = CntClass()
  
  var body: some View {
    VStack {
      SubView(name: $cntObj.name)
      Text("Count: \(cntObj.count)")
      Button("증가하기") {
        print("증가하기 버튼 탭!")
        cntObj.count += 1
      }
      .padding()
    }
    
  }
}

struct SubView: View {
  @Binding var name: String
  
  var body: some View {
    TextField("hello", text: $name)
  }
}

#Preview {
  ContentView()
}
