-- ������̺� (EMP)���� �̸� (ENAME)���� SC�� �����ϴ� �̸� �˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE 'SC%';

-- ������̺� (EMP)���� �̸� (ENAME)�� ER�� ������ �̸� �˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%ER';

-- ������̺� (EMP)���� �̸� (ENAME)�� AN�� �����ϰ� �ִ� �̸� �˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%AM%';

-- ������̺� (EMP)���� �̸� (ENAME)�� N I�� �����ϰ� �ִ� �̸��˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%M%I%' OR ENAME LIKE '%I%M%';


SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%M%I%';

-- ������̺�(EMP) ���� �̸� (ENAME)�� 5�����̰� ���������ڰ� 'S'�� �̸� �˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '____S';

-- ������̺� EMP���� �̸� ENAME�� 2��° ��ġ�� A�� �̸� �˻�

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '__A%';
