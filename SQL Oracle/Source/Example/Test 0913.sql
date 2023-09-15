-- hr ���� ���� ���


--����Ŭ 11g hr���� ��������


--1. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 

-- ��� �� �⵵�� �������� �������� �����Ͻÿ�. 

SELECT A.HIRE_DATE, A.SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID
AND B.JOB_TITLE LIKE 'Sales Manager';

SELECT  TO_CHAR(A.HIRE_DATE, 'YYYY'), AVG(A.SALARY)
FROM    EMPLOYEES A, JOBS B
WHERE   A.JOB_ID = B.JOB_ID
AND     B.JOB_TITLE = 'Sales Manager'
GROUP BY TO_CHAR(A.HIRE_DATE, 'YYYY')
ORDER BY TO_CHAR(A.HIRE_DATE, 'YYYY') ASC;

--2. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
-- LOCATIONS, EMPLOYEES, DEPARTMENTS
-- ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 

-- ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.

-- 3�� ���̺� ����

SELECT      AVG(A.SALARY), MIN(A.SALARY), C.CITY, COUNT(C.CITY)
FROM        EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND         B.LOCATION_ID = C.LOCATION_ID
GROUP BY    C.CITY 
HAVING      COUNT(*) < 10
ORDER BY    AVG(A.SALARY) ASC;




--3. ��Public Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 

-- (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.) 

-- �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.

-- �ʿ� ���̺�. JOBS, JOB_HISTORY,EMPLOYEES ���̺� ����

SELECT  A.EMPLOYEE_ID, A.FIRST_NAME || '-' || A.LAST_NAME AS NAME
FROM    EMPLOYEES A, JOBS B, JOB_HISTORY C
WHERE   A.EMPLOYEE_ID = C.EMPLOYEE_ID
AND     B.JOB_ID = C.JOB_ID
AND     B.JOB_TITLE = 'Public Accountant';




--4. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�. 

-- EMPLOYEES ���̺� ����. SELF JOIN

SELECT E.LAST_NAME, E.SALARY 
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.EMPLOYEE_ID
AND E.SALARY > M.SALARY;





--5. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 

-- �μ���(department_name)�� ��ȸ�մϴ�. 

-- �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�. 


SELECT  A.EMPLOYEE_ID, A.HIRE_DATE, A.FIRST_NAME, A.LAST_NAME, B.DEPARTMENT_NAME
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     A.HIRE_DATE BETWEEN '07-01-01' AND '08-01-01';

SELECT  A.EMPLOYEE_ID, A.HIRE_DATE, A.FIRST_NAME, 
        A.LAST_NAME, NVL(B.DEPARTMENT_NAME, '<Not Assigned>')
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
AND     TO_CHAR(A.HIRE_DATE, 'YYYY') = 2007;



--6. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 

-- �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�

SELECT  A.FIRST_NAME, A.LAST_NAME, A.SALARY, B.JOB_TITLE
FROM    EMPLOYEES A , JOBS B
WHERE   A.JOB_ID = B.JOB_ID
AND     A.SALARY BETWEEN 9000 AND 10000
AND     JOB_TITLE LIKE 'Sales Representative';

--7. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 

-- �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 

-- �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�. 
-- INLINE VIEW : FROM���� ��������.

-- ���� ������
SELECT  *
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ���� ����
SELECT      B.DEPARTMENT_NAME, MIN(A.SALARY)
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME;


-- 1) ������ ����
SELECT      A.LAST_NAME , B.*
FROM        EMPLOYEES A,
            (
                SELECT      B.DEPARTMENT_NAME, MIN(A.SALARY) AS MIN_SALARY
                FROM        EMPLOYEES A, DEPARTMENTS B
                WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
                GROUP BY    B.DEPARTMENT_NAME
            ) B
WHERE       A.SALARY = B.MIN_SALARY;

-- 2) ���� ���
SELECT      E.LAST_NAME , A.*
FROM        EMPLOYEES E,
            (
                SELECT      D.DEPARTMENT_ID, D.DEPARTMENT_NAME, MIN(E.SALARY) AS MIN_SALARY
                FROM        EMPLOYEES E, DEPARTMENTS D
                WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID
                GROUP BY    D.DEPARTMENT_ID, D.DEPARTMENT_NAME
            ) A
