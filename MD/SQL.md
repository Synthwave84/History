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