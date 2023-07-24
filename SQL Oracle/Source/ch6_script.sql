-- ���� �ǽ�
-- ����? ������̺��� �����ȣ, �̸�, �޿�, �Ի�����, �μ��ڵ带 ����϶�.
SELECT employee_id, EMP_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES;

-- ����? ������̺��� �����ȣ, �̸�, �޿�, �Ի�����, �μ��̸��� ����϶�.
-- ������̺� : �����ȣ, �̸�, �޿�, �Ի�����, [�μ��ڵ�]
-- �μ����̺� : �μ��̸�, [�μ��ڵ�]
-- ������ : �μ��ڵ�� 2�� ���̺��� ����, ���Ҽ��� �ִ�.

-- ���̺� ��Ī ��� ���� ���
SELECT EMPLOYEES.employee_id, EMPLOYEES.EMP_NAME, EMPLOYEES.SALARY, EMPLOYEES.HIRE_DATE, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.department_id = DEPARTMENTS.department_id;

-- ���̺� ��Ī ��� ���
SELECT e.employee_id, e.EMP_NAME, e.SALARY, e.HIRE_DATE, d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.department_id;

-- SELECT���� �÷��� ��Ī����
SELECT employee_id, EMP_NAME, SALARY, HIRE_DATE, DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.department_id;


-- ��������(INNER JOIN) , ��������
-- �� ��� ���̺��� ��ü �Ǽ��� 107�������� �μ���ȣ�� ���� ����� �� �� �����ϹǷ� 106���� ��ȸ�� ���̴�.
-- ������̺� �μ��ڵ尡 NULL �� ����Ÿ 1�� ������.
--1)����Ŭ ����
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id;  --   �������ǽ�. 106��
 
 -- ������̺� �μ��ڵ尡 NULL �� ����Ÿ�� �����Ͽ� ��ȸ �� ��쿡�� OUTER JOIN���
 -- ��ġ���� �ʴ� ����Ÿ�� ����
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id(+);
 
 --2) ANSI-SQL ����
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id;
 
-- ���̺� 3��, 4�� �����Ͽ�, �����ϴ� ����
--1)����Ŭ ����
-- 3��
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
  FROM employees a,
       departments b,
       job_history jh
 WHERE a.department_id = b.department_id
 AND a.employee_id = jh.employee_id;
 -- 4��
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id, j.job_title
  FROM employees a,
       departments b,
       job_history jh,
       jobs j
 WHERE a.department_id = b.department_id
 AND a.employee_id = jh.employee_id
 AND j.job_id = jh.job_id;
 
  --2) ANSI-SQL ����
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id;
 
 -- 3��
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id
 INNER JOIN job_history jh
 ON a.employee_id = jh.employee_id;
  
 -- 4�� ( 4 - 1 = 3)
  SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id, j.job_title
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id
 INNER JOIN job_history jh
 ON a.employee_id = jh.employee_id
 INNER JOIN jobs j
 ON j.job_id = jh.job_id;
 
 
 
 
 
 
 
 
 
 
 
 
 
 


-- ��������
/*
���� ����(SEMI-JOIN)�� ���� ������ ����� ���� ������ �����ϴ� �����͸� ���� �������� �����ϴ� ���� ������� IN�� EXISTS �����ڸ� ����� �����̴�.
*/
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;


SELECT department_id, department_name
  FROM departments a
 WHERE a.department_id  IN ( SELECT b.department_id
                               FROM employees b
                              WHERE b.salary > 3000)
ORDER BY department_name;


SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;


-- ��Ƽ����
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id NOT IN ( SELECT department_id
                                  FROM departments 
                                 WHERE manager_id IS NULL) ;


SELECT count(*)
  FROM employees a
 WHERE NOT EXISTS ( SELECT 1
                      FROM departments c
                   WHERE a.department_id = c.department_id 
AND manager_id IS NULL) ;


-- ��������
/*
������ ������ �� �� �ֵ���, ���� ����(SELF-JOIN)�� ���� �ٸ� �� ���̺��� �ƴ� ������ �� ���̺��� ����� �����ϴ� ����� ���Ѵ�.
*/

SELECT employee_id, emp_name FROM employees;

/*
��� ���̺��� A, B�� ������ ������ �ϴµ�, 
���� �μ���ȣ�� ���� ��� �� A �����ȣ�� B �����ȣ���� ���� ���� ��ȸ�ϴ� ������. 
��� ���̺��� �μ���ȣ�� 20�� ���� �� 2�� ���ε�(201�� 202), �����ǿ� ���� ����� 1�Ǹ� ����� ���� ��������.
*/
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
  FROM employees a,
        employees b
 WHERE a.employee_id < b.employee_id      --  A �����ȣ�� B �����ȣ���� ���� ��
   AND a.department_id = b.department_id    -- ���� �μ���ȣ
   AND a.department_id = 20;    -- �μ���ȣ�� 20�� ��
   




