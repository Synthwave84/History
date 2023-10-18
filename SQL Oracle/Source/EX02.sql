-- �Խ��� ���̺� ���� �۾�

CREATE TABLE BOARD (
    BNO             NUMBER, -- �۹�ȣ
    TITLE           VARCHAR2(100)   NOT NULL, -- ������
    CONTENT         VARCHAR2(1000)  NOT NULL, -- �۳���
    WRITER          VARCHAR2(100)   NOT NULL, -- �ۼ���
    REGDATE         DATE    DEFAULT SYSDATE, -- �����
    UPDATEDDATE     DATE    DEFAULT SYSDATE, -- ������
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);
/*  ������ �ɼ�
    CREATE SEQUENCE my_seq1
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
*/

drop table BOARD;

alter table BOARD;

-- ������ ����
CREATE SEQUENCE SEQ_BOARD;

-- ������ ����
DROP SEQUENCE SEQ_BOARD;

-- ������ ���ɾ�
/* BNO(�۹�ȣ)�� ����
    - SEQ_BOARD.NEXTVAL : �ش� ���������� ���� ���� ���� �ڵ����� �����´�.
    - SEQ_BOARD.CURRVAL : �ش� �������� ���� ���� �� �� �ִ�.
*/
SELECT SEQ_BOARD.NEXTVAL FROM DUAL;

SELECT SEQ_BOARD.CURRVAL FROM DUAL;

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '�׽�Ʈ', '������ �Խ��ǿ���', 'user02');

SELECT * FROM BOARD;

--    �ֽű� ����
SELECT BNO, TITLE, CONTENT, WRITER, REGDATE, UPDATEDDATE FROM BOARD ORDER BY BNO DESC;

DELETE FROM BOARD WHERE CONTENT IS NOT NULL;

UPDATE BOARD SET TITLE= ? , CONTENT= ? , UPDATEDATE = SYSDATE WHERE BNO = ?;





COMMIT;



