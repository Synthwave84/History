-- ������ ����
/*
������ ����HierarchicalQuery �� 2���� ������ ���̺� ����� �����͸� ������ ������ ����� ��ȯ�ϴ� ������ ���Ѵ�. 
������ ������ ���� ���� ������ ������ ���-�븮-����-����� ���� ����, �Ǹź�-������ ���� �μ� ����, ������ �а�, ���� ��ó ���� ������ ������ ���Ѵ�.
���� ������ ���� ���α׷��� �޴� ����, �亯�� �Խ��ǻӸ� �ƴ϶� �� å�� ������ �̿� ���Եȴ�.
*/

-- ����Ŭ�� ���������� ������ ���� �ȵ� ������ �Ʒ� �������� ������ ��������� ����ϴ� ����.
SELECT department_id, 
       department_name, 
       0 AS PARENT_ID,
       1 as levels,
        parent_id || department_id AS sort
FROM departments 
WHERE parent_id IS NULL
UNION ALL
SELECT t2.department_id, 
       LPAD(' ' , 3 * (2-1)) || t2.department_name AS department_name, 
       t2.parent_id,
       2 AS levels,
       t2.parent_id || t2.department_id AS sort
FROM departments t1,
     departments t2
WHERE t1.parent_id is null
  AND t2.parent_id = t1.department_id
UNION ALL
SELECT t3.department_id, 
       LPAD(' ' , 3 * (3-1)) || t3.department_name AS department_name, 
       t3.parent_id,
       3 as levels,
       t2.parent_id || t3.parent_id || t3.department_id as sort
FROM departments t1,
     departments t2,
     departments t3
WHERE t1.parent_id IS NULL
  AND t2.parent_id = t1.department_id
  AND t3.parent_id = t2.department_id
UNION ALL
SELECT t4.department_id, 
       LPAD(' ' , 3 * (4-1)) || t4.department_name as department_name, 
       t4.parent_id,
       4 as levels,
       t2.parent_id || t3.parent_id || t4.parent_id || t4.department_id AS sort
FROM departments t1,
     departments t2,
     departments t3,
     departments t4
WHERE t1.parent_id IS NULL
  AND t2.parent_id = t1.department_id
  AND t3.parent_id = t2.department_id
  and t4.parent_id = t3.department_id
ORDER BY sort;

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
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL  -- ��Ʈ�� ������ ����.
  CONNECT BY PRIOR department_id  = parent_id;  -- prior Ű���尡 �ڽ��÷�(department_id) �տ� ���
  

--2)  �������� -> �������� �������� ����Ÿ ���  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH parent_id IS NULL -- ��Ʈ�� ������ ����.
CONNECT BY department_id  = PRIOR parent_id;  -- prior Ű���尡 �θ��÷�(parent_id) �տ� ���


-- ����/����θ� ��Ʈ�� �����Ͽ�, ������������ ���������� ����϶�.
SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH department_id = 30   -- 30   ����/�����
CONNECT BY department_id = PRIOR parent_id;

-- ����/����θ� ��Ʈ�� �����Ͽ�, ������������ ���������� ����϶�.
SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH department_id = 30   -- 30   ����/�����
CONNECT BY PRIOR department_id =  parent_id;


-- ����ڿ��� �ϱ��ڷ����� ����϶�.  
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 START WITH a.manager_id IS NULL
 CONNECT BY PRIOR a.employee_id = a.manager_id;


--1) START WITH a.manager_id IS NULL ��Ʈ������ ����Ÿ�� ��¾ȵ�.
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name, a.DEPARTMENT_ID
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id = 30 -- �μ��� 30���� ����Ÿ�� ��������.
 START WITH a.manager_id IS NULL
 CONNECT BY NOCYCLE PRIOR a.employee_id = a.manager_id;

--2)���������� ���Ŀ� ���ǽ��� ���Ǹ�, ��Ʈ������ ����Ÿ�� ���ԵǾ� ��µȴ�.
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name, a.DEPARTMENT_ID
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 START WITH a.manager_id IS NULL
 CONNECT BY NOCYCLE PRIOR a.employee_id = a.manager_id
     AND a.department_id = 30; -- 
  
-- ������ �����ϱ�.  

