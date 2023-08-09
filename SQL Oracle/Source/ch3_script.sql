-- ORA_USER���� ���ӽ� ���̺� ���� Ȯ��.
-- ��ҹ��� ������ ���� �ʴ´�.
-- �ڵ带 �����Ϸ���, �ڵ� ��ϼ���
SELECT TABLE_NAME FROM USER_TABLES;

-- ���̺� : ������ ���� �� �����ϴ� ��ü,
-- ���̺� : 1) ����� ���̺� 2) �ý��� ��
/*
���� �⺻���� SQL������ ���̺��̳� �信 �ִ� �����͸� ��ȸ�� �� ����ϴ� �����̴�. 
SQL�� �� ���󵵷� �� �� ���� ���� ����ϴ� ���� SELECT���̸�, �⺻ ������ ������ ����.

    SELECT * Ȥ�� �÷�
    FROM [��Ű��.]���̺�� Ȥ�� [��Ű��.]���
    WHERE ����
    ORDER BY �÷�;
*/
-- SELECT �� ��ɾ�. 



-- ����> ��� ���̺��� �޿��� 5000�� �Ѵ� �����ȣ�� ������� ��ȸ

SELECT  employee_id, emp_name
FROM employees
WHERE salary > 5000;

SELECT EMPLOYEE_ID, EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 5000;


-- ����> ��� ���̺��� �޿��� 5000�� �Ѵ� �����ȣ�� ������� ��ȸ(��, ������� �������� ����)

SELECT  employee_id, emp_name
FROM employees
WHERE salary > 5000
ORDER BY employee_id; -- ASC ����. �⺻��

SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID ASC;

-- ����> ��� ���̺��� �޿��� 5000�� �Ѵ� �����ȣ�� ������� ��ȸ(��, ������� �������� ����)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID DESC;

-- �̸��÷��� �������� ���� (�÷� 1��)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY EMP_NAME ASC; -- ASC ��������

-- �÷��� ������ ����
SELECT JOB_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY JOB_ID ASC /* 1������*/, EMP_NAME  ASC /*2�� ����*/;

-- EMPLOYEE_ID �÷��� pk�̹Ƿ�, �ߺ��� ����Ÿ�� ������Ѵ�.
-- EMPLOYEE_ID �÷��� 1�� �����ϴ� ���� 2�����ĺ��ʹ� �ǹ̰� ����.
-- �����ȣ, �̸��� �����϶�.
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID ASC, EMP_NAME ASC;

-- ��Ī���
SELECT EMPLOYEE_ID AS E_ID, EMP_NAME  ENAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID ASC

-- �÷��� ����� ����.(�� �÷��� ���ڵ����� Ÿ��)
SELECT EMPLOYEE_ID, EMP_NAME, SALARY, SALARY * 1.5 AS SALARY2
FROM EMPLOYEES;

-- �������. 


-- �÷����� ���Ṯ�ڿ��� ���� �ϳ��� �÷����� ��ȸ
SELECT EMPLOYEE_ID || ' / ' || MANAGER_ID AS ID_MANAGER
FROM EMPLOYEES;

-- �÷��� ���� �ٲٱ�
SELECT EMP_NAME, EMPLOYEE_ID, EMP_NAME, EMPLOYEE_ID 
FROM EMPLOYEES;

-- ���ǽ��� �߰��� AND, OR ������ ���.
-- ����? �޿��� 5000 �̻��̰� job_id�� ��IT_PROG���� ����� ��ȸ�Ѵٸ�, AND �����ڿ� job_id�� �˻��ϴ� ������ �߰��Ѵ�.

SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
  AND job_id = 'IT_PROG'
ORDER BY employee_id;


-- ���ڿ� ����Ÿ�� ��,�ҹ��� �����Ѵ�.
-- ����� �ִ�.
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY >= 5000 AND JOB_ID = 'IT_PROG'  -- �빮��
ORDER BY EMPLOYEE_ID;

-- ����� ����.
SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
  AND job_id = 'it_prog'    -- �ҹ���
ORDER BY employee_id;

-- ����? �޿��� 5000 �̻��̰ų� job_id�� ��IT_PROG���� ���, �� �޿��� 5000 �̻��� ��� Ȥ�� job_id ���� ��IT_PROG���� ����� ��ȸ�Ѵٸ�, AND ��� OR �����ڿ� ������ �߰��� ���̸� �ȴ�.

SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
   OR job_id = 'IT_PROG'
ORDER BY employee_id;

-- ��Ī
-- �÷��� ��Ī
-- ���̺�� ��Ī
SELECT a.employee_id, a.emp_name, a.department_id, 
b.department_name AS dep_name
 FROM employees a, 
       departments b
 WHERE a.department_id = b.department_id;
 
 -- �ó�����?
 -- DEPARTMENT_ID�� 60 �̰�, JOB_ID�� 'IT_PROG'�� ����Ÿ ��ȸ�϶�, DEPARTMENT_ID -> DEPT_ID, JOB_ID -> J_ID ��Ī�̿�
 SELECT DEPARTMENT_ID AS DEPT_ID, JOB_ID AS J_ID
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60 AND JOB_ID = 'IT_PROG';
 
 
 -- �޿��� 4000�̻��̰�, 8000������ ����Ÿ ��ȸ�϶�.(�����ȣ, �̸�, �޿�). �޿��� �������� ����.
 SELECT EMPLOYEE_ID, EMP_NAME, SALARY
 FROM EMPLOYEES 
 WHERE SALARY >= 4000 AND SALARY <= 8000
 ORDER BY SALARY ASC;  -- ��� ����Ÿ�� ������ ���Ŀ� ���.(����� ������ ��ġ�� ����)
 
 /*
 ���ۼ���: 
 FROM EMPLOYEES(107��) -> WHERE SALARY >= 4000 AND SALARY <= 8000(���͸�) -> SELECT EMPLOYEE_ID, EMP_NAME, SALARY
 */



-- INSERT : ���̺� �����͸� �߰��ϴ� ��ɾ�
/*
 INSERT INTO [��Ű��.]���̺�� (�÷�1, �÷�2, ...)
    VALUES (��1, ��2, ...);
    �÷��� ������ ���� ����, Ÿ���� ��ġ�ؾ� �Ѵ�.
*/
CREATE TABLE ex3_1 (
    col1   VARCHAR2(10),  -- NULL
    col2   NUMBER,       -- NULL
    col3   DATE    );    -- NULL
    
-- �÷��� ������ ����, Ÿ���� ��ġ�ؾ� �Ѵ�.  ����
INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, SYSDATE);  

-- �÷��� ������ �����Ͽ�, ���� �����Ҽ��� �ִ�.  ����
INSERT INTO ex3_1 (col3, col1, col2)
VALUES (SYSDATE, 'DEF', 20);  

-- col3 DATE Ÿ�Կ� 30 ���ڵ����͸� ������ ���. ����ŸŸ�� ����ġ�� �����߻�.
INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, 30);  



-- �÷� ������ ����. ���̺��� ����÷��� �Է��ϴ� �ǹ�. �÷������� ���̺� ������ �ۼ��� ���� COL1, COL2, COL3
INSERT INTO ex3_1 
VALUES ('GHI', 10, SYSDATE);  

-- COL3 �÷��� NULL ����̹Ƿ� ������ ����. COL3�÷��� INSERT�� ����� NULL ó���� �ȴ�.
INSERT INTO ex3_1  (col1, col2 )
VALUES ('GHI', 20);

-- �÷��� ������ ����. ��� �÷��� ���.
-- 1), 2)������ ������ �ǹ̷� �ؼ��ȴ�.
-- 1) �÷��� 3���ε� ���� 3���� ����Ͽ�, �����߻�
INSERT INTO ex3_1  
VALUES ('GHI', 30);

--2)
INSERT INTO ex3_1 (COL1, COL2, COL3) 
VALUES ('GHI', 30);

/*
����> VALUES���� ����.
INSERT ~ SELECT ����
    INSERT INTO [��Ű��.]���̺�� (�÷�1, �÷�2, ...)
    SELECT ��; -- ������ ����. �� VALUES ��ɸ����� �Ѵ�.
*/    


-- employees���̺��� �����Ͽ�, ������.

CREATE TABLE ex3_2 (
       emp_id    NUMBER,    -- �����ȣ
       emp_name  VARCHAR2(100));    -- ����̸�


