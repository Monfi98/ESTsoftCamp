//
//  MainView.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//

import SwiftUI

struct MainView: View {
  @Environment(MainViewModel.self) var viewModel
  
  var body: some View {
    NavigationStack {
      List(viewModel.state.reflections) { reflection in
        NavigationLink {
          DetailView(reflection: reflection)
        } label: {
          VStack(alignment: .leading) {
            Text(reflection.date.formattedString)
              .font(.subheadline)
              .foregroundStyle(.gray)
            Text(reflection.content)
              .fontWeight(.light)
          }
        }
      }
      .navigationTitle("회고 목록")
      .toolbar {
        NavigationLink {
          AddView()
        } label: {
          Image(systemName: "plus")
            .foregroundStyle(.blue)
        }
        
        NavigationLink {
          SettingView()
        } label: {
          Image(systemName: "gearshape")
            .foregroundStyle(.blue)
        }
      }
    }
    
  }
}

#Preview {
  MainView()
    .environment(MainViewModel())
}
