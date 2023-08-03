CREATE TABLE DEFT_CONST (
        DEFTNO      NUMBER(2)           CONSTRAINT      DEFTCONST_DEFFNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14)        CONSTRAINT      DEFFCONST_DNAME_UNQ UNIQUE,
        LOC         VARCHAR2(13)        CONSTRAINT      DEFTCONST_LOC_NN    NOT NULL
    );

/* 
CREATE TABLE DEFT_CONST (
        DEFTNO      NUMBER(2)           CONSTRAINT      DEFTCONST_DEFFNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14)        UNIQUE,     -- �ۼ����� �������� ����Ŭ ������ ���������̸��� �ڵ� �����Ѵ�
        LOC         VARCHAR2(13)        NOT NULL    -- �ۼ����� �������� ����Ŭ ������ ���������̸��� �ڵ� �����Ѵ�
    );
*/

/*
��� ���̺�� : EMP
    - ��� ��ȣ(EMP_ID)     - ������Ÿ�� :  ���� ����, �������� : PRIMARY KEY �����̸� : PK_EMP_ID
    - �����ȣ (EMP_NAME)   - ������Ÿ�� :  ������Ÿ��: �������ڿ�, ���� : 60 �������� NOT NULL �����̸� : ����
    - �Ի�����(EXP_HIRE)    - ������Ÿ�� : ��¥, ����: ����. �������� : NOT NULL �����̸� : ����

*/  

CREATE TABLE EMP  (
    EMP_ID      NUMBER                  CONSTRAINT PK_EXP_ID   PRIMARY KEY,
    EMP_NAME    VARCHAR2(60)            NOT NULL,
    EMP_HIRE    DATE                    NOT NULL
);

/* 
���� ���� -
ORA-00907: missing right parenthesis
00907. 00000 -  "missing right parenthesis" 
-- PRIMARY KEY ���� CONSTRAINT ���Է����� ���� ����
*/

/* 
���̺�� : GOODS
- ��ǰ�ڵ� G_CODE    ��������, 4  PRIMARY KEY : PK_GOODS_CODE
- ��ǰ�̸� G_NAME    �������� 30  NOT NULL  
- ��ǰ�̸� G_PRICE   �������� 6   NULL
- ����� CREATE_DATE      ��¥         NOT NULL
*/

CREATE TABLE GOODS (
    GCODE       NUMBER(4)       CONSTRAINT PK_GOODS_CODE PRIMARY KEY,
    G_NAME      VARCHAR2(30)    NOT NULL,
    G_PRICE     NUMBER(6)       NULL,
    CREATE_DATE DATE            NOT NULL
);

SELECT * FROM GOODS;

DROP TABLE GOODS;