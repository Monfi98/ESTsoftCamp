## 📝 오늘 배운 내용 요약

### 1. Git 설치 및 GitHub Repsitory 생성

- (이미 쓰고 있으므로,, 생략)

### 2. 이스트 소프트 부트캠프용 레포

[GitHub - Monfi98/ESTsoftCamp: 📚 이스트소프트 프론티어 iOS 부트캠프에서 매일매일 배운 내용을 기록하는 "Today I Learned" (TIL) 저장소입니다.](https://github.com/Monfi98/ESTsoftCamp)

### 3. 참고 사이트

- https://developer.apple.com/

### 4. 제어문 연습: 피보나치 수열 출력하기(1)

```swift
let MAX = 21
var cur = 1

var next = 1
var prev = 0
var total = 0

while cur <= MAX {
  
  total += cur
  
  prev = cur
  cur = next
  next = prev + cur
}

print(total)
```

### 5. 제어문 연습: 피보나치 수열 출력하기(2)

```swift
let MAX = 21
var cur = 1

var next = 1
var prev = 0
var total = 0

var flag = false

while cur <= MAX {
  
  if flag || prev == 0 {
    total += cur
  } else {
    total -= cur
  }
  
  flag.toggle()
  
  prev = cur
  cur = next
  next = prev + cur
  
}

print(total)
```

## 💭 오늘의 회고

1. **배운 점**
    - 네트워크 공부
    - SSC25 신청 및 준비, 아이디에이션
2. **어려운 점/개선할 점**
    - 또, Git & GitHub를 강의하실 때, 내가 알고 있는 내용이라 뭘해야할 지 생각해보았다.
3. **액션 플랜**
    - 아이디어가 떠오르면 그때 그때 적기
    - 뭔가 나만의 구멍 뚫린 부분을 보완할 수 있는 시트가 있어야 할 것같다.
    - 전체적으로 내가 뭘모르는지 모르는 느낌이 든다.
4. **함께 나누고 싶은 점**
    - 내가 레포를 어떻게 관리하고 있는지, 최상단에 레포 링크

## 📚 참고자료

- https://didu-story.tistory.com/258
- https://developer.apple.com/swift-student-challenge/eligibility/

## 🔍 내일 학습 예정

- SSC25 아이디어 구체화