-- �ܺ�����(outer join)
-- 3���� ���� left outer join, right outer join, 
--  full outer join ����Ŭ������ ��������. ANSI-SQL������ ������.

-- ��������(INNER JOIN)
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id;

SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id;   -- 10��.



-- 1)����Ŭ OUTER JOIN
-- DEPARTMENTS �μ����̺� ������Ʈ�� ���������ʴ� �μ��� ����.
-- left outer join
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id(+);   -- 10��.
-- right outer join
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE b.department_id(+) = a.department_id;   -- 10��.


SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id (+) ;

-- 2)ANSI-SQL OUTER JOIN
-- LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
-- ���̺��� ��ġ�� ����Ű�� �ǹ̷� LEFT OR RIGHT �� OUTER JOIN�� ����.
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a LEFT OUTER JOIN job_history b
ON a.department_id = b.department_id;

SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM  job_history b RIGHT OUTER JOIN departments a
ON a.department_id = b.department_id;


-- FULL OUTE JOIN
--����Ŭ ��������.(�����߻�)
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id(+) = b.department_id (+) ;

-- ANSI-SQL
-- job_history���̺��� �μ��� departments ���̺��� �κ����տ� �ش�ȴ�.
-- RIGHT OUTER JOIN ����ϸ�, �Ʒ� ����� �����ϴ�.
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM  job_history b FULL OUTER JOIN departments a
ON a.department_id = b.department_id;


SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id;   -- 10��.


-- employees ���̺� (����� - ������Ʈ ������ ���, ������Ʈ �������� ���� ���)
-- job_history ���̺� : ������Ʈ�� ������ �������
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a,
       job_history b
 WHERE a.employee_id = b.employee_id(+)
   AND a.department_id = b.department_id;


select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);


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
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,  -- 107
       departments b;  -- 27


-- ANSI ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    ON (a.department_id = b.department_id )
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


-- ANSI �ܺ�����
select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT OUTER JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM job_history b 
  RIGHT OUTER JOIN employees a
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


-- CROSS ����

-- ����Ŭ : īŸ�þ� ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;

-- ANSI-SQL CROSS JOIN
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a 
CROSS JOIN departments b;


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
SELECT a.emp_id, b.emp_id
FROM HONG_A a, HONG_B b
WHERE a.emp_id = b.emp_id;

--2)ansi-sql
SELECT a.emp_id, b.emp_id
FROM HONG_A a INNER JOIN HONG_B b
ON a.emp_id = b.emp_id;

-- left outer join
-- ORACLE 
SELECT a.emp_id, b.emp_id
FROM hong_a a, 
     hong_b b
WHERE a.emp_id = b.emp_id(+);

-- ansi-sql
SELECT a.emp_id, b.emp_id
FROM hong_a a LEFT OUTER JOIN     hong_b b
ON a.emp_id = b.emp_id;

-- RIGHT OUTER JOIN
-- ORACLE 
SELECT a.emp_id, b.emp_id
FROM hong_b b, hong_a a      
WHERE a.emp_id(+) = b.emp_id;

-- ansi-sql
SELECT a.emp_id, b.emp_id
FROM hong_a a RIGHT OUTER JOIN hong_b b
ON a.emp_id = b.emp_id;

-- FULL OUTER JOIN
-- ORACLE : ��������. �����߻�
SELECT a.emp_id, b.emp_id
FROM hong_b b, hong_a a      
WHERE a.emp_id(+) = b.emp_id(+);

-- ANSI-SQL

SELECT a.emp_id, b.emp_id
FROM hong_a a
FULL OUTER JOIN hong_b b
ON ( a.emp_id = b.emp_id);


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



SELECT count(*)
  FROM employees 
 WHERE salary >=  ( SELECT AVG(salary)
                      FROM employees );

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
SELECT count(*)
  FROM employees 
 WHERE department_id IN ( SELECT department_id
                            FROM departments
                           WHERE parent_id IS NULL);


-- ����3 : �������� �÷��� ���ϴ� ��������.
-- ���ǽĿ��� ���ϴ� �÷��� ������ ����ŸŸ���� ��ġ�ؾ� �Ѵ�.

SELECT employee_id, job_id FROM job_history;

-- 2���� �÷��� ���������� ���ǽ� ���� ��ġ�Ǵ� ����Ÿ ��ȸ
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id ) IN ( SELECT employee_id, job_id
                                    FROM job_history);

-- INSERT, UPDATE, MERGE, DELETE �������� �������� ����� �����ȴ�.
UPDATE employees
   SET salary = ( SELECT AVG(salary)
                    FROM employees );


DELETE employees
 WHERE salary >= ( SELECT AVG(salary)
                    FROM employees );
                    
