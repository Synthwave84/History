--JOIN , SUB QUARY

-- 1. �ּұ޿��� �޴� ����� ���� �μ����� �ٹ��ϴ� ��� �����, �μ����� ���

-- �ּ� �޿��� �޴� ���
SELECT  MIN(SAL) 
FROM    EMP;

-- �ּ� �޿��� �޴� ����� �μ�
SELECT  DEPTNO 
FROM    EMP 
WHERE   SAL = (SELECT MIN(SAL) FROM EMP);

-- �� �μ��� ���� �����, �μ��� ���
SELECT  A.ENAME, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     B.DEPTNO = (SELECT DEPTNO 
                    FROM EMP 
                    WHERE SAL = (SELECT MIN(SAL) FROM EMP));

-- 2. CLARK ���� �Ի����� ���� ����� ���� �μ����� �ٹ��ϴ� ������� �μ���, �̸�, �޿��� ��� 

-- CLARK �Ի���
SELECT  HIREDATE 
FROM    EMP
WHERE   ENAME = 'CLARK';

-- CLARK ���� �Ի����� ���� ����� ���� �μ�
SELECT DEPTNO FROM EMP
WHERE HIREDATE > (SELECT  HIREDATE 
FROM    EMP
WHERE   ENAME = 'CLARK');




SELECT  B.DNAME, A.ENAME, A.SAL, A.HIREDATE
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND A.DEPTNO IN (SELECT DEPTNO 
                 FROM EMP
                 WHERE HIREDATE > ( SELECT HIREDATE 
                                    FROM EMP 
                                    WHERE ENAME = 'CLARK'));

-- 3. �̸��� 'K'�ڰ� ���� ����� �� �޿��� ���� ���� ����� �μ���, �����, �޿��� ��� 


SELECT  MIN(SAL),
FROM    EMP
WHERE   ENAME LIKE '%K%';

SELECT  B.DNAME, A.ENAME, A.SAL
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.SAL = (SELECT MIN(SAL)
                 FROM EMP
                 WHERE ENAME LIKE'%K');


-- 4. Ŀ�̼� ����� ���� ����� �Ի����� ���� ���� ����� �μ���, �����, �Ի����� ���

SELECT MIN(HIREDATE)
FROM EMP
WHERE COMM IS NULL;

SELECT  A.ENAME, A.HIREDATE, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.HIREDATE =( SELECT MIN(HIREDATE)
                      FROM EMP
                      WHERE COMM IS NULL);


-- 5. ��ġ�� ��ī���� �μ��� ���� ������� �̸��� �μ����� ���.

SELECT  A.ENAME, B.DNAME, B.LOC
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     LOC = (SELECT LOC
               FROM DEPT
               WHERE LOC LIKE 'CHICAGO');
-- 6. KING�� �޿����� CLARK�� �޿��� �� ������� ���� �޿��� �޴� ����� �μ���, �̸�, �޿��� ��� 

SELECT SAL FROM EMP WHERE ENAME = 'KING';

SELECT SAL FROM EMP WHERE ENAME = 'CLARK';
-- �޿�����
-- ���������� FROM��, WHERE��, SELECT���� �� �� �� �ִ�. 
SELECT
    (SELECT SAL FROM EMP WHERE ENAME= 'KING') 
    - 
    (SELECT SAL FROM EMP WHERE ENAME = 'CLARK')
    FROM DUAL;


SELECT  A.ENAME, A.SAL, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND   A.SAL < (
                 SELECT (SELECT SAL FROM EMP WHERE ENAME= 'KING') 
                 - 
                (SELECT SAL FROM EMP WHERE ENAME = 'CLARK')
                 FROM DUAL
              );

-- 7. DALLAS�� ��ġ�� �μ��� ���� ����� �ѻ����, ��ձ޿�,��ü�޿�,�ְ�޿�,�����޿��� ���ϼ���. 

SELECT  COUNT(*)
FROM DEPT , EMP
WHERE LOC LIKE 'DALLAS'

-- 8. Ŀ�̼� ��������� ������ �̸��� 'N'�ڰ� ���� ����� �� �޿��� ���� ���� ����� �����, �޿�,�μ����� ���

?

-- 9. ALLEN ���� �Ի����� ���� ����� �μ���,������� ���

?

?

-- 10. EMP ���̺��� �̸��� 5������ ����� �޿��� ���� ���� ����� �̸�, �޿� , �μ����� ���

?

?

-- 11. CLARK �� ���� �μ��� ��� �������� �޿��� ���� ����� �Ի����� ���� ���� ����� �μ���, �����, �޿��� ���

?

?

?

-- 12. ALLEN�� �μ����� ���

?

?

-- 13. �̸��� J�� ���� ����� ��, �޿��� ���� ���� ����� �����ȣ, �̸�, �μ���, �޿�, �μ���ġ�� ���

?

?

?

?

-- 14. �ι�°�� ���� �޿��� �޴� ����� �̸��� �μ���,�޿��� ���

?

?

?

-- 15. �Ի����� 2��°�� ���� ����� �μ���� �̸�, �Ի����� ���

?

?

-- 16. DALLAS�� ��ġ�� �μ��� ��� �� �ִ� �޿��� �޴� ����� �޿����� �ּ� �޿��� �޴� ����� �޿��� �� ����� ���