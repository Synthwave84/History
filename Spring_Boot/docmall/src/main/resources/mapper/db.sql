CREATE TABLE MBSP_TBL(
        MBSP_ID             VARCHAR2(15),
        MBSP_NAME           VARCHAR2(30)            NOT NULL,
        MBSP_EMAIL          VARCHAR2(50)            NOT NULL,
        MBSP_PASSWORD       CHAR(60)               NOT NULL,        -- 비밀번호 암호화 처리.
        MBSP_ZIPCODE        CHAR(5)                 NOT NULL,
        MBSP_ADDR           VARCHAR2(100)            NOT NULL,
        MBSP_DEADDR         VARCHAR2(100)            NOT NULL,
        MBSP_PHONE          VARCHAR2(15)            NOT NULL,
        MBSP_POINT          NUMBER DEFAULT 0        NOT NULL,
        MBSP_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL
);

ALTER TABLE MBSP_TBL
ADD CONSTRAINT PK_MBSP_ID PRIMARY KEY (MBSP_ID);

CREATE TABLE BOARD (
    BNO NUMBER, -- 글번호
    TITLE       VARCHAR2(100)   NOT NULL,   -- 제목
    CONTENT     VARCHAR2(1000)  NOT NULL,   -- 내용
    WRITER      VARCHAR2(100)   NOT NULL,   -- 작성자
    REGDATE     DATE    DEFAULT SYSDATE,    -- 등록일
    UPDATEDDATE DATE DEFAULT SYSDATE,       -- 수정일
    VIEWCOUNT   NUMBER DEFAULT 0,
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD;


DROP TABLE CATEGORY_TBL;
CREATE TABLE CATEGORY_TBL(
        CG_CODE            NUMBER    PRIMARY KEY,    -- 카테고리 코드
        CG_PARENT_CODE         NUMBER    NULL,           -- 상위카테고리 코드
        CG_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CG_PARENT_CODE) REFERENCES CATEGORY_TBL(CG_CODE)
);

cg_code, cg_parent_code, cg_name

-- / -> /

-- 1차 카테고리 : TOP(1) PANTS(2) SHIRTS(3) OUTER(4) SHOES(5) BAG(6) ACC(7)
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (1,NULL,'TOP');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (2,NULL,'PANTS');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (3,NULL,'SHIRTS');    
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (4,NULL,'OUTER');        
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (5,NULL,'SHOES');    
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (6,NULL,'BAG');    
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (7,NULL,'ACC');    

-- 1차카테고리 TOP : 1
-- 2차 카테고리 : 긴팔티 니트 맨투맨/후드티 프린팅티 나시 반팔티/7부티
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (8,1,'긴팔티');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
VALUES (9,1,'니트');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
VALUES (10,1,'맨투맨&#38;후드티');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
VALUES (11,1,'프린팅티');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
VALUES (12,1,'나시');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
VALUES (13,1,'반팔티&#38;7부티');

-- 1차카테고리 PANTS : 2
-- 2차카테고리 : 밴딩팬츠 청바지 슬랙스 면바지 반바지
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (14,2,'밴딩팬츠');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (15,2,'청바지');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (16,2,'슬랙스');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (17,2,'면바지');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (18,2,'반바지');
    
-- 1차카테고리 SHIRTS : 3
-- 2차카테고리 : 헨리넥/차이나 베이직 체크/패턴 청남방 스트라이프 

INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (19,3,'헨리넥&#38;차이나');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (20,3,'베이직');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (21,3,'체크&#38;패턴');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (22,3,'청남방');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (23,3,'스트라이프'); 
    
    
-- 1차카테고리 OUTER : 4
-- 2차카테고리 : 패딩 코트 수트/블레이져 자켓 블루종/MA-1 가디건/조끼 후드/집업

INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (24,4,'패딩');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (25,4,'코트');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (26,4,'수트&#38;블레이져');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (27,4,'자켓');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (28,4,'블루종&#38;MA-1');     
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (29,4,'가디건&#38;조끼');     
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (30,4,'후드&#38;집업');  
    
-- 1차카테고리 SHOES : 5
-- 2차카테고리 : 스니커즈 로퍼/구두 키높이신발/깔창 슬리퍼/쪼리/샌들
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (31,5,'스니커즈');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (32,5,'로퍼&#38;구두');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (33,5,'키높이신발&#38;깔창');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (34,5,'슬리퍼&#38;쪼리/샌들');
   
-- 1차카테고리 BAG : 6
-- 2차카테고리 : 백팩 토트/숄더백 크로스백 클러치
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (35,6,'백팩'); 
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (36,6,'토트/숄더백');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME)
    VALUES (37,6,'크로스백');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (38,6,'클러치');    
