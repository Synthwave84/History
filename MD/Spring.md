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
