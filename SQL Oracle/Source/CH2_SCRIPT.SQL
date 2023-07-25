-- �����ͺ��̽� ���α׷��� : SQL 

/* 
    ���̺�: �����͸� �����ϰ� �����ϴ� ��ü
    ���̺� : ROW , COLUMN���� �����Ǿ��ִ�.
    
    ���̺� ���� ����
    CREATE TABLE [��Ű��.]���̺���(
        �÷�1 �÷�1_������Ÿ�� [NULL, NOT NULL],
        �÷�2 �÷�2_������Ÿ�� [NULL, NOT NULL],
    ...
    )[TABLESPACE ���̺������̽���];
    
    ��Ű�� : �����ͺ��̽� ��ü�� �����ϴ� �ǹ�. 
    ���̺� ������ ��Ű���� �����ϸ�, ������ ������ �̸����� ���۵ȴ�. 
    EX) ���� ���� ������ ORA_USER �����̸��� ��Ű�������� �����ȴ�.
    
    1. ���̺���, �÷����� �ִ� ũ��� 30����Ʈ��.

    2. ���̺���, �÷������� ������ ����� �� ����.

    (�����(Ű����)�� ����Ŭ���� �̸� ������ �ܾ�� SELECT, UPDATE�� ���� ����, 
    COUNT, ASC�� ���� SQL �Լ� ���� ������, ����� ����� 
    V\$RESERVED_WORDS �ý��� �信�� ��ȸ�� �� �ִ�)

    3. ���̺���, �÷������� ����, ����, ��_��, ��\$��, ��#���� ����� �� ������, ù ���ڴ� ���ڸ� �� �� �ִ�.

    4. �� ���̺��� ��� ������ �÷��� �ִ� 255��������.

    1, 2, 3�� ������ ���̺��� �÷��Ӹ� �ƴ϶� ����Ŭ�� �ִ� ��� �����ͺ��̽� ��ü �̸��� ������ ���� ����ȴ�.
*/
-- ȸ�����̺�.

CREATE TABLE MEMBER (
    U_ID        VARCHAR2(16)    NOT NULL PRIMARY KEY,
    U_NAME      VARCHAR2(30)    NOT NULL,
    U_PW        VARCHAR2(15)    NOT NULL,
    U_BIRTH     CHAR(10)        NOT NULL,
    U_GENDER    CHAR(6)         NOT NULL,
    U_EMAIL     VARCHAR2(50)    NOT NULL,
    U_TEL1      VARCHAR2(20)    NOT NULL,
    U_TEL2      VARCHAR(20)     NULL, -- ���� ���� ���� �ִ�. �� ���� �޾ƾ� �� ��� NOT NULL
    U_POST      CHAR(5)         NOT NULL,
    U_ADDR1     VARCHAR2(50)    NOT NULL,
    U_ADDR2     VARCHAR2(50)    NOT NULL,
    U_EMAIL_CHK CHAR(1)         NOT NULL,
    U_SMS_CHK   CHAR(1)         NOT NULL
 );

-- SELECT �� : ���̺��� �����͸� ��ȸ�ϴ� ���ɾ�.
SELECT * FROM MEMBER; -- ���̺����� ��� �÷����� ��ȸ�϶�.

-- �Խ��� ���̺�
CREATE TABLE BOARD (
    B_IDX       NUMBER          PRIMARY KEY,
    B_SUBJECT   VARCHAR2(100)   NOT NULL,
    B_CONTENT   VARCHAR2(4000)  NOT NULL,
    B_WRITER    VARCHAR2(50)    NOT NULL,
    -- ����ڿ��� �Է¹��� �ʰ� �ڵ����� ó��(DEFAULT) ����Ŭ�� ������������ �������°� (SYSDATE)
    -- ���帶���� ������ �޸��� ���ش�.
    B_REGDATE   DATE            DEFAULT SYSDATE
    );