-- 1차카테고리 ACC : 7
-- 2차카테고리 : 양말/넥타이 모자 머플러/장갑 아이웨어 벨트/시계 기타
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (39,7,'양말/넥타이');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (40,7,'모자');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (41,7,'머플러&#38;장갑');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (42,7,'아이웨어');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME)
    VALUES (43,7,'벨트&#38;시계');
INSERT INTO category_tbl (CG_CODE,CG_PARENT_CODE,CG_NAME) 
    VALUES (44,7,'기타');

commit; -- 스프링에서 확인 안됨.

DROP TABLE PRODUCT_TBL;
CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER  CONSTRAINT  PK_PRO_NUM         PRIMARY KEY,
        CG_CODE            NUMBER            NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         VARCHAR2(4000)  /* CLOB */                  NOT NULL,       -- 내용이 4000BYTE 초과여부판단?
        PRO_UP_FOLDER       VARCHAR2(50)             NOT NULL,
        PRO_IMG             VARCHAR2(100)             NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL,  -- Y OR N
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CG_CODE) REFERENCES CATEGORY_TBL(CG_CODE)
);

-- 상품테이블의 상품코드(PRO_NUM) 컬럼에 사용목적
CREATE SEQUENCE SEQ_PRODUCT_TBL;


DROP TABLE CART_TBL;
--4.장바구니 테이블
CREATE TABLE CART_TBL(
        CART_CODE        NUMBER,
        PRO_NUM         NUMBER          NOT NULL,
        MBSP_ID         VARCHAR2(15)    NOT NULL,
        CART_AMOUNT      NUMBER          NOT NULL,
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM),
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID),
        CONSTRAINT PK_CART_CODE primary key(CART_CODE) 
);

create sequence seq_cart_code;


--5.주문내용 테이블
CREATE TABLE ORDER_TBL(
        ORD_CODE            NUMBER                  PRIMARY KEY,
        MBSP_ID             VARCHAR2(15)            NOT NULL,
        ORD_NAME            VARCHAR2(30)            NOT NULL,
        ORD_ZIPCODE        CHAR(5)                 NOT NULL,
        ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
        ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
        ORD_TEL             VARCHAR2(20)            NOT NULL,
        ORD_PRICE           NUMBER                  NOT NULL,  -- 총주문금액. 선택
        ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
        ORD_STATUS          VARCHAR2(20)            NOT NULL,   -- 주문상태
        PAYMENT_STATUS      VARCHAR2(20)            NOT NULL,    -- 결제상태
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);

create sequence seq_ord_code;

--6.주문상세 테이블
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
        PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,  -- 역정규화
        PRIMARY KEY (ORD_CODE ,PRO_NUM) 
);

DROP TABLE REVIEW_TBL;
--7.리뷰 테이블
CREATE TABLE REVIEW_TBL(
        REW_NUM         NUMBER,
        MBSP_ID         VARCHAR2(15)                NOT NULL,
        PRO_NUM         NUMBER                      NOT NULL,
        REW_CONTENT     VARCHAR2(200)               NOT NULL,
        REW_SCORE       NUMBER                      NOT NULL,
        REW_REGDATE     DATE DEFAULT SYSDATE        NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID),
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM)
);

ALTER TABLE REVIEW_TBL
ADD CONSTRAINT PK_REVIEW_TBL PRIMARY KEY(REW_NUM);

-- 결제테이블
CREATE TABLE PAYMENT 
(
  PAY_CODE NUMBER NOT NULL primary key 
, ORD_CODE NUMBER NOT NULL 
, MBSP_ID VARCHAR2(50 BYTE) NOT NULL 
, PAY_METHOD VARCHAR2(50 BYTE) NOT NULL 
, PAY_DATE DATE 
, PAY_TOT_PRICE NUMBER NOT NULL 
, PAY_NOBANK_PRICE NUMBER 
, PAY_NOBANK_USER VARCHAR2(50 BYTE) 
, PAY_NOBANK VARCHAR2(50 BYTE) 
, PAY_MEMO VARCHAR2(100 BYTE) 
, PAY_BANKACCOUNT VARCHAR2(50 BYTE) 
);

create sequence seq_payment_code;


--9.관리자(ADMIN)테이블
CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)    PRIMARY KEY,
    ADMIN_PW    CHAR(60)    NOT NULL,
    ADMIN_VISIT_DATE    DATE
);

admin_id, admin_pw, admin_visit_date

INSERT INTO ADMIN_TBL VALUES('admin', '$2a$10$dQFCMr0udCI865eG6SoIcOaNr3Y/dgBX.R4qf6rX5KA3jciSnnNjG',sysdate);


commit;



