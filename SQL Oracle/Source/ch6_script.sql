-- ���� �ǽ�
-- ����? ������̺��� �����ȣ, �̸�, �޿�, �Ի�����, �μ��ڵ带 ����϶�.
SELECT EMPLOYEE_ID, EMP_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES;

-- ����? ������̺��� �����ȣ, �̸�, �޿�, �Ի�����, �μ��̸��� ����϶�.
-- ������̺� : �����ȣ, �̸�, �޿�, �Ի�����, [�μ��ڵ�]
-- �μ����̺� : �μ��̸�, [�μ��ڵ�]
-- ������ : �μ��ڵ�� 2�� ���̺��� ����, ���Ҽ��� �ִ�.



SELECT  EMPLOYEES.EMPLOYEE_ID,EMPLOYEES.EMP_NAME, 
        EMPLOYEES.SALARY, EMPLOYEES.HIRE_DATE,
        DEPARTMENTS.DEPARTMENT_NAME
FROM    EMPLOYEES, DEPARTMENTS
-- ���� ���ǽ� WHERE ���� ���ǽ�. 
WHERE   EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


-- ���̺� ��Ī ��� ���� ���
SELECT  EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.EMP_NAME, 
        EMPLOYEES.SALARY, EMPLOYEES.HIRE_DATE, 
        DEPARTMENTS.DEPARTMENT_NAME
FROM    EMPLOYEES, DEPARTMENTS
WHERE   EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- ���̺� ��Ī ��� ��� (AS���� �����Ǿ����)
-- �̰��� ����.
SELECT      E.EMPLOYEE_ID, 
            E.EMP_NAME, 
            E.SALARY,   
            E.HIRE_DATE, 
            D.DEPARTMENT_NAME
FROM        EMPLOYEES E, DEPARTMENTS D
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- SELECT���� �÷��� ��Ī���� �� �������ǽĿ��� ����� DEPARTMENT_ID�� ��Ī 
-- �Ǵ� ���̺�� ������ ���� �߻�

SELECT  EMPLOYEE_ID, EMP_NAME, 
        SALARY, HIRE_DATE, 
        DEPARTMENT_NAME
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- ��������(INNER JOIN) , ��������
-- �� ��� ���̺��� ��ü �Ǽ��� 107�������� �μ���ȣ�� ���� ����� 
-- �� �� �����ϹǷ� 106���� ��ȸ�� ���̴�.
-- ������̺� �μ��ڵ尡 NULL �� ����Ÿ 1�� ������.

-- 1)����Ŭ ����
SELECT  A.EMPLOYEE_ID, A.EMP_NAME, 
        A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM    EMPLOYEES A,
        DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;  --   �������ǽ�. 106��
 
 -- ������̺� �μ��ڵ尡 NULL �� ����Ÿ�� �����Ͽ� ��ȸ �� ��쿡�� OUTER JOIN���
 -- ��ġ���� �ʴ� ����Ÿ�� ����
 
SELECT  A.EMPLOYEE_ID, A.EMP_NAME, 
        A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM    EMPLOYEES A,
        DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);
 
-- 2) ANSI-SQL ����
-- ��ǥ ��� INNER JOIN�� ����ϰ�, WHERE ��� ON�� ����Ѵ�.

SELECT  A.EMPLOYEE_ID, A.EMP_NAME, 
        A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM    EMPLOYEES A INNER JOIN DEPARTMENTS B
ON      A.DEPARTMENT_ID = B.DEPARTMENT_ID;
 
-- ���̺� 3��, 4�� �����Ͽ�, �����ϴ� ����
-- �ó����� : ����� ����� ������Ʈ �̸��� ��ȸ�϶�.
-- (�����ȣ, ����̸�, �μ��ڵ�, �μ��̸�, ������Ʈ�̸�(JOB_ID) �÷�
-- �������̺� :
-- 1) ������̺� : �����ȣ, ����̸�, �μ��ڵ�
-- 2) �μ����̺� : �μ��ڵ�. �μ��̸�
-- 3) ������Ʈ(JOB_HISTORY) : �����ȣ, �μ��ڵ�, ������Ʈ �̸�

-- 1) ����Ŭ ����
-- 3��


SELECT      E.EMPLOYEE_ID, E.EMP_NAME, D.DEPARTMENT_ID, 
            D.DEPARTMENT_NAME, JH.JOB_ID
FROM        EMPLOYEES E, DEPARTMENTS D, JOB_HISTORY JH
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.EMPLOYEE_ID = JH.EMPLOYEE_ID;
-- 10��


-- �߸��� ǥ�� ( JOB_HISTORY ���̺� ������Ʈ�� 10�� �ۿ� ����.
SELECT      E.EMPLOYEE_ID, E.EMP_NAME, D.DEPARTMENT_ID, 
            D.DEPARTMENT_NAME, JH.JOB_ID
FROM        EMPLOYEES E, DEPARTMENTS D, JOB_HISTORY JH
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_ID = JH.DEPARTMENT_ID;
-- 175��




SELECT  A.EMPLOYEE_ID, A.EMP_NAME, 
        A.DEPARTMENT_ID, B.DEPARTMENT_NAME, 
        JH.JOB_ID
FROM    EMPLOYEES A,
        DEPARTMENTS B,
        JOB_HISTORY JH
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     A.EMPLOYEE_ID = JH.EMPLOYEE_ID;
 -- 4��
SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME, JH.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES A,
       DEPARTMENTS B,
       JOB_HISTORY JH,
       JOBS J 
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.EMPLOYEE_ID = JH.EMPLOYEE_ID
AND J.JOB_ID = JH.JOB_ID;
 
  --2) ANSI-SQL ����
SELECT  A.EMPLOYEE_ID, A.EMP_NAME, 
        A.DEPARTMENT_ID, B.DEPARTMENT_NAME, JH.JOB_ID
FROM    EMPLOYEES A INNER JOIN DEPARTMENTS B
ON      A.DEPARTMENT_ID = B.DEPARTMENT_ID;
 
 -- 3��
 
SELECT          E.EMPLOYEE_ID, E.EMP_NAME, 
                D.DEPARTMENT_ID, D.DEPARTMENT_NAME, 
                JH.JOB_ID, J.JOB_TITLE 
FROM            EMPLOYEES E 
INNER JOIN      DEPARTMENTS D 
ON              E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN      JOB_HISTORY JH 
ON              E.EMPLOYEE_ID = JH.EMPLOYEE_ID
INNER JOIN      JOBS J 
ON              J.JOB_ID = JH.JOB_ID;
 
 
 
 
 SELECT     A.EMPLOYEE_ID, A.EMP_NAME, 
            A.DEPARTMENT_ID, B.DEPARTMENT_NAME, JH.JOB_ID
 FROM       EMPLOYEES A 
 INNER JOIN DEPARTMENTS B
 ON         A.DEPARTMENT_ID = B.DEPARTMENT_ID
 INNER JOIN JOB_HISTORY JH
 ON         A.EMPLOYEE_ID = JH.EMPLOYEE_ID;
  
 -- 4�� ( 4 - 1 = 3)
SELECT      A.EMPLOYEE_ID, A.EMP_NAME, 
            A.DEPARTMENT_ID, B.DEPARTMENT_NAME, 
            JH.JOB_ID, J.JOB_TITLE
FROM        EMPLOYEES A 
INNER JOIN  DEPARTMENTS B
ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
INNER JOIN  JOB_HISTORY JH
ON          A.EMPLOYEE_ID = JH.EMPLOYEE_ID
INNER JOIN  JOBS J
ON          J.JOB_ID = JH.JOB_ID;
 
 
 
 
 
 
 
 
 
 
 
 
 
 


-- ��������
/*
���� ����(SEMI-JOIN)�� ���� ������ ����� ���� ������ �����ϴ� �����͸� ���� �������� �����ϴ� ���� ������� IN�� EXISTS �����ڸ� ����� �����̴�.
*/
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS A
 WHERE EXISTS ( SELECT * 
                 FROM EMPLOYEES B
                WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                  AND B.SALARY > 3000)
ORDER BY A.DEPARTMENT_NAME;


SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS A
 WHERE A.DEPARTMENT_ID  IN ( SELECT B.DEPARTMENT_ID
                               FROM EMPLOYEES B
                              WHERE B.SALARY > 3000)
ORDER BY DEPARTMENT_NAME;


SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME
  FROM DEPARTMENTS A, EMPLOYEES B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND B.SALARY > 3000
ORDER BY A.DEPARTMENT_NAME;


-- ��Ƽ����
SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A,
       DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.DEPARTMENT_ID NOT IN ( SELECT DEPARTMENT_ID
                                  FROM DEPARTMENTS 
                                 WHERE MANAGER_ID IS NULL) ;


