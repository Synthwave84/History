-- ������̺� (EMP)���� �̸� (ENAME)���� SC�� �����ϴ� �̸� �˻�

SELECT  *
FROM    EMP
WHERE   ENAME LIKE 'SC%';

-- ������̺� (EMP)���� �̸� (ENAME)�� ER�� ������ �̸� �˻�

SELECT  *
FROM    EMP
WHERE   ENAME LIKE '%ER';

-- ������̺� (EMP)���� �̸� (ENAME)�� AN�� �����ϰ� �ִ� �̸� �˻�

SELECT *
FROM EMP
WHERE ENAME LIKE '%AN%';

-- ������̺� (EMP)���� �̸� (ENAME)�� N I�� �����ϰ� �ִ� �̸��˻�

SELECT *
FROM EMP
WHERE ENAME LIKE '%N%' OR ENAME LIKE '%I%';
