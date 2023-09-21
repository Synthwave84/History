JAVA

개발환경 구축

- JDK설치 : 버전 1.8 , 1.11
- 유료정책 : 오라클 JDK
- 무료정책 : Open JDK

편집기 : IDE Tool
- 이클립스(무료)
  최신 이클립스 : JDK8(JDK 1.8)을 지원하지 않는다.
- 인텔리J : Jetbrain
  Ultimate Edition : 상용버젼
  Community Edition : 무료버젼 (30일)
- Visual Studio Code

설치

  - JDK(with JRE)
  - JRE

구성요소

- JDK(JRE포함) : Java Development Kit 자바개발도구 및 실행환경 프로그램

- JRE : 자바 런타임 실행환경 프로그램 Runtime Environment

환경변수 등록

1. 사용자 환경 변수 설정 -> JDK 폴더. (bin이 아님.)
    상단은, 유저, 하단은 시스템으로 구성되어있다.
2. path 편집 : 실행파일을 폴더위치와 상관없이 어디든 사용 하고자 하는 목적
    ->%JAVA_HOME%\BIN

개발 툴 설정

- Workspace 폴더 설정
- 인코딩 설정
  Windows메뉴 - Preferences - 텍스트박스 : 검색어 enc 입력




자바 

C, C++, C# 프로그램 코드작성 -> 컴파일러 프로그램 사용 -> 기계어 변환 (0,1의 2진수 코드)
JAVA 프로그램 코드작성 -> 컴파일러 javac.exe ->바이트코드 -> 기계어 변환.

a
- bin폴더에 바이트코드 
- src폴더에 소스


- 자바는 기본구조가 class라는 기본 형태를 구성으로 만들어져있다.
  class 클래스명 {
    실행될 코드.
  }


자바에서 스프링 설치
 - sts 검색 마켓플레이스


데이터타입 : 기억장소를 형태,크기로 생성
  - 형태(type)  : 정수형, 실수형, 문자형...
  - 크기 : 1byet, 2byte, 4byte, 8byte


백엔드 기술
- 스프링 맞춤형 자바학습
- 스프링 버전과 자바버전

자바 개발환경 구축 (웹분야)
- JDK설치 
 -> 자바8 (JDK 1.8)

자바 응용프로그램
 - 콘솔 프로그램 : 문법학습 이용
 - 윈도우 프로그램
 - 앱프로그램
 - 모바일(안드로이드) 프로그램
 - Embeded프로그램

 - 라이브러리.


클래스

  -자바언어 
   1) 객체지향언어
   2) 문법 기본구조 : 클래스 기반


Scanner 클래스 : 웹에서는 사용 할 수 없다.
콘솔 응용 프로그램을 제작할때 사용 할 수 있다.


자바 스프링 기본 
https://kghworks.tistory.com/m/137


자바 프로그램 실행

> JHello.java -> javac 컴파일러 -> Hello.class(바이트코드) -> java.exe(실행)
> JVM 구동 -> Hello.class 기계어 변환 -> JVM
> JVM 운영체제로부터 할당 메모리를 관리

- 기억장소의 성격
  1. 메소드 영역..
  2. 스택 영역
  3. 힙 영역


  메소드영역 : Hello.class 바이트코드를 읽어들인 정보
  스택 영역 : 기본 데이터 타입 사용
  힙 영역 : 참조타입 사용.

기본(primitive) 타입 데이터는 앞 글자가 소문자다.
boolean, char, int, long etc....
힙영역을 사용하는 참조타입은 대문자로 시작한다.
String etc....

char vs String 

char : 기본데이터타입 (2바이트 유니코드 0~65535)
"A" - 올바른 문법
"AB" - 잘못된 문법

String : 클래스, 참조타입
"A"

객체지향  ( 클래스 )
필드 : 명사적
메소드 : 동사적 

예를들면 인간 객체가 가질 수 있는 공통된 속성
팔다리갯수 이름 나이 성별등 
즉 애초에 객체 자체에 할당된 것. 

<필드>

반대로 인간객체가 하는 행위
움직이다, 먹는다, 웃는다, 잔다 등 <메소드>

example

쇼핑몰 

객체 

회원 : Member
- 속성과 동작으로 나뉜다
  1. 속성 : 아이디, 비밀번호, 이름, 주소, 연락처 등 (정보)
  2. 동작 : 회원가입, 회원수정, 회원삭제, 상품 장바구니에 담기, 상품 주문 (행위)

- 필드(변수)와 메소드
  String userid;
  String passwd;