--   employees���̺��� ����Ÿ��   ex3_2���̺� ����Ÿ �����ϴ� ����   
INSERT INTO ex3_2 ( emp_id, emp_name ) 
SELECT employee_id, emp_name
 FROM employees
WHERE salary > 5000;

INSERT INTO ex3_2(emp_id, emp_name)
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;  -- 58���� ����Ÿ�� ex3_2���̺� �߰���.

-- ������ ����
-- SELECT���� ����� ������ ����Ÿ�� �̿��Ͽ�, ex3_2_2���̺� ������ �Ѵ�.
-- PRIMARY KEY�� �������� ���簡 �ȵ�.
CREATE TABLE ex3_2_2
AS
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

       
--  ������ Ÿ���� ������ �ʾƵ� INSERT�� �����ϴ� ��찡 �ִ� (�ڵ� ����ȯ)
/*
COL1    VARCHAR2(10)  �� 10
COL2    NUMBER        �� '10'
COL3    DATE          �� '2014-01-01'
*/
INSERT INTO ex3_1 (col1, col2, col3)
VALUES (10, '10', '2014-01-01');

-- ���̺� ����Ȯ��
DESC ex3_1;

       
-- UPDATE
/*
���̺� �ִ� ���� �����͸� ������ �� ����ϴ� ������ UPDATE���̴�.

    UPDATE [��Ű��.]���̺��
    SET �÷�1 = ���氪1,
        �÷�2 = ���氪2,
    ...
    WHERE ����;
*/    
SELECT *
FROM ex3_1;

-- ex3_1���̺��� col2 ���� ��� 50���� ������ ����. ������ �������� �ʴ´�.
UPDATE ex3_1 -- ���� WHERE���� ������, ���̺��� ��絥��Ÿ�� �����Ѵٴ� �ǹ̰��ȴ�.
   SET col2 = 50;
   
SELECT *
FROM ex3_1;

/*
�� ��° �ο��� col3 ���� ��� �ִµ�, 
�� ���� ���� ��¥�� ������ ����. �̸� ���ؼ��� �� ��° �ο츦 �˻��ϴ� ������ �ʿ��ѵ�, 
col3 ���� NULL�� ���� ã���� �ȴ�.
*/
--1)'' �� NULL�ǹ̰� �ƴϴ�. 0�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
UPDATE ex3_1
   SET col3 = SYSDATE
WHERE col3 = '';    -- ���ǽĿ� '' ����ϸ�, NULL �ǹ̰� �ƴ϶�, ������ �ǹ��Ѵ�. INSERT���� ''���� NULL�ǹ�.

--2) IS NULL.  1 �� ��(��) ������Ʈ�Ǿ����ϴ�.   ����> IS NOT NULL
UPDATE ex3_1
   SET col3 = SYSDATE
WHERE col3 IS NULL; -- COL3�÷��� ����Ÿ�� �ԷµǾ� �������� �ǹ�.

UPDATE ex3_1
    SET COL3 = NULL
WHERE COL1 = 'GHI';

UPDATE ex3_1
    SET COL3 = ''  -- NULL ��ó���� ��.
WHERE COL1 = 'GHI';

-- ����? COL3�� ����Ÿ�� �����ϴ� �͸� ��ȸ
SELECT *
FROM ex3_1
WHERE COL3 IS NOT NULL;


CREATE TABLE ex3_3 (
       employee_id NUMBER, 
       bonus_amt   NUMBER DEFAULT 0);

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id 
  FROM employees e, sales s
 WHERE e.employee_id = s.employee_id
   AND s.SALES_MONTH BETWEEN '200010' AND '200012'
 GROUP BY e.employee_id;
 
SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
  
 
 SELECT employee_id, manager_id, salary, salary * 0.01
   FROM employees 
  WHERE employee_id IN (  SELECT employee_id
                            FROM ex3_3 ); 
 
 SELECT employee_id, manager_id, salary, salary * 0.001
   FROM employees 
  WHERE employee_id NOT IN (  SELECT employee_id
                                FROM ex3_3 )
    AND manager_id = 146; 


-- MERGE 
-- ORACLE 9i ����, DELETE ������ 10g ���� ��밡��.
-- ���� : ���̺� ����Ÿ�� ���縦 ����������, INSERT �����۾��� �����ϰ�, �����ϸ� UPDATE �����۾��� �����ϰ� �ϴ� ���.

