## 📝 오늘 배운 내용 요약

### 0. Swift 주요 특징

- 타입 안정성 → 프로그램이 실행되는 동안 데이터가 항상 명시적으로 선언된 타입을 유지하도록 하는 속성
- 성능 → C++에 가까운 빠른 실행속도
- 모던한 문법
- 다중 패러다임 지원 → 객체 지향, 함수형, 프로토콜 지향형 프로그래밍 등
- 메모리 관리 → ***ARC**를 통한 자동 메모리관리
    - **ARC(Automatic Reference Counting)란?**
        
        힙에 할당된 인스턴스의 메모리를 알아서 관리해주는 녀석
        
        [ARC(Auto Reference Counting)](../Archive/ARC(Auto%20Reference%20Counting).md)
        

### 1. 변수와 상수

- 변수: `var` 키워드를 사용하여 선언, 값 변경 가능
- 상수: `let` 키워드를 사용하여 선언, 선언 후 값을 변경할 수 없음

```swift
var number = 1
number = number + 1 // 값 변경 가능

let pi = 3.14 // 값 변경 불가
```

### 2. 옵셔널(Optional)

값이 있을 수도 있고 없을 수도 있는 변수의 데이터 타입

- 옵셔널 바인딩: 안전하게 옵셔널을 언랩핑하는 것
- 강제 언래핑: 강제로 ***옵셔널** 껍데기를 벗기는것
    - **옵셔널도 열거형이다..!**
        
        옵셔널 타입을 안에 까보면 아래처럼 작성되어있음 !
        
        ```swift
        enum Optional<Wrapped> {
          case none // nil
          case some(Wrapped) // optional value
        }
        ```
        
        사실 머,, 그래서 옵셔널 안에 값을 사용할 때
        
        ```swift
        if case .some(let value) = name {
            print(value)
        }
        ```
        
        이렇게 사용할 수 있지만 항상 이와 같은 방법으로 옵셔널 타입을 사용하는 건 불편하기 때문에 `!`, `?`와 같은 약속을 만들어 사용한다.
        (내부적으론 `enum type`으로 작성된 `optional`코드가 실행됨)
        

```swift
// Optional(String)
var name: String? = "신승재"

// 옵셔널 바인딩
if let name = name {
	print(name)
}

// 강제 언래핑
print(name!)
```

### 3. 조건문

- `if` 조건문: 특정 조건이 참인 경우 실행됨, 조건이 거짓이면 `else` 블록이 실행됨

```swift
if 조건 {
	// 조건이 참일 때
} else {
	// 조건이 거짓일 때
}
```

- `switch` 문: 주어진 값을 여러 조건과 비교하여 해당하는 코드 블록을 실행함

```swift
let choice = 2

switch choice {
case 1:
    print("Option 1 선택")
case 2:
    print("Option 2 선택")
default:
    print("잘못된 선택")
}
```

### 4. 반복문

특정 작업을 반복적으로 실행하기 위해 사용하는 제어문, Swift에서 지원하는 반복문의 종류는 아래와 같다.

- `for in` 반복문: 범위, 배열, 딕셔너리 등에서 사용
- `while` 반복문: 조건이 참인 동안 실행
- `repeat-while` 반복문: 블록을 최소 한 번 실행 한 후 조건 확인

```swift
let numbers = [1, 2, 3, 4, 5]

// for in
for num in numbers {
	print(num)
}

// while
var count = 0
while count < 10 {
    if count == 5 {
        break // break를 만나면 바로 종료
    }
    print(count)
    count += 1
}

// repeat-while
var count = 6
repeat {
	print(count)
	count += 1
} while count <= 5
```

### 5. 메모리와 ARC(Auto Reference Counting)

- [메모리 구조(코데힙스)](https://www.notion.so/165bb0ddfcbe438bafce624b09d3b84c?pvs=21)
- [ARC(Auto Reference Counting)](https://www.notion.so/ARC-Auto-Reference-Counting-e5a49c3016b841798f44721bee93aba2?pvs=21)

## 💭 오늘의 회고

1. **배운 점**
    - Swift 기초 문법(복습)
    - 메모리 구조와 ARC(인스턴스 관점)
2. **어려운 점/개선할 점**
    - Swift 기초 문법은 전에 했던 부분이라..
    이 시간을 어떻게 하면 값진 시간으로 만들 수 있을지 고민
3. **액션 플랜**
    - 기초 문법을 진행하면서 연관되는 CS부분 정리하면서 듣자..!
    - 의문이 생기면(애매하게 아는 것도 포함!) 넘기지말고 바로바로 찾아보고 정리할 것
    - 하나라도 그냥 넘어가지 않는 습관들이기
4. **함께 나누고 싶은 점**
    - 메모리 구조와 ARC 정리 자료

## 📚 참고자료

- https://bbiguduk.gitbook.io/swift/language-guide-1/automatic-reference-counting
- https://terrypotter.tistory.com/32

## 🔍 내일 학습 예정

- 클로저와 ARC
- 포트폴리오 정리