- 메소드
  void join() {}
  void modify() {}

  ex>
  // 객체 (class)
  public class Members {
    필드 : 아이디, 비밀번호 etc
    메소드 : 회원가입, 회원수정 ~~~
  }

- 클래스 정의,설계,디자인
  public class Member {
    String userId;
    String passwd;

    void join() {}
    void modify() {}
  }

- 데이터베이스와 결합한 예제
  오라클 SCOTT 의 EMP 테이블 참조.
  public class Emp {
    int empno;
    String ename;
    String job;
    int mgr'
    LocalDate hiredate;
    int sal
    int comm
    int deptno
  // 사원들이 회사에서 하는 업무 기능
  // 메소드 정의를 하거나, 아예 새로 만들 수 있다
  
  }
  public class EmpWork {
  // 사원들이 회사에서 하는 업무기능
  // 메소드 정의

  }

상품 : Product
주문 : Order  

원본 소스에는 디폴트 생성자가 없으나,
컴파일되어 바이트코드로 전환된 class에는 디폴트생성자가 생성된다.

Hello.java -> javac.exe -> Hello.class -> java.exe -> jvm 구동
jvm rnehd - Hello.class 파일을 메모리상에 기계어로 변환 및 실행
기계어로 되어있는 내용에 따라 메모리를 생성. 

메모리는 크게 3가지 영역으로 관리한다.

- 메소드 영역 : hello.class 바이트코드를 읽은 내용 저장 후, 정적(static)멤버의 기억장소로 이용
- 스택 영역 : 기본타입 변수 또는 참조타입 변수가 생성되는 기억장소
- 힙 영역 : new 키워드가 클래스의 인스턴스 멤버로 기억장소를 사용.


생성자 구분
- public = 패키지와 상관 없이 어디서든 접근이 가능
- default = 같은 패키지 내에서 제한 없이 접근 가능
- private = 클래스 내 에서만 접근 가능.

컴파일 에러 > 문법 작성 중 오류
런타임 에러 > 문법 작성은 통과 했으나, 프로그램 실행 도중 에러 발생.

디버깅 : 오류 수정작업
디버그 : 프로그램 실행중 발생한 오류

자동형변환

- 부모클래스 = 자식클래스 (자동형변환,묵시적)
- 자식클래스 = (자식클래스) 부모클래스; (강제적 변환 명시적)
- 부모타입은 자식 타입으로 자동 변환되지 않음 대신 캐스팅 연산자로 강제 변환 가능.

상속 
(일반) 클래스
추상 클래스 

인터페이스.

- 일반적인 메소드의 형태
  void method() <헤더> {
  실행문장; <바디>
  }

  - 추상 메소드
  void method() 


상속

완성 클래스
 -필드 + 메소드

추상클래스8
  -필드 + 메소드 + 추상메소드

인터페이스
  -추상메소드 Only

클래스
- 상속과 다형성
  1) 필드 다형성
  2) 매개변수 다형성

인터페이스
- 상속과 다형성
  1) 필드다형성
  2) 매개변수 다형성

인터페이스
- 설계의 표준화를 이용해 사용된다. 일종의 버튼이 들어갈 틀 같은 느낌이다.
- 다형성 필드 다형성, 매개변수 다형성.

자식크래스 extends 부모클래스
자식클래스 implements 부몽니터페이스
자식인터페이스 extends 부모인터페이스 

인터페이스 implements 부모클래스 <- 말이안된다. interface는 클래스를 생성하기 위한 목적이 있다.

인터페이스는 다중 상속이 가능하다.
다중상속시 상속대상이 동일 인터페이스 인 경우
extends 를 사용한다. 
ex > 인터페이스 extends 인터페이스1 , 2


클래스 implements 인터페이스 1, 2


자바 : 클래스
데이터베이스 : 테이블
회원테이블 : 회원클래스

1. 테이블과 상관이 있는 테이블 구조를 내용으로 하는 클래스.
  - 회원 테이블 : 회원 클래스
  - 상품 테이블 : 상품 클래스
2. 테이블과 상관 없는 클래스

java.base
모든 모듈이 의존하는 기본 모듈로, 모듈 중 유일하게 requires하지 않아도 사용할 수 있음

java.lang
자바 언어의 기본적인 클래스를 담고 있는 패키지. 이 패키지에 있는 클래스와 인터페이스는 import 없이 사용할 수 있음

Exception(예외) : 예외 관련 최상위 클래스.

Object obj = 데이터타입. 모든 타입은 obj 로 변환 가능하다.