-- ORDER BY Ű���� ����, ������ ������ �������� �ʰ�, �ܼ��ϰ� ���ĵȴ�.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER BY department_name;  

-- ORDER SIBLINGS BY : ������ ������ ������ ���¿��� ����  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER SIBLINGS BY department_name;    

/*
�� CONNECT_BY_ROOT
CONNECT_BY_ROOT�� ������ �������� �ֻ��� �ο츦 ��ȯ�ϴ� �����ڴ�
*/

-- �����߻�.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, CONNECT_BY_ROOT
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER SIBLINGS BY department_name;      
  
  
-- �ֻ��� �μ����� �����.  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       CONNECT_BY_ROOT department_name AS root_name
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;
/*
�� CONNECT_BY_ISLEAF : �������� ���������� Ȯ�ΰ����ϴ�.
CONNECT_BY_ISLEAF�� CONNECT BY ���ǿ� ���ǵ� ���迡 ���� 
�ش� �ο찡 ������ �ڽ� �ο��̸� 1��, �׷��� ������ 0�� ��ȯ�ϴ� �ǻ� �÷��̴�.
*/
  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, CONNECT_BY_ISLEAF
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;  
 
/*
�� SYS_CONNECT_BY_PATH (colm, char)
SYS_CONNECT_BY_PATH�� ������ ���������� ����� �� �ִ� �Լ���, 
��Ʈ ��忡�� ������ �ڽ��� ����� ����� ��� ������ ��ȯ�Ѵ�. 
�� �Լ��� ù ��° �Ķ���ͷδ� �÷���, �� ��° �Ķ������ char�� �÷� �� �����ڸ� �ǹ��Ѵ�.
*/
  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       SYS_CONNECT_BY_PATH( department_name, '|')
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;   
 
 /*
 SYS_CONNECT_BY_PATH( department_name, '/')
 �� ��° �Ű������� �����ڷ� �ش� �÷� ���� ���Ե� ���ڴ� ����� �� ���ٴ� ���� �����ؾ� �Ѵ�. 
����/����δ� ��/�����ڰ� ���� �ִµ�, �����ڷ� ��/���� ����ϸ� ������ ���� ������ �߻��Ѵ�
 */
 
 -- �����߻� :  department_name�÷��� "����/�����"   �����Ͱ� �����Ѵ�. / �� �����ϰ� �ִ�.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       SYS_CONNECT_BY_PATH( department_name, '/')
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;     
 
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
UPDATE departments
   SET parent_id = 170
 WHERE department_id = 30;
 
 
-- �μ��ڵ尡 30�� ��Ʈ���� .
-- ������������ ���������� ���
-- �����Ͱ� �߸� �ԷµǾ�, ���ѷ��� ���� �߻�. CONNECT BY loop in user data
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       parent_id
  FROM departments
  START WITH department_id = 30 -- ��������
CONNECT BY PRIOR department_id  = parent_id; 

/*
�̶��� ������ �߻��� ������ ã�� �߸��� �����͸� �����ؾ� �ϴµ�, 
�̸� ���ؼ��� ���� CONNECT BY ���� NOCYCLE�� �߰��ϰ� 
SELECT ���� CONNECT_BY_ISCYCLE �ǻ� �÷��� ����� ã�� �� �ִ�. 
CONNECT_BY_ISCYCLE�� ������ ���� ���� �ο찡 �ڽ��� ���� �ִµ� 
���ÿ� �� �ڽ� �ο찡 �θ� �ο��̸� 1��, �׷��� ������ 0�� ��ȯ�Ѵ�.
*/



SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name AS depname, LEVEL, 
       CONNECT_BY_ISCYCLE IsLoop,
       parent_id
  FROM departments
  START WITH department_id = 30
CONNECT BY NOCYCLE PRIOR department_id  = parent_id; 

-- ���� �߻���Ų ����Ÿ�� Ȯ���Ѵ�.
-- ���� ���·� �ٽ� �����Ѵ�. 170 -> 10 �ڵ�� ����
UPDATE departments
   SET parent_id = 10
 WHERE department_id = 30;
  
  
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
SELECT SYS.dbms_random.VALUE FROM DUAL;

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
-- ���õ���Ÿ �۾�
CREATE TABLE ex7_1 AS  
SELECT ROWNUM seq, 
       '2014' || LPAD(CEIL(ROWNUM/1000) , 2, '0' ) month,
        ROUND(DBMS_RANDOM.VALUE (100, 1000)) amt