ROLLBACK;                    


-- ������ �ִ� ��������  
-- ����?

SELECT 1 FROM job_history b
                WHERE a.department_id = b.department_id;

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
SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );
/*
20,������
50,��ۺ�
60,IT
80,������
90,��ȹ��
110,�渮��
*/
                
-- ���� ������ �������� ��ȯ : �ߺ��� ����Ÿ�� �����Ѵ�.
SELECT a.department_id, a.department_name
FROM departments a, job_history b
WHERE a.department_id = b.department_id;
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
SELECT a.employee_id, 
       ( SELECT b.emp_name
           FROM employees b
          WHERE a.employee_id = b.employee_id) AS emp_name,
       a.department_id,
       ( SELECT b.department_name
           FROM departments b
          WHERE a.department_id = b.department_id) AS dep_name     
FROM job_history a;  -- 10��

-- ���α������� ��ȯ
-- ����� ������ ��쿡�� ���������� ����, ������ �������ִ� �����������ٴ� ���� �������̴�.
SELECT a.employee_id, b.emp_name, c.department_name
FROM job_history a, employees b, departments c
WHERE a.employee_id = b.employee_id
AND a.department_id = c.department_id
ORDER BY a.employee_id ASC;
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
SELECT a.department_id, a.department_name
  FROM departments a
 WHERE EXISTS ( SELECT 1
                  FROM employees b  
                 WHERE a.department_id = b.department_id 
                   AND b.salary > ( SELECT AVG(salary)  
                                      FROM employees )
               );
               
-- ����? �μ� ���̺��� ���� �μ��� ��ȹ��(�μ���ȣ�� 90)�� ���ϴ� ������� �μ��� ��� �޿��� ��ȸ�� ����.               
SELECT department_id,department_name FROM departments WHERE parent_id = 90;
/*
��ȹ��(90) �����μ�
60,IT
70,ȫ����
100,�ڱݺ�
110,�渮��
*/


SELECT department_id , AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90)
GROUP BY    department_id;                     
                           
-- ����? ��ȹ�� �����μ� �������� ��ü�ο����� ��ձ޿��� ��ȸ�� ����.

SELECT department_id,department_name FROM departments WHERE parent_id = 90;

SELECT AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90) ;

/*
���� �μ��� ��ȹ�ο� ���ϴ� ��� ����� �޿��� �ڽ��� �μ��� ��ձ޿��� �����ϴ� ������ ������ ����
*/
-- �ܰ躰�� ���������� �ۼ�.

UPDATE employees a  -- 107��
   SET a.salary = ( SELECT sal
                      FROM ( SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id ) d
                      WHERE a.department_id = d.department_id )
 WHERE a.department_id IN ( SELECT department_id 
                              FROM departments
                             WHERE parent_id = 90 ) ;
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

SELECT department_id , MIN(salary), MAX(salary)
  FROM employees a
 WHERE department_id  IN ( SELECT department_id 
                             FROM departments
                            WHERE parent_id = 90) 
GROUP BY department_id ;


MERGE INTO employees a
  USING ( SELECT b.department_id, AVG(c.salary) as sal
            FROM departments b, 
                  employees c
           WHERE b.parent_id = 90 
             AND b.department_id = c.department_id
            GROUP BY b.department_id ) d
      ON ( a.department_id = d.department_id )
 WHEN MATCHED THEN
 UPDATE SET a.salary = d.sal;

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

SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.department_id = c.department_id   -- ��ȹ��
            AND b.parent_id = 90;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- ��ȹ��
            AND b.department_id = c.department_id ) d
 WHERE a.department_id = b.department_id 
   AND a.salary > d.avg_salary  /*��ȹ�� ��ձ޿�*/;   --7908.285714285714285714285714285714285714


SELECT a.* 
  FROM ( SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'     
          GROUP BY a.sales_month  
       )  a,
       ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'       
       ) b
 WHERE a.month_avg > b.year_avg ;


-- ���� ���Ͽ�
SELECT SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id, 
        SUM(a.amount_sold) AS amount_sold
   FROM sales a,
        customers b,
        countries c
  WHERE a.cust_id = b.CUST_ID
    AND b.country_id = c.COUNTRY_ID
    AND c.country_name = 'Italy'     
GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;


SELECT  years, 
        MAX(amount_sold) AS max_sold
 FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
 FROM sales a,
               customers b,
               countries c
  WHERE a.cust_id = b.CUST_ID
          AND b.country_id = c.COUNTRY_ID
          AND c.country_name = 'Italy'     
       GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
      ) K
 GROUP BY years
 ORDER BY years;
 
 
SELECT emp.years, 
       emp.employee_id,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
  ORDER BY years


SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale,
       employees emp2
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
    AND emp.employee_id = emp2.employee_id
ORDER BY years;




               