Date
Calender
LocalDate, LocalTime, LocalDateTime

디자인 패턴 알아보기. 1 

클래스 설계(정의, 선언)
  - 제네릭이 없는 클래스 : 스프링
  - 제네릭이 있는 클래스 :  제너릭이 있는 성격은 <> 가 등장하느냐 아니냐로 구분 할 수 있다.

제네릭 : 결정되지 않은 타입을 파라미터로 처리하고,  실제 사용할 때 구체적인 타입을 지정하여
사용하는 기능.

타입 파라미터
클래스명 <A>
클래스명 <A,B>
클래스명 <A,B,C>

메소드 파라미터
메소드 (A);
메소드 (A,B);
메소드 (A,B,C);


Ctrl + Shift + R 리소스찾기.

Ctrl + Shift + F 코드재정렬


Spring
  - 스프링 프레임워크 : 선행 (SI 업체에서 주로 진행)
  - 스프링 부트 : 별도 정리. (Service 업체에서 주로 진행)
  대략 70% 가량의 사용법이 비슷하다. 
  스프링 부트는 다소 난이도가 쉬우나, 스프링 프레임워크는 다소 난이도가 있다.
  스프링부트 : 스프링프레임워크를 간편하게 변경한 버젼. 특히 설정이나 세팅값
  부분에서 상당한 편의성이 개선된 프로그램이라고 한다.

  스프링 프레임워크로 개발을 시작한 개발자는 스프링 부트로의 전환이 빠른 편이나,
  스프링 부트로 시작을 하게 된 개발자는 스프링 프레임워크 사용시 어려움을 겪을 수 있다.

https://drive.google.com/drive/folders/1503W7f140lzvWsBdTq_RMLCPMWA19NWH
> 주소 -> sts4.zip 다운

SpringTool.exe 실행
>안됨 ㅠ 내일

대신 docmall.zip 다운 후 pom.xml 실행 VSCode 등 암거나 열어도됨.

Google에 Maven repository 검색. 메이븐 관련 무료 API

JACKSON DATABIND = JSON 관리 라이브러리(API). 검색 
버전 클릭하면 HTML 주소 하나 나오고, 이를 POM.XML의 
<dependency> 태그에 붙여넣기 해 주어야함. 

example > https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind/2.15.2
하단의 태그 클릭시 바로 클립보드 카피.
<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.15.2</version>
</dependency>
카피 된 내역.

허나, 현재 pom에는 jackson databind는 이미 등록이 되어있음.
Ctrl + F 로 Jackson 검색 시 확인 가능.

Explorer 에서 사용자 -> <USER 계정명> -> 클릭 시 
.m2 폴더 존재. = Repository -> com -> fasterxml -> jackson 확인 가능.
패키지가 저장되는 곳.
허나, 현재 작업한 것이 없기 때문에 우리는 .m2.폴더가 없다. 이후 작업 시 생성됨.

Jackson 폴더 클릭시, 버젼 존재. 2.9.4
내부 jar 파일이 존재. 압축을 원래는 풀지 않으나, 풀 수 있음.
확인 시 내부의 클래스 등이 존재.

이후, Maven Repository 사이트를 통해 필요한 API를 끌어옴.

이후, docmall -> main -> java -> controller 0> MemberController.java 클릭
어노테이션(@xxxxx) 들 확인 및 주석 확인.

작업의 흐름은 Controller -> service -> mapper 
mapper : DB와 관련된 작업. 
mapper > service > controller. = 누군가 설계한게 아니라 스프링 자체의 가이드라인으로 잡혀있음.
즉 기본 뼈대.

mybatis = SI가 주로 사용함.
Spring JPA = 현재 신생업체에서 주로 사용함.
허나 Mybatis 가 기본이 되지 않은 상태로는 JPA를 공부해선 안된다. 
정상적인 루트는 반드시 Mybatis 를 거쳐야 한다. 왜냐하면, mybatis 는 SQL쿼리문을 사용하기때문.

ex > C:\Users\i7F-21\Downloads\docmall\src\main\resources\com\docmall\mapper
> MemberMapper.xml 의 일부

	<insert id="join">
		insert into member_tbl(mem_id, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, 
			MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E)
		values(#{mem_id}, #{mem_name}, #{mem_pw}, #{mem_email}, #{mem_zipcode},
			#{mem_addr}, #{mem_addr_d}, #{mem_phone}, #{mem_nick}, #{mem_accept_e})
	</insert>

mybatis또한 라이브러리.
pom.xml 에서 확인 가능.