FROM DUAL
CONNECT BY LEVEL <= 12000;

-- 2014�⵵ 01��~12�� ����Ÿ�� �����۾�
-- ROWNUM 1~1000
SELECT CEIL(1/1000), CEIL(999/1000), CEIL(1000/1000) FROM DUAL;

-- -- ROWNUM 1001~2000
SELECT CEIL(1001/1000), CEIL(1999/1000), CEIL(2000/1000) FROM DUAL;


-- ����. INSERT~SELECT ����.
/*
INSERT INTO ���̺��A
SELECT �÷�1, �÷�2 FROM ���̺��B
*/


-- 3��29�ϱ��� �����.

SELECT *
  FROM ex7_1;
  
SELECT month, SUM(amt)
FROM ex7_1
GROUP BY month
ORDER BY month;

SELECT ROWNUM
FROM (
       SELECT 1 AS row_num
         FROM DUAL
        UNION ALL
       SELECT 1 AS row_num
         FROM DUAL
)
CONNECT BY LEVEL <= 4;
  
-- �ο츦 �÷�����

CREATE TABLE ex7_2 AS
  SELECT department_id,
         listagg(emp_name, ',') WITHIN GROUP (ORDER BY emp_name) as empnames
  FROM employees
 WHERE department_id IS NOT NULL
  GROUP BY department_id;
  
  
SELECT *
FROM ex7_2;

-- �÷��� �ο��
  
SELECT empnames,
       DECODE(level, 1, 1, instr(empnames, ',', 1, level-1)) st,
       INSTR(empnames, ',', 1, level) ed,
       LEVEL as lvl
 FROM ( SELECT empnames || ',' as empnames,
               LENGTH(empnames) ori_len,
               LENGTH(REPLACE(empnames, ',', '')) new_len
          FROM ex7_2
         WHERE department_id = 90
       )
 CONNECT BY LEVEL <= ori_len - new_len + 1;
 
 
SELECT empnames,
       DECODE(level, 1, 1, INSTR(empnames, ',', 1, LEVEL-1)) start_pos,
       INSTR(empnames, ',', 1, LEVEL) end_pos,
       LEVEL as lvl
  FROM (  SELECT empnames || ',' as empnames,
                 LENGTH(empnames) ori_len,
                 LENGTH(REPLACE(empnames, ',', '')) new_len
            FROM ex7_2
           WHERE department_id = 90
        )
  CONNECT BY LEVEL <= ori_len - new_len + 1; 
  
  
SELECT REPLACE(SUBSTR(empnames, start_pos, end_pos - start_pos), ',', '') AS emp
FROM ( SELECT empnames,
              DECODE(level, 1, 1, INSTR(empnames, ',', 1, level-1)) start_pos,
              INSTR(empnames, ',', 1, LEVEL) end_pos,
              LEVEL as lvl
      FROM (  SELECT empnames || ',' as empnames,
                     LENGTH(empnames) ori_len,
                     LENGTH(REPLACE(empnames, ',', '')) new_len
                FROM ex7_2
               WHERE department_id = 90
           )
      CONNECT BY LEVEL <= ori_len - new_len + 1
) ;
                  
  
-- WITH ��
  
SELECT b2.*
FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
         FROM kor_loan_status 
         GROUP BY period, region
      ) b2,      
      ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
         FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
                  FROM kor_loan_status 
                 GROUP BY period, region
              ) b,
              ( SELECT MAX(PERIOD) max_month
                  FROM kor_loan_status
                 GROUP BY SUBSTR(PERIOD, 1, 4)
              ) a
         WHERE b.period = a.max_month
         GROUP BY b.period
      ) c   
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;


WITH b2 AS ( SELECT period, region, sum(loan_jan_amt) jan_amt
               FROM kor_loan_status 
              GROUP BY period, region
           ),
     c AS ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
              FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
                      FROM kor_loan_status 
                     GROUP BY period, region
                   ) b,
                   ( SELECT MAX(PERIOD) max_month
                       FROM kor_loan_status
                      GROUP BY SUBSTR(PERIOD, 1, 4)
                   ) a
             WHERE b.period = a.max_month
             GROUP BY b.period
           )
