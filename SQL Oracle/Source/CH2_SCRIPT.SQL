-- 데이터베이스 프로그래밍 : SQL 

/* 
    테이블: 데이터를 저장하고 관리하는 객체
    테이블 : ROW , COLUMN으로 구성되어있다.
    
    테이블 생성 구문
    CREATE TABLE [스키마.]테이블명(
        컬럼1 컬럼1_데이터타입 [NULL, NOT NULL],
        컬럼2 컬럼2_데이터타입 [NULL, NOT NULL],
    ...
    )[TABLESPACE 테이블스페이스명];
    
    스키마 : 데이터베이스 객체를 관리하는 의미. 
    테이블 생성시 스키마를 생략하면, 접속한 계정의 이름으로 제작된다. 
    EX) 현재 접속 게정인 ORA_USER 계정이름이 스키마명으로 생성된다.
    
    1. 테이블명, 컬럼명의 최대 크기는 30바이트다.

    2. 테이블명, 컬럼명으로 예약어는 사용할 수 없다.

    (예약어(키워드)란 오라클에서 미리 선점한 단어로 SELECT, UPDATE과 같은 구문, 
    COUNT, ASC와 같은 SQL 함수 등이 있으며, 예약어 목록은 
    V\$RESERVED_WORDS 시스템 뷰에서 조회할 수 있다)

    3. 테이블명, 컬럼명으로 문자, 숫자, ‘_’, ‘\$’, ‘#’을 사용할 수 있지만, 첫 글자는 문자만 올 수 있다.

    4. 한 테이블에 사용 가능한 컬럼은 최대 255개까지다.

    1, 2, 3번 내용은 테이블과 컬럼뿐만 아니라 오라클에 있는 모든 데이터베이스 객체 이름을 생성할 때도 적용된다.
*/
-- 회원테이블.

CREATE TABLE MEMBER (
    U_ID        VARCHAR2(16)    NOT NULL PRIMARY KEY,
    U_NAME      VARCHAR2(30)    NOT NULL,
    U_PW        VARCHAR2(15)    NOT NULL,
    U_BIRTH     CHAR(10)        NOT NULL,
    U_GENDER    CHAR(6)         NOT NULL,
    U_EMAIL     VARCHAR2(50)    NOT NULL,
    U_TEL1      VARCHAR2(20)    NOT NULL,
    U_TEL2      VARCHAR(20)     NULL, -- 값이 없을 수도 있다. 꼭 값을 받아야 할 경우 NOT NULL
    U_POST      CHAR(5)         NOT NULL,
    U_ADDR1     VARCHAR2(50)    NOT NULL,
    U_ADDR2     VARCHAR2(50)    NOT NULL,
    U_EMAIL_CHK CHAR(1)         NOT NULL,
    U_SMS_CHK   CHAR(1)         NOT NULL
 );

-- SELECT 문 : 테이블의 데이터를 조회하는 명령어.
SELECT * FROM MEMBER; -- 테이블명의 모든 컬럼명을 조회하라.

-- 게시판 테이블
CREATE TABLE BOARD (
    B_IDX       NUMBER          PRIMARY KEY,
    B_SUBJECT   VARCHAR2(100)   NOT NULL,
    B_CONTENT   VARCHAR2(4000)  NOT NULL,
    B_WRITER    VARCHAR2(50)    NOT NULL,
    -- 사용자에게 입력받지 않고 자동으로 처리(DEFAULT) 오라클의 데이터정보를 가져오는것 (SYSDATE)
    -- 가장마지막 라인의 콤마는 빼준다.
    B_REGDATE   DATE            DEFAULT SYSDATE
       );
    
    /* 
    문자데이터타입
    - CHAR
    - VARCHAR2
    CHAR : 고정길이. 최대 2000바이트, 기본값 1바이트
    VARCHAR2 : 유동길이. 최대 4000바이트, 기본값 1바이트 EX > ID. PASSWORD, ETC
    
    */
-- 표 생성
-- 컬럼 생성시 NOT NULL을 정의하지 않으면, 기본값은 NULL이 된다.
-- NULL의 의미는 해당 컬럼에 데이터가 존재하면 입력하고, 없으면 입력 하지 않아도 괜찮다는 의미가 된다.
CREATE TABLE ex2_1 (
    COLUMN1     CHAR(10),
    COLUMN2     VARCHAR2(10),
    COLUMN3     NVARCHAR2(10),
    COLUMN4     NUMBER
);

-- 데이터 삽입
-- 문자 데이터는 ' 작은 따옴표를 사용해야 한다.
INSERT INTO EX2_1(COLUMN1,COLUMN2) VALUES('ABC','ABC');

COMMIT: -- 실제 데이터가 물리적으로 오라클 디스크에 반영되는 작업.

SELECT * FROM EX2_1;
