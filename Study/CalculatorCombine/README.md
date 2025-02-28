# CalculatorCombine

### 스크린샷
<img src="https://github.com/user-attachments/assets/6751515e-0d4f-4ceb-8259-08d612d88f04"  width="300"/>

### 기능

- [x] 숫자 입력 (0-9)
- [x] 사칙연산 (+, -, ×, ÷)
- [x] = 버튼을 눌러 수식 계산 (소수점 두 자리까지 표시)
- [x] 연산자가 연속으로 입력되지 않도록 제한
- [x] AC (All Clear) 버튼으로 전체 초기화
- [x] C (Delete) 버튼으로 최근 입력 삭제
- [x] 정수 연산뿐만 아니라 실수 연산 지원
- [ ] % (퍼센트) 기능
- [ ] -/+ (부호 전환) 기능
- [ ] . (소수점 입력) 기능

---

- [ ] 버튼 애니메이션
- [ ] 저장 기능

### 예외 사항

- [x] 연산자가 연속으로 입력되지 않도록 제한
- [x] 계산식이 비어있을 때 = 버튼을 눌러도 크래시 방지
- [x] 0이 맨 앞에 올 수 없도록 처리
- [x] 소수점 연산 가능하도록 Double 변환 적용
- [x] 연산자 맨 앞 입력 방지
- [ ] 연산자가 마지막에 올 경우 = 눌렀을 때 예외 처리 필요
- [ ] .(소수점) 입력 시 연속 입력 방지 필요
- [ ] 5 / 0 같은 나눗셈 예외 처리 필요
- [ ] 현재 수식에서 연산자 교체 기능 필요
- [ ] 부호 전환(-/+)이 숫자에만 적용되도록 처리 필요


### 코드 설명
```swift
  /// 숫자 입력을 처리하는 함수
  private func handleNumberInput(_ number: String) {
    if state.expressionText == "0" {
      state.expressionText = number // 0이 맨 앞에 오지 않도록
    } else {
      state.expressionText += number // 숫자 추가
    }
    recentInput = number
  }

  /// 연산자 입력을 처리하는 함수 (연산자가 연속으로 입력되지 않도록 방지)
  private func handleOperationInput(_ type: OperationType) {
    if recentInput.isEmpty || isOperator(recentInput) {
      return // 이전 입력이 비어있거나 연산자이면 추가하지 않기
    }
    
    state.expressionText += type.rawValue // 연산자 추가
    recentInput = type.rawValue
  }

  /// 입력된 수식을 계산하는 함수
  private func calculateExpression() {
    if state.expressionText.isEmpty || isOperator(recentInput) {
      return // 빈 수식이거나 연산자로 끝나면 계산하지 않음
    }
    
    let modifiedExpression = state.expressionText
      .replacingOccurrences(of: "(?<=\\d)(?=\\D)", with: ".0", options: .regularExpression) // TODO: 정수 연산을 실수로 변환인데 코드 좀더 봐야함..

    let expression = NSExpression(format: modifiedExpression)

    if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
      state.resultNumber = String(format: "%.2f", result.doubleValue)
    } else {
      state.resultNumber = "0" // 계산 오류 시 0으로 설정
    }
  }

  /// 입력된 문자열이 연산자인지 확인하는 함수
  private func isOperator(_ text: String) -> Bool {
    return ["+", "-", "*", "/"].contains(text)
  }
```