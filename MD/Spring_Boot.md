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

팀장 synthwave100
 -  원격 레포지토리(기본 브랜치 : main) : 깃허브에 협업프로젝트 공유.
  : https//github.com/docomsa1000//ezen10000.git
  - token : 

개발 컴퓨터
  - 프로젝트 생성
    -> 로컬 레포지토리 생성(기본 브랜치 main)
        협업 프로젝트 기본작업 - 로컬 레포지토리 커밋
    ->  원격 레포지토리(기본브랜치 main) 소스 올리기.
        1) GIT Repositories
            spring100(main) : 로컬 레포지토리
              -Remotes
                - origin 

로컬 레포지토리와 원격 레포지토리 동기화 (sync)
  로컬에서 원격으로 push작업을 하기 위해서는 원격의 내용을 로컬이 동일하게 가지고 있어야한다.
  원격에서 pull(fetch+merge) 작업으로 로컬로 가져와 동기화를 해야함.




-> Push작업
  Pull Request -> Merge 작업
      main branch(default) + master내용이 merge(병합)
      master

팀원 synthwave84
팀장ㅇ의 원격 레포지토리를 공유 : fork

  - 팀장 원격 레포지토리 생성.