SELECT b2.*
  FROM b2, c
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;           
           
           
-- ��ȯ ��������
           
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;
  
WITH recur ( department_id, parent_id, department_name, lvl)
        AS ( SELECT department_id, parent_id, department_name, 1 AS lvl
               FROM departments
              WHERE parent_id IS NULL
              UNION ALL
             SELECT a.department_id, a.parent_id, a.department_name, b.lvl + 1 
               FROM departments a, recur b
              WHERE a.parent_id = b.department_id 
              )             
SELECT department_id, LPAD(' ' , 3 * (lvl-1)) || department_name, lvl
 FROM recur;
 
 
WITH recur ( department_id, parent_id, department_name, lvl)
        AS ( SELECT department_id, parent_id, department_name, 1 AS lvl
               FROM departments
              WHERE parent_id IS NULL
              UNION ALL
             SELECT a.department_id, a.parent_id, a.department_name, b.lvl + 1 
               FROM departments a, recur b
              WHERE a.parent_id = b.department_id 
              )       
SEARCH DEPTH FIRST BY department_id SET order_seq                       
SELECT department_id, LPAD(' ' , 3 * (lvl-1)) || department_name, lvl, order_seq
 FROM recur; 


-- �м��Լ�

SELECT department_id, emp_name, 
       ROW_NUMBER() OVER (PARTITION BY department_id 
                          ORDER BY emp_name ) dep_rows
  FROM employees;
  
  
SELECT department_id, emp_name, 
       salary,
       RANK() OVER (PARTITION BY department_id 
                    ORDER BY salary ) dep_rank
  FROM employees;
  
SELECT department_id, emp_name, 
       salary,
       DENSE_RANK() OVER (PARTITION BY department_id 
                    ORDER BY salary ) dep_rank
  FROM employees;
  
SELECT *
FROM ( SELECT department_id, emp_name, 
              salary, 
              DENSE_RANK() OVER (PARTITION BY department_id 
                                 ORDER BY salary desc) dep_rank
         FROM employees
     )
WHERE dep_rank <= 3;  
    
    
SELECT department_id, emp_name, 
       salary,
       CUME_DIST() OVER (PARTITION BY department_id 
                         ORDER BY salary ) dep_dist
  FROM employees;    
  
  
SELECT department_id, emp_name, 
       salary
      ,rank() OVER (PARTITION BY department_id 
                         ORDER BY salary ) raking
      ,CUME_DIST() OVER (PARTITION BY department_id 
                         ORDER BY salary ) cume_dist_value
      ,PERCENT_RANK() OVER (PARTITION BY department_id 
                         ORDER BY salary ) percentile
  FROM employees
WHERE department_id = 60;  

SELECT department_id, emp_name, 
       salary
      ,NTILE(4) OVER (PARTITION BY department_id 
                         ORDER BY salary 
                      ) NTILES
  FROM employees
WHERE department_id IN (30, 60) ;

SELECT emp_name, hire_date, salary,
       LAG(salary, 1, 0)  OVER (ORDER BY hire_date) AS prev_sal,
       LEAD(salary, 1, 0) OVER (ORDER BY hire_date) AS next_sal
  FROM employees
 WHERE department_id = 30;
 
SELECT emp_name, hire_date, salary,
       LAG(salary, 2, 0)  OVER (ORDER BY hire_date) AS prev_sal,
       LEAD(salary, 2, 0) OVER (ORDER BY hire_date) AS next_sal
  FROM employees
 WHERE department_id = 30;
 
 
-- Window��
 
SELECT department_id, emp_name, hire_date, salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS all_salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                         ) AS first_current_sal,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                         ) AS current_end_sal
  FROM employees
 WHERE department_id IN (30, 90);
 
SELECT department_id, emp_name, hire_date, salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS all_salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE 365 PRECEDING
                         ) AS range_sal1,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE BETWEEN 365 PRECEDING AND CURRENT ROW
                         ) AS range_sal2
  FROM employees
 WHERE department_id = 30; 
 
 
SELECT department_id, emp_name, hire_date, salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS all_salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS fr_st_to_current_sal,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
 SELECT department_id, emp_name, hire_date, salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS all_salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS fr_st_to_current_sal,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
