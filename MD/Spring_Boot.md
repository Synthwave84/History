스프링 MVC -> 스프링 부트 마이그레이션 작업

STS 툴 버젼 선택 시 개발 JDK버전으로 변경작업

WINDOW - PREFERENCES- JAVA- INSTALLED JRES
DIALOG : ADD JDK

인코딩 설정
WINDOWS PREFERENCES
- ENC

스프링 부트 
패키징- jar > 톰캣 내장 (jsp미지원)
  - 참고 > 전통적인 (Apache 사이트)외장 톰캣 = jsp 지원.
  - jsp 및 jstl사용 : 라이브러리 추가 필요.

Boot의 maven 방식은 mybatis xml 과 pom.xml 을 제외하면 없다.

스프링 진영
: 빌드 및 라이브러리 관리도구 S/W
 - Maven :pom.xml
 - Gradle : build.gradle

기본 패키지 : com.docmall.demo
  - 기본패키지 하위로 구성하여 사용.
  com.docmall.demo 패키지명

  -com.docmall.web = 하위패키지 x > 권장하지 않음.
  -com.docmall.demo.web = 동등패키지 o

스프링 bean : 스프링 IoC컨테이너에 등록되어 사용


팀장(PL)과 팀원(개발자)의 협업시
