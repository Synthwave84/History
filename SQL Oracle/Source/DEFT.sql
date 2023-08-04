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
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER,      
        PRO_NUM         NUMBER,     
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,
        CONSTRAINT PK_CODE_NUM PRIMARY KEY (ORD_CODE,PRO_NUM)
        );
        
    
        
        