SELECT COUNT(*)
  FROM EMPLOYEES A
 WHERE NOT EXISTS ( SELECT 1
                      FROM DEPARTMENTS C
                   WHERE A.DEPARTMENT_ID = C.DEPARTMENT_ID 
AND MANAGER_ID IS NULL) ;


-- ��������
/*
������ ������ �� �� �ֵ���, ���� ����(SELF-JOIN)�� ���� �ٸ� �� ���̺��� �ƴ� ������ �� ���̺��� ����� �����ϴ� ����� ���Ѵ�.
*/

SELECT EMPLOYEE_ID, EMP_NAME FROM EMPLOYEES;

/*
��� ���̺��� A, B�� ������ ������ �ϴµ�, 
���� �μ���ȣ�� ���� ��� �� A �����ȣ�� B �����ȣ���� ���� ���� ��ȸ�ϴ� ������. 
��� ���̺��� �μ���ȣ�� 20�� ���� �� 2�� ���ε�(201�� 202), �����ǿ� ���� ����� 1�Ǹ� ����� ���� ��������.
*/
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.EMPLOYEE_ID, B.EMP_NAME, A.DEPARTMENT_ID
  FROM EMPLOYEES A,
        EMPLOYEES B
 WHERE A.EMPLOYEE_ID < B.EMPLOYEE_ID      --  A �����ȣ�� B �����ȣ���� ���� ��
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID    -- ���� �μ���ȣ
   AND A.DEPARTMENT_ID = 20;    -- �μ���ȣ�� 20�� ��
   




-- �ܺ�����(outer join)
-- 3���� ���� left outer join, right outer join, 
--  full outer join ����Ŭ������ ��������. ANSI-SQL������ ������.

-- ��������(INNER JOIN)
-- ��ġ�� ������
SELECT  A.DEPARTMENT_ID, A.DEPARTMENT_NAME, 
        B.JOB_ID, B.DEPARTMENT_ID
FROM    DEPARTMENTS A,  JOB_HISTORY B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;



SELECT COUNT(*) FROM JOB_HISTORY; -- 10��
SELECT COUNT(*) FROM DEPARTMENTS; -- 27��

-- ��ġ�� ������ + ��ġ���� �ʴ� ������(JOB HISTORY) ���̺� 
-- �������� �ʴ� �μ�������)

-- OUTER JOINT
SELECT  A.DEPARTMENT_ID, A.DEPARTMENT_NAME, 
        B.JOB_ID, B.DEPARTMENT_ID
FROM    DEPARTMENTS A, JOB_HISTORY B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);   -- 10��.



-- 1)����Ŭ OUTER JOIN
-- DEPARTMENTS �μ����̺� ������Ʈ�� ���������ʴ� �μ��� ����.
-- left outer join
SELECT      A.DEPARTMENT_ID, A.DEPARTMENT_NAME, 
            B.JOB_ID, B.DEPARTMENT_ID
FROM        DEPARTMENTS A, JOB_HISTORY B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);   -- 10��.
-- right outer join
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM DEPARTMENTS A, JOB_HISTORY B
WHERE B.DEPARTMENT_ID(+) = A.DEPARTMENT_ID;   -- 10��.


SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM DEPARTMENTS A,
     JOB_HISTORY B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID (+) ;

-- 2)ANSI-SQL OUTER JOIN
-- LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
-- ���̺��� ��ġ�� ����Ű�� �ǹ̷� LEFT OR RIGHT �� OUTER JOIN�� ����.
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM DEPARTMENTS A LEFT OUTER JOIN JOB_HISTORY B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;

SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM  JOB_HISTORY B RIGHT OUTER JOIN DEPARTMENTS A
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;


-- FULL OUTE JOIN
--����Ŭ ��������.(�����߻�)
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM DEPARTMENTS A,
     JOB_HISTORY B
WHERE A.DEPARTMENT_ID(+) = B.DEPARTMENT_ID (+) ;

-- ANSI-SQL
-- job_history���̺��� �μ��� departments ���̺��� �κ����տ� �ش�ȴ�.
-- RIGHT OUTER JOIN ����ϸ�, �Ʒ� ����� �����ϴ�.
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM  JOB_HISTORY B FULL OUTER JOIN DEPARTMENTS A
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;


SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.JOB_ID, B.DEPARTMENT_ID
FROM DEPARTMENTS A, JOB_HISTORY B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;   -- 10��.


