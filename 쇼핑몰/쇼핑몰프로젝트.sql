/*

*/
DROP TABLE MBSP_TBL;

-- 한글 데이터 크기?
SELECT LENGTHB('홍') FROM DUAL;

--1.회원가입 테이블
CREATE TABLE MBSP_TBL(
        MBSP_ID             VARCHAR2(15),
        MBSP_NAME           VARCHAR2(30)            NOT NULL,
        MBSP_EMAIL          VARCHAR2(50)            NOT NULL,
        MBSP_PASSWORD       CHAR(60)               NOT NULL,        -- 비밀번호 암호화 처리.
        MBSP_ZIPCODE        CHAR(5)                 NOT NULL,
        MBSP_ADDR           VARCHAR2(100)            NOT NULL,
        MBSP_DEADDR         VARCHAR2(100)            NOT NULL,
        MBSP_PHONE          VARCHAR2(15)            NOT NULL,
        MBSP_NICK           VARCHAR2(30)            NOT NULL UNIQUE,
        MBSP_RECEIVE        CHAR(1)  default 'Y'    NOT NULL,
        MBSP_POINT          NUMBER DEFAULT 0        NOT NULL,
        MBSP_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL
);

--실행
ALTER TABLE MBSP_TBL
ADD CONSTRAINT PK_MBSP_ID PRIMARY KEY (MBSP_ID);


SELECT * FROM MBSP_TBL;
DELETE FROM MBSP_TBL;

-- 회원기능

--1)회원가입
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user01','홍길동','user01@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무1','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user02','이승엽','user02@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무2','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user03','손흥민','user03@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무3','N');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user04','이정후','user04@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무4','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user05','박찬호','user05@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무5','N');   

COMMIT;

--2)아이디 중복체크
-- 데이타 존재 할 경우
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01'; -- 아이디 사용불가능
-- 데이타 존재 안 할 경우
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user06'; -- 아이디 사용가능

SELECT COUNT(MBSP_ID) FROM MBSP_TBL WHERE MBSP_ID = 'user01';  -- 0 OR 1 권장안함.

--3)회원수정
--3.1)비밀번호확인
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.2) 회원정보 수정페이지
SELECT MBSP_ID, MBSP_NAME, MBSP_PASSWORD, MBSP_ZIPCODE, MBSP_ADDR, MBSP_DEADDR, MBSP_PHONE, MBSP_NICK, MBSP_RECEIVE, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE, MBSP_LASTLOGIN
FROM MBSP_TBL
WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.3) 회원정보 수정하기
UPDATE MBSP_TBL
    SET MBSP_PASSWORD = ?, MBSP_ZIPCODE = ?, MBSP_ADDR = ?, MBSP_DEADDR = ?, MBSP_PHONE = ?, MBSP_RECEIVE = ?
WHERE MBSP_ID = ?;

--4) 회원정보 삭제하기
--4.1) 비밀번호 확인
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--4.2) 삭제하기
DELETE FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--5)아이디및비밀번호찾기
--5.1)아이디 찾기(메일 전송)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_NAME = '손흥민' AND MBSP_EMAIL = 'user03@abc.co.kr';
--5.2)비밀번호 찾기(메일 전송)
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = 'user03' AND MBSP_EMAIL = 'user03@abc.co.kr';


--6)로그인 기능(비밀번호가 암호화 처리 된 경우에는 문제발생)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

-- 비밀번호 암호화 된 경우
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = ?;

-- 비번 컬럼명의 암호화 된 데이타를 읽어와서, 비교하는 메서드를 통하여 작업하게된다.


--2.카테고리 테이블

