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

-- 에러 발생
INSERT INTO EX2_6(COL_NULL, COL_NOT_NULL) VALUES('AA', NULL);
-- INSERT INTO ex2_6 VALUES('AA', '');
/*
ORA-01400: cannot insert NULL into ("ORA_USER"."EX2_6"."COL_NOT_NULL")
*/

-- 성공
INSERT INTO EX2_6 VALUES('AA', 'BB');

-- 데이터조회
SELECT *FROM EX2_6;

-- 에러발생.
INSERT INTO EX2_6 VALUES (NULL, NULL);
/*
ORA-01400: cannot insert NULL into ("ORA_USER"."EX2_6"."COL_NOT_NULL")
*/

/*
제약조건개체이름
SYS_C008289     C      EX2_6    
*/
/*
② UNIQUE
UNIQUE 제약조건은 말 그대로 해당 컬럼에 들어가는 값이 유일해야 한다는 의미다. 즉 중복 값을 허용하지 않는다

    컬럼명 데이터타입 UNIQUE -- 1) 컬럼수준 제약
    혹은
    CONSTRAINTS 제약조건명 UNIQUE(컬럼명, ...) -- 2) 테이블수준 제약
*/

CREATE TABLE EX2_7 (
    COL_UNIQUE_NULL      VARCHAR2(10)    UNIQUE,     -- 생략 시 기본값은 NULL
    COL_UNIQUE_NNULL     VARCHAR2(10)    UNIQUE NOT NULL,    
    COL_UNIQUE           VARCHAR2(10),
    CONSTRAINTS UNIQUE_NM1 UNIQUE (COL_UNIQUE)
    
);



-- 테이블 삭제
DROP TABLE EX2_7;


-- 시스템 뷰 : 테이블의 제약조건 정보를 볼 때 확인
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6'; -- 테이블명을 대문자로 입력

-- 성공
INSERT INTO EX2_7 VALUES('AA', 'AA', 'AA');
INSERT INTO EX2_7 VALUES('BB', 'BB', 'BB');

