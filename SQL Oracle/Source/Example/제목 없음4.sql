-- hr ����

-- ����1) EMPLOYEES ���̺��� �Ի����� ������ �����Ͽ� �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.
-- ASC�� ����� ������ �������� ���� �����ش�.

SELECT      EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY, HIRE_DATE
FROM        EMPLOYEES
ORDER BY    HIRE_DATE ASC;



-- ����2) EMPLOYEES ���̺��� ���� �ֱٿ� �Ի��� ������ �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.

SELECT      EMPLOYEE_ID, LAST_NAME,JOB_ID, SALARY, DEPARTMENT_ID
FROM        EMPLOYEES
ORDER BY    HIRE_DATE ASC;

-- ����3) EMPLOYEES ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ��� �޿��� ���� ������ �����Ͽ� 
-- �����ȣ, ����, ����, �μ���ȣ, �޿��� ����Ͽ���.

SELECT      EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY
FROM        EMPLOYEES
ORDER BY    DEPARTMENT_ID ASC, SALARY DESC;


-- ����4) EMPLOYEES ���̺��� ù��° ������ �μ���ȣ�� �ι�° ������ ������ ����° ������ �޿��� ���� ������ �����Ͽ� 

-- �����ȣ, ����, �Ի�����, �μ���ȣ, ����, �޿��� ����Ͽ���.

SELECT      EMPLOYEE_ID, LAST_NAME, HIRE_DATE, JOB_ID, DEPARTMENT_ID, SALARY
FROM        EMPLOYEES
ORDER BY    DEPARTMENT_ID ASC, JOB_ID ASC, SALARY DESC;


-- hr �׷���

-- ����1) EMPLOYEES ���̺��� ��� SALESMAN(SA_)�� ���Ͽ� �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����Ͽ���.

SELECT 
        SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM    EMPLOYEES
WHERE   JOB_ID LIKE 'SA%';



-- ����2) EMPLOYEES ���̺� ��ϵǾ� �ִ� �ο���, 
-- ���ʽ��� NULL�� �ƴ� �ο���, ���ʽ��� ���, ��ϵǾ� �ִ� �μ��� ���� ���Ͽ� ����϶�.

SELECT  COUNT(*), COUNT(COMMISSION_PCT),
        ROUND(AVG(COMMISSION_PCT* SALARY)),
        COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;



-- ����3) EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ����϶�.

SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



-- ����4) EMPLOYEES ���̺��� �� �μ����� �ο���,�޿��� ���, ���� �޿�, �ְ� �޿�, 
-- �޿��� ���� ���Ͽ� �޿��� ���� ���� ������ ����Ͽ���.

SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY TOTAL_SALARY DESC;



-- ����5) EMPLOYEES ���̺��� �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, 
-- �޿��� ���� ���Ͽ� ����Ͽ���.

SELECT COUNT(*), DEPARTMENT_ID, JOB_ID, ROUND(AVG(SALARY),2), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

-- ����6) EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���

SELECT DEPARTMENT_ID, SUM(SALARY), COUNT(*) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 4;


-- ����7) EMPLOYEES ���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ� �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.

SELECT MAX(SALARY), ROUND(AVG(SALARY),2), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 10000;


-- ����8) EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ����϶�.

SELECT JOB_ID,AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;





-- ����9) EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. 
-- �� �Ǹſ�(SA_)�� �����ϰ� �� �޿� �հ�� ����(��������)�϶�.

SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID NOT LIKE 'SA%'
GROUP BY JOB_ID
HAVING SUM(SALARY) >= 10000
ORDER BY SUM(SALARY) DESC;
