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
    
    LONG형은 숫자가 아닌 문자 타입으로 
    오라클에서는 LONG타입을 더는 사용하지 않도록 권고하고있다
    이 타입은 CLOB나 BLOB로 대체할 수 있으며, 하위 버젼 호환성을 위해 11G에서도 지원하고 있는것이다.

    대용량 문자열 데이터 타입 : CLOB, BLOB
    선택하는 기능 : 용량이 4000 BYTE보다 큰 문자데이터 저장시.
    
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

SELECT COLUMN1, COLUMN2 FROM EX2_1;
-- COLUMN1 과 COLUMN2의 사이즈 확인.
SELECT COLUMN1,LENGTH(COLUMN1) ,COLUMN2, LENGTH(COLUMN2) FROM EX2_1;

-- BYTE : 크기
-- CHAR : 문자

CREATE TABLE EX2_2 (
    COLUMN1 VARCHAR2(3),-- 기본값은 BYTE 적용
    COLUMN2 VARCHAR2(3 BYTE),  
    COLUMN3 VARCHAR2(3 CHAR) -- 한글 영어 구분 없이 3개의 문자를 저장.
);

-- 영문데이터 입력 시
-- INSERT문 사용시 컬럼명을 생략 시, 테이블의 모든 컬럼명을 입력한다는 의미.
INSERT INTO EX2_2 VALUES('abc','abc','abc');

SELECT 
COLUMN1, LENGTH(COLUMN1), 
COLUMN2, LENGTH(COLUMN2), 
COLUMN3, LENGTH(COLUMN3) 
FROM EX2_2;

-- 한글 데이터 입력시,

INSERT INTO EX2_2 VALUES('홍길동','홍길동','홍길동');

/* 
ORA-12899: value too large for column "ORA_USER"."EX2_2"."COLUMN1" (actual: 9, maximum: 3)
에러 발생. 길이가 너무 길다. 입력값 바이트 수는 9 이고, 최대는 3이다. 
*/
-- COLUMN 1 , 2 는 입력하지 않고 3만 입력한다는 뜻이다. 
-- 두 컬럼이 NULL로 설정이 되어있어 스킵이 가능하다. 
INSERT INTO EX2_2 (COLUMN3) VALUES ('홍길동');
-- COLUMN3 에 데이터가 정상적으로 들어간 이유는 VARCHAR2(3 CHAR)이기 때문이다.
-- 이유는 3 CHAR 옵션은 바이트 수에 상관없이 갯수로 세는 것이기 때문이다.

-- 타 데이터베이스는 ''를 공백문자로 사용하나, ORACLE은 ''를 NULL로 처리한다.
-- INSERT INTO EX2_2 VALUES('','',''); 
-- INSERT INTO EX2_2 VALUES(NULL,NULL,NULL);
-- 상단의두개 코드는 같다. NULL입력 시 콜론을 붙여선 안된다. 붙이면 문자열로 인식하게된다.


-- 입력된 데이터값 확인.
SELECT 
COLUMN1, LENGTH(COLUMN1), 
COLUMN2, LENGTH(COLUMN2), 
COLUMN3, LENGTH(COLUMN3) 
FROM EX2_2;

COMMIT;

-- 데이터 확인 : 길이 및 바이트 확인
-- LENGTHB는 바이트 용량을 재 주는 것이다.
SELECT COLUMN3, LENGTH(COLUMN3), LENGTHB(COLUMN3) FROM EX2_2;
 
-- 한글의 바이트 수 확인
SELECT LENGTHB('홍') FROM DUAL;
-- 오라클의 시간 확인
SELECT SYSDATE FROM DUAL;

-- DUAL = 특수 테이블 : 테이블이 필요한 명령문을 사용 시 가상의 테이블을 제작해서 데이터를 보는데 쓰인다.

-- NCHAR, NVARCHAR2 사용

CREATE TABLE UNITABLE (
    COL1    NCHAR(9),
    COL2    NVARCHAR2(20)
);
-- 유니코드를 작성 시 에는 필수적으로 스트링 앞에 N을 붙여아한다.
INSERT INTO UNITABLE (COL1, COL2) VALUES (N'홍길동',N'가나다라'); -- CTRL + ENTER 실행 단축키

SELECT * FROM UNITABLE;

