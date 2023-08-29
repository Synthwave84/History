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

CREATE TABLE GOODS (
    GCODE       NUMBER(4)       CONSTRAINT PK_GOODS_CODE PRIMARY KEY,
    G_NAME      VARCHAR2(30)    NOT NULL,
    G_PRICE     NUMBER(6)       NULL,
    CREATE_DATE DATE            NOT NULL
);

SELECT * FROM GOODS;

DROP TABLE GOODS;