CREATE TABLE TEST_07 (
    EMPNO   NUMBER NOT NULL,
    ENAME   VARCHAR2(20)    NOT NULL,
    DEPTNO  NUMBER NOT NULL
);

SELECT EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;

SELECT * FROM  TEST_07;

-- 1)�������̺� ���. WHERE�� ������.
MERGE 
    INTO TEST_07 a  -- ������̺�
USING DUAL
    ON (a.EMPNO = 114)  -- ���ǽ�
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    -- DELETE
WHEN NOT MATCHED THEN
    INSERT (a.EMPNO, a.ENAME, a.DEPTNO)
    VALUES(114, 'SCOTT', 30);

-- 2)������ ���
-- ����
SELECT * FROM JOB_HISTORY a, TEST_07 b
WHERE a.EMPLOYEE_ID = 114 AND a.EMPLOYEE_ID = b.EMPNO;


MERGE
    INTO JOB_HISTORY a
USING TEST_07 b
    ON (a.EMPLOYEE_ID = 114 AND a.EMPLOYEE_ID = b.EMPNO)  -- ���ǽĿ� �����Ǵ� ���� ������Ʈ �Ұ���
 WHEN MATCHED THEN
    UPDATE
        SET a.JOB_ID = 'ST_CLERK'     -- 'ST_CLERK'
 WHEN NOT MATCHED THEN
    INSERT (a.EMPLOYEE_ID, a.START_DATE, a.END_DATE, a.JOB_ID, a.DEPARTMENT_ID)
    VALUES (b.EMPNO, sysdate, sysdate, null, null);

-- 3)�ζ��� ��  ���
MERGE 
    INTO TEST_07 a  -- ������̺�
USING (SELECT ~~~ FROM  ON ���ǽ�)  -- ���ǽ�
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    WHERE a.ENAME = 'SCOTT';

-- 4) WHERE �� ���. ORACLE 10g ���� UPDATE, DELETE ������ WHERE�� ��밡��
--��)
MERGE 
    INTO TEST_07 a  -- ������̺�
USING DUAL
    ON (a.EMPNO = 114)  -- ���ǽ�
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    WHERE a.ENAME = 'SCOTT';
    
-- ��)    
MERGE 
    INTO TEST_07 a  -- ������̺�
USING DUAL
    ON (a.EMPNO = 114)  -- ���ǽ�
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
        WHERE a.ENAME = 'SCOTT'
    -- DELETE�� ���� ���� UPDATE �� ����ؾ� ��.
    DELETE 
        WHERE a.ENAME = 'SCOTT';    




