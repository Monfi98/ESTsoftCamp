//
//  MainViewModel.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import Foundation
import Combine

final class MainViewModel {
  // View 로부터 들어오는 Input
  enum Input {
    case onAppear
    case addButtonTapped
    case cellTapped(index: Int)
  }
  
  // View로 나가는 출력들
  enum Output {
    case loadMemoDatas([Memo])
    case pushToDetailView
  }
  
  // 구독한 이벤트를 모아놓는 변수
  private var cancellables = Set<AnyCancellable>()
}