-- employees ���̺� (����� - ������Ʈ ������ ���, ������Ʈ �������� ���� ���)
-- job_history ���̺� : ������Ʈ�� ������ �������
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM EMPLOYEES A,
       JOB_HISTORY B
 WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID(+)
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM EMPLOYEES A,
       JOB_HISTORY B
 WHERE A.EMPLOYEE_ID  = B.EMPLOYEE_ID(+)
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);


-- īŸ�þ� ����
/*
īŸ�þ� ����(CATASIAN PRODUCT)�� WHERE ���� ���� ������ ���� ������ ���Ѵ�. 
�� FROM ���� ���̺��� ���������, �� ���̺� �� ���� ������ ���� �����̴�. 
���� ������ �����Ƿ� ������ ���� �����̶� ���� �� ���� ���� ������, 
FROM ���� 2�� �̻� ���̺��� ��������Ƿ� ������ �����̴�. 
���� ������ �����Ƿ� �� ����� �� ���̺� �Ǽ��� ���̴�. 
�� A ���̺� �Ǽ��� n1, B ���̺� �Ǽ��� n2��� �Ѵٸ�, ��� �Ǽ��� ��n1 * n2���� �ȴ�.
*/
-- 107 * 27 = 2889 ������ ������ ���������� �����Ѵ�.
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A,  -- 107
       DEPARTMENTS B;  -- 27


-- ANSI ����
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A,
       DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.HIRE_DATE >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A
  INNER JOIN DEPARTMENTS B
    ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID )
 WHERE A.HIRE_DATE >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A
  INNER JOIN DEPARTMENTS B
    USING (DEPARTMENT_ID)
 WHERE A.HIRE_DATE >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT A.EMPLOYEE_ID, A.EMP_NAME, DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A
  INNER JOIN DEPARTMENTS B
    USING (DEPARTMENT_ID)
 WHERE A.HIRE_DATE >= TO_DATE('2003-01-01','YYYY-MM-DD');


-- ANSI �ܺ�����
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM EMPLOYEES A,
       JOB_HISTORY B
 WHERE A.EMPLOYEE_ID  = B.EMPLOYEE_ID(+)
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM EMPLOYEES A
  LEFT OUTER JOIN JOB_HISTORY B
  ON ( A.EMPLOYEE_ID  = B.EMPLOYEE_ID
       AND A.DEPARTMENT_ID = B.DEPARTMENT_ID) ;


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM JOB_HISTORY B 
  RIGHT OUTER JOIN EMPLOYEES A
  ON ( A.EMPLOYEE_ID  = B.EMPLOYEE_ID
       AND A.DEPARTMENT_ID = B.DEPARTMENT_ID) ;


SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.JOB_ID, B.DEPARTMENT_ID 
  FROM EMPLOYEES A
  LEFT JOIN JOB_HISTORY B
  ON ( A.EMPLOYEE_ID  = B.EMPLOYEE_ID
       AND A.DEPARTMENT_ID = B.DEPARTMENT_ID) ;


-- CROSS ����

-- ����Ŭ : īŸ�þ� ����
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A,
       DEPARTMENTS B;

-- ANSI-SQL CROSS JOIN
SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A 
CROSS JOIN DEPARTMENTS B;


-- FULL OUTER ����
CREATE TABLE HONG_A  (EMP_ID INT);

CREATE TABLE HONG_B  (EMP_ID INT);

INSERT INTO HONG_A VALUES ( 10);

INSERT INTO HONG_A VALUES ( 20);

INSERT INTO HONG_A VALUES ( 40);

INSERT INTO HONG_B VALUES ( 10);

INSERT INTO HONG_B VALUES ( 20);

INSERT INTO HONG_B VALUES ( 30);

COMMIT;

SELECT * FROM HONG_A;
SELECT * FROM HONG_B;


-- INNER JOIN
--1)����Ŭ ����
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A, HONG_B B
WHERE A.EMP_ID = B.EMP_ID;

--2)ansi-sql
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A INNER JOIN HONG_B B
ON A.EMP_ID = B.EMP_ID;

-- left outer join
-- ORACLE 
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A, 
     HONG_B B
WHERE A.EMP_ID = B.EMP_ID(+);

-- ansi-sql
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A LEFT OUTER JOIN     HONG_B B
ON A.EMP_ID = B.EMP_ID;

-- RIGHT OUTER JOIN
-- ORACLE 
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_B B, HONG_A A      
WHERE A.EMP_ID(+) = B.EMP_ID;

-- ansi-sql
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A RIGHT OUTER JOIN HONG_B B
ON A.EMP_ID = B.EMP_ID;

