## 📝 오늘 배운 내용 요약

### 1. 반복문, 조건문 실습

- 업, 다운 게임

```swift
let randomInt = Int.random(in: (1...100))
var count = 0

while count < 6 {
  print("\(count + 1)회차 시도 난수?:", terminator: " ")
  let input = Int(readLine() ?? "")
  
  if let input = input {
 
    if input == randomInt {
      print("맞췄습니다!")
      break
    }
    
    if input > randomInt {
      print("Down")
    } else if input < randomInt {
      print("Up")
    }

    count += 1
  } else { print("제대로 숫자를 입력해주세요 !") }
}
```

### 2. guard, if의 차이

- `if`는 특정 조건을 만족시켰을때, `guard`는 조기 탈출을 시켜야할 때 사용하면 좋음
- 조기 탈출 시에 `guard`를 쓰면 다음의 장점이 있음
    - 코드의 가독성 향상
    - 중첩 방지
    - 코드 흐름의 일관성을 유지할 수 있다.(위에서 아래로)
- 예시

```swift
func validateUser(name: String?, age: Int?, email: String?) {
    if let name = name {
        if let age = age {
            if let email = email {
                print("사용자 정보 - 이름: \(name), 나이: \(age), 이메일: \(email)")
            } else {
                print("이메일이 입력되지 않았습니다.")
            }
        } else {
            print("나이를 입력해야 합니다.")
        }
    } else {
        print("이름이 없습니다.")
    }
}
```

위 코드의 로직을 `guard`를 사용한다면, 다음과 같이 만들 수 있음

```swift
func validateUser(name: String?, age: Int?, email: String?) {
    guard let name = name else {
        print("이름이 없습니다.")
        return
    }
    
    guard let age = age else {
        print("나이를 입력해야 합니다.")
        return
    }
    
    guard let email = email else {
        print("이메일이 입력되지 않았습니다.")
        return
    }
    
    print("사용자 정보 - 이름: \(name), 나이: \(age), 이메일: \(email)")
}
```

### 3. 배열과 딕셔너리

1. **배열이란?**
    - 동일한 데이터 타입의 값을 순서대로 저장하는 컬렉션
    - 인덱스(index)로 접근이 가능함
    
    ```swift
    let fruits = ["Apple", "Banana", "Cherry"]
    
    fruits.append("Mango")     // 추가
    fruits.remove(at: "Apple") // 삭제
    frutis.contains("Banana")  // 특정 요소가 있는지 탐색
    ```
    

1. **딕셔너리란?**
    - 키와 값의 쌍으로 데이터를 저장하는 컬렉션
    - 키는 고유해야하며, 각 키는 하나의 값과 연결됨
    
    ```swift
    let person = ["name": "John", "age": "25"]
    
    person["weight"] = "23kg" // 추가
    person["name"] = "shin"   // 수정
    person.removeValue(forKey: "age") // 삭제
    ```
    

## 💭 오늘의 회고

1. **배운 점**
    - 실습 및 옵셔널 바인딩
    - 옵셔널 바인딩 하다보니 갑자기 궁금해진 `if` vs `guard`
2. **어려운 점/개선할 점**
    - 실습을 할때는 어떻게 해야 값진 시간으로 만들 수 있을까,, 고민
3. **액션 플랜**
    - 실습을 할때, `Optional`처리를 안전하게 할 수 있도록 신경써보자!
4. **함께 나누고 싶은 점**
    - `guard` vs `if`

## 📚 참고자료

- [05. Swift 언어 소개 및 기초 문법](https://www.notion.so/05-Swift-170e622122f18092983af1e985dc16c0?pvs=21)
- https://velog.io/@minni/if-VS-guard

## 🔍 내일 학습 예정

- 과제 하기