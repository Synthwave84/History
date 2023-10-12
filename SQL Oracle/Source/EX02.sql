-- 게시판 테이블 생성

CREATE TABLE BOARD (
  
    BNO         NUMBER,                             -- 글번호
    TITLE       VARCHAR2(100)   NOT NULL,           -- 제목
    CONTENT     VARCHAR2(1000)  NOT NULL,           -- 내용
    WRITER      VARCHAR2(100)   NOT NULL,           -- 작성자
    REGDATE     DATE            DEFAULT SYSDATE,    -- 등록일
    UPDATEDDATE DATE            DEFAULT SYSDATE,    -- 수정일
    CONSTRAINT  PK_BOARD        PRIMARY KEY(BNO)
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD;

-- 시퀀스 명령어 

/* 

- SEQ_BOARD.NEXTVAL 시퀀스에서 다음 순번값을 자동으로 가져온다
- SEQ_BOARD.CURRVAL  시퀀스에서 현재 값을 알 수 있다.
*/
SELECT SEQ_BOARD.NEXTVAL FROM DUAL;
SELECT SEQ_BOARD.CURRVAL FROM DUAL;