-- FULL OUTER JOIN
-- ORACLE : ��������. �����߻�
SELECT A.EMP_ID, B.EMP_ID
FROM HONG_B B, HONG_A A      
WHERE A.EMP_ID(+) = B.EMP_ID(+);

-- ANSI-SQL

SELECT A.EMP_ID, B.EMP_ID
FROM HONG_A A
FULL OUTER JOIN HONG_B B
ON ( A.EMP_ID = B.EMP_ID);


-- �������� : Sub-Query �� �� SQL ���� �ȿ��� ������ ���Ǵ� �� �ٸ� SELECT���� �ǹ��Ѵ�
-- ��������, ������ ���Ǿ�.
/*
    ���� - ���������� ���������� ���� ����(����) ����.
    1)�������� ���� �������� - ���������� ������������ ����ϴ� ���̺��� �÷��� ���� ���ϴ� ����.
       - ���������� �������� ������ ������ ����.
       - ���ǽĿ��� ���� ���������� ������ �����Ǿ� ������� ������ ���ǽĿ� ���ȴ�.
    2)�������� �ִ� �������� - ���������� ���谡 �ִ�. ���������� ������ �Ұ����ϴ�. ������ �������� ������ �Ϻΰ� �������� ���̺��� �����ϱ� ����
*/

-- ������ ���� �������� 

-- ����1>
-- ����?  �� ����� ��� �޿� �̻��� �޴� ��� ���� ��ȸ�ϴ� ������.

-- �� ����� ��� �޿�
SELECT AVG(SALARY) FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841

SELECT COUNT(*) -- ��������
FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES);  -- 51.. ��������



SELECT COUNT(*)
  FROM EMPLOYEES 
 WHERE SALARY >=  ( SELECT AVG(SALARY)
                      FROM EMPLOYEES );

-- ����2>

-- ����? �μ� ���̺��� parent_id�� NULL�� �μ���ȣ�� ���� ����� �� �Ǽ��� ��ȯ�ϴ� ������
-- �ѹ���ȹ��(10)�� �Ҽӵ� ��� ���� ���?

-- �ܰ�1> �μ� ���̺��� parent_id�� NULL�� �μ���ȣ
SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE PARENT_ID IS NULL;


-- ���������� WHERE ���ǽĿ��� ���� = , IN ������.

--1) = ��� : ���������� ���ϰ��̾�� �Ѵ�. ( ���� �ϳ� )

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = (50, 70);  -- ����

SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE PARENT_ID IS NULL);


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (50, 70);
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 OR  DEPARTMENT_ID = 70;

--2) IN : ���������� ����� 1�� �̻��� ���.
SELECT COUNT(*)
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                           WHERE PARENT_ID IS NULL);


-- ����3 : �������� �÷��� ���ϴ� ��������.
-- ���ǽĿ��� ���ϴ� �÷��� ������ ����ŸŸ���� ��ġ�ؾ� �Ѵ�.

SELECT EMPLOYEE_ID, JOB_ID FROM JOB_HISTORY;

-- 2���� �÷��� ���������� ���ǽ� ���� ��ġ�Ǵ� ����Ÿ ��ȸ
SELECT EMPLOYEE_ID, EMP_NAME, JOB_ID
FROM EMPLOYEES
WHERE (EMPLOYEE_ID, JOB_ID ) IN ( SELECT EMPLOYEE_ID, JOB_ID
                                    FROM JOB_HISTORY);

-- INSERT, UPDATE, MERGE, DELETE �������� �������� ����� �����ȴ�.
UPDATE EMPLOYEES
   SET SALARY = ( SELECT AVG(SALARY)
                    FROM EMPLOYEES );


DELETE EMPLOYEES
 WHERE SALARY >= ( SELECT AVG(SALARY)
                    FROM EMPLOYEES );
                    
ROLLBACK;                    


-- ������ �ִ� ��������  
-- ����?

SELECT 1 FROM JOB_HISTORY B
                WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ���������� departments���̺� ����Ÿ 27���� ������������ �񱳵Ǿ�, 
-- ��ġ�Ǵ� ����Ÿ�� ���������� ������, ��ġ���� �ʴ� ����Ÿ�� ������.
-- �������������� ��ġ�� ���Ϲ��� ����Ÿ�� ������, SELECT ������ ��µȴ�.


-- EXISTS(SELECT ��) : SELECT ���� ����Ǿ� ������� ������ �� TRUE

