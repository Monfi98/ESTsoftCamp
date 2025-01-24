## ARC란?

<aside>

> 힙에 할당된 인스턴스의 메모리를 알아서 관리해주는 녀석

</aside>

### 1. 참조(Reference) 타입과 Heap

Swift에서는 인스턴스, 클로저 등등 참조 타입(Reference Type)은 자동으로 힙에 할당 한다.

```swift
class Human {
	var name: String?
	var age: Int?
	
	init(name: String?, age: Int?) {
		self.name = name
		self.age = age
	}
}

let shin = Human(name: "신승재", age: 28)
// 힙 영역에 shin 인스턴스가 저장되고
// 스택 영역에서는 주소값을 가진 지역변수 shin이 할당됨

let copyShin = shin
// 지역 변수 copyShin은 shin과 동일한 주소값을 가지고
// 힙 영역에 있는 shin 인스턴스를 "참조"함
```

따라서, `shin`과 `copyShin`이 스택에서 해제되면 `shin` 인스턴스를 ARC가 해제한다.

### 2. ARC, 그래서 메모리 관리 어떻게?

ARC는 이름 내용 그대로 참조(Refence)를 Count해서 참조 횟수가 0이 되면 메모리에서 해제 시킨다. 따라서, 모든 인스턴스는 자신의 RC값을 가지고 있다.

## Strong, Weak, unowned, 순환참조

### 1. Strong(강 한 참 조)

우리가 일반적으로 계속 하는 것이 강한참조이다. 별다른 선언이 없다면 강한 참조 라고 생각하면 된다. but, 순환 참조가 발생할 수 있다….

### 2. 순환참조

```swift
class Man {
    var name: String
    var girlfriend: Woman? 
    
    init(name: String) {
        self.name = name
    }
    deinit { print("Man Deinit!") }
}
 
class Woman {
    var name: String
    var boyfriend: Man?
    
    init(name: String) {
        self.name = name
    }
    deinit { print("Woman Deinit!") }
}

var chelosu: Man? = .init(name: "철수")
var yeonghee: Woman? = .init(name: "영희")

chelosu?.girlfriend = yeonghee
yeonghee?.boyfriend = chelosu
```

라고 코드를 작성하면 철수 인스턴스의 프로퍼티는 영희를 참조하고,
영희 인스턴스의 프로퍼티는 철수를 참조하여 순환참조가 발생함.


순환 참조가 발생할 경우

```swift
chelsu = nil // RC가 1만큼 감소해도 1이 남음
heyonghee = nil // RC가 1만큼 감소해도 1이 남음
```

을 해도 메모리(힙)에서 두 인스턴스가 해제되지 않는다.

→ 이 현상을 강한 순환 참조라고 한다.

### 3. Weak(약한 참조)

강한 순환 참조를 해결하기 위해서는 `weak` 키워드를 사용할 수 있다.
`weak` 키워드를 사용하면 인스턴스를 참조할 시, RC를 증가시키지 않는다.

인스턴스가 메모리에 해제된 경우, 자동으로 `nil`이 할당되어 메모리가 해제된다.
→ 자동으로 `nil`이 할당되어야 하기 때문에 반드시 `Optional` 타입이여야 함

```swift
class Man {
    var name: String
    weak var girlfriend: Woman?
    
    init(name: String) {
        self.name = name
    }
    deinit { print("Man Deinit!") }
}
 
class Woman {
    var name: String
    var boyfriend: Man?
    
    init(name: String) {
        self.name = name
    }
    deinit { print("Woman Deinit!") }
}
```

### 4. Unowned(미소유 참조)

`unowned`는 `weak`처럼 RC값을 증가시키지 않아, 강한 순환 참조를 해결 할 수 있다. 

but, `unowned`를 사용하는 것은 인스턴스를 참조하는 도중에 해당 인스턴스가 메모리에서 사라질 일이 없다고 확신하는 것이다.

따라서, 참조하던 인스턴스가 메모리에서 해제된 경우 nil을 할당 받지 못하고 해제된 메모리 주소값을 계속 들고 있다.

## 참고

- https://babbab2.tistory.com/26
- https://babbab2.tistory.com/27