WHERE       E.SALARY = A.MIN_SALARY
AND         E.DEPARTMENT_ID = A.DEPARTMENT_ID;




SELECT      A.LAST_NAME, A.SALARY, B.DEPARTMENT_NAME
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID;

SELECT      MIN(A.SALARY), B.DEPARTMENT_NAME
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME
ORDER BY    B.DEPARTMENT_NAME ASC; 


-- ��ɾ� ���� �ʿ�. RANK() �Լ� ���.
--8. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 

-- 5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.



--9. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
-- �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
-- ����� �̸��� ������������ �����Ͻÿ�. 

-- ���̺� : EMPLOYEES, DEPARTMENTS, LOCATIONS

-- SELF JOIN�� ����ؾ� �ϴ� ����
SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
FROM    EMPLOYEES;

-- SELF JOIN ���ʵ�����
SELECT      B.EMPLOYEE_ID AS E_ID, A.MANAGER_ID AS M_ID, A.FIRST_NAME, A.LAST_NAME
FROM        EMPLOYEES A LEFT OUTER JOIN EMPLOYEES B 
ON          A.MANAGER_ID = B.EMPLOYEE_ID;


SELECT  E.E_NAME, NVL(E.M_NAME, '<����>'), D.DEPARTMENT_NAME
FROM    (
            SELECT      A.FIRST_NAME AS E_NAME, B.LAST_NAME AS M_NAME, A.DEPARTMENT_ID
            FROM        EMPLOYEES A LEFT OUTER JOIN EMPLOYEES B 
            ON          A.MANAGER_ID = B.EMPLOYEE_ID
        )   E,
            DEPARTMENTS D, LOCATIONS L
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND         D.LOCATION_ID = L.LOCATION_ID
AND         L.CITY ='Seattle'
ORDER BY    E.E_NAME ASC;




-- 10. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
-- ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�. 

-- ���� ���̺� : JOBS, EMPLOYEES

-- ���� ������

SELECT      *
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID;

-- �� ����(JOB) ���� ����(SALARY)�� ����
SELECT      J.JOB_TITLE, SUM(E.SALARY)
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID
GROUP BY    J.JOB_TITLE;


-- ���� : ���� ������ 30000 ���� ū ������ ���
SELECT      J.JOB_TITLE, SUM(E.SALARY)
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID
GROUP BY    J.JOB_TITLE
HAVING      SUM(E.SALARY) > 30000
ORDER BY    SUM(E.SALARY) DESC;




--11. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
-- �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
-- �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.

-- �ʿ����̺� : EMPLOYEES, DEPARTMENTS, LOACATIONS, JOBS

SELECT      E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM        EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, JOBS J
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND         D.LOCATION_ID = L.LOCATION_ID
AND         J.JOB_ID =  E.JOB_ID
AND         L.CITY = 'Seattle'
ORDER BY    E.EMPLOYEE_ID ASC;


--12. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
-- ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

-- �ʿ� ���̺� Employees

-- 2001~2003
SELECT  * 
FROM    EMPLOYEES
WHERE   TO_CHAR(HIRE_DATE,'YYYY') BETWEEN '2001' AND '2003';

-- ���� ������
SELECT  A.HIRE_DATE, A.FIRST_NAME,A.EMPLOYEE_ID,A.MANAGER_ID, B.FIRST_NAME, A.HIRE_DATE 
FROM    EMPLOYEES A, EMPLOYEES B
WHERE   A.MANAGER_ID = B.EMPLOYEE_ID(+)
AND     TO_CHAR(A.HIRE_DATE,'YYYY') BETWEEN '2001' AND '2003';

SELECT  A.FIRST_NAME, TO_CHAR(A.HIRE_DATE, 'YYYY'), A.MANAGER_ID, B.FIRST_NAME
FROM    EMPLOYEES A INNER JOIN EMPLOYEES B
ON      A.MANAGER_ID = B.EMPLOYEE_ID
AND     TO_CHAR(A.HIRE_DATE,'YYYY') BETWEEN '2001' AND '2003';