-- EXISTS() �Լ� ����
SELECT 1 FROM DUAL WHERE 0 = 0;
-- ���������� ������� �����ϸ�, EXISTS()  ��ȯ���� TRUE
SELECT 'YES' FROM DUAL WHERE EXISTS(SELECT 1 FROM DUAL WHERE 0 = 0);


SELECT 1 FROM DUAL WHERE 0 = 1;
-- ���������� ������� �������� ������, EXISTS()  ��ȯ���� FALSE
SELECT 'YES' FROM DUAL WHERE EXISTS(SELECT 1 FROM DUAL WHERE 0 = 1);

-- �ߺ��� ����Ź ���� ���Ѵ�.
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME
 FROM DEPARTMENTS A
WHERE EXISTS ( SELECT 1 
                 FROM JOB_HISTORY B
                WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID );
/*
20,������
50,��ۺ�
60,IT
80,������
90,��ȹ��
110,�渮��
*/
                
-- ���� ������ �������� ��ȯ : �ߺ��� ����Ÿ�� �����Ѵ�.
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME
FROM DEPARTMENTS A, JOB_HISTORY B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;
/*
20	������
50	��ۺ�
50	��ۺ�
60	IT
80	������
80	������
90	��ȹ��
90	��ȹ��
110	�渮��
110	�渮��
*/
                

-- select �� : ���̺��� �÷���, �Լ����, ��������
SELECT A.EMPLOYEE_ID, 
       ( SELECT B.EMP_NAME
           FROM EMPLOYEES B
          WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID) AS EMP_NAME,
       A.DEPARTMENT_ID,
       ( SELECT B.DEPARTMENT_NAME
           FROM DEPARTMENTS B
          WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID) AS DEP_NAME     
FROM JOB_HISTORY A;  -- 10��

-- ���α������� ��ȯ
-- ����� ������ ��쿡�� ���������� ����, ������ �������ִ� �����������ٴ� ���� �������̴�.
SELECT A.EMPLOYEE_ID, B.EMP_NAME, C.DEPARTMENT_NAME
FROM JOB_HISTORY A, EMPLOYEES B, DEPARTMENTS C
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID
ORDER BY A.EMPLOYEE_ID ASC;
/*
101,Neena Kochhar,�渮��
101,Neena Kochhar,�渮��
102,Lex De Haan,IT
114,Den Raphaely,��ۺ�
122,Payam Kaufling,��ۺ�
176,Jonathon Taylor,������
176,Jonathon Taylor,������
200,Jennifer Whalen,��ȹ��
200,Jennifer Whalen,��ȹ��
201,Michael Hartstein,������
*/


-- ���������� ��ø�Ǿ� �ִ� ����.
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME
  FROM DEPARTMENTS A
 WHERE EXISTS ( SELECT 1
                  FROM EMPLOYEES B  
                 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID 
                   AND B.SALARY > ( SELECT AVG(SALARY)  
                                      FROM EMPLOYEES )
               );
               
-- ����? �μ� ���̺��� ���� �μ��� ��ȹ��(�μ���ȣ�� 90)�� ���ϴ� ������� �μ��� ��� �޿��� ��ȸ�� ����.               
SELECT DEPARTMENT_ID,DEPARTMENT_NAME FROM DEPARTMENTS WHERE PARENT_ID = 90;
/*
��ȹ��(90) �����μ�
60,IT
70,ȫ����
100,�ڱݺ�
110,�渮��
*/


SELECT DEPARTMENT_ID , AVG(SALARY)
  FROM EMPLOYEES A
 WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID 
                            FROM DEPARTMENTS
                           WHERE PARENT_ID = 90)
GROUP BY    DEPARTMENT_ID;                     
                           
-- ����? ��ȹ�� �����μ� �������� ��ü�ο����� ��ձ޿��� ��ȸ�� ����.

SELECT DEPARTMENT_ID,DEPARTMENT_NAME FROM DEPARTMENTS WHERE PARENT_ID = 90;

SELECT AVG(SALARY)
  FROM EMPLOYEES A
 WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID 
                            FROM DEPARTMENTS
                           WHERE PARENT_ID = 90) ;

/*
���� �μ��� ��ȹ�ο� ���ϴ� ��� ����� �޿��� �ڽ��� �μ��� ��ձ޿��� �����ϴ� ������ ������ ����
*/
-- �ܰ躰�� ���������� �ۼ�.