SELECT department_id, emp_name, hire_date, salary,
       NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                 ) AS all_salary,
       NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                 ) AS fr_st_to_current_sal,
       NTH_VALUE(salary,2 ) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                 ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90) ; 
 
-- ��Ÿ �м� �Լ� 

SELECT department_id, emp_name, 
       salary
      ,NTILE(4) OVER (PARTITION BY department_id 
                         ORDER BY salary 
                      ) NTILES
      ,WIDTH_BUCKET(salary, 1000, 10000, 4) widthbuacket
  FROM employees
WHERE department_id = 60; 

WITH basis AS ( SELECT period, region, SUM(loan_jan_amt) jan_amt
                  FROM kor_loan_status
                 GROUP BY period, region
              ), 
    basis2 as ( SELECT period, MIN(jan_amt) min_amt, MAX(jan_amt) max_amt
                  FROM basis
                 GROUP BY period
              )
 SELECT a.period, 
        b.region "�ּ�����", b.jan_amt "�ּұݾ�",
        c.region "�ִ�����", c.jan_amt "�ִ�ݾ�"
   FROM basis2 a, basis b, basis c
  WHERE a.period  = b.period
    AND a.min_amt = b.jan_amt 
    AND a.period  = c.period
    AND a.max_amt = c.jan_amt
  ORDER BY 1, 2;
 
 
WITH basis AS (
               SELECT period, region, SUM(loan_jan_amt) jan_amt
                 FROM kor_loan_status
                GROUP BY period, region
              )
SELECT a.period, 
       MIN(a.region) KEEP ( DENSE_RANK FIRST ORDER BY jan_amt) "�ּ�����", 
       MIN(jan_amt) "�ּұݾ�", 
       MAX(a.region) keep ( DENSE_RANK LAST ORDER BY jan_amt) "�ִ�����",
       MAX(jan_amt) "�ִ�ݾ�"
FROM basis a
GROUP BY a.period
ORDER BY 1, 2;

SELECT department_id, emp_name, hire_date, salary,
       ROUND(RATIO_TO_REPORT(salary) OVER (PARTITION BY department_id 
                                ),2) * 100 AS salary_percent
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
-- ���� ���̺� INSERT
-- ���� ���� INSERT���� �� �濡 ó��
CREATE TABLE ex7_3 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));


CREATE TABLE ex7_4 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));
       
INSERT INTO ex7_3 VALUES (101, 'ȫ�浿'); 

INSERT INTO ex7_3 VALUES (102, '������');       

INSERT ALL
INTO ex7_3 VALUES (103, '������')
INTO ex7_3 VALUES (104, '�����ҹ�')
SELECT *
FROM DUAL;

INSERT ALL
INTO ex7_3 VALUES (emp_id, emp_name)
SELECT 103 emp_id, '������' emp_name
FROM DUAL
UNION ALL
SELECT 104 emp_id, '�����ҹ�' emp_name
FROM DUAL;


INSERT ALL
INTO ex7_3 VALUES (105, '������')
INTO ex7_4 VALUES (105, '������')
SELECT *
FROM DUAL;

-- ���ǿ� ���� ���� INSERT
TRUNCATE TABLE ex7_3;

TRUNCATE TABLE ex7_4;


INSERT ALL
WHEN department_id = 30 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN department_id = 90 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, 
       employee_id, emp_name 
FROM  employees;


CREATE TABLE ex7_5 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));
       
INSERT ALL
WHEN department_id = 30 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN department_id = 90 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
ELSE
  INTO ex7_5 VALUES (employee_id, emp_name)
SELECT department_id, 
       employee_id, emp_name 
FROM  employees;
       
       
SELECT COUNT(*)
FROM EX7_5;
       
SELECT department_id, employee_id, emp_name,  salary
FROM employees
WHERE department_id = 30;

INSERT ALL
WHEN employee_id < 116 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN  salary < 5000 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, employee_id, emp_name,  salary
FROM   employees
WHERE  department_id = 30;  


SELECT *
FROM ex7_3;

SELECT *
FROM ex7_4;

INSERT FIRST
WHEN employee_id < 116 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN  salary < 5000 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, employee_id, emp_name,  salary
FROM   employees
WHERE  department_id = 30;   