SELECT      E.EMP_ID,  E.E_NAME, NVL(E.M_NAME,'-NONE-'), E.HIRE_DATE
FROM        (
                SELECT    A.FIRST_NAME AS E_NAME, B.FIRST_NAME AS M_NAME, A.HIRE_DATE, A.EMPLOYEE_ID AS EMP_ID
                FROM      EMPLOYEES A LEFT OUTER JOIN EMPLOYEES B 
                ON        A.MANAGER_ID = B.EMPLOYEE_ID
            )   E
WHERE     E.HIRE_DATE BETWEEN '2001-01-01' AND '2003-12-31';



--13. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 

-- ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 

-- ���̺� : EMPLOYEES, DEPARTMENTS

-- ���� ������
SELECT  *
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ���� 'SALES' �μ�

SELECT  *
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Sales';

-- ���� : �޿��� 100�� �μ��� ���
SELECT  AVG(SALARY)
FROM    EMPLOYEES 
WHERE   DEPARTMENT_ID = '100';

-- ���
SELECT  E.FIRST_NAME, E.SALARY, D.DEPARTMENT_NAME
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Sales'
AND     E.SALARY < (
                    SELECT  AVG(SALARY)
                    FROM    EMPLOYEES 
                    WHERE   DEPARTMENT_ID = '100'
                    );




--14. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.

SELECT  COUNT(*), TO_CHAR(HIRE_DATE ,'MM')  
FROM    EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE ,'MM');

--15. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 

-- ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 

-- EMPLOYEES, DEPARTMENTS

SELECT  *
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE  A.DEPARTMENT_ID = B.DEPARTMENT_ID;

SELECT      MIN(A.SALARY), MAX(A.SALARY), AVG(A.SALARY), A.DEPARTMENT_ID
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    A.DEPARTMENT_ID;


SELECT  AVG(A.SALARY)
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     DEPARTMENT_NAME=    'IT';

SELECT  AVG(A.SALARY)
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     DEPARTMENT_NAME=    'Sales';

SELECT  MAX(A.SALARY), MIN(A.SALARY), AVG(A.SALARY)
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID
HAVING      AVG(A.SALARY) >    (
                                SELECT  AVG(A.SALARY)
                                FROM    EMPLOYEES A, DEPARTMENTS B
                                WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
                                AND     DEPARTMENT_NAME=    'IT'
                                )
AND     AVG(A.SALARY) <         (
                                SELECT  AVG(A.SALARY)
                                FROM    EMPLOYEES A, DEPARTMENTS B
                                WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
                                AND     DEPARTMENT_NAME=    'Sales'
                                );




-- ��������
/*
        �� �μ��� ������ �ٹ� �ο����� ��ȸ�϶�. �� ������ ���� �μ��� ���ؼ���
        <�Ż��μ�>�Ǵ� 0 ��� ���ڿ� ���.
*/

--16. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
-- ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
-- ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�. 



 SELECT     D.DEPARTMENT_NAME , COUNT(E.DEPARTMENT_ID)
            FROM        DEPARTMENTS D   RIGHT OUTER JOIN EMPLOYEES E
            ON          E.DEPARTMENT_ID = D.DEPARTMENT_ID
            GROUP BY    D.DEPARTMENT_NAME
            HAVING COUNT(*) = 1;








-- EMPLOYEES, DEPARTMENTS

SELECT  *
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- �μ����� ���� ������.

SELECT  *
FROM    EMPLOYEES A RIGHT OUTER JOIN DEPARTMENTS B
ON      A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     B.DEPARTMENT_ID IS NULL;


-- ������̺� �����ϴ� �μ�

SELECT  DISTINCT DEPARTMENT_ID
FROM    EMPLOYEES;


-- �� �μ��� ����

SELECT      B.DEPARTMENT_NAME
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME
HAVING      COUNT(*) = 1
ORDER BY    B.DEPARTMENT_NAME;



--17. �μ��� �Ի���� �������� ����Ͻÿ�. 

-- ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.



--18. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 

-- ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 

-- �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.

?

?

?

--19. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 

-- ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.

?

?

?

--20. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 

-- Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 

-- ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.

?

?

?

--21. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4���� �μ���(department_name), 

-- ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 

-- ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