UPDATE EMPLOYEES A  -- 107��
   SET A.SALARY = ( SELECT SAL
                      FROM ( SELECT B.DEPARTMENT_ID, AVG(C.SALARY) AS SAL
                               FROM DEPARTMENTS B, 
                                    EMPLOYEES C
                              WHERE B.PARENT_ID = 90 
                                AND B.DEPARTMENT_ID = C.DEPARTMENT_ID
                              GROUP BY B.DEPARTMENT_ID ) D
                      WHERE A.DEPARTMENT_ID = D.DEPARTMENT_ID )
 WHERE A.DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID 
                              FROM DEPARTMENTS
                             WHERE PARENT_ID = 90 ) ;
/*
��ȹ��(90) �����μ�
60,IT
70,ȫ����
100,�ڱݺ�
110,�渮��
*/

/*
�����μ��� ��ȹ���� �����μ��� ��ձ޿�
SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id

60,5760
70,10000
100,8601.333333333333333333333333333333333333
110,10154
*/

SELECT DEPARTMENT_ID , MIN(SALARY), MAX(SALARY)
  FROM EMPLOYEES A
 WHERE DEPARTMENT_ID  IN ( SELECT DEPARTMENT_ID 
                             FROM DEPARTMENTS
                            WHERE PARENT_ID = 90) 
GROUP BY DEPARTMENT_ID ;


MERGE INTO EMPLOYEES A
  USING ( SELECT B.DEPARTMENT_ID, AVG(C.SALARY) AS SAL
            FROM DEPARTMENTS B, 
                  EMPLOYEES C
           WHERE B.PARENT_ID = 90 
             AND B.DEPARTMENT_ID = C.DEPARTMENT_ID
            GROUP BY B.DEPARTMENT_ID ) D
      ON ( A.DEPARTMENT_ID = D.DEPARTMENT_ID )
 WHEN MATCHED THEN
 UPDATE SET A.SALARY = D.SAL;

ROLLBACK;

-- �ζ��κ�
/*
FROM ���� ����ϴ� ���� ������ �ζ��� ��InlineView ��� �Ѵ�. ������ ���� ��������.
���� FROM ������ ���̺��̳� �䰡 ���µ�, ���� ������ FROM ���� ����� �ϳ��� ���̺��̳� ��ó�� ����� �� �ִ�.
*/
-- ����? �� ������ ��ȹ��(90) ���Ͽ� �ִ� �μ��� ���� ����� ��ձ޿����� ���� �޿��� �޴� ��� ����� ������ ���ε�, 
-- ��ȹ�� ���� ��ձ޿��� ���ϴ� �κ��� ���� ������ �ۼ��߰� �̸� FROM ���� ��ġ���״�. 


-- ���������� ���� :  ��ȹ�� ���� ��ձ޿�(������̺� - �޿�, �μ��ڵ�, �μ����̺� - �����μ�, �����μ� ����)
-- ������̺��� �μ��ڵ�� �����μ��� ��ȹ�� �ڵ������� ����. ��ȹ���� �����μ� �ڵ尡 ������̺� �����Ѵ�.
/*
/*
��ȹ��(90) �����μ�
60,IT
70,ȫ����
100,�ڱݺ�
110,�渮��
*/

SELECT AVG(C.SALARY) AS AVG_SALARY 
           FROM DEPARTMENTS B,
                EMPLOYEES C
          WHERE B.DEPARTMENT_ID = C.DEPARTMENT_ID   -- ��ȹ��
            AND B.PARENT_ID = 90;

SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
  FROM EMPLOYEES A,
       DEPARTMENTS B,
       ( SELECT AVG(C.SALARY) AS AVG_SALARY 
           FROM DEPARTMENTS B,
                EMPLOYEES C
          WHERE B.PARENT_ID = 90  -- ��ȹ��
            AND B.DEPARTMENT_ID = C.DEPARTMENT_ID ) D
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID 
   AND A.SALARY > D.AVG_SALARY  /*��ȹ�� ��ձ޿�*/;   --7908.285714285714285714285714285714285714


