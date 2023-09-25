-- ������ ����
/*
������ ����HierarchicalQuery �� 2���� ������ ���̺� ����� �����͸� ������ ������ ����� ��ȯ�ϴ� ������ ���Ѵ�. 
������ ������ ���� ���� ������ ������ ���-�븮-����-����� ���� ����, �Ǹź�-������ ���� �μ� ����, ������ �а�, ���� ��ó ���� ������ ������ ���Ѵ�.
���� ������ ���� ���α׷��� �޴� ����, �亯�� �Խ��ǻӸ� �ƴ϶� �� å�� ������ �̿� ���Եȴ�.
*/

-- ����Ŭ�� ���������� ������ ���� �ȵ� ������ �Ʒ� �������� ������ ��������� ����ϴ� ����.
SELECT  DEPARTMENT_ID, 
        DEPARTMENT_NAME, 
        0 AS PARENT_ID,
        1 AS LEVELS,
        PARENT_ID || DEPARTMENT_ID AS SORT
FROM    DEPARTMENTS 
WHERE   PARENT_ID IS NULL
UNION ALL
SELECT  T2.DEPARTMENT_ID, 
        LPAD(' ' , 3 * (2-1)) || T2.DEPARTMENT_NAME AS DEPARTMENT_NAME, 
        T2.PARENT_ID,
        2 AS LEVELS,
        T2.PARENT_ID || T2.DEPARTMENT_ID AS SORT
FROM    DEPARTMENTS T1,
        DEPARTMENTS T2
WHERE   T1.PARENT_ID IS NULL
  AND   T2.PARENT_ID = T1.DEPARTMENT_ID
UNION ALL
SELECT  T3.DEPARTMENT_ID, 
        LPAD(' ' , 3 * (3-1)) || T3.DEPARTMENT_NAME AS DEPARTMENT_NAME, 
        T3.PARENT_ID,
        3 AS LEVELS,
        T2.PARENT_ID || T3.PARENT_ID || T3.DEPARTMENT_ID AS SORT
FROM    DEPARTMENTS T1,
        DEPARTMENTS T2,
        DEPARTMENTS T3
WHERE   T1.PARENT_ID IS NULL
  AND   T2.PARENT_ID = T1.DEPARTMENT_ID
  AND   T3.PARENT_ID = T2.DEPARTMENT_ID
UNION ALL
SELECT  T4.DEPARTMENT_ID, 
        LPAD(' ' , 3 * (4-1)) || T4.DEPARTMENT_NAME AS DEPARTMENT_NAME, 
        T4.PARENT_ID,
        4 AS LEVELS,
        T2.PARENT_ID || T3.PARENT_ID || T4.PARENT_ID || T4.DEPARTMENT_ID AS SORT
FROM    DEPARTMENTS T1,
        DEPARTMENTS T2,
        DEPARTMENTS T3,
        DEPARTMENTS T4
WHERE   T1.PARENT_ID IS NULL
  AND   T2.PARENT_ID = T1.DEPARTMENT_ID
  AND   T3.PARENT_ID = T2.DEPARTMENT_ID
  AND   T4.PARENT_ID = T3.DEPARTMENT_ID
ORDER BY SORT;

/*
    SELECT expr1, expr2, ...
      FROM ���̺�
     WHERE ����
     START WITH[�ֻ��� ����] -- �ֻ��� �����͸� ����
    CONNECT BY [NOCYCLE][PRIOR ������ ���� ����];
*/    

/*
department_id : �ڽ��÷�
parent_id : �θ��÷�
*/

--1)  �������� -> �������� �������� ����Ÿ ���
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL  -- ��Ʈ�� ������ ����.
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;  -- prior Ű���尡 �ڽ��÷�(department_id) �տ� ���
 
 
  
SELECT      DEPARTMENT_ID, LPAD(' ', 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
FROM        DEPARTMENTS
-- �ֻ��� ����
START WITH  PARENT_ID IS NULL
-- �÷� ���� �ϳ��� PRIOR�� �Է��� �־���Ѵ�.
CONNECT BY  PRIOR DEPARTMENT_ID = PARENT_ID;

--2)  �������� -> �������� �������� ����Ÿ ���  
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
FROM DEPARTMENTS
START WITH PARENT_ID IS NULL -- ��Ʈ�� ������ ����.
CONNECT BY DEPARTMENT_ID  = PRIOR PARENT_ID;  -- prior Ű���尡 �θ��÷�(parent_id) �տ� ���


-- ����/����θ� ��Ʈ�� �����Ͽ�, ������������ ���������� ����϶�.
SELECT      DEPARTMENT_ID, LPAD(' ', 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
FROM        DEPARTMENTS
START WITH  DEPARTMENT_ID = 30   -- 30   ����/�����
CONNECT BY  DEPARTMENT_ID = PRIOR PARENT_ID;

-- ����/����θ� ��Ʈ�� �����Ͽ�, ������������ ���������� ����϶�.
SELECT      DEPARTMENT_ID, LPAD(' ', 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
FROM        DEPARTMENTS
START WITH  DEPARTMENT_ID = 30   -- 30   ����/�����
CONNECT BY  PRIOR DEPARTMENT_ID =  PARENT_ID;


-- ���� ����
SELECT      *
FROM        EMPLOYEES;

SELECT      EMPLOYEE_ID, MANAGER_ID
FROM        EMPLOYEES
START WITH  MANAGER_ID IS NULL
CONNECT BY  PRIOR EMPLOYEE_ID = MANAGER_ID;


-- ����ڿ��� �ϱ��ڷ����� ����϶�.  
SELECT A.EMPLOYEE_ID, LPAD(' ' , 3 * (LEVEL-1)) || A.EMP_NAME, 
       LEVEL,
       B.DEPARTMENT_NAME
  FROM EMPLOYEES A,
       DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
 START WITH A.MANAGER_ID IS NULL
 CONNECT BY PRIOR A.EMPLOYEE_ID = A.MANAGER_ID;


--1) START WITH a.manager_id IS NULL ��Ʈ������ ����Ÿ�� ��¾ȵ�.
SELECT A.EMPLOYEE_ID, LPAD(' ' , 3 * (LEVEL-1)) || A.EMP_NAME, 
       LEVEL,
       B.DEPARTMENT_NAME, A.DEPARTMENT_ID
  FROM EMPLOYEES A,
       DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.DEPARTMENT_ID = 30 -- �μ��� 30���� ����Ÿ�� ��������.
 START WITH A.MANAGER_ID IS NULL
 CONNECT BY NOCYCLE PRIOR A.EMPLOYEE_ID = A.MANAGER_ID;

--2)���������� ���Ŀ� ���ǽ��� ���Ǹ�, ��Ʈ������ ����Ÿ�� ���ԵǾ� ��µȴ�.
SELECT A.EMPLOYEE_ID, LPAD(' ' , 3 * (LEVEL-1)) || A.EMP_NAME, 
       LEVEL,
       B.DEPARTMENT_NAME, A.DEPARTMENT_ID
  FROM EMPLOYEES A,
       DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
 START WITH A.MANAGER_ID IS NULL
 CONNECT BY NOCYCLE PRIOR A.EMPLOYEE_ID = A.MANAGER_ID
     AND A.DEPARTMENT_ID = 30; -- 
  
-- ������ �����ϱ�.  

-- ORDER BY Ű���� ����, ������ ������ �������� �ʰ�, �ܼ��ϰ� ���ĵȴ�.
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID
  ORDER BY DEPARTMENT_NAME;  

-- ORDER SIBLINGS BY : ������ ������ ������ ���¿��� ����  
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID
  ORDER SIBLINGS BY DEPARTMENT_NAME;    

/*
�� CONNECT_BY_ROOT
CONNECT_BY_ROOT�� ������ �������� �ֻ��� �ο츦 ��ȯ�ϴ� �����ڴ�
*/

-- �����߻�. > CONNECT_BY_ROOT �� �μ����� �ʼ������� �Է��� �־���Ѵ�.-
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, CONNECT_BY_ROOT
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID
  ORDER SIBLINGS BY DEPARTMENT_NAME;      
  
  
-- �ֻ��� �μ����� �����.  
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, 
       CONNECT_BY_ROOT DEPARTMENT_NAME AS ROOT_NAME
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;
/*
�� CONNECT_BY_ISLEAF : �������� ���������� Ȯ�ΰ����ϴ�.
CONNECT_BY_ISLEAF�� CONNECT BY ���ǿ� ���ǵ� ���迡 ���� 
�ش� �ο찡 ������ �ڽ� �ο��̸� 1��, �׷��� ������ 0�� ��ȯ�ϴ� �ǻ� �÷��̴�.
*/
  
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, CONNECT_BY_ISLEAF
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;  
 
/*
�� SYS_CONNECT_BY_PATH (colm, char)
SYS_CONNECT_BY_PATH�� ������ ���������� ����� �� �ִ� �Լ���, 
��Ʈ ��忡�� ������ �ڽ��� ����� ����� ��� ������ ��ȯ�Ѵ�. 
�� �Լ��� ù ��° �Ķ���ͷδ� �÷���, �� ��° �Ķ������ char�� �÷� �� �����ڸ� �ǹ��Ѵ�.
*/
  
