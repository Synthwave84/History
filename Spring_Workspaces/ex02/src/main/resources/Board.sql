-- 게시판 테이블 생성 작업

CREATE TABLE BOARD (
    BNO             NUMBER, -- 글번호
    TITLE           VARCHAR2(100)   NOT NULL, -- 글제목
    CONTENT         VARCHAR2(1000)  NOT NULL, -- 글내용
    WRITER          VARCHAR2(100)   NOT NULL, -- 작성자
    REGDATE         DATE    DEFAULT SYSDATE, -- 등록일
    UPDATEDDATE     DATE    DEFAULT SYSDATE, -- 수정일
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);
/*  시퀀스 옵션
    CREATE SEQUENCE my_seq1
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
*/
-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD;

-- 시퀀스 명령어
/* BNO(글번호)에 적용
    - SEQ_BOARD.NEXTVAL : 해당 시퀀스에서 다음 순번 값을 자동으로 가져온다.
    - SEQ_BOARD.CURRVAL : 해당 시퀀스의 현재 값을 알 수 있다.
*/
SELECT SEQ_BOARD.NEXTVAL FROM DUAL;

SELECT SEQ_BOARD.CURRVAL FROM DUAL;
