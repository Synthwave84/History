-- scott

--19) emp ���̺��� �����ȣ, ����̸�, �Ի����� ����ϴµ� �Ի����� ���� ��������� �����Ͻÿ�.

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;


--20) emp ���̺��� ����̸�, �޿�, ������ ���ϰ� ������ ���� ������ �����Ͻÿ�.

SELECT ENAME, SAL, MGR
FROM EMP
ORDER BY MGR DESC;


--21)10�� �μ��� 20���μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� ����ϴµ� �̸��� �����ڼ����� ǥ���Ͻÿ�.

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO BETWEEN 10 AND 20
ORDER BY ENAME ASC;


--22) Ŀ�̼��� �޴� ��� ����� �̸�,�޿� �� Ŀ�̼��� Ŀ�̼��� �������� ������������ �����Ͽ� ǥ���Ͻʽÿ�.

SELECT ENAME,SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM ASC;


--23) emp���̺��� ����(job)�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�. INITCAP() 
--����(job)�� �ߺ��� �������ֽʽÿ�.

SELECT DISTINCT INITCAP(JOB)
FROM EMP;


--24) emp���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ���

SELECT SUBSTR(ENAME,1,3)
FROM EMP
WHERE ENAME LIKE '%A%';



--25) �̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�.

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';


-- 26) �̸��� J,A �Ǵ� M���� �����ϴ� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� 
-- �̸��� ���̸� ǥ���Ͻÿ�.(�� ���̺��� name�� length�� ǥ��)

SELECT INITCAP(ENAME), ENAME, LENGTH(ENAME)
FROM EMP
WHERE ENAME LIKE 'J%' OR ENAME LIKE 'A%' OR ENAME LIKE 'M%';



--27) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�


SELECT LOWER(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 6;

--28) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.

SELECT SUBSTR(LOWER(ENAME),1,3) AS LENGTH
FROM EMP
WHERE LENGTH(ENAME) >=6;


--29) ��� ����� �̸��� �޿��� ǥ���Ͻÿ�. �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ� �����̺��� SALARY�� �����Ͻÿ�.

SELECT ENAME, LPAD(SAL, 15, '$') AS SALARY
FROM EMP;

-- EMP���̺�� ���̻� ���谡 ����.
--30) ���ú��� �̹����� �������������� ���� �� ���� ���Ͻÿ�.
SELECT SYSDATE
FROM DUAL;
-- ���� ��¥

SELECT  LAST_DAY(SYSDATE)
FROM    DUAL;

SELECT TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE), 'YYMMDD')) FROM DUAL;
SELECT TO_NUMBER(TO)CHAR(SYSDATE, 'YYMMDD')) FROM DUAL;

SELECT TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE), 'YYMMDD'))
- TO_NUMBER(TO_CHAR(SYSDATE,'YYMMDD')) FROM DUAL;

SELECT LAST_DAY(SYSDATE) - SYSDATE FROM DUAL;

--31) emp���̺��� �� ����� ���� �����ȣ, �̸�, �޿� �� 15% �λ�� �޿��� ����(�ݿø�)�� ǥ���Ͻÿ�.
--    �λ�� �޿����� ���̺��� New Salary�� �����Ͻÿ�.

SELECT EMPNO, ENAME, SAL, CEIL(SAL*1.15) AS "NEW SALARY"
FROM EMP;



--32) emp���̺��� ������ 4�� ���(mod(sal,4)=0)�� ����� �̸��� ������ ����Ͻÿ�.(���ڸ� ���� ��ǥ ǥ��)

SELECT  ENAME, TO_CHAR(SAL, '999,999,999') 
FROM    EMP
WHERE   MOD(SAL,4)=0;


-- 33) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �޼�)�� ����Ͽ� �� ���̺��� MONTHS_WORKED�� �����Ͻÿ�. 
-- ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ��� ���� �������� ������������ �����Ͻÿ�.
-- ������� ��¥�� ���� �� TO_DATE('00000000','YYYYMMDD') ���

SELECT  ENAME, HIREDATE,ROUND (MONTHS_BETWEEN (SYSDATE,HIREDATE)) 
AS      MONTHS_WORKED
FROM    EMP
ORDER BY MONTHS_WORKED ASC;