-- ���� ������� ���� ����/ ����� �÷��� '/'�� �ִµ�, �̰��� ����ؼ� �ȵȴ�.
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, 
       SYS_CONNECT_BY_PATH( DEPARTMENT_NAME, '->')
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;   
 
 /*
 SYS_CONNECT_BY_PATH( department_name, '/')
 �� ��° �Ű������� �����ڷ� �ش� �÷� ���� ���Ե� ���ڴ� ����� �� ���ٴ� ���� �����ؾ� �Ѵ�. 
����/����δ� ��/�����ڰ� ���� �ִµ�, �����ڷ� ��/���� ����ϸ� ������ ���� ������ �߻��Ѵ�
 */
 
 -- �����߻� :  department_name�÷��� "����/�����"   �����Ͱ� �����Ѵ�. / �� �����ϰ� �ִ�.
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, 
       SYS_CONNECT_BY_PATH( DEPARTMENT_NAME, '/')
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;     
 
/*
�� CONNECT_BY_ISCYCLE
��ġë������ �𸣰����� ����Ŭ�� ������ ������ ����(�ݺ�) �˰����� ����Ѵ�. 
������ ������ ������ ���̺� �ִ� �����Ϳ� ���� �������� ����ǹǷ�, ���������δ� ������ ���� �ڽ� ��带 ã�ư���. 
���� �˰��򿡼� ������ ���� ������ �߸� �ָ� ���ѷ����� Ÿ�� �ȴٴ� ���ε�, 
������ ���������� �θ�-�ڽ� ���� ���踦 �����ϴ� ���� �߸� �ԷµǸ� ���ѷ����� Ÿ�� ������ �߻��Ѵ�.
*/
 
/*
���� ������ �߻��Ǵ� ����Ÿ �����۾����Ͽ�, �׽�Ʈ�ϴ� �ó�����.

���� ���, ������(170)�� �θ� �μ��� ����/�����(30)�ε�, 
����/������� parent_id ���� ����η� �ٲٸ� �� �μ��� ��ȣ ������ �Ǿ� ���ѷ����� �߻��� ���̴�. ���� Ȯ���� ����.
*/

--   ����/������� parent_id ���� ����� 10������ 170������ �����۾��� �Ѵ�. ����� �������������� ���ѷ����� �߻��ȴ�.
UPDATE DEPARTMENTS
   SET PARENT_ID = 170
 WHERE DEPARTMENT_ID = 30;
 
 
-- �μ��ڵ尡 30�� ��Ʈ���� .
-- ������������ ���������� ���
-- �����Ͱ� �߸� �ԷµǾ�, ���ѷ��� ���� �߻�. CONNECT BY loop in user data
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL, 
       PARENT_ID
  FROM DEPARTMENTS
  START WITH DEPARTMENT_ID = 30 -- ��������
CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID; 

/*
�̶��� ������ �߻��� ������ ã�� �߸��� �����͸� �����ؾ� �ϴµ�, 
�̸� ���ؼ��� ���� CONNECT BY ���� NOCYCLE�� �߰��ϰ� 
SELECT ���� CONNECT_BY_ISCYCLE �ǻ� �÷��� ����� ã�� �� �ִ�. 
CONNECT_BY_ISCYCLE�� ������ ���� ���� �ο찡 �ڽ��� ���� �ִµ� 
���ÿ� �� �ڽ� �ο찡 �θ� �ο��̸� 1��, �׷��� ������ 0�� ��ȯ�Ѵ�.
*/

-- �ý��� ��Ű��
-- DBMS


SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME AS DEPNAME, LEVEL, 
       CONNECT_BY_ISCYCLE ISLOOP,
       PARENT_ID
  FROM DEPARTMENTS
  START WITH DEPARTMENT_ID = 30
CONNECT BY NOCYCLE PRIOR DEPARTMENT_ID  = PARENT_ID; 

-- ���� �߻���Ų ����Ÿ�� Ȯ���Ѵ�.
-- ���� ���·� �ٽ� �����Ѵ�. 170 -> 10 �ڵ�� ����
UPDATE DEPARTMENTS
   SET PARENT_ID = 10
 WHERE DEPARTMENT_ID = 30;
  
  
-- ������ ���� ���� 
-- ���� ������ ����  

-- �ý��� ��Ű�� : ����Ŭ���� �����ϴ� ��ɾ��� ����ü.
-- DBMS_RANDOM ��Ű��.
-- �ֿ��� : ������ ���ڳ� ���ڿ� ���鶧 ���.



SET SERVEROUTPUT ON;

SET SERVEROUTPUT OFF;

-- ������ ����(��� �Ǵ� ����)
SELECT DBMS_RANDOM.RANDOM FROM DUAL;

-- 0~1 ���� ������ ���� �� ����
SELECT SYS.DBMS_RANDOM.VALUE FROM DUAL;

-- 1~1000 ������ ���� �� ����
SELECT DBMS_RANDOM.VALUE(1, 1000) FROM DUAL;

SELECT TRUNC(DBMS_RANDOM.VALUE(1, 1000), -1) FROM DUAL;