-------------------------------------------------------------------------------------
MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 146) b
        ON (d.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
 WHEN NOT MATCHED THEN 
      INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
       WHERE (b.salary < 8000);
       

 SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
 
MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 146) b
        ON (d.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
      DELETE WHERE (B.employee_id = 161)
 WHEN NOT MATCHED THEN 
      INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
      WHERE (b.salary < 8000);

 SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
 

 -- DELETE
 /*
 ���̺� �ִ� �����͸� ������ �� DELETE���� ����Ѵ�.

    �� �Ϲ� ����
    DELETE [FROM] [��Ű��.]���̺��
    WHERE delete ����; 

    -- ���̺� ������ ��Ƽ�� �۾��� ������ �� ��쿡 ���.
    �� Ư�� ��Ƽ�Ǹ� ������ ����� ����
    DELETE [FROM] [��Ű��.]���̺�� PARTITION (��Ƽ�Ǹ�)
    WHERE delete ����;
*/

-- ���� WHERE���� ������, ���̺��� ��� ����Ÿ�� ����
 DELETE ex3_3;
 
  SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
SELECT partition_name
  FROM user_tab_partitions
 WHERE table_name = 'SALES';


-- 3��20��(��) ���� ������ ��.
-- COMMIT, ROLLBACK, TRUNCATE
/*
COMMIT�� ������ �����͸� �����ͺ��̽��� ���������� �ݿ��ϴ� ������, 
ROLLBACK�� �� �ݴ�� ������ �����͸� �����ϱ� ���� ���·� �ǵ����� ������ �Ѵ�.
UPDATE, INSERT, MERGE, DELETE���� �����ϸ� �����Ϳ� ��ȭ�� �����. ������ ���������� ����Ǵ� ���� �ƴϴ�.


�޺κп� Ʈ�����(Transaction) ���信�� ������ �ٷ�.
*/

DROP TABLE ex3_4;
CREATE TABLE ex3_4 (
       employee_id NUMBER);


INSERT INTO ex3_4 VALUES (100);

SELECT employee_id, rowid
  FROM ex3_4;
  
Rollback; -- �տ� insert�� ������ ����Ÿ�۾��� ��������ũ�� �ݿ����� �ʰ�, ��Ұ� �ȴ�.
commit; -- �տ� insert�� ������ ����Ÿ�۾��� ��������ũ�� �ݿ���.

-- ����Ÿ �����ϴ� ��ɾ�.  
TRUNCATE TABLE ex3_4; -- commit, rollback ��������.



-- �ǻ��÷�
/*
�ǻ��÷�Pseudo-column�̶� ���̺��� �÷�ó�� ���������� ������ ���̺� ��������� �ʴ� �÷��� ���Ѵ�.
SELECT �������� �ǻ��÷��� ����� �� ������, �ǻ��÷� ���� INSERT, UPDATE, DELETE �� ���� ����.
*/

-- ROWNM�� �������� ��ȯ�Ǵ� �� �ο�鿡 ���� ���� ���� ��Ÿ���� �ǻ��÷��̴�
SELECT ROWNUM, employee_id
  FROM employees;
  
SELECT ROWNUM, employee_id FROM EMPLOYEES;

-- ����Ÿ ��½� ��ȸ �Ǽ� ������ �� ���. ���������� �Խ��� ����¡��ɿ� ����� ��ɾ�.
SELECT ROWNUM, employee_id
FROM employees
WHERE ROWNUM < 5;

-- ROWID�� ���̺� ����� �� �ο찡 ����� �ּ� ���� ����Ű�� �ǻ��÷��̴�.  
-- �� �ο츦 �ĺ��ϴ� ���̹Ƿ� ROWID�� ������ ���� ������.
SELECT ROWNUM, employee_id, ROWID
FROM employees      -- 107��
WHERE ROWNUM < 5;

SELECT ROWNUM, employee_id
  FROM employees;

-- �Ʒ�ó�� WHREE ROWNUM ���ǽ��� ����ϸ� ����� ������ ���� ����.(�߿�)
SELECT ROWNUM, employee_id
  FROM employees
  WHERE ROWNUM >= 5 AND ROWNUM <= 10;



-- ������. || ���ڿ� �Ǵ� �÷� ���Ῥ���ڱ��
SELECT employee_id || '-' || emp_name AS employee_info
  FROM employees
 WHERE ROWNUM < 5;
 
-- ǥ����
-- CASE �� - 2����(ANSI-SQLǥ�ر���)
/*
1)IF�� ����
CASE 
    WHEN ����1 THEN ��1
    WHEN ����2 THEN ��2
    ...
    ELSE ��Ÿ ��
END
*/
-- ����> ��� ���̺��� �� ����� �޿��� ���� 5000 ���Ϸ� �޿��� �޴� ����� C, 5000~15000�� B, 15000 �̻��� A����� ��ȯ�ϴ� ������ �ۼ��� ����.
 SELECT employee_id, salary, 
         CASE WHEN salary <= 5000 THEN 'C���'
            WHEN salary > 5000 AND salary <= 15000 THEN 'B���'
            ELSE 'A���'
       END AS salary_grade
  FROM employees;
  
  SELECT employee_id, salary,
            CASE 
                WHEN salary <= 5000 THEN 'C���'
                WHEN salary >5000 AND salary < 15000 THEN 'B���'
                WHEN salary >= 15000 THEN 'A���'
            END AS salary_grade
  FROM employees;
  
  
/*
2)SWITCH�� ����
CASE �÷���
    WHEN ���ǰ� THEN ��1
    WHEN ���ǰ� THEN ��2
    ...
    ELSE ��Ÿ ��
END
*/
CREATE TABLE TEST_05 (
    CODE    NUMBER PRIMARY KEY,
    ENAME   VARCHAR2(20)     NOT NULL
);

INSERT INTO TEST_05 VALUES(1, 'JAVA');
INSERT INTO TEST_05 VALUES(2, 'ORACLE');
INSERT INTO TEST_05 VALUES(3, 'SPRING');

SELECT * FROM TEST_05;

-- ����? �ڵ尡 1�̸� �ڹ�, 2�̸� ����Ŭ 3�̸� ������ ���� �������.
SELECT CODE, ENAME, 
        CASE CODE
            WHEN 1 THEN '�ڹ�'
            WHEN 2 THEN '����Ŭ'
            WHEN 3 THEN '������'
        END AS KNAME
FROM TEST_05;

-- ����>
-- ������̺��� �μ��ڵ尡 10�̸� New York, 20�̸� Dallas, �ƴϸ� Unknown ������� ó���ϰ�, ��ȸ �÷���Ī loc_name
-- ����̸�, �μ��ڵ�, loc_name
SELECT EMP_NAME, DEPARTMENT_ID, 
    CASE 
        WHEN DEPARTMENT_ID = 10 THEN 'New York'
        WHEN DEPARTMENT_ID = 20 THEN 'Dallas'
        ELSE 'Unknown'
    END AS loc_name
FROM EMPLOYEES;

-- ELSE������ ��ġ�Ǵ� ����Ÿ�� ������ NULL����
SELECT EMP_NAME, DEPARTMENT_ID, 
    CASE 
        WHEN DEPARTMENT_ID = 10 THEN 'New York'
        WHEN DEPARTMENT_ID = 20 THEN 'Dallas'
        -- ELSE 'Unknown'
    END AS loc_name
FROM EMPLOYEES;

-- �Լ��� �̿��� CASE��
SELECT EMP_NAME, HIRE_DATE,
    CASE
        WHEN TO_CHAR(HIRE_DATE, 'q') = '1' THEN '1�б�'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '2' THEN '2�б�'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '3' THEN '3�б�'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '4' THEN '4�б�'
    END AS HIRE_QUARTER
FROM EMPLOYEES;

-- ��ø�� �̿��� CASE��
/*
�μ����� ��ޱ����� �ٸ� ���
�μ��ڵ� 10 �̸� �޿��� 2000 �̻� 1���, �޿��� 1500 �̻� 2���, �޿��� 1000 �̻� 3���
�μ��ڵ� 20 �̸� �޿��� 3000 �̻� 1���, �޿��� 2500 �̻� 2���, �޿��� 2000 �̻� 3���
�μ��ڵ� 50 �̸� �޿��� 2500 �̻� 1���, �޿��� 2000 �̻� 2���, �޿��� 1500 �̻� 3���
������ �μ��ڵ��  �޿��� 4000 �̻� 1���, �޿��� 3500 �̻� 2���, �޿��� 2500 �̻� 3���
*/

SELECT EMP_NAME, SALARY, DEPARTMENT_ID,
    CASE
        WHEN DEPARTMENT_ID = 10 THEN 
            CASE
                WHEN SALARY >= 2000 THEN '1���'
                WHEN SALARY >= 1500 THEN '2���'
                WHEN SALARY >= 1000 THEN '3���'
            END
        WHEN DEPARTMENT_ID = 20 THEN 
            CASE
                WHEN SALARY >= 3000 THEN '1���'
                WHEN SALARY >= 2500 THEN '2���'
                WHEN SALARY >= 2000 THEN '3���'
            END
        WHEN DEPARTMENT_ID = 30 THEN 
            CASE
                WHEN SALARY >= 2500 THEN '1���'
                WHEN SALARY >= 2000 THEN '2���'
                WHEN SALARY >= 1500 THEN '3���'
            END
        ELSE
            CASE
                WHEN SALARY >= 4000 THEN '1���'
                WHEN SALARY >= 3500 THEN '2���'
                WHEN SALARY >= 2500 THEN '3���'
            END
    END AS SAL_GRADE
FROM EMPLOYEES;


  
-- ���ǽ�
-- �����ǽ�
/*
�� ���ǽ��� �� �����ڳ� ANY, SOME, ALL Ű����� ���ϴ� ���ǽ��� ���Ѵ�. 
���⼭�� ANY, SOME, ALL �񱳿� ���ؼ� �˾� ���ٵ� ���� ANY�� ���� ����.
*/

-- ANY(��1, ��2, ��3) : ���ŵ� ���� �ϳ��� ��ġ�ϸ�, ��ġ�� ����Ÿ�� ��ȸ�Ѵ�.
/*
�� ������ �޿��� 2000�̰ų� 3000, 4000�� ����� �����ϴ� ���̴�. 
ANY�� ���ƹ��͡��̳� ���ϳ����� ���� �����Ƿ� �� ������ �� ���� ��, �� �޿��� 2000�̳� 3000�̳� 4000 �� �ϳ��� ��ġ�ϴ� 
��� ����� ������ ���̴�. ���� ANY�� OR �������� ��ȯ�� �����ϸ� ���� ���嵵 ���� ����� ��ȯ�Ѵ�.
*/
SELECT employee_id, salary 
  FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY(2000, 3000, 4000)
ORDER BY employee_id;

-- ANY -> OR ��ȯ����   
SELECT employee_id, salary 
  FROM employees
WHERE salary = 2000
   OR salary = 3000
   OR salary = 4000
ORDER BY employee_id;   

-- ALL�� ���ŵ� ���� ��� ������ ���ÿ� �����ؾ� �Ѵ�. 
--  �� ����� �޿��� �� ���� ���� ������ �����Ƿ� �������� ���� �߸��� ������
-- (=) ���� ��ȣ�����ڴ� ����� �����ϰ�,  �ε�ȣ(<, >, >=, <=) ��밡��.
SELECT employee_id, salary 
  FROM employees
WHERE salary = ALL (2000, 3000, 4000)
ORDER BY employee_id;

-- �ε�ȣ(<, >, >=, <=) ��밡��
SELECT employee_id, salary 
  FROM employees
WHERE salary > ALL (2000, 3000, 4000)  -- �ִ� 4000 ���� ū ����� ����Ÿ
ORDER BY employee_id;


-- SOME�� ANY�� �����ϰ� ���Ǹ� �����Ѵ�.
SELECT employee_id, salary 
  FROM employees
WHERE salary = SOME (2000, 3000, 4000)
ORDER BY employee_id;

-- �����ǽ�
/*
�� ���ǽ��� ���������� AND, OR, NOT�� ����ϴ� ���ǽ��� ���Ѵ�. 
AND�� ��� ������ �����ؾ� �ϰ� OR�� ���� ���� �� �ϳ��� �����ص� TRUE�� ��ȯ�ȴ�. NOT�� ���ǽ� �� ����� ����(FALSE)�� �� ���ϴ� ���, �� TRUE�� ��ȯ�Ѵ�.
*/

-- ����? �� ������ NOT���� �޿��� 2500���� ũ�ų� ���� ���� ���, �� �޿��� 2500 �̸��� ����� ��ȯ�ϰ� �ִ�.
-- not �� ����ϴ� ����? ����Ÿ�� ������ �Ǵ��Ͽ�, ��ȸ�Ǵ� ������ �������� �ϱ⶧���� ���.
SELECT employee_id, salary 
  FROM employees
WHERE NOT ( salary >= 2500)
ORDER BY employee_id;
/*
127	2400
128	2200
132	2100
135	2400
136	2200
*/

SELECT employee_id, salary 
  FROM employees
WHERE salary < 2500
ORDER BY employee_id;
/*
127	2400
128	2200
132	2100
135	2400
136	2200
*/

-- �޿��� 2000~2500 �� ����Ÿ ��ȸ.
-- BETWEEN AND ���ǽ� : ������ ����
-- 1) 2)������ ������ ���.
-- 1)
SELECT employee_id, salary 
  FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;