-- 34)emp���̺��� �̸�, ����, �ٹ������� ����Ͻÿ�.

SELECT  ENAME, JOB, ROUND(MONTHS_BETWEEN (SYSDATE,HIREDATE) / 12) 
AS      YEARS
FROM    EMP
ORDER BY MONTHS_WORKED ASC;


-- 35)emp���̺��� ����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿���� �ؼ� ���.
-- ��, NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�. NVL
SELECT ENAME, SAL, SAL + NVL(COMM, 0) AS REALSAL
FROM EMP
WHERE COMM IS NOT NULL AND COMM !=0;

SELECT ENAME, SAL, NVL(COMM+SAL, SAL) AS REALSAL
FROM EMP
WHERE (COMM+SAL) IS NOT NULL AND COMM !=0;





-- 36)���ް� Ŀ�̼��� ��ģ �ݾ��� 2,000�̻��� �޿��� �޴� ����� �̸�,����,����,Ŀ�̼�,��볯¥�� 
-- ����Ͻÿ�. ��, ��볯¥�� 1980-12-17 ���·� ����Ͻÿ�.
SELECT ENAME, SAL, SAL + NVL(COMM, 0), TO_CHAR(HIREDATE, 'YYYY-MM-DD') 
FROM EMP
WHERE SAL+ NVL(COMM,0) >= 2000;



-- 38)��� ����� �޿��� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�. 
-- �� ���̺��� ���� maximum,minimum,sum �� average�� �����ϰ� 
-- ����� ������ �ݿø��ϰ� ���ڸ� ������ ,�� ����Ͻÿ�.

SELECT  TO_CHAR(MAX(SAL),'999,999') MAXIMUM, 
        TO_CHAR(MIN(SAL),'999,999') MINIMUM, 
        TO_CHAR(SUM(SAL),'999,999') SUM, 
        TO_CHAR(ROUND(AVG(SAL),0),'999,999') AVERAGE
FROM    EMP;

-- 39) ������ ������ ��� ���� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
SELECT COUNT(*), JOB
FROM EMP
GROUP BY JOB;



-- 40) emp���̺��� 30���μ��� ������� ���Ͻÿ�.

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;


-- 41) emp���̺��� ������ �ְ� ������ ���ϰ� ����,�ְ� ������ ����Ͻÿ�.

SELECT MAX(SAL), JOB
FROM EMP
GROUP BY DEPTNO,JOB;


-- 42) emp���̺��� 20���μ��� �޿� �հ踦 ���ϰ� �޿� �հ� �ݾ��� ����Ͻÿ�.

SELECT SUM(SAL)
FROM EMP
WHERE DEPTNO=20;


-- 43) emp���̺��� �μ����� ���޵Ǵ� �ѿ��޿��� �ݾ��� 7,000�̻��� �μ���ȣ, �ѿ����� ����Ͻÿ�.

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) >=7000;

 
-- 44) emp���̺��� �������� ����� ���� ���� ����� ���ϰ� �� ��� ������ ����� 79�� �����ϴ� ����� �����ֽÿ�.

SELECT MAX(EMPNO),JOB
FROM EMP
GROUP BY JOB
HAVING MAX(EMPNO) LIKE '79%';

-- 45) emp���̺��� ������ �ѿ����� ����ϴµ� ������ 'MANAGER'�� ������� �����ϰ� 
-- �ѿ����� 5,000���� ū ������ �ѿ��޸� ����Ͻÿ�.

SELECT SUM(SAL), JOB
FROM EMP
WHERE JOB!='MANAGER'
GROUP BY JOB
HAVING SUM(SAL)>5000;


-- 46)emp���̺��� �������� ������� 4�� �̻��� ������ �ο����� ����Ͻÿ�.

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >=4;


-- 47)emp���̺��� ������� 5���� �Ѵ� �μ��� �μ���ȣ�� ������� ���Ͻÿ�.

SELECT COUNT(*), DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) > 5;


-- 48)emp���̺��� �μ��� �޿������ ���� �� �Ҽ��� 3�ڸ����� �ݿø��ؼ� 2�ڸ����� ���ϰ� 
-- �μ���ȣ, �޿������ ����Ͻÿ�.

SELECT ROUND(AVG(SAL),2), DEPTNO
FROM EMP
GROUP BY DEPTNO;