-- 12�ڸ� ������ ����
SELECT DBMS_RANDOM.VALUE(100000000000, 999999999999) FROM DUAL;

-- �빮�� 20�ڸ� ���� ���ڿ� ����
SELECT DBMS_RANDOM.STRING('U', 20) FROM DUAL; -- NVWTRENTWJWZTFHAFIYO

-- �ҹ��� 20�ڸ� ���� ���ڿ� ����
SELECT DBMS_RANDOM.STRING('L', 20) FROM DUAL; -- gfjxzhhkqhogifqlnaig

-- ��ҹ��� ȥ�� 20�ڸ� ���� ���ڿ� ����
SELECT DBMS_RANDOM.STRING('A', 20) FROM DUAL; -- FWqmZRnYSooxFRWrSsfn

-- �빮��, ���� ȥ�� 20�ڸ� ���� ���ڿ� ����
SELECT DBMS_RANDOM.STRING('X', 20) FROM DUAL; -- A77BYPBI7IJJY339H0E8

-- ��°����� Ư���������� 20�ڸ� ���� ���ڿ� ����
SELECT DBMS_RANDOM.STRING('P', 20) FROM DUAL; -- )ge]&h\yTf8 e>%s+K`a

-- CONNECT BY LEVEL <= ����
SELECT DBMS_RANDOM.VALUE(1000, 10000) FROM DUAL;

SELECT CEIL(DBMS_RANDOM.VALUE(1000, 10000)) FROM DUAL;

-- �����θ� 1000~10000 �������� ������ ���� 10�� ��������.
SELECT CEIL(DBMS_RANDOM.VALUE(1000, 10000)) FROM DUAL
CONNECT BY LEVEL <= 10;

-- ���̺� ����(����Ÿ����) : ����Ÿ ��� 
-- ���õ���Ÿ �۾� : 2014�� 1��~12�� ������
CREATE TABLE EX7_1 AS  
SELECT ROWNUM SEQ, 
       '2014' || LPAD(CEIL(ROWNUM/1000) , 2, '0' ) MONTH,
        ROUND(DBMS_RANDOM.VALUE (100, 1000)) AMT
FROM DUAL
CONNECT BY LEVEL <= 12000;

SELECT * FROM EX7_1;

-- 2014�⵵ 01��~12�� ����Ÿ�� �����۾�
-- ROWNUM 1~1000
SELECT CEIL(1/1000), CEIL(999/1000), CEIL(1000/1000) FROM DUAL;

-- -- ROWNUM 1001~2000
SELECT CEIL(1001/1000), CEIL(1999/1000), CEIL(2000/1000) FROM DUAL;

-- CREATE TABLE ���̺�� AS SELECT --
-- ����, TABLE, SELECT ���� --
-- ����. INSERT~SELECT ����.
/*
INSERT INTO ���̺��A
SELECT �÷�1, �÷�2 FROM ���̺��B
*/


-- 3��29�ϱ��� �����.

SELECT *
  FROM EX7_1;
  
-- 2014�� ���� �ݾ� �հ�.
SELECT MONTH, SUM(AMT)
FROM EX7_1
GROUP BY MONTH
ORDER BY MONTH;


  
-- �ο츦 �÷�����
-- �μ��� ����̸��� ��ȸ�϶�.

-- �� <ROW ������ ��µ� ��= ��
SELECT DEPARTMENT_ID,EMP_NAME FROM EMPLOYEES
ORDER BY DEPARTMENT_ID
;
-- ��ü ��� ���

CREATE TABLE EX7_2 AS
  SELECT DEPARTMENT_ID,
         LISTAGG(EMP_NAME, ',') WITHIN GROUP (ORDER BY EMP_NAME) AS EMPNAMES
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
  GROUP BY DEPARTMENT_ID;
  
-- ����� ���̺� ���� �� ������ Ȯ��.
SELECT *
FROM EX7_2;

-- ��ü ��� ���
-- ���� SELECT ����Ʈ�� DEPARTMENT_ID�� "GROUP BY DEPARTMENT_ID �κ��� ���ָ�
-- ��� ����� , �����ڷ� �Ͽ� ��ü ����� �� ������ ���

  SELECT 
         LISTAGG(EMP_NAME, ',') WITHIN GROUP (ORDER BY EMP_NAME) AS EMPNAMES
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL

                  
  
-- WITH ��

-- 1)
SELECT B2.*
FROM ( SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
         FROM KOR_LOAN_STATUS 
         GROUP BY PERIOD, REGION
      ) B2,      
      ( SELECT B.PERIOD,  MAX(B.JAN_AMT) MAX_JAN_AMT
         FROM ( SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
                  FROM KOR_LOAN_STATUS 
                 GROUP BY PERIOD, REGION
              ) B,
              ( SELECT MAX(PERIOD) MAX_MONTH
                  FROM KOR_LOAN_STATUS
                 GROUP BY SUBSTR(PERIOD, 1, 4)
              ) A
         WHERE B.PERIOD = A.MAX_MONTH
         GROUP BY B.PERIOD
      ) C   
 WHERE B2.PERIOD = C.PERIOD
   AND B2.JAN_AMT = C.MAX_JAN_AMT
 ORDER BY 1;


-- 2)
WITH B2 AS ( SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
               FROM KOR_LOAN_STATUS 
              GROUP BY PERIOD, REGION
           ),
     C AS ( SELECT B.PERIOD,  MAX(B.JAN_AMT) MAX_JAN_AMT
              FROM ( SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
                      FROM KOR_LOAN_STATUS 
                     GROUP BY PERIOD, REGION
                   ) B,
                   ( SELECT MAX(PERIOD) MAX_MONTH
                       FROM KOR_LOAN_STATUS
                      GROUP BY SUBSTR(PERIOD, 1, 4)
                   ) A
             WHERE B.PERIOD = A.MAX_MONTH
             GROUP BY B.PERIOD
           )
SELECT B2.*
  FROM B2, C
 WHERE B2.PERIOD = C.PERIOD
   AND B2.JAN_AMT = C.MAX_JAN_AMT
 ORDER BY 1;           

           
-- ��ȯ ��������
           
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LEVEL-1)) || DEPARTMENT_NAME, LEVEL
  FROM DEPARTMENTS
  START WITH PARENT_ID IS NULL
  CONNECT BY PRIOR DEPARTMENT_ID  = PARENT_ID;
  
WITH RECUR ( DEPARTMENT_ID, PARENT_ID, DEPARTMENT_NAME, LVL)
        AS ( SELECT DEPARTMENT_ID, PARENT_ID, DEPARTMENT_NAME, 1 AS LVL
               FROM DEPARTMENTS
              WHERE PARENT_ID IS NULL
              UNION ALL
             SELECT A.DEPARTMENT_ID, A.PARENT_ID, A.DEPARTMENT_NAME, B.LVL + 1 
               FROM DEPARTMENTS A, RECUR B
              WHERE A.PARENT_ID = B.DEPARTMENT_ID 
              )             
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LVL-1)) || DEPARTMENT_NAME, LVL
 FROM RECUR;
 
 
WITH RECUR ( DEPARTMENT_ID, PARENT_ID, DEPARTMENT_NAME, LVL)
        AS ( SELECT DEPARTMENT_ID, PARENT_ID, DEPARTMENT_NAME, 1 AS LVL
               FROM DEPARTMENTS
              WHERE PARENT_ID IS NULL
              UNION ALL
             SELECT A.DEPARTMENT_ID, A.PARENT_ID, A.DEPARTMENT_NAME, B.LVL + 1 
               FROM DEPARTMENTS A, RECUR B
              WHERE A.PARENT_ID = B.DEPARTMENT_ID 
              )       
SEARCH DEPTH FIRST BY DEPARTMENT_ID SET ORDER_SEQ                       
SELECT DEPARTMENT_ID, LPAD(' ' , 3 * (LVL-1)) || DEPARTMENT_NAME, LVL, ORDER_SEQ
 FROM RECUR; 


           
-- WITH�� ���� ����
-- ������ SQL���� ���� ��Ͽ� ���� �ݺ������� SQL���� ����ϴ� ���
-- �� ��Ͽ� �̸��� �ο��Ͽ� �����ϴ� �뵵

WITH EXAMPLE AS 
(
    SELECT 'WITH��' AS STRI FROM DUAL
)
SELECT * FROM EXAMPLE;

-- 2) ���� WITH ��
WITH EXAMPLE1 AS 
(
    SELECT 'EX1' A FROM DUAL
    UNION ALL
    SELECT '2X2' FROM DUAL
), 
EAMPLE2 AS
(
    SELECT 'EX3' A FROM DUAL
    UNION ALL
    SELECT A FROM EXAMPLE1
)
SELECT * FROM EXAMPLE2;



-- �м��Լ�
/* 
�м� �Լ� AnalyticFunction �� ���̺� �ִ� �ο쿡 ���� Ư�� �׷캰�� ���� ���� ������ �� ���ȴ�. 
���� ���� ���� �� ������ �׷� ������ ����ϴµ�, �̶� GROUP BY ���� ���� ���� ���� ����� 
�׷캰�� �ο� ���� �پ���. �̿� ����, ���� �Լ��� ����ϸ� �ο��� �ս� ���̵� 
�׷캰 ���� ���� ������ �� �� �ִ�. �м� �Լ����� ����ϴ� �ο캰 �׷��� 
������(window)��� �θ��µ�, �̴� ���� �� ����� ���� �ο��� ������ �����ϴ� ������ �Ѵ�.
*/

-- �μ��� �޿� �հ� 
SELECT      DEPARTMENT_ID, SUM(SALARY)
FROM        EMPLOYEES
GROUP BY    DEPARTMENT_ID
ORDER BY    DEPARTMENT_ID;

/*
   �м� �Լ�(�Ű�����) OVER
       ������(PARTITION BY expr1, expr2,...
                  ORDER BY expr3, expr4...
                window ��)

*/

-- �� ROW_NUMBER( )
-- ROW_NUMBER�� ROWNUM �ǻ� �÷��� ����� ����� �ϴµ�, 
-- ��Ƽ������ ���ҵ� �׷캰�� �� �ο쿡 ���� ������ ��ȯ�ϴ� �Լ���. 
-- ��� ���̺��� �μ��� ������� �ο� ���� ����� ����.



SELECT DEPARTMENT_ID, EMP_NAME, 
       ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID 
                          ORDER BY EMP_NAME ) DEP_ROWS
  FROM EMPLOYEES;
  
-- RANK �Լ��� ��Ƽ�Ǻ� ������ ��ȯ�Ѵ�. �μ����� �޿� ������ �Űܺ���.
  
-- �μ��� �޿��� ������ ���δ�.
-- RANK() : �޿��� ������ �����Ϳ� ���Ͽ� ���������� �ű��,
-- �� ���� ���� ���� ��ŭ ���̸� �ξ� �� ���� ������ �ű��.
SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY,
       RANK() OVER (PARTITION BY DEPARTMENT_ID 
                    ORDER BY SALARY ) DEP_RANK
  FROM EMPLOYEES;
  
/* 
40	Susan Mavris	    6500	1
50	TJ Olson	        2100	1
50	Steven Markle	    2200	2
50	Hazel Philtanker	2200	2
50	Ki Gee	            2400	4
50	James Landry	    2400	4
*/
  
  
SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY,
       DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID 
                    ORDER BY SALARY ) DEP_RANK
  FROM EMPLOYEES;
  
/* 
50	TJ Olson	        2100	1
50	Steven Markle	    2200	2
50	Hazel Philtanker	2200	2
50	Ki Gee	            2400	3
50	James Landry	    2400	3
50	Randall Perkins	    2500	4
50	Martha Sullivan	    2500	4
50	Joshua Patel	    2500	4
50	Peter Vargas	    2500	4
50	James Marlow	    2500	4
*/
  
  
/* 
TOP N ����!
�м� �Լ��� ���� �о߰� �ſ� ����. 
���� ���, Ư�� ���ǿ� �´� ���� Ȥ�� ���� n���� �����͸� �����ϴ� 
TOP n ������ ���� �ۼ��� �� �ִ�. �� �μ����� �޿��� 
���� 3�������� ����� �����ϴ� ������ �ۼ��� ����.
*/ 

-- 1) ���� 3��
SELECT *
FROM ( SELECT DEPARTMENT_ID, EMP_NAME, 
              SALARY, 
              DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID 
                                 ORDER BY SALARY DESC) DEP_RANK
         FROM EMPLOYEES
     )
WHERE DEP_RANK <= 3;  

-- 2) ���� 3��
SELECT *
FROM ( SELECT DEPARTMENT_ID, EMP_NAME, 
              SALARY, 
              DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID 
                                 ORDER BY SALARY ASC) DEP_RANK
         FROM EMPLOYEES
     )
WHERE DEP_RANK <= 3;  
    
    
    
SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY,
       CUME_DIST() OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY ) DEP_DIST
  FROM EMPLOYEES;    
  
  
SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY
      ,RANK() OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY ) RAKING
      ,CUME_DIST() OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY ) CUME_DIST_VALUE
      ,PERCENT_RANK() OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY ) PERCENTILE
  FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;  

SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY
      ,NTILE(4) OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY 
                      ) NTILES
  FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 60) ;

SELECT EMP_NAME, HIRE_DATE, SALARY,
       LAG(SALARY, 1, 0)  OVER (ORDER BY HIRE_DATE) AS PREV_SAL,
       LEAD(SALARY, 1, 0) OVER (ORDER BY HIRE_DATE) AS NEXT_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30;
 
SELECT EMP_NAME, HIRE_DATE, SALARY,
       LAG(SALARY, 2, 0)  OVER (ORDER BY HIRE_DATE) AS PREV_SAL,
       LEAD(SALARY, 2, 0) OVER (ORDER BY HIRE_DATE) AS NEXT_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30;
 
 
-- Window��
 
SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS ALL_SALARY,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                         ) AS FIRST_CURRENT_SAL,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                         ) AS CURRENT_END_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 90);
 
SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS ALL_SALARY,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         RANGE 365 PRECEDING
                         ) AS RANGE_SAL1,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                         RANGE BETWEEN 365 PRECEDING AND CURRENT ROW
                         ) AS RANGE_SAL2
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30; 
 
 
SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       FIRST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS ALL_SALARY,
       FIRST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS FR_ST_TO_CURRENT_SAL,
       FIRST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                 ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS FR_CURRENT_TO_END_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 90); 
 
 
 SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       LAST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS ALL_SALARY,
       LAST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS FR_ST_TO_CURRENT_SAL,
       LAST_VALUE(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS FR_CURRENT_TO_END_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 90); 
 
 
SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       NTH_VALUE(SALARY, 2) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                 ) AS ALL_SALARY,
       NTH_VALUE(SALARY, 2) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                 ) AS FR_ST_TO_CURRENT_SAL,
       NTH_VALUE(SALARY,2 ) OVER (PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE
                                  ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                 ) AS FR_CURRENT_TO_END_SAL
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 90) ; 
 
-- ��Ÿ �м� �Լ� 

SELECT DEPARTMENT_ID, EMP_NAME, 
       SALARY
      ,NTILE(4) OVER (PARTITION BY DEPARTMENT_ID 
                         ORDER BY SALARY 
                      ) NTILES
      ,WIDTH_BUCKET(SALARY, 1000, 10000, 4) WIDTHBUACKET
  FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60; 

WITH BASIS AS ( SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
                  FROM KOR_LOAN_STATUS
                 GROUP BY PERIOD, REGION
              ), 
    BASIS2 AS ( SELECT PERIOD, MIN(JAN_AMT) MIN_AMT, MAX(JAN_AMT) MAX_AMT
                  FROM BASIS
                 GROUP BY PERIOD
              )
 SELECT A.PERIOD, 
        B.REGION "�ּ�����", B.JAN_AMT "�ּұݾ�",
        C.REGION "�ִ�����", C.JAN_AMT "�ִ�ݾ�"
   FROM BASIS2 A, BASIS B, BASIS C
  WHERE A.PERIOD  = B.PERIOD
    AND A.MIN_AMT = B.JAN_AMT 
    AND A.PERIOD  = C.PERIOD
    AND A.MAX_AMT = C.JAN_AMT
  ORDER BY 1, 2;
 
 
WITH BASIS AS (
               SELECT PERIOD, REGION, SUM(LOAN_JAN_AMT) JAN_AMT
                 FROM KOR_LOAN_STATUS
                GROUP BY PERIOD, REGION
              )
SELECT A.PERIOD, 
       MIN(A.REGION) KEEP ( DENSE_RANK FIRST ORDER BY JAN_AMT) "�ּ�����", 
       MIN(JAN_AMT) "�ּұݾ�", 
       MAX(A.REGION) KEEP ( DENSE_RANK LAST ORDER BY JAN_AMT) "�ִ�����",
       MAX(JAN_AMT) "�ִ�ݾ�"
FROM BASIS A
GROUP BY A.PERIOD
ORDER BY 1, 2;

SELECT DEPARTMENT_ID, EMP_NAME, HIRE_DATE, SALARY,
       ROUND(RATIO_TO_REPORT(SALARY) OVER (PARTITION BY DEPARTMENT_ID 
                                ),2) * 100 AS SALARY_PERCENT
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 90); 
 
 
-- ���� ���̺� INSERT
-- ���� ���� INSERT���� �� �濡 ó��

--   ���� ���̺� INSERT ������ �� �ϳ��� INSERT �������� ���� ���� INSERT ���� 
--   �����ϴ� ȿ���� �� �� ���� �Ӹ� �ƴ϶� Ư�� ���ǿ� �´� �����͸� Ư�� ���̺� 
--   �Էµǰ� �� �� �ִ� �����̴�. 
--   ���� ���� ���̺� INSERT ���� ������ ���� ����.


-- INSERT ALL| FIRST
--    WHEN ����1 THEN
--    ��INTO [��Ű��.]���̺��(�÷�1, �÷�2, ...) VALUES(��1, ��2, ...)
--    WHEN ����2 THEN
--    ��INTO [��Ű��.]���̺��(�÷�1, �÷�2, ...) VALUES(��1, ��2, ...)
--        ...
--     ELSE
--    �� INTO [��Ű��.]���̺��(�÷�1, �÷�2, ...) VALUES(��1, ��2, ...)
--    SELECT ��;

CREATE TABLE EX7_3 (
       EMP_ID    NUMBER,
       EMP_NAME  VARCHAR2(100));


CREATE TABLE EX7_4 (
       EMP_ID    NUMBER,
       EMP_NAME  VARCHAR2(100));
       
INSERT INTO EX7_3 VALUES (101, 'ȫ�浿'); 

INSERT INTO EX7_3 VALUES (102, '������');       

INSERT ALL
INTO EX7_3 VALUES (103, '������')
INTO EX7_3 VALUES (104, '�����ҹ�')
SELECT *
FROM DUAL;

INSERT ALL
INTO EX7_3 VALUES (EMP_ID, EMP_NAME)
SELECT 103 EMP_ID, '������' EMP_NAME
FROM DUAL
UNION ALL
SELECT 104 EMP_ID, '�����ҹ�' EMP_NAME
FROM DUAL;

SELECT * FROM EX7_3;


INSERT ALL
INTO EX7_3 VALUES (105, '������')
INTO EX7_4 VALUES (105, '������')
SELECT *
FROM DUAL;

-- ���ǿ� ���� ���� INSERT

-- COMMIT, ROLLBACK ����� ������� ����.
-- ���� �����͸� �����ϴ� ���� �ƴ�, �������� �ּҸ� �߶������.

TRUNCATE TABLE EX7_3;

TRUNCATE TABLE EX7_4;


-- ��� ��




INSERT ALL
WHEN    DEPARTMENT_ID = 30 THEN
    INTO EX7_3 VALUES (EMPLOYEE_ID, EMP_NAME)
WHEN    DEPARTMENT_ID = 90 THEN
    INTO EX7_4 VALUES (EMPLOYEE_ID, EMP_NAME)
SELECT  DEPARTMENT_ID, 
        EMPLOYEE_ID, EMP_NAME 
FROM    EMPLOYEES;

INSERT ALL
WHEN    DEPARTMENT_ID=30 THEN
    INTO    EX7_3 VALUES(EMPLOYEE_ID, EMP_NAME)
WHEN    DEPARTMENT_ID = 90 THEN
    INTO    EX7_4   VALUES(EMPLOYEE_ID, EMP_NAME)
SELECT  DEPARTMENT_ID, 
        EMPLOYEE_ID, EMP_NAME     
FROM    EMPLOYEES;





CREATE TABLE EX7_5 (
       EMP_ID    NUMBER,
       EMP_NAME  VARCHAR2(100));
       
INSERT ALL
WHEN DEPARTMENT_ID = 30 THEN
  INTO EX7_3 VALUES (EMPLOYEE_ID, EMP_NAME)
WHEN DEPARTMENT_ID = 90 THEN
  INTO EX7_4 VALUES (EMPLOYEE_ID, EMP_NAME)
ELSE
  INTO EX7_5 VALUES (EMPLOYEE_ID, EMP_NAME)
SELECT DEPARTMENT_ID, 
       EMPLOYEE_ID, EMP_NAME 
FROM  EMPLOYEES;
       
SELECT * FROM EX7_3;

SELECT * FROM EX7_4;
       
SELECT * FROM EX7_5;
       
SELECT COUNT(*)
FROM EX7_5;
       
SELECT DEPARTMENT_ID, EMPLOYEE_ID, EMP_NAME,  SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;


-- EX7_3, 7_4 ������ ���۾�
TRUNCATE TABLE EX7_3;
TRUNCATE TABLE EX7_4;

SELECT * FROM EX7_3;
SELECT * FROM EX7_4;


--1) WHEN ���ǽ��� TRUE�̸� �����͸� �����϶�.
INSERT ALL
WHEN EMPLOYEE_ID < 116 THEN
  INTO EX7_3 VALUES (EMPLOYEE_ID, EMP_NAME)
WHEN  SALARY < 5000 THEN
  INTO EX7_4 VALUES (EMPLOYEE_ID, EMP_NAME)
SELECT DEPARTMENT_ID, EMPLOYEE_ID, EMP_NAME,  SALARY
FROM   EMPLOYEES
WHERE  DEPARTMENT_ID = 30;  


SELECT *
FROM EX7_3;

SELECT *
FROM EX7_4;


-- 2) ù��° WHEN���� TRUE�� �Ǿ� , ���Ե� ������ ���� �����ϸ�,
--    �̹� ���� �ܰ迡�� �Է��� �Ǿ����Ƿ�, �ι�° WHEN���� TRUE �� �Ǿ� 
--    �� �ο�(��������)�� �߰��� �Էµ��� �����.
INSERT FIRST
-- EMPLOYEE_ID �� 115�� �����ʹ� ���Եȴ� 
WHEN EMPLOYEE_ID < 116 THEN
  INTO EX7_3 VALUES (EMPLOYEE_ID, EMP_NAME)
  -- EMPLOYEE_ID �� 115�� �����ʹ� SALARY<5000���� ���� ���������, ���� ���� �ʴ´�.
WHEN  SALARY < 5000 THEN
  INTO EX7_4 VALUES (EMPLOYEE_ID, EMP_NAME)
SELECT DEPARTMENT_ID, EMPLOYEE_ID, EMP_NAME,  SALARY
FROM   EMPLOYEES
WHERE  DEPARTMENT_ID = 30;   


