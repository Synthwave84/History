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
GRANT CONNECT, RESOURCE TO (account); <<필수

성격 
포트 = IP 기반에서 Port로 프로그램 번호를 설정한다. IP는 동일하나 Port 넘버가 없으면 
한번 연결된 컴퓨터는 다른 컴퓨터에 접근 할수 없다. 

TCP Port = ARS전화를 걸 떄 번호로 특정한 부서로 이동하는 것을 생각하면 된다. 즉
통로 라고 생각하면 된다. 비슷한 성격을 가진 프로그램들 끼리 포트를 묶는다.
오라클이란 데이터베이스는 1521이란 포트 번호를 가진다.
IP = 회사 대표 번호. TCP Port = 각 부서로 연결해주는 1번 2번 등의 번호 (내선번호).
네트워크를 사용하는 모든 프로그램은 포트가 존재하며, 웹서버는 80번이다.
즉 모든 홈페이지는 www.naver.com:80 이런 식으로 구성 되어 있다.

포트는 크게 세 종류로 구분됨
0~1023 : 잘 알려진 포트 (Well-known Port)
1024-49151 : 등록된 포트 (Registered Port)
49152-65535 : 동적 포트 (Dynamic Port)

20 : FTP(Data)
21 : FTP(제어)
22 : SSH
23 : Telnet
53 : DNS
80 : World Wide Web
119 : NNTP
443 : TLS/SSL 방식의 HTTP


SID - 서비스에서 OracleService 뒤에 xx를 확인하면된다. 현재 XE.

The Network Adapter could not established ~~ = OracleXEINSListener 서비스가 꺼져있는것.


데이터베이스 

 - 관리자(DBA)
 - 개발자 : 데이터베이스 관리 기능은 제외.
 - 일반 사용자

데이터 베이스 프로그래밍 : SQL
- 툴 (GUI)


데이터베이스를 통해 테이블을 작성하고
Spring 이나 자바등으로 전송 해 준다. 


간단한 순서도.
  - 1. 웹페이지에서 데이터 입력
  - 2. 회원 가입 (submit)
  - 3. 자바 or 스프링 서버(mybatis등)를 이용해 데이터 확보 후
  - 4. Oracle 로 전송. 
  - 5. Oracle 로 전송 받기 이전에, Oracle에는 타입에 맞는 테이블이 준비 되어 있어야함. 
    (현재는 회원가입)


테이블

주의사항 

주소 입력의 경우 기본주소 + 상세주소를 지정할 때, 2개의 컬럼을 쓰거나, 구분자를 통해 기본주소와
상세주소를 구분 해 줄 필요가 있다.

- VARCHAR2 = 입력값이 일정하지 않은 문자열일 경우.
                          예시로 영어 성별인 경우 MALE 4자 FEMALE 6자 이므로 VARCHAR2가 되야함. 글자 길이까지도 영향을 받게된다.
                          
                          
- CHAR = 데이터가 고정적인 것. (생일 같은 형태)

- NUMBER = 숫자의 경우 0은 인식하지 않는다. 때문에 우편번호나, 0이 포함되는 경우, 계산에 필요한
                      것이 아니라면  CHAR를 써서 숫자의 원형을 보존해야한다. 예시로 핸드폰번호의 010은 10이 되어버리므로 문제가 된다.  


                      https://thebook.io/006696/0017/


ERD - 테이블의 도식화 라고 생각하면 될것같다. 데이터 모델러에서 확인 할 수 있다.


SQL : 데이터베이스 프로그래밍 언어
Structured Query Language. 

DDL - Definintion Data Language
  - CREATE, ALTER, DROP ...
DML - Data Manipulation Language
  - SELECT, UPDATE, INSERT, DELETE ...
DCL - Data Control Language
  - GRANT, REVOKE, COMMIT, ROLLBACK

DBA 관리자의 영역
TABLE SPACE
  - 테이블 등이 저장되는 영역


  SELECT
  INSERT
  UPDATE
  DELETE

  -- 조건식
  WHERE (INSERT는 제외 된다.)

  MERGE


계정 생성 및 권한 작업.


Rollup expr1 , expr,2, expr3

- expr1, expr2, expr3
- expr1, expr2,
- expr1
- 전체

CUBE expr1, expr2, expr3 = 2^3 = 8개
- expr1, expr2, expr3
- expr1, expr2
- expr1, expr3
- expr2, expr3
- expr1
- expr2
- expr3
- 전체


Cube expr1, expr2, expr3, expr4

- expr1, 2, 3, 4
- 1 2 3
- 1 2 4
- 1 3 4
-  2 3 4
- 1 2 
- 1 3
- 1 4
- 2 3
- 2 4
- 3 4
- 1
- 2
- 3
- 4
- 전체


Group by 1, CUBE(2, 3)

1 2 3
1 3 
1 2 
1


 JOIN
  - 이론 8가지
    
    내부조인 (INNER JOIN)
    : 두 테이블에서 컬럼을 비교하여 일치되는 데이터 행을 수평결합

    외부 조인(OUTER JOIN)
    : INNER JOIN( 일치되는 데이터 행) + 일치되지 않는 데이터형 추가.
    
    LEFT OUTER JOIN
    RIGHT OUTER JOIN
    FULL OUTER JOIN


좋은 사이트 구루비


PL/SQL

 - 시스템 패키지 : DBMS



Index

인덱스를 사용하지 않고(타지 않고 )
테이블의 데이터를 처음부터 끝까지 검색하는 방식 - 테이블 스캔

오라클
예> 게시판 리스트 페이징 기능
       쿼리 : 인덱스 힌트를 사용한 쿼리