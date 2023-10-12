-- �Խ��� ���̺� ����

CREATE TABLE BOARD (
  
    BNO         NUMBER,                             -- �۹�ȣ
    TITLE       VARCHAR2(100)   NOT NULL,           -- ����
    CONTENT     VARCHAR2(1000)  NOT NULL,           -- ����
    WRITER      VARCHAR2(100)   NOT NULL,           -- �ۼ���
    REGDATE     DATE            DEFAULT SYSDATE,    -- �����
    UPDATEDDATE DATE            DEFAULT SYSDATE,    -- ������
    CONSTRAINT  PK_BOARD        PRIMARY KEY(BNO)
);

-- ������ ����
CREATE SEQUENCE SEQ_BOARD;

-- ������ ��ɾ� 

/* 

- SEQ_BOARD.NEXTVAL ���������� ���� �������� �ڵ����� �����´�
- SEQ_BOARD.CURRVAL  ���������� ���� ���� �� �� �ִ�.
*/
SELECT SEQ_BOARD.NEXTVAL FROM DUAL;
SELECT SEQ_BOARD.CURRVAL FROM DUAL;