-- 숫자 데이터 타입
/*
    NUMBER[P,{S}]
    P(PRECISION : - 최대 유효 자릿수
    S(SCALE : 소숫점 기준 자리)
*/
-- 숫자 데이터 타입에는 INTEGER, DECIMAL, NUMBER 가 있다. 그러나 내부적으로는 모두 NUMBER 로 관리 된다.
CREATE TABLE EX2_3 (
    COL_INT     INTEGER,
    COL_DEC     DECIMAL,
    COL_NUM     NUMBER
);

-- 시스템 뷰 : 오라클이 설치되면서, 자동으로 생성된 테이블
-- user_tab_cols : 테이블 생성 시 컬럼에 적용한 데이터 타입 정보가 저장되어있음.
-- 테이블명은 반드시 대문자로 적어야한다.

SELECT COLUMN_ID, COLUMN_NAME, DATA_TYPE, DATA_LENGTH FROM USER_TAB_COLS 
WHERE TABLE_NAME = 'EX2_3' 
ORDER BY COLUMN_ID;

/* 
 NUMBER (P[,S])
 컬럼의 데이터타입이 다음과 같고, 숫자 데이터 입력시 결과 처리는 다음과 같다.
 입력 123.54 NUMBER => 123.54 정상처리
 입력 123.54 NUMBER(3) => 124 NUMBER(3)은 NUMBER (3,0)과 같다. 정수 자리 3자리. 소수자리 0자리. 반올림된다.
 입력 123.54 NUMBER(3,2) => ERROR NUMBER(3,2)는 소수자리 2자리를 포함한 전체자리수가 3자리. 정수자리수는 1자리
 입력 123.54 NUMBER(5,2) -> 정상 NUMBER(5,2)는 소수자리 2자리를 ?마한 전체 자리수를 5개로 표현. 정수자리는 3자리가된다.
*/

-- 날짜 데이터 타입
/* 
DATE : 	BC 4712년 1월 1일부터 9999년 12월 31일, 연,월,일,시,분,초까지 입력 가능하다.
TIMESTAMP : 연도, 월, 일, 시, 분, 초는 물론 밀리초까지 입력 가능하다.
fractional_seconds_precision은 0~9까지 입력할 수 있고 디폴트 값은 6이다.

*/

CREATE TABLE EX2_5 (
    COL_DATE        DATE,
    COL_TIMESTAMP   TIMESTAMP
);

-- 날짜형 함수
    /*
    SYSDATE : 현재 날짜 시간, 시간을 초까지 정보확인
    SYSTIMESTAMP : 오라클 서버의 현재 날짜, 시간을 밀리세컨드까지 정보 확인.
    */
 
INSERT INTO EX2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT * FROM EX2_5;

COMMIT;

-- LOB 데이터타입 : 대용량 데이터를 저장할 수 있는 데이터 타입.

/*
    문자열 대용량 데이터
    
    CLOB  : 고정길이, 가변길이는 의미가 없다. 최대크기 4GB - 1*데이터블록 사이즈
    NCLOB : 유니코드(다국어지원)를 포함한 문자열 대용랑 객체, 최대크기 4GB -1*데이터 블록 사이즈
    
    그래픽, 이미지, 동영상 등의 데이터 저장
    
    BLOB  : 이진형 대용량 객체. 최대크기 4GB -1*데이터 블록 사이즈
    
    실제 이진 파일이 아닌 데이터베이스 외부에 있는 파일에 대한 포인터를 저장.
    
    BFILE : 대용량 이진파일에 대한 로케이터(위치이름). 치대크기 4GB
*/
    
/*
    NULL
    
    값이 없음을 의미한다.
    테이블 생성시 컬럼에 기술한다. 생략하면 컬럼은 기본적으로 NULL 속성을 가지게된다.
    컬럼에 NULL이 혀용되면, 데이터삽입 (INSERT)에서 컬럼에 데이터를 삽입하는 구문을 제외시킬 수 있다.
    컬럼에 NOT NULL 속성을 부여하면, 데이터를 삽입하는 구문이 반드시 작성되어야 한다
    데이터베이스 마다 NULL에 대한 처리가 조금씩 다르니, 확인하고 작업진행을 해야한다.
*/

-- 제약조건 : 데이터 무결성을위한 명령어. 
-- 제약조건의 종류 : NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN ㅏXY, CHECK 등

/* 
    NOT NULL : 해당 컬럼에 데이터 삽입(INSERT)시 반드시 구문 작업을 해야한다.
        컬럼명 데이터 타입 NOT NULL
*/

CREATE TABLE EX2_6 (
    COL_NULL        VARCHAR2(10),
    COL_NOT_NULL    VARCHAR2(10)    NOT NULL
)