--2)
SELECT employee_id, salary 
  FROM employees
WHERE salary >= 2000 AND salary <= 2500
ORDER BY employee_id;

-- IN ���ǽ�
-- IN ���ǽ��� �������� ����� ���� ���Ե� ���� ��ȯ�ϴµ� �տ��� ����� ANY�� ����ϴ�.
-- or ��ȯ����.
-- ����? �޿��� 2000 �Ǵ� 3000 �Ǵ� 4000 �� �ش��ϴ� ����Ÿ ��ȸ
SELECT employee_id, salary 
  FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

-- ����? �޿��� 2000 �Ǵ� 3000 �Ǵ� 4000 �� �������� �ʴ� ����Ÿ ��ȸ. 1), 2) 3) ������ ���.
--1)
SELECT employee_id, salary 
  FROM employees
WHERE salary NOT IN (2000, 3000, 4000)
ORDER BY employee_id;
--2)
SELECT employee_id, salary 
  FROM employees
WHERE salary <> 2000 AND salary <> 3000 AND salary <> 4000
ORDER BY employee_id;
--3)
SELECT employee_id, salary 
  FROM employees
WHERE salary  <> ALL (2000, 3000, 4000)
ORDER BY employee_id;
---------------------------------------------


-- EXISTS ���ǽ� : 6�忡�� ���������� �Բ� ������ ��.
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;

