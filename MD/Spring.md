Spring

  STS4 

  Lombok
  롬복 라이브러리 다운로드

  cmd java -jar lombok.jar
  (Pepper 나옴)
  스프링 실행파일 선택.

  Maven Repo - > Lombok -> 1.18.30 dependency

  https://velog.io/@swjy1216/Lombok

  처리가 원활하지 않을 시
  -javaagent:C:\DEV\Devtools\sts4\lombok.jar

  레거시 프로젝트 생성 시  Spring MVC Project

  Top Level Package = 도메인 네임을 거꾸로. ex(com.*.*

자바 진영
빌드 및 라이브러리 관리 도구
  - Maven 메이븐
  - Gradle 그래들 

스프링 MVC
  빌드 및 라이브러리 관리도구 : Maven 기본(pom.xml)
스프링 부트
  빌드 및 라이브러리 관리도구 : Maven 또는 Gradle 중 선택

스프링 MVC 프로젝트 구성
  - JDK Version과 Spring Framework Version 설정

    JDK Version
    - <java-version>1.8</java-version> 

    Spring Version
	  - <org.springframework-version>5.0.7.RELEASE</org.springframework-version>

    Source Version
    <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>2.5.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>

  JDK 버젼 업데이트
  프로젝트 우클릭 -> Maven - > Update Project.

  http:\\localhost.9091/doD?id=docomsa&age=100

잘 실행 되었을 때
  INFO : com.demo.controller.HomeController - Welcome home! The client locale is ko_KR.


JSP문법 = EL(Expression Language) 문법
 - ${표현식} 

 

라이브러리 구성 시 pom.xml

스프링의 코어 = servlet-context.xml, root-context.xml

/resources/**
  - /resources/aaa
  - /resouces/aaa/bbb



초기 세팅
1.6 to 1.8
3.1.1 to 5.0.7

Tomcat Path - > / 만 남기고 지우기.
패키지 마우스 우클릭 Maven -> 업데이트. 

스프링 정상작동 하지 않을때
  - ContextPath를 루트디렉토리(/) 로 변경
  - 톰캣 서버 재시작
  - Maven 업데이트

톰캣과 관련된 문제로 스프링이 정상작동이 안되는경우
  - 톰캣 기존 경로 삭제 후 재설치 및 재설정

파일 아이콘에 S 가 있다면 Spring에서 관리가 되고 있다는 뜻이다. 
S 로고가 없을 시, 특정한 작업을 빼 먹었거나, 툴에 문제가 있는 경우이다.
재시작을 통해 확인하거나, 빼먹은 작업이 있는지 확인 해야한다.
@Controller 어노테이션을 이용하니 작동하기 시작했다.


web.xml, servlet-context.xml, pom.xml

JDK
  JDBC : java.sql
    Connection
    PrepareStatement
    ResultSet

데이터베이스 회사에서 제공하는 데이터베이스 드라이버
 - 오라클
 - MS-SQL Server
 - DB2

스프링에서 DB를 사용하는 기술
  - Mybatis : 단순히 설명하면 XML파일에 SQL구문 코드를 사용하는 기술
  - JPA : JAVA프로그래밍으로 데이터베이스를 사용하는 기술


초기 스프링 세팅

1. pom.xml 작업
  - 서블릿 버전 변경 : 2.5 -> 3.1.0
    <dependency>
		    <groupId>javax.servlet</groupId>
		    <artifactId>javax.servlet-api</artifactId>
		    <version>3.1.0</version>
		    <scope>provided</scope>
		</dependency>

  2. web.xml 작업
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns="http://xmlns.jcp.org/xml/ns/javaee"
      xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
      id="WebApp_ID" version="3.1">


3. 데이터베이스 연동 작업.

  ! 작업순서 !
  - DB : BOARD 테이블 생성 및 시퀀스 생성

  - Spring : 4개의 패키지 생성. 
                com.demo.domain
                com.demo.controller <프로젝트 생성 시 만들어진것.
                com.demo.service
                com.demo.mapper
                폴더생성
                src/main/resources > com/demo/mapper 폴더 생성. 
                >com.demo.mapper패키지와 이름 동일해야함.

  각 패키지별 작업

  com.demo.domain  : 
    - 테이블의 구조를 갖는 클래스 생성 
    > BoardVO.java 클래스

  com.demo.controller
    >BoardController.java 클래스

  com.demo.service
    >BoardService.java 인터페이스
    >BoardServiceImpl.java 클래스 (Implements BoardService)

  com.demo.mapper
    >BoardMapper.java 인터페이스
    
  com/demo/mapper 폴더
    >BoardMapper.xml 파일 생성 : mybatis의 xml mapper파일
      -BoardMapper 인터페이스 파일과 파일명이 일치해야만 한다.


구현 작업 순서
1)BoardMapper 인터페이스와 BoardMapper.xml파일
   - public void register(BoardVO board)

   - <insert id="register" parameterType="com.demo.domain.BoardVO">

2)BoardService 인터페이스와 BoardServiceImpl구현 클래스
  - BoardService 인터페이스
    public void register(BoardVO board);
  - BoardServiceImpl 구현 클래스
    @RequiredArgsConstructor 클래스 위에 선언
  - 클래스 안에 필드선언. 스프링이 BoardMapper  인터페이스 bean 객체를 자동으로 주입.
    private final BoardMapper boardMapper;
    
    public void register(BoardVO board); 추상메소드 재정의(구현)

3)BoardController 클래스
  @RequiredArgsConstructor 클래스 위에 선언
  public final BoardService boardService; // BoardServiceImpl boardService= new BoardServiceImpl();

스프링 동작 방식
https://dalpaeng00.tistory.com/83

DAO - 데이터베이스를 접근하는 코드를 가지고 있는 클래스객체


1.BoardMapper인터페이스 ,BoardMapper.xml
2.BoardService인터페이스, BoardServiceImpl클래스 
  -> DI 디펜던시 인젝션. (주입작업) > @RequiredArgsConstructor + private final BoardMapper boardMapper << 이놈이 주입받은 것. 즉 가공하여 서빙(제공) 해주는 것. 그래서 서비스.
3.Controller 



servlet context > 웹 관련
root-context > 비 웹 관련.


- 프로젝트 시작
  1) 데이터 베이스 담ㅈ당자가 개별 정보 제공
    -데이터베이스 연결정보
    -오라클 서버명
    -계정 비번

  2) 훈련생(수강생)
    -SQL Delveloper실행
    1) 관리자 접속 : sys, system
    2) 계정 생성
      CREATE USER '계정명' IDENTIFIED BY 비밀번호;
    3) 권하부여
      GRANT CONNECT, RESOURCE TO 계정이름;


https://dorothy-yang.tistory.com/

포폴 
  - 데이터베이스 설계

스프링 시큐리티
암호화

톰캣 서버가 또 시작이 안된다.
  - Run As -> Maven Clean -> Maven Install
근데 또안된다
  - Server -> Tomcat LC -> Clean Tomcat Working Directory
하지만 아직도 안된다
  - Server -> Tomcat -> Clean.

1) 자바스크립트 코드와 jsp 문법이 혼합되어 있을 경우
  -> views폴더 하위에 파일확장자 jsp로 저장
2) 자바스크립트 코드
  -> resource폴더 하위에 파일확장자로 js 저장.

HTTP 오류 코드 = 400 = 클라이언트단 오류로 인해 스프링접근 조차 불가능
HTTP 오류 코드 = 500 = 값은 들어왔으나, 스프링에서 에러발생.

Handlebar :자바스크립트 탬플릿 엔진
-> 서버에서 보내온 JSON 형태의 데이터를 사용하여 작업을 편히 할 수 있는 특징

웹 요청방식
- Get > select문
- Post > Insert update delete문
- put/ patch > update
- delete > delete

REST API 개발방법론
- CRUD
  Create
  Read
  Update
  Delete


-Spring legacy project
  -> spring mvc project
  view : jsp 기본제공

-spring starter project
 -> spring boot project
 view : thymeleaf 기본권장
        jsp권장 안함. 설정작업을 통하여 설정 가능.

  -> 설정파일 : xml 파일 사용안함.
  -> Bean 설정 : Java Class파일로 Bean작업.
  application.properties 파일로 설정
    위의 파일을 변형하여, application.yml로 확장자 변경 사용도 한다.
DemomallApplication : 프로젝트명 + Application

패키징
War > 따로 톰캣 필요
JAR > 내장 톰캣 제공 : 톰캣서버 등록작업이 필요하지 않음.