SELECT A.* 
  FROM ( SELECT A.SALES_MONTH, ROUND(AVG(A.AMOUNT_SOLD)) AS MONTH_AVG
           FROM SALES A,
                CUSTOMERS B,
                COUNTRIES C
          WHERE A.SALES_MONTH BETWEEN '200001' AND '200012'
            AND A.CUST_ID = B.CUST_ID
            AND B.COUNTRY_ID = C.COUNTRY_ID
            AND C.COUNTRY_NAME = 'Italy'     
          GROUP BY A.SALES_MONTH  
       )  A,
       ( SELECT ROUND(AVG(A.AMOUNT_SOLD)) AS YEAR_AVG
           FROM SALES A,
                CUSTOMERS B,
                COUNTRIES C
          WHERE A.SALES_MONTH BETWEEN '200001' AND '200012'
            AND A.CUST_ID = B.CUST_ID
            AND B.COUNTRY_ID = C.COUNTRY_ID
            AND C.COUNTRY_NAME = 'Italy'       
       ) B
 WHERE A.MONTH_AVG > B.YEAR_AVG ;


-- ���� ���Ͽ�
SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
        A.EMPLOYEE_ID, 
        SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
   FROM SALES A,
        CUSTOMERS B,
        COUNTRIES C
  WHERE A.CUST_ID = B.CUST_ID
    AND B.COUNTRY_ID = C.COUNTRY_ID
    AND C.COUNTRY_NAME = 'Italy'     
GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID;


SELECT  YEARS, 
        MAX(AMOUNT_SOLD) AS MAX_SOLD
 FROM ( SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
                A.EMPLOYEE_ID, 
                SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
 FROM SALES A,
               CUSTOMERS B,
               COUNTRIES C
  WHERE A.CUST_ID = B.CUST_ID
          AND B.COUNTRY_ID = C.COUNTRY_ID
          AND C.COUNTRY_NAME = 'Italy'     
       GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID    
      ) K
 GROUP BY YEARS
 ORDER BY YEARS;
 
 
SELECT EMP.YEARS, 
       EMP.EMPLOYEE_ID,
       EMP.AMOUNT_SOLD
  FROM ( SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
                A.EMPLOYEE_ID, 
                SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
           FROM SALES A,
                CUSTOMERS B,
                COUNTRIES C
          WHERE A.CUST_ID = B.CUST_ID
            AND B.COUNTRY_ID = C.COUNTRY_ID
            AND C.COUNTRY_NAME = 'Italy'     
          GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID   
        ) EMP,
       ( SELECT  YEARS, 
                 MAX(AMOUNT_SOLD) AS MAX_SOLD
          FROM ( SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
                        A.EMPLOYEE_ID, 
                        SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
                   FROM SALES A,
                        CUSTOMERS B,
                        COUNTRIES C
                  WHERE A.CUST_ID = B.CUST_ID
                    AND B.COUNTRY_ID = C.COUNTRY_ID
                    AND C.COUNTRY_NAME = 'Italy'     
                  GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID    
               ) K
          GROUP BY YEARS
       ) SALE
  WHERE EMP.YEARS = SALE.YEARS
    AND EMP.AMOUNT_SOLD = SALE.MAX_SOLD 
  ORDER BY YEARS


SELECT EMP.YEARS, 
       EMP.EMPLOYEE_ID,
       EMP2.EMP_NAME,
       EMP.AMOUNT_SOLD
  FROM ( SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
                A.EMPLOYEE_ID, 
                SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
           FROM SALES A,
                CUSTOMERS B,
                COUNTRIES C
          WHERE A.CUST_ID = B.CUST_ID
            AND B.COUNTRY_ID = C.COUNTRY_ID
            AND C.COUNTRY_NAME = 'Italy'     
          GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID   
        ) EMP,
       ( SELECT  YEARS, 
                 MAX(AMOUNT_SOLD) AS MAX_SOLD
          FROM ( SELECT SUBSTR(A.SALES_MONTH, 1, 4) AS YEARS,
                        A.EMPLOYEE_ID, 
                        SUM(A.AMOUNT_SOLD) AS AMOUNT_SOLD
                   FROM SALES A,
                        CUSTOMERS B,
                        COUNTRIES C
                  WHERE A.CUST_ID = B.CUST_ID
                    AND B.COUNTRY_ID = C.COUNTRY_ID
                    AND C.COUNTRY_NAME = 'Italy'     
                  GROUP BY SUBSTR(A.SALES_MONTH, 1, 4), A.EMPLOYEE_ID    
               ) K
          GROUP BY YEARS
       ) SALE,
       EMPLOYEES EMP2
  WHERE EMP.YEARS = SALE.YEARS
    AND EMP.AMOUNT_SOLD = SALE.MAX_SOLD 
    AND EMP.EMPLOYEE_ID = EMP2.EMPLOYEE_ID
ORDER BY YEARS;




               