-- LIKE ���ǽ�
/*
LIKE ���ǽ��� ���ڿ��� ������ �˻��� �� ����ϴ� ���ǽ��̴�. 
���� ���, ��� ���̺��� ����̸��� ��A���� ���۵Ǵ� ����� ��ȸ�ϴ� ������ �ۼ��Ѵٸ� 
������ ���� LIKE ���ǽ��� ����Ѵ�.
*/
SELECT emp_name
  FROM employees
 WHERE emp_name LIKE 'A%'   -- 'A' ���� 1���̻����� �����ϴ� ���ڿ�
 ORDER BY emp_name;
 
 -- Al�� ���۵Ǵ� ��� ����� ��ȸ�� ������. (Al �̶�� �α��� �̻��� ���ڿ�)
SELECT emp_name
  FROM employees
 WHERE emp_name LIKE 'Al%'
 ORDER BY emp_name; 
 
/*
��%���� ��, ��, �߰� ��� �� �� ������ ���ǽ��� �˻��� �� ��ҹ��ڸ� �����Ѵٴ� ���� ��������. 0�� �̻��� ���ڿ�
��%���ʹ� �ٸ��� ��_��(����, ������ھ�)�� ������ ���� ��ü�� �ƴ� �� ���ڸ� ���Ѵ�.
*/
 
