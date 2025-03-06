## 실습 순서

### 1. 정수 사칙 연산위주로 뷰모델 변경

일단 편~~안한 학습을 위해 `정수 사칙 연산` 위주 코드로 뷰모델을 변경하였다.

- `CalcViewModel.swift`
    
    ```swift
    final class CalcViewModel: ObservableObject {
    
      @Published var previewText = ""
      @Published var resultNumberText = ""
      
      private var operators: Set<Character> = ["+", "-", "*", "/"]
      
      enum Action {
        case numberTapped(String)
        case operatorTapped(String)
        case deleteTapped
        case allClearTapped
        case equalTapped
      }
      
      func send(_ action: Action) {
        switch action {
        case .numberTapped(let numberText):
          handleNumber(numberText)
          
        case .operatorTapped(let operatorText):
          handleOperator(operatorText)
          
        case .deleteTapped:
          if !previewText.isEmpty { previewText.removeLast() }
          
        case .allClearTapped:
          resultNumberText = ""
          previewText = ""
          
        case .equalTapped:
          handleEqual()
        }
      }
    }
    
    extension CalcViewModel {
      
      private func handleNumber(_ numberText: String) {
        if numberText == "0" {
          
          if let lastText = previewText.last, !operators.contains(lastText) {
            previewText += numberText
          }
        } else {
          previewText += numberText
        }
      }
      
      private func handleOperator(_ operatorText: String) {
        if let lastText = previewText.last, !operators.contains(lastText) {
          previewText += operatorText
        }
      }
      
      private func handleEqual() {
        guard let lastText = previewText.last, !operators.contains(lastText)
        else { return }
        
        if let expression = NSExpression(format: previewText) as NSExpression?,
           let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
          resultNumberText = result.stringValue
        }
        
      }
    }
    ```
    

### 2. `@Published`부터 바꿔보자

```swift
import Foundation
import Combine

final class CalcViewModel: ObservableObject {

  let previewTextPublisher = CurrentValueSubject<String, Never>("")
  let resultNumberPublisher = PassthroughSubject<Int, Never>()
  
  // ... code
}
```

이때, Subject는 뭘까?

<img width="500" alt="Combine 공부 4" src="https://github.com/user-attachments/assets/19742381-6be7-45f4-bc7e-ff224c207c9b" />

잘보면 Subject도 프로토콜이며 Publisher 프로토콜을 채택하고 있고, Summary에는 *“stream에 send(_:) 메서드를 호출해서 값을 주입할 수 있는 Publisher이다.”*라고 써져 있다.


> Subject는 스트림을 만들 수도 있고, 값을 방출할수도 있고, (publisher 프로토콜을 채택하니깐) send() 메서드를 통해 값을 주입할 수도 있구나!

(Combine을 사용하지 않던 코드에 Combine 모델을 적용하고 싶을 때 사용하면 좋다고함-참고1번)

Subject를 채택한 객체는 두 가지 종류가 있다.

1. **PassthroughSubject**
    
    이름에서 알 수 있다 시피 값을 스쳐보내는 쿨한 녀석 이라고 생각하면된다. 정의도 살펴보면 딱히 초기값도 필요 없으며 최신 값을 저장하기 위한 공간도 없다고 되어있다.
    
2. **CurrentValueSubject**
    
    Passthroughsubject와 다르게 가장 최근에 published된 값의 버퍼를 유지한다고 한다. 
    

내 코드에서

`resultNumberText`는 이전값 필요없기 때문에 Passthroughsubject를 `previewText`는 이전 값이 operator가 마지막에 있는지, empty인지 확인하기 위해서 필요하기 때문에 CurrentValueSubject를 썼다.

### 3. 뷰모델 내부함수

```swift
extension CalcViewModel {
  
  private func handleNumber(_ numberText: String) {
    if numberText == "0" {
      if let lastText = previewTextPublisher.value.last, !operators.contains(lastText) {
        previewTextPublisher.value += numberText
      }
    } else {
      previewTextPublisher.value += numberText
    }
  }
  
  private func handleOperator(_ operatorText: String) {
    if let lastText = previewTextPublisher.value.last, !operators.contains(lastText) {
      previewTextPublisher.value += operatorText
    }
  }
  
  private func handleEqual() {
    guard let lastText = previewTextPublisher.value.last, !operators.contains(lastText) else { return }
    
    if let expression = NSExpression(format: previewTextPublisher.value) as NSExpression?,
       let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
      resultNumberPublisher.send(result.intValue)
    }
  }
}
```

- `resultNumberPublisher.send(result.stringValue)`
    
    요거는 위에서 설명했던 `send` 메서드
    
- `previewTextPublisher.value += operatorText`
    
    CurrentValueSubject인 previewTextPublisher는 value를 바꿔주면 알아서 값이 방출된다고 한다.
    

### 4. 뷰에서 구독을 해보자

```swift
import SwiftUI
import Combine

struct ContentView: View {
  
  @StateObject private var viewModel = CalcViewModel()

  @State private var resultNumberText = "0"
  @State private var previewText = ""
  
  @State private var cancellableBag = Set<AnyCancellable>()
  
  // code ..
  
  .onAppear {
	  // 뷰가 나타날때 State변수와 바인딩
    viewModel.resultNumberPublisher
		    .map { String($0) }
	      .sink { resultNumberText = $0 }
	      .store(in: &cancellableBag)
	      
    viewModel.previewTextPublisher
        .assign(to: \.previewText, on: self)
        .store(in: &cancellableBag)
  }
}
```

- `.map { String($0) }` → Int로 들어오는 값을 String으로 변환해주는 Operator
- `.sink { previewText = $0 }` → Publisher가 방출한 값을 구독, 값을 방출하면 넣어주는 역할
- `.assign(to: \.previewText, on: self)` → 위 `.sink`와 다르게 값을 바로 할당할 수 있다
- `.store(in: &cancellableBag)` → 뷰가 사라질때 자동으로 구독을 해제

## 참고

- https://icksw.tistory.com/274
- https://dongdida.tistory.com/174?category=1157927
