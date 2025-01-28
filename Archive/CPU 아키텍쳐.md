## CPU란?

Central Processing Unit, 중앙 처리 장치.

기억, 해석, 연산, 제어를 맡고있는 컴퓨터의 매우 중요한 부분이다.

## CPU 아키텍쳐

CPU의 설계와 명령어의 집합(*ISA)를 정의하는 방식 이다. CPU의 내부 구성 요소, 데이터 버스, 레지스터, ISA를 포함하는 개념이다.

- ISA(Instruction Set Architecture)
    
    CPU가 이해하고 실행할 수 있는 명령어 집합니다. 각각의 아키텍쳐는 고유한 ISA를 가지며, 이 명령어 집합들은 운영체제와 어플리케이션에 사용된다.
    

### X86

- Intel 기반 32bit CPU
- Windows, Linux, Mac OS(BigSur)

### X86_64

- Intel 기반 64bit CPU

### ARM

- *RISC아키텍쳐
    - RISC(Reduced Instruction Set Computer)
        
        CISC(Complex Instruction Set Computer)과 대비 되는 개념. RISC는 간단하고 적은 종류의 명령어와 주소 지정 모드를 사용하지만 CISC는 100개 ~ 250개 정도의 많은 명령어를 가지고 있어 설계가 어렵다.
        
- 저전력 소비, 높은 효율성이 특징임
- 32bit CPU
- X86과는 아예 달라서 호환이 안됨
- Linux, Mac OS(Monterey부터), Android, iOS

### ARM64

- arm 기반 64bit CPU
- Linux, Mac OS(Monterey부터), Android, iOS

ARM은 과거엔 아키텍쳐가 단순하고 가격이 저렴하며 저전력을 갖추고 있기 때문에 소형기기에 많이 사용했다. 하지만 스마트폰 시대에 접어들면서 엄청난 기술의 발전으로 이제 PC에 근접한 수준에 이르렀다.

반면에 저렴한 가격과 저전력은 유지. Apple이 자체 개발한 M1, M2,,, M시리즈 CPU가 이에 해당한다.

## 참고

- https://namu.wiki/w/CPU: CPU란?
- https://velog.io/@seok990301/CPU-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98
- https://namu.wiki/w/RISC: RISC