DROP TABLE CATEGORY_TBL;
CREATE TABLE CATEGORY_TBL(
        CAT_CODE            NUMBER    PRIMARY KEY,    -- 카테고리 코드
        CAT_PRTCODE         NUMBER    NULL,           -- 상위카테고리 코드
        CAT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CAT_PRTCODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

-- / -> /

-- 1차 카테고리 : TOP(1) PANTS(2) SHIRTS(3) OUTER(4) SHOES(5) BAG(6) ACC(7)
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (1,NULL,'TOP');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (2,NULL,'PANTS');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (3,NULL,'SHIRTS');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (4,NULL,'OUTER');        
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (5,NULL,'SHOES');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (6,NULL,'BAG');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (7,NULL,'ACC');    

-- 1차카테고리 TOP : 1
-- 2차 카테고리 : 긴팔티 니트 맨투맨/후드티 프린팅티 나시 반팔티/7부티
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (8,1,'긴팔티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (9,1,'니트');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (10,1,'맨투맨&#38;후드티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (11,1,'프린팅티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (12,1,'나시');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (13,1,'반팔티&#38;7부티');

-- 1차카테고리 PANTS : 2
-- 2차카테고리 : 밴딩팬츠 청바지 슬랙스 면바지 반바지
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (14,2,'밴딩팬츠');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (15,2,'청바지');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (16,2,'슬랙스');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (17,2,'면바지');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (18,2,'반바지');
    
-- 1차카테고리 SHIRTS : 3
-- 2차카테고리 : 헨리넥/차이나 베이직 체크/패턴 청남방 스트라이프 

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (19,3,'헨리넥&#38;차이나');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (20,3,'베이직');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (21,3,'체크&#38;패턴');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (22,3,'청남방');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (23,3,'스트라이프'); 
    
    
-- 1차카테고리 OUTER : 4
-- 2차카테고리 : 패딩 코트 수트/블레이져 자켓 블루종/MA-1 가디건/조끼 후드/집업

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (24,4,'패딩');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (25,4,'코트');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (26,4,'수트&#38;블레이져');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (27,4,'자켓');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (28,4,'블루종&#38;MA-1');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (29,4,'가디건&#38;조끼');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (30,4,'후드&#38;집업');  
    
-- 1차카테고리 SHOES : 5
-- 2차카테고리 : 스니커즈 로퍼/구두 키높이신발/깔창 슬리퍼/쪼리/샌들
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (31,5,'스니커즈');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (32,5,'로퍼&#38;구두');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (33,5,'키높이신발&#38;깔창');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (34,5,'슬리퍼&#38;쪼리/샌들');
   
-- 1차카테고리 BAG : 6
-- 2차카테고리 : 백팩 토트/숄더백 크로스백 클러치
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (35,6,'백팩'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (36,6,'토트/숄더백');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (37,6,'크로스백');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (38,6,'클러치');    
-- 1차카테고리 ACC : 7
-- 2차카테고리 : 양말/넥타이 모자 머플러/장갑 아이웨어 벨트/시계 기타
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (39,7,'양말/넥타이');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (40,7,'모자');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (41,7,'머플러&#38;장갑');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (42,7,'아이웨어');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (43,7,'벨트&#38;시계');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (44,7,'기타');

commit;
    

-- 1차카테고리 출력
SELECT cat_code,cat_prtcode,cat_name FROM category_tbl WHERE cat_prtcode IS NULL;

-- 1차카테고리 TOP 의 2차카테고리 출력.
SELECT * FROM category_tbl WHERE cat_prtcode = 1;


-- 2차카테고리 전부 출력하라.
SELECT * FROM category_tbl WHERE cat_prtcode IS NOT NULL;



SELECT * FROM category_tbl;
COMMIT;
ROLLBACK;

SELECT 055 FROM DUAL;  -- 컬럼이 NUMBER
SELECT '055' FROM DUAL; -- 컬럼이 VARCHAR2(10)
    
--3.상품정보 테이블
DROP TABLE PRODUCT_TBL;

/*
데이타가 존재한다는 전제조건에서
테이블의 컬럼이 
    NOT NULL -> NUL 로 변경 가능
    NULL -> NOT NULL 로 변경 불가능

*/
DROP TABLE PRODUCT_TBL;
CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER  CONSTRAINT  PK_PRO_NUM         PRIMARY KEY,
        CAT_CODE            NUMBER            NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         VARCHAR2(4000)  /* CLOB */                  NOT NULL,       -- 내용이 4000BYTE 초과여부판단?
        PRO_UP_FOLDER       VARCHAR(50)             NOT NULL,
        PRO_IMG             VARCHAR(50)             NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL,
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

pro_num, cat_code, pro_name, pro_price, pro_discount, pro_publisher, pro_content, pro_up_folder, pro_img, pro_amount, pro_buy, pro_date, pro_updatedate

-- 상품마다 이미지의 개수가 다를 경우 별도의 테이블을 구성(권장)
-- 상품설명 컬럼에 웹에디터를 이용한 태그코드 내용이 저장된다.

-- PRO_CONTENT컬럼이 CLOB 데이타 타입은 비교명령어를 지원안함.
SELECT * FROM product_tbl ORDER BY PRO_CONTENT ASC;



-- 상품등록작업
-- pro_up_folder 컬럼 : 업로드파일의 저장 날짜폴더이름.   운영체제별 경로구분자  유형1) /2023/04/06/   유형2)\2023\04\06\ 역슬래쉬


-- 1차카테고리 : TOP (코드 : 1)
-- 2차카테고리 : 긴팔티(코드 : 8)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder, pro_amount,pro_buy) 
VALUES (1,8,'A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (2,14,'A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (3,19,'A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (4,24,'A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (5,31,'A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06\','abc.gif',10,'Y');

-- 2차카테고리 : 니트(코드 : 9)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (6,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (7,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (8,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (9,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (10,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 맨투맨&후드티(코드 : 10)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (11,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (12,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (13,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (14,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (15,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 프린팅티(코드 : 11)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (16,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (17,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (18,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (19,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (20,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');


-- 2차카테고리 : 나시(코드 : 12)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (21,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (22,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (23,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (24,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (25,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 반팔티&7부티(코드 : 13)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (26,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (27,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (28,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (29,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (30,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

COMMIT;


/*********************************************************************
-- 상품리스트 출력
*/

-- 1차 카테고리별 상품목록 조회.  예) TOP(1) 1차카테고리 선택
SELECT * FROM product_tbl WHERE cat_code IN (SELECT cat_code FROM  category_tbl WHERE CAT_PRTCODE = ? );

SELECT * FROM product_tbl WHERE cat_code IN (SELECT cat_code FROM  category_tbl WHERE CAT_PRTCODE = 1 );

-- 2차 카테고리별 상품목록 조회.
SELECT * FROM product_tbl WHERE cat_code = ?;

SELECT * FROM product_tbl WHERE cat_code = 8;




-- 상품상세설명
/*
상품리스트에서 상품 하나를 선택하였을 때 나오는 페이지

*/
SELECT * FROM product_tbl WHERE PRO_NUM = ?;

SELECT * FROM product_tbl WHERE PRO_NUM = 1;

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

-- 장바구니에 로그인 사용자가 상품을 추가시, 존재 할경우는 수량변경, 존재 하지않는 경우 장바구니 추가(담기)

merge into cart_tbl
using dual
on (MBSP_ID = 'id값' and PRO_NUM = '상품코드')
when matched then
    update
        set CART_AMOUNT = CART_AMOUNT + 수량
when not matched then
    insert(cart_code, pro_num, mbsp_id, cart_amount)
    values(seq_cart_code.nextval,#{pro_num},#{mbsp_id},#{cart_amount})



-- cart_code, pro_num, mbsp_id, cart_amount



-- 로그인한 상태에서 장바구니 보기
SELECT * FROM CART_TBL WHERE MBSP_ID = ?;

-- 상품상세페이지에서 장바구니 담기 - MERGE 구문사용.
/*
주의? 장바구니에 동일한 상품이 존재하면, 수량이 변경(업데이트)작업 : UPDATE
                            존재하지 않으면, 상품을 장바구니에 추가 : INSERT
*/
MERGE
    INTO CART_TBL C
USING DUAL
    ON (C.MBSP_ID = ?) AND (C.PRO_NUM = ?)
 WHEN MATCHED THEN
    UPDATE
        SET C.CAT_AMOUNT = C.CAT_AMOUNT + ?
 WHEN NOT MATCHED THEN
    INSERT (C.CAT_CODE, C.PRO_NUM, C.MBSP_ID, C.CAT_AMOUNT)
    VALUES ( ?, ?, ?, ?);
    
    
-- 장바구니에 동일상품이 존재하는 지 여부만 확인    
SELECT COUNT(*) FROM CART_TBL WHERE (C.MBSP_ID = ?) AND (C.PRO_NUM = ?);

SELECT C.CAT_CODE FROM CART_TBL WHERE (C.MBSP_ID = ?) AND (C.PRO_NUM = ?);
    
    
    

INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (1,1,'user01', 2 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (2,5,'user01', 3 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (3,7,'user01', 5 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (4,12,'user02', 1 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (5,30,'user02', 2 );

SELECT * FROM cart_tbl;
COMMIT;

/*
주문하기
  - 1)장바구니 사용하고 장바구니에서 구매.
  - 2)장바구니 사용 안하고, 바로구매.
 
*/
-- 장바구니 리스트 조회




SELECT rownum, P.pro_img, p.pro_up_folder, P.pro_name, P.pro_price, C.cart_amount, P.pro_price * C.cart_amount as unitprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- 전체금액 : 100000
SELECT SUM(P.pro_price * C.cat_amount) as totalprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- 장바구니에서 수량변경
-- 수량을 직접변경
UPDATE cart_tbl
    SET CAT_AMOUNT = 10
WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;
-- 유의!!!!(수량을 누적)
UPDATE cart_tbl
    SET CAT_AMOUNT = CAT_AMOUNT + 10
WHERE CAT_CODE = 1;

-- 장바구니 상품삭제 ( CAT_CODE : 장바구니코드 )
DELETE FROM cart_tbl WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;

-- 장바구니 비우기 : 로그인 한 사용자 데이타만 삭제해야 한다.(주의)
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';


-- 결제하기 : 트랜잭션처리.
/*
주문테이블 : 주문자, 배송지(수령인) 등 
주문상세테이블 : 단위 상품정보
장바구니테이블 : 로그인 사용자의 상품정보 삭제
회원테이블 포인트 적립.
*/
DROP TABLE ORDER_TBL;
--5.주문내용 테이블
CREATE TABLE ORDER_TBL(
        ORD_CODE            NUMBER                  PRIMARY KEY,
        MBSP_ID             VARCHAR2(15)            NOT NULL,
        ORD_NAME            VARCHAR2(30)            NOT NULL,
        ORD_ADDR_NUM        CHAR(5)                 NOT NULL,
        ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
        ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
        ORD_TEL             VARCHAR2(20)            NOT NULL,
        ORD_PRICE           NUMBER                  NOT NULL,  -- 총주문금액. 선택
        ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);


insert into ORDER_TBL(ord_code, mbsp_id, ord_name, ord_addr_post, ord_addr_basic, ord_addr_detail, ord_tel, ord_price)
values


DROP TABLE ORDETAIL_TBL;
--6.주문상세 테이블
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
        PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,  -- 역정규화
        PRIMARY KEY (ORD_CODE ,PRO_NUM) 
);

insert into ORDETAIL_TBL(ord_code, pro_num, dt_amount, dt_price)
select c.pro_num, c.cart_amount, p.pro_price
from cart_tbl c inner join product_tbl p
on c.pro_num = p.pro_num;

-- 총주문금액
SELECT ORD_CODE, SUM(DT_AMOUNT * DT_PRICE) FROM ORDETAIL_TBL WHERE ORD_CODE = ?;

/*

장바구니 -> 주문하기 클릭 후 -> 주문정보 페이지

*/
-- 주문정보 페이지 구성

-- 주문자 정보 내역
SELECT  *
FROM mbsp_tbl
WHERE mbsp_id = 'user01';

-- pay_code, odr_code, mbsp_id, pay_method, pay_price, pay_user, pay_bank, pay_date, pay_memo

create sequence seq_payment_tbl;

/*
트랜잭션(예외처리포함)기능을 적용해야 되는경우?
하나의 기능에 복수의 작업을 할 경우(INSERT, UPDATE, DELETE, MERGE 등)
*/


/*
주문정보를 입력 후 주문하기 진행을 할 경우 세부적인 작업이 동시에 이루어진다.

트랜잭션(예외처리포함)기능을 적용해야한다.
- 주문정보 입력(주문테이블, 주문상세태이블)
- 포인트 변경
- 장바구니 삭제
- 결제

*/

-- 주문정보 기능.   1)스프링(SQL 구문사용)에서 트랜잭션적용 작업  2) 프로시저에서 트랜잭션 적용 작업
--장바구니 내역참조
SELECT * FROM cart_tbl WHERE mbsp_id = 'user01';

--1)주문테이블 
INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
VALUES (1,'user01','홍길동','10050','전라북도 고창','성삼면 100리','010-555-5555',20000);

--2)주문상세테이블 - 상품별로 데이타 삽입

INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 5, 3, 1000);
INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 7, 5, 1000);

--3)장바구니테이블
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--4) 포인트 사용
UPDATE mbsp_tbl
SET mbsp_point = mbsp_point + 50    -- 50 포인트 값
WHERE mbsp_id = 'user01';

COMMIT;

-- 주문내역 조회 리스트

SELECT * FROM ORDER_TBL;
SELECT * FROM ORDETAIL_TBL;

-- 상품, 주문, 주문상세 조인을 이용한 주문내역조회
SELECT rownum, OD.ORD_REGDATE, P.PRO_NAME , OT.DT_AMOUNT * OT.DT_PRICE  as SALEPRICE
FROM ORDER_TBL od   INNER JOIN ORDETAIL_TBL ot
ON od.ord_code = ot.ord_code
INNER JOIN PRODUCT_TBL p
ON OT.PRO_NUM = P.PRO_NUM
WHERE od.mbsp_id = 'user01';


-- 위의 4가지 작업을 프로시저로 구성(트랜잭션 적용)
CREATE OR REPLACE PROCEDURE UDP_ORDERINFO_PROCESS
(
    p_ord_code          IN    order_tbl.ord_code%TYPE,
    p_mbsp_id           IN    mbsp_tbl.mbsp_id%TYPE,
    p_ord_name          IN    order_tbl.ord_name%TYPE,
    p_ord_addr_num      IN    order_tbl.ord_addr_num%TYPE,
    p_ord_addr_basic    IN    order_tbl.addr_basic%TYPE,
    p_ord_addr_detail   IN    order_tbl.ord_addr_detail%TYPE,
    p_ord_tel           IN    order_tbl.ord_tel%TYPE,
    p_ord_price         IN    order_tbl.ord_price%TYPE,
    
    
    /*
    아래 3개의 매개변수는 장바구니의 상품개수만큼 데이타가 존재해야 한다.
    예) 장바구니 데이타 3개 인 경우 매개변수의 값도 3개의 내용을 가져야 한다.
    */
    p_pro_num           IN    ,
    p_dt_amount         IN      ,
    p_dt_price          IN      ,
    
    
    
    p_mbsp_point        IN     mbsp_tbl.mbsp_point%TYPE 
)
IS

BEGIN
    --1)주문테이블 입력
    INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
        VALUES (1,p_mbsp_id,'홍길동','10050','전라북도 고창','성삼면 100리','010-555-5555',20000);
    --2)주문상세테이블 입력   
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 5, 3, 1000);
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 7, 5, 1000);
    
    --3)장바구니테이블 삭제
    DELETE FROM cart_tbl WHERE mbsp_id = 'user01';
    
    --4)회원테이블 포인트 변경
    UPDATE mbsp_tbl
        SET mbsp_point = mbsp_point - 50    -- 50 포인트 값
    WHERE mbsp_id = 'user01';

    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;

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



create sequence seq_REVIEW_TBL;

-- rew_num, mbsp_id, pro_num, rew_content, rew_score, rew_regdate

--상품후기 입력
SELECT * FROM ORDETAIL_TBL;

INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (1, 'user01',5,'무난하다.', 4 );
INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (2, 'user01',7,'아주 좋다.', 5 );
    
    
COMMIT;    
SELECT * FROM  review_tbl; 

-- 상품상세설명(앞부분)/ 상품후기(뒷부분)

SELECT * FROM PRODUCT_TBL WHERE PRO_NUM = 5;

SELECT * FROM review_tbl WHERE PRO_NUM = 5;

DROP TABLE BOARD_TBL;

--8.게시판 테이블

CREATE SEQUENCE BOARD_NUM_SEQ;
CREATE TABLE BOARD_TBL(
        BRD_NUM         NUMBER  CONSTRAINT PK_BOARD_BRD_NUM  PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)            NOT NULL,
        BRD_TITLE       VARCHAR2(100)           NOT NULL,
        BRD_CONTENT     VARCHAR2(4000)          NOT NULL,
        BRD_REGDATE     DATE DEFAULT SYSDATE    NOT NULL
       
);

-- 참조키 추가
ALTER TABLE BOARD_TBL ADD CONSTRAINT FK_BOARD_MBSP_ID
FOREIGN KEY (MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID);

--9.관리자(ADMIN)테이블
CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)    PRIMARY KEY,
    ADMIN_PW    CHAR(60)    NOT NULL,
    ADMIN_VISIT_DATE    DATE
);

admin_id, admin_pw, admin_visit_date

INSERT INTO ADMIN_TBL VALUES('admin', '$2a$10$dQFCMr0udCI865eG6SoIcOaNr3Y/dgBX.R4qf6rX5KA3jciSnnNjG',sysdate);


commit;


-- 인덱스 힌트 문법설명
-- BOARD_TBL 게시판테이블 더미데이터 작업
INSERT INTO BOARD_TBL(BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
VALUES(BOARD_NUM_SEQ.NEXTVAL, 'USER01', '제목1', '내용1', SYSDATE);


INSERT INTO BOARD_TBL(BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
SELECT BOARD_NUM_SEQ.NEXTVAL, 'USER04', '제목4', '내용4', SYSDATE FROM BOARD_TBL;

COMMIT;


/*
인덱스 힌트 명령어
INDEX : 오름차순.  INDEX_ASC
INDEX_DESC : 내림차순
*/
-- order by  구문사용
SELECT * FROM BOARD_TBL ORDER BY BRD_NUM DESC;

-- 인덱스 힌트 구문사용
SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;
    
SELECT /*+ INDEX_ASC(b PK_BOARD_BRD_NUM )  */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;
    
-- 인덱스명이 틀린 경우   K_BOARD_BRD_NUM -> K_BOARD_BRD_NUM2 
SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM2 )  */
BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;


-- 페이징쿼리 설명.
-- 키워드 ROWNUM 사용
SELECT * FROM BOARD_TBL WHERE ROWNUM <= 10 ORDER BY BRD_NUM DESC;

SELECT * FROM BOARD_TBL WHERE ROWNUM >= 5 AND ROWNUM <=10; -- 출력결과가 없다. ROWNUM 동작원리 때문에.

-- 위의 동작원리 때문에 인라인 뷰를 사용
-- 페이지 1 클릭
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( 
        SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */ 
            ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
            FROM BOARD_TBL b
    )
WHERE RN >=1 AND RN <=3;

-- 페이지 2 클릭
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( 
        SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */
            ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
            FROM BOARD_TBL b
    )
WHERE RN >=4 AND RN <=6;