CREATE TABLE ex3_5 (
     names VARCHAR2(30));
     
INSERT INTO ex3_5 VALUES ('ȫ��');
   
INSERT INTO ex3_5 VALUES ('ȫ�浿');

INSERT INTO ex3_5 VALUES ('ȫ���');

INSERT INTO ex3_5 VALUES ('ȫ���');

INSERT INTO ex3_5 VALUES ('ȫ���');

SELECT * FROM ex3_5;



SELECT *
  FROM ex3_5
 WHERE names LIKE 'ȫ��%';  -- 'ȫ��' ���̰� 2���� �ڽŵ� �����ϰ�, ���۵Ǵ� ���ڿ��� �ǹ��Ѵ�.
 
 
 SELECT *
  FROM ex3_5
 WHERE names LIKE '%ȫ��%';  -- 'ȫ��' ���̰� 2���� �ڽŵ� �����ϰ�, ��, �ڿ��� � ���ڿ��� �͵� �������.
 
 SELECT *
  FROM ex3_5
 WHERE names LIKE 'ȫ��_';  -- 'ȫ��' �̶�� 2���ڿ� 3��° ��ġ�� ������1���� ���ڴ� ����� �͵� ������� ��ü���̰� 3���ڿ��� �Ѵ�.
 
 -- ������̺��� �̸�����  '~S' ������ ����Ÿ�� ��ȸ�϶�.
 SELECT EMP_NAME 
 FROM EMPLOYEES
 WHERE EMP_NAME LIKE '%s';
 
 -- ������̺��� �̸����� 3��° ��ġ�� n �� �ش��ϴ� �����͸� ��ȸ�϶�.
  SELECT EMP_NAME 
 FROM EMPLOYEES
 WHERE EMP_NAME LIKE '__n%';
 
 -- JOB_ID �÷����� 'H�� �����ϸ鼭, REP ������ ���ڿ��� ��ȸ�϶�.'
 SELECT JOB_ID
 FROM EMPLOYEES
 WHERE JOB_ID LIKE 'H%REP';
 
 -- JOB_ID 'IT~', 'ST~' 'PU~' �����ϴ� ���ڿ��� ��ȸ�϶�.
 SELECT JOB_ID
 FROM EMPLOYEES
 WHERE JOB_ID LIKE 'IT%'  OR JOB_ID LIKE 'ST%' OR JOB_ID LIKE 'PU%';
 
 
 