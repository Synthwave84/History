계정과 권한.
  
  - 오라클 기본설치 

  - SQL Developer 프로그램 
    오라클 데이터베이스 서버를 접속 할 때 사용하는 프로그램이다.

    관리자 계정이 자동 생성된다.
      - sys(main) : 1234
      관리자 계정 생성시 Role은 무조건 SYSDBA가 되야한다.
      - system (sub) : 1234
        SYSTEM 설정일 경우 Role은 무조건 기본값이 되어야한다.

  - 프로젝트 진행
    개발 계정 생성 : 회사의 데이터베이스 관리자 또는 거래처 등이 제작 해준다.
    
    실제 개발시에는 호스트이름 or 도메인기반 또는 특정 ip를 제공 받는다.

키워드
  - localhost = 내 자신의 컴퓨터를 지칭한다. (내부)
    컴퓨터에 SQL Developer와 Oracle이 동시에 설치 되어있을 경우, localhost가 된다.
    
    IP : 127.0.0.1 (localhost = 127.0.0.1을 상수로 만든것.) 

시작 
CREATE USER doc1 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO doc1; <<필수