-- 실패 AA중복
INSERT INTO EX2_7 VALUES('', 'AA', 'BB); -- ' '은 NULL

-- UNIQUE 비교 대상에서 NULL은 제외
-- 오라클운 ''(NULL) 중복데이터 제외된다 그러나, 다른 데이터베이스에서는 다를 수 있다. 실무에서 작업 시 확인 후 작업바람.
INSERT INTO EX2_7 VALUES('', 'CC', 'CC');

-- 데이터 확인
SELECT * FROM EX2_7;

-- UNIQUE 제약조건 에러 : COL_UNIQUE_NULL 컬럼에 UNIQUE 제약조건 때문에 'AA'데이터가 존재하여, 입력할 수가 없다.
INSERT INTO EX2_7 VALUES('AA', 'DD', 'DD');
/*
ORA-00001: unique constraint (ORA_USER.SYS_CC008299) violated
*/

COMMIT;

/* 
③ 기본키

- 단일키 : 컬럼 1개를 설정
- 복합키 : 컬럼 2개 이상으로 설정

기본키Primary key라고도 하고 영어 그대로 ‘Primary key’라고 한다. 
보통 테이블에 키를 생성했다라고 할 때, 이는 기본키를 의미한다. 
기본키는 UNIQUE와 NOT NULL 속성을 동시에 가진 제약조건으로, 
테이블 당 1개의 기본키만 생성할 수 있다.

    컬럼명 데이터타입 PRIMARY KEY  -- 컬럼 수준 제약
    혹은
    CONSTRAINTS 제약조건명 PRIMARY KEY(컬럼명, ...)  -- 테이블 수준 제약.

*/

-- PRIMARY KEY 제약 조건에 의하여 생성되는 제약조건이름은 자동으로 생성되게 하지않고,
-- 수동으로 생성해야, 나중에 스프링기능에서 페이징 처리 할 때 사용 할 수가 있다. (중요)


CREATE TABLE EX2_8(
    COL1        VARCHAR2(10)    PRIMARY KEY, -- UNIQUE와 NOT_NULL 성격을 동시에 가진다.
    COL2        VARCHAR2(10)    
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM   USER_CONSTRAINTS
WHERE  TABLE_NAME = 'EX2_8';

-- 오류. 값이 NOT_NULL이다. PRIMARY KEY로 설정이 되었기 때문.
-- ORA-01400: cannot insert NULL into ("ORA_USER"."EX2_8"."COL1")
INSERT INTO EX2_8 VALUES('', 'AA');

-- 성공
INSERT INTO EX2_8 VALUES('AA','AA');

-- 실패. PRIMARY KEY 성격 ?문에 중복데이터 입력 불가
-- ORA-00001: unique constraint (ORA_USER.SYS_C007141) violated
-- CONSTRAINT_NAME = SYS_C007141 로 에러 코드와 동일하다.
-- 상단의 코드는 컴퓨터 마다 다르다.
-- 이것이 시스템 뷰의 속성 명칭이 된다.
INSERT INTO EX2_8 VALUES('AA','AA');

DROP TABLE EX2_8;

SELECT * FROM EX2_8;

--- 테이블의 PRIMARY_KEY  수동생성하기.
CREATE TABLE EX2_8 (
    COL1    VARCHAR2(10)  CONSTRAINT pk_coll PRIMARY KEY,
    COL2    VARCHAR2(10)    
    );

commit;


CREATE TABLE DEFT_CONST (
        DEFTNO      NUMBER(2)           CONSTRAINT      DEFTCONST_DEFFNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14)        CONSTRAINT      DEFFCONST_DNAME_UNQ UNIQUE,
        LOC         VARCHAR2(13)        CONSTRAINT      DEFTCONST_LOC_NN    NOT NULL
    );

/* 
CREATE TABLE DEFT_CONST (
        DEFTNO      NUMBER(2)           CONSTRAINT      DEFTCONST_DEFFNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14)        UNIQUE,     -- 작성되지 않은것은 오라클 서버가 제약조건이름을 자동 생성한다
        LOC         VARCHAR2(13)        NOT NULL    -- 작성되지 않은것은 오라클 서버가 제약조건이름을 자동 생성한다
    );
*/

/*
사원 테이블명 : EMP
    - 사원 번호(EMP_ID)     - 데이터타입 :  정수 숫자, 제약조건 : PRIMARY KEY 제약이름 : PK_EMP_ID
    - 사원번호 (EMP_NAME)   - 데이터타입 :  데이터타입: 가변문자열, 길이 : 60 제약조건 NOT NULL 제약이름 : 생략
    - 입사일자(EXP_HIRE)    - 데이터타입 : 날짜, 길이: 없음. 제약조건 : NOT NULL 제약이름 : 생략

*/  
-- 기본키를 이용한 테이블 연습(단일키)

CREATE TABLE EMP  (
    EMP_ID      NUMBER                  CONSTRAINT PK_EXP_ID   PRIMARY KEY,
    EMP_NAME    VARCHAR2(60)            NOT NULL,
    EMP_HIRE    DATE                    NOT NULL
);

/* 
오류 보고 -
ORA-00907: missing right parenthesis
00907. 00000 -  "missing right parenthesis" 
-- PRIMARY KEY 사용시 CONSTRAINT 미입력으로 인한 오류
*/

/* 
테이블명 : GOODS
- 상품코드 G_CODE    정수숫자, 4  PRIMARY KEY : PK_GOODS_CODE
- 상품이름 G_NAME    가변문자 30  NOT NULL  
- 상품이름 G_PRICE   정수숫자 6   NULL
- 등록일 CREATE_DATE      날짜         NOT NULL
*/
-- 기본키를 이용한 연습)복합키)

CREATE TABLE GOODS (
    GCODE       NUMBER(4)       CONSTRAINT PK_GOODS_CODE PRIMARY KEY,
    G_NAME      VARCHAR2(30)    NOT NULL,
    G_PRICE     NUMBER(6)       NULL,
    CREATE_DATE DATE            NOT NULL
);

SELECT * FROM GOODS;

DROP TABLE GOODS;
-- 기본키를 이용한 테이블 연습(단일키)
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      PRIMARY KEY,
        PRO_NUM         NUMBER      PRIMARY KEY,
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL
        );
        
        
-- 기본키를 이용한 연습)복합키)

-- 에러 발생 
-- ORA-02260: table can have only one primary key
-- 02260. 00000 -  "table can have only one primary key"
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      PRIMARY KEY,
        PRO_NUM         NUMBER      PRIMARY KEY,
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL
        );
        
-- 위의 2개의 컬럼을 하나의 의미로 복합키로 설정을 할 경우 다음과 같다.
-- 마지막 컬럼에도 콤마를 추가 해 주어야 한다. 하단의 맨 마지막 코드만 콤마가 들어가지 않기 ?문.
CREATE TABLE ORDETAIL_TBL (
        ORD_CODE        NUMBER      UNIQUE,      
        PRO_NUM         NUMBER      UNIQUE,     
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,
        CONSTRAINT PK_CODE_NUM PRIMARY KEY (ORD_CODE,PRO_NUM)
        );

-- 에러발생 
-- SQL 오류: ORA-00947: not enough values
-- 00947. 00000 -  "not enough values" NOT NULL성격
INSERT INTO ORDETAIL_TBL VALUES ('','');


-- UNIQUE (유니크)
/*

단일키
복합키

*/

-- 테이블에 유니크 두개 생성, 각각 단일 키.
CREATE TABLE ORDERS_TBL_1(
        ORD_CODE        NUMBER      UNIQUE,  
        PRO_NUM         NUMBER      UNIQUE,
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL
        );
-- 자료를 테이블에 삽입 할 경우. 테이블 클릭 후 ORDERS_TEL_3 () 괄호안에 드래그 하여주면 바로 입력이 가능하다.
-- 영문 대 소문자 일괄변화는 ALT + '(작은따옴표)로 자동전환 시킬 수 있다.

--성공
INSERT INTO ORDERS_TBL_1 (ORD_CODE, PRO_NUM, DT_AMOUNT, DT_PRICE)
VALUES (1,1,10,500);
-- 에러 발생
-- ORA-00001: unique constraint (ORA_USER.SYS_C007165) violated
INSERT INTO ORDERS_TBL_1 (ORD_CODE, PRO_NUM, DT_AMOUNT, DT_PRICE)
VALUES (1,1,10,500);


-- 테이블에 UNIQUE를 1번만 선언 후 컬럼2개를 묶어 복합키로 생성
CREATE TABLE ORDERS_TBL_2 (
        ORD_CODE        NUMBER,      
        PRO_NUM         NUMBER,     
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,
        CONSTRAINT PK_CODE_NUM_2 UNIQUE (ORD_CODE,PRO_NUM)
        );

-- 자료를 테이블에 삽입 할 경우. 테이블 클릭 후 ORDERS_TEL_3 () 괄호안에 드래그 하여주면 바로 입력이 가능하다.
-- 영문 대 소문자 일괄변화는 ALT + '(작은따옴표)로 자동전환 시킬 수 있다.

-- 성공
INSERT INTO ORDERS_TBL_2 (ORD_CODE, PRO_NUM, DT_AMOUNT, DT_PRICE)
VALUES (1,2,10,500);

-- 성공 : 복합키는 동시에 만족되는 데이터를 삽입 시 에러가 발생한다.
-- 즉 컬럼1, 컬럼2가 둘다 문제가 되어야만 문제가 생기는 것이다.
INSERT INTO ORDERS_TBL_2 (ORD_CODE, PRO_NUM, DT_AMOUNT, DT_PRICE)
VALUES (1,1,10,500);


COMMIT;

/* 
    
    PRIMARY KEY(복합키)를 이용한 테이블 생성예제
    테이블명 COMPLEX_TEL
    컬럼명 : COL A B C D
    데이터 타입 : NUMBER , VARCHAR2 10 , NUMBER NULL, VARCHAR 2 19 N_NULL
    
기본키 복합키 : COL,A B 설정
 기본키 제약조건 명 : PK_COLAB
*/

CREATE TABLE COMPLEX_TEL (

    COLA        NUMBER, 
    COLB        VARCHAR2(10),
    COLC        NUMBER          NULL,
    COLD        VARCHAR2(10)    NOT NULL,
    
    -- PRIMARY KEY는 필수는 아니나 가급적 무조건 생성하도록 한다.
    CONSTRAINT PK_COMP_COLAB PRIMARY KEY (COLA,COLB)
);

/*
④ 외래키
외래키Foreign key는 테이블 간의 참조 데이터 무결성을 위한 제약조건이다.

    CONSTRAINT 외래키명 FOREIGN KEY(컬럼명, ...)
    REFERENCES 참조 테이블(참조 테이블 컬럼명, ...)
    
    참조되는 테이블이 기본키(복합키) 이면, 참조하는 테이블도 참조키( 복합키 ) 로 설정되어야 한다.
    
*/

-- 부서테이블 : DEPT
CREATE TABLE DEPT (
    DEPT_CODE       NUMBER          CONSTRAINT PK_DEPT_CODE PRIMARY KEY,
    DEPT_NAME       VARCHAR2(30)    NOT NULL
);
-- DROP TABLE DEPT;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- 삭제가 안된다. 왜냐면, 레퍼런스로 하단에서 사용중이기 때문
-- 참조(레퍼런스) 테이블 부터 지우는 것은 상관 없다.
-- 단 CASCADE CONSTRAINTS 옵션을 추가로 사용하면 삭제된다
-- DROP TABLE DEPT CASCADE CONSTRAINTS
-- 사원 테이블의 FOREIGN KEY 제약 조건도 삭제된다. 


-- 사원 테이블
-- 하단라인의 DEPT_CODE 부는 상단의 DEPT 테이블의 DEPT_CODE 부를 참조한다. (FOREIGN KEY)
-- 하단 행의 DEPT_CODE 테이블명은 마음대로 변경하여도 된다. 어차피 참조하는 값은 REFERENCES DEPT(DEPT_CODE)
-- 에서 가져오기 때문이다. 다만, 애초에 표를 만드는 작업이므로, 명칭을 같게 하는것이 옳다.
-- 참조의 경우 참조할 테이블명과, 데이터타입이 무조건 동일해야한다. 
-- 현재는 DEPT_CODE의 데이터 타입이 NUMBER 로 되어있기 때문에, 하단 EMP 테이블에서도 
-- 참조하려는 DEPT_CODE 컬럼의 데이터 타입또한 NUMBER 가 되어야 한다.

CREATE TABLE EMP (
    EMP_NO      NUMBER          CONSTRAINT  PK_EMP_NOR   PRIMARY KEY,
    EMP_NAME    VARCHAR2(30)    NOT NULL,
    DEPT_CODE   NUMBER          NULL        REFERENCES DEPT(DEPT_CODE) 
);

/* 
테이블 하단에 추가하여 테이블 단위의 작업을 할 수도 있다.
CONSTRAINT PK_EMP_DEPT FOREIGN KEY (DEPT_CODE) REFERENCE DEPT(DEPT_CODE)
*/
-- 각 테이블에 데이터 입력 
-- DEPT(부서테이블 = 참조데이터)에 먼저 생성해야한다.
INSERT INTO DEPT(DEPT_CODE, DEPT_NAME) VALUES(100, '총무부');
INSERT INTO DEPT(DEPT_CODE, DEPT_NAME) VALUES(101, '마케팅부');
INSERT INTO DEPT(DEPT_CODE, DEPT_NAME) VALUES(102, '영업부');
INSERT INTO DEPT(DEPT_CODE, DEPT_NAME) VALUES(103, '전략기획부');

SELECT * FROM DEPT;

-- EMP 사원 테이블
/*
SQL 오류: ORA-00926: missing VALUES keyword
00926. 00000 -  "missing VALUES keyword"
*/
-- INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES(1, '홍길동', 104); <- 참조테이블(부모테이블)에 자료가 없음
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (1, '홍길동', 100);
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (2, '손흥민', 102);
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (3, '이강인', 103);
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (4, '박지성', 101);
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (5, '이영표', 102);
INSERT INTO EMP(EMP_NO, EMP_NAME, DEPT_CODE) VALUES (6, '하석주', 100);

SELECT * FROM EMP;

-- 참조되는 테이블이 기본키(복합키) 이면, 참조하는 테이블도 참조키( 복합키 ) 로 설정되어야 한다.

CREATE TABLE TESTA (
    A   NUMBER,     
    B   VARCHAR2(10),  
    C   NUMBER,
    D   NUMBER,
    CONSTRAINT PK_TESTA PRIMARY KEY (A,B)
);


CREATE TABLE TESTB (
    X   NUMBER,   
    Y   VARCHAR2(10),
    M   VARCHAR2(100)      NOT NULL,
    N   NUMBER,
    CONSTRAINT FK_TESTB_TESTA FOREIGN KEY (X,Y) REFERENCES TESTA (A,B)
    );
    
    
COMMIT;

/*
⑤ CHECK
마지막으로 알아볼 제약조건으로 CHECK가 있다. 
컬럼에 입력되는 데이터를 체크해 특정 조건에 맞는 데이터만 입력 받고 
그렇지 않으면 오류를 뱉어 낸다.
CONSTRAINT 체크면, CHECK(체크조건)
*/

CREATE TABLE EX2_9 (
    NUM1        NUMBER          CONSTRAINTS CHECK1 CHECK (NUM1 BETWEEN 1 AND 9),
    GENDER      VARCHAR2(10)    CONSTRAINTS CHECK2 CHECK (GENDER IN ('MALE', 'FEMALE') )
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM   USER_CONSTRAINTS
WHERE  TABLE_NAME = 'EX2_9';

-- 오류
-- ORA-02290: check constraint (ORA_USER.CHECK2) violated
-- 숫자 범위를 벗어남. 숫자는 1~9 까지 
INSERT INTO EX2_9 VALUES(10,'MAN');

INSERT INTO EX2_9 VALUES(5,'FEMALE');

-- DEFAULT 속성 (기본값) > 제약조건은 아니다. 

CREATE TABLE EX2_10 (
    COL1        VARCHAR2(10)        NOT NULL,
    COL2        VARCHAR2(10)        NULL,
    CREATE_DATE DATE                DEFAULT SYSDATE    
);

-- EX2_10 테이블에는 3개의 컬럼이 존재하고 있다. 컬럼명이 존재하고있다.
-- 그래서 값도 반드시 3개가 존재해야한다. 
-- 그러나 COLUMN이 DEFAULT 이거나 NULL인 컬럼은 값을 생략 할 수 있다. (중요)

-- 오류 : not enough values > 컬럼을 표기 생략되면 3개 컬럼의 값을 일치해야한다.
INSERT INTO EX2_10 VALUES ('AA','BB');

-- 위의 문장을 올바르게 작성 하려면
INSERT INTO EX2_10(COL1, COL2) VALUES ('AA','BB'); -- CREATE_DATE 컬럼은 DEFAULT 기능이 값으로 작동한다.

INSERT INTO EX2_10(COL1, COL2) VALUES ('AA','AA');

-- DEFAULT 기능을 사용하지 않고 수동으로 날짜 데이터 삽입
INSERT INTO EX2_10 VALUES ('AA','BB', '2023-08-07');

SELECT * FROM EX2_10;

COMMIT;

CREATE TABLE EMP_CONST (
    EMPNO       NUMBER(4)       CONSTRAINTS    EMPCONST_EMPNO_PK    PRIMARY KEY,
    ENAME       VARCHAR2(10)    CONSTRAINTS    EMPCONST_ENAME_NM    NOT NULL,
    JOB         VARCHAR2(9),            
    TEL         VARCHAR2(20)    CONSTRAINTS    EMPCONST_TEL_UNQ     UNIQUE,
    HIREDATE    DATE,            
    SAL         NUMBER(7,2)     CONSTRAINTS    EMPCONST_SAL_CHK     CHECK (SAL BETWEEN 1000 AND 9999),
    COMM        NUMBER(7,2),
    DEPTNO      NUMBER(7)       CONSTRAINTS    EMPCONST_DEPTNO_FK   REFERENCES DEFT_CONST(DEFTNO)
    );


SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM   USER_CONSTRAINTS
WHERE  TABLE_NAME = 'EMP_CONST';

COMMIT;

-- 드랍 테이블
-- DROP TABLE[스키마,] 테이블명 [CASCASDE CONSTRAINTS]
-- CASCADE CONSTRAINTS를 붙이면 삭제할 테이블의 기본키와 
-- UNIQUE 키를 참조하는 참조 무결성 제약조건도 자동으로 삭제된다.

-- 테이블 변경 
CREATE TABLE EX2_TEST (
COLA    NUMBER      PRIMARY KEY,
COLB    VARCHAR2(10),
COLC    CHAR(10)    NOT NULL
);

DROP TABLE EX2_TEST;

DROP TABLE EX2_10;

CREATE TABLE EX2_10 (
    COL1        VARCHAR2(10)    NOT NULL,
    COL2        VARCHAR2(10)    NULL,
    CREATE_DATE DATE            DEFAULT SYSDATE
);

-- ① 컬럼명 변경: col1 컬럼 이름을 col11으로 변경
-- ALTER TABLE [스키마.]테이블명 RENAME COLUMN 변경전컬럼명 TO 변경후컬럼명;

ALTER TABLE EX2_10
RENAME COLUMN COL1 TO COL11;

SELECT * FROM EX2_10;

-- 테이블 컬럼 내역 확인 명령어

DESC EX2_10;

-- ② 컬럼 타입 변경: col2 컬럼을 VARCHAR2(10)에서 VARCHAR2(30)으로 변경
-- ALTER TABLE [스키마.]테이블명 MODIFY 컬럼명 데이터타입;

ALTER TABLE EX2_10 
MODIFY COL2 VARCHAR2(30);

-- ③ 컬럼 추가: col3 NUMBER 타입으로 신규 생성
-- ALTER TABLE [스키마.]테이블명 ADD 컬럼명 데이터타입;


ALTER TABLE EX2_10
ADD COL3    NUMBER;

-- ④ 컬럼 삭제: col3 컬럼을 삭제
-- ALTER TABLE [스키마.]테이블명 DROP COLUMN 컬럼명;

ALTER TABLE EX2_10
DROP COLUMN COL3;

-- ⑤ 제약조건 추가: col11에 기본키 추가
-- ALTER TABLE [스키마.]테이블명 ADD CONSTRAINTS 제약조건명 PRIMARY KEY (컬럼명, ..);
-- 나머지 보다 상대적으로 자주 쓰일 경우가 있다.

ALTER TABLE EX2_10
ADD CONSTRAINTS PK_EX2_10 PRIMARY KEY (COL11);

-- ⑥ 제약조건 삭제: col11에서 기본키 삭제
-- ALTER TABLE [스키마.]테이블명 DROP CONSTRAINTS 제약조건명;

-- 제약조건명만 적어주면 된다. 
-- 제약조건명 이후에 삭제하고자 하는 키 이름까지 추가할 경우,
-- ORA-01735: invalid ALTER TABLE option가 뜬다

ALTER TABLE EX2_10 
DROP CONSTRAINTS PK_EX2_10;
 
COMMIT;


-- 테이블 복사
-- 기존 테이블을 복사한다. 테이블 내부의 데이터 까지 복사한다.
-- 주로 테스트 용도 또는 백업용으로 사용한다. 
-- SELECT 컬럼 1, 컬럼2 ....
-- FROM 복사할 테이블 명

DESC EX2_9;

-- EX2_9테이블을 EX2_9_1로 테이블 복제

CREATE TABLE EX2_9_1 
AS
SELECT * FROM EX2_9;

CREATE TABLE EMP_01
AS 
SELECT EMP_NAME, EMPLOYEE_ID, HIRE_DATE, SALARY FROM EMPLOYEES

WHERE SALARY >= 10000;

DROP TABLE EMP_01;

-- 테이블 생성 및 데이터 조회 확인.

SELECT * FROM EMP_01;

-- 테이블 복사기능 : 제약조건 PRIMARY KEY가 복사 되지 않는다.

--01 | SELECT문
--가장 기본적인 SQL문으로 테이블이나 뷰에 있는 데이터를 조회할 때 사용하는 문장이다. 
--SQL문 중 사용빈도로 볼 때 가장 많이 사용하는 것이 SELECT문이며, 기본 구문은 다음과 같다.
--
--    SELECT * 혹은 컬럼
--    FROM [스키마.]테이블명 혹은 [스키마.]뷰명
--    WHERE 조건
--    ORDER BY 컬럼;

-- 질의 > 사원 테이블에서 급여가 5000이 넘는 사원을 조회.

SELECT * FROM EMPLOYEES;  -- 107건

SELECT EMPLOYEE_ID, EMP_NAME  
FROM EMPLOYEES
WHERE SALARY > 5000;  -- 58건

SELECT EMPLOYEE_ID, EMP_NAME SALARY
FROM EMPLOYEES;
WHERE SALARY> 5000;

-- 질의 사원 테이블에서 급여가 5000이 넘는 사원번호와 사원명을 조회( 단, 사번으로 오름차순 정렬)

SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID ABC;

GRANT CONNECT, RESOURCE TO ORA_USER;





















































