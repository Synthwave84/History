Spring

  레거시 프로젝트 생성 시  Spring MVC Project

  Top Level Package = 도메인 네임을 거꾸로. ex(com.demo.__)

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

