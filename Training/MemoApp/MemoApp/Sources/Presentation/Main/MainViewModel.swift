//
//  MainViewModel.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import Foundation
import Combine


final class MainViewModel {
  
  private var cancellables = Set<AnyCancellable>()
  
  // View 로부터 들어오는 Input
  enum Input {
    case onAppear
    case addButtonTapped
    case cellTapped(index: Int)
  }
  
  // View로 나가는 출력들
  private let output: PassthroughSubject<Output, Never> = .init()
  enum Output {
    case loadMemoDatas([Memo])
    case pushToDetailView
  }
  
  // UI에 직접적으로 연관이 되는 변수(상태를 저장하고 변경 사항을 자동으로 방출하는데 사용됨, 예를 들어, textField)
  @Published var viewType: ViewType = .table
  @Published var memos: [Memo] = []
  
  func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
    input.receive(on: DispatchQueue.main)
      .sink { [weak self] event in
        switch event {
        case .onAppear:
          print(#function, "OnAppear")
        case .addButtonTapped:
          print(#function, "addButtonTapped")
        case .cellTapped(let index):
          print(#function, "cellTapped")
        }
      }
      .store(in: &cancellables)
    
    return output.eraseToAnyPublisher()
  }
}
