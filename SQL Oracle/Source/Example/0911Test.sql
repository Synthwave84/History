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
                  
-- ANSI                    
SELECT  A.ENAME, B.DNAME
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
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

-- ANSI
SELECT  B.DNAME, A.ENAME, A.SAL, A.HIREDATE
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
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

-- ANSI
SELECT  B.DNAME, A.ENAME, A.SAL
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
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
               
-- ANSI

SELECT  A.ENAME, B.DNAME, B.LOC
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
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
              
-- ANSI
SELECT  A.ENAME, A.SAL, B.DNAME
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
AND   A.SAL < (
                 SELECT (SELECT SAL FROM EMP WHERE ENAME= 'KING') 
                 - 
                (SELECT SAL FROM EMP WHERE ENAME = 'CLARK')
                 FROM DUAL
              );

-- 7. DALLAS�� ��ġ�� �μ��� ���� ����� �ѻ����, ��ձ޿�,��ü�޿�,�ְ��޿�,�����޿��� ���ϼ���. 

SELECT DEPTNO
FROM DEPT
WHERE LOC LIKE 'DALLAS';

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 20;

SELECT AVG(SAL), SUM(SAL), MAX(SAL), MIN(SAL)
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPT 
                WHERE LOC='DALLAS');
                
                


-- 8. Ŀ�̼� ��������� ������ �̸��� 'N'�ڰ� ���� ����� �� �޿��� ���� ���� ����� �����, �޿�,�μ����� ���

SELECT A.ENAME, A.SAL, B.DNAME, A.COMM
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.SAL = (SELECT MIN(SAL) 
             FROM EMP 
             WHERE COMM IS NOT NULL 
             AND ENAME LIKE'%N%');

-- ANSI
SELECT A.ENAME, A.SAL, B.DNAME, A.COMM
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
AND A.SAL = (SELECT MIN(SAL) 
             FROM EMP 
             WHERE COMM IS NOT NULL 
             AND ENAME LIKE'%N%');


-- 9. ALLEN ���� �Ի����� ���� ����� �μ���,������� ���

SELECT ENAME, HIREDATE
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.HIREDATE < (  SELECT HIREDATE
                    FROM EMP
                    WHERE ENAME = 'ALLEN');
                    
                    
--ANSI
SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
AND A.HIREDATE < (  SELECT HIREDATE
                    FROM EMP
                    WHERE ENAME = 'ALLEN');


-- 10. EMP ���̺����� �̸��� 5������ ����� �޿��� ���� ���� ����� �̸�, �޿� , �μ����� ���
SELECT  MAX(SAL) 
FROM    EMP
WHERE   LENGTH(ENAME) = 5;


SELECT  A.ENAME, A.SAL, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.SAL = (SELECT  MAX(SAL) 
                 FROM    EMP
                 WHERE   LENGTH(ENAME) = 5 );

-- ANSI
SELECT  A.ENAME, A.SAL, B.DNAME
FROM    EMP A INNER JOIN DEPT B
ON      A.DEPTNO = B.DEPTNO
AND     A.SAL = (SELECT  MAX(SAL) 
                 FROM    EMP
                 WHERE   LENGTH(ENAME) = 5 );



-- 11. CLARK �� ���� �μ��� ��� �������� �޿��� ���� ����� �Ի����� ���� ���� ����� �μ���, �����, �޿��� ���

SELECT ENAME, DEPTNO
FROM EMP
WHERE ENAME = 'CLARK';

SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO=10;

SELECT  A.ENAME, A.SAL, A.HIREDATE, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.SAL > (SELECT AVG(SAL)
                 FROM EMP
                 WHERE DEPTNO=10);              

-- ANSI
SELECT  A.ENAME, A.SAL, A.HIREDATE, B.DNAME
FROM    EMP A INNER JOIN DEPT B
ON      A.DEPTNO = B.DEPTNO
AND     A.SAL > (SELECT AVG(SAL)
                 FROM EMP
                 WHERE DEPTNO=10);     
                 
-- ?�� �������� �޿��� ���� ��� �� �Ի���

SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.HIREDATE  = (
                    SELECT MIN(HIREDATE)
                    FROM EMP 
                    WHERE SAL > (SELECT AVG(SAL) 
                                 FROM EMP 
                                 WHERE DEPTNO = (SELECT DEPTNO 
                                                 FROM EMP 
                                                 WHERE ENAME = 'CLARK'))
                  );

-- ANSI
SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
AND A.HIREDATE  = (
                    SELECT MIN(HIREDATE)
                    FROM EMP 
                    WHERE SAL > (SELECT AVG(SAL) 
                                 FROM EMP 
                                 WHERE DEPTNO = (SELECT DEPTNO 
                                                 FROM EMP 
                                                 WHERE ENAME = 'CLARK'))
                  );

-- 12. ALLEN�� �μ����� ���

SELECT A.ENAME , B.DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.ENAME LIKE 'ALLEN';


SELECT A.ENAME , B.DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
AND A.ENAME LIKE 'ALLEN';

-- 13. �̸��� J�� ���� ����� ��, �޿��� ���� ���� ����� �����ȣ, �̸�, �μ���, �޿�, �μ���ġ�� ���

SELECT A.SAL, A.EMPNO, A.ENAME, B.DNAME, B.LOC
FROM EMP A , DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND SAL =   (SELECT MAX(SAL) 
             FROM EMP 
             WHERE ENAME LIKE '%J%');
             
-- ANSI             
SELECT  A.SAL, A.EMPNO, A.ENAME, B.DNAME, B.LOC
FROM    EMP A INNER JOIN DEPT B
ON      A.DEPTNO = B.DEPTNO
AND     SAL =   (SELECT MAX(SAL) 
             FROM EMP 
             WHERE ENAME LIKE '%J%');

-- 14. �ι�°�� ���� �޿��� �޴� ����� �̸��� �μ���,�޿��� ���

-- ���� ���� �޿�
SELECT  MAX(SAL)
FROM    EMP; -- 5000

SELECT  A.ENAME , B.DNAME, A.SAL
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND SAL = (SELECT  MAX(SAL)
           FROM    EMP
           WHERE   SAL < (SELECT MAX(SAL)
                          FROM EMP));

-- ANSI
SELECT  A.ENAME , B.DNAME, A.SAL
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
AND SAL = (SELECT  MAX(SAL)
           FROM    EMP
           WHERE   SAL < (SELECT MAX(SAL)
                          FROM EMP));



-- 15. �Ի����� 2��°�� ���� ����� �μ����� �̸�, �Ի����� ���

SELECT  A.ENAME, A.HIREDATE, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.HIREDATE = (SELECT MIN(HIREDATE)
                      FROM EMP
                      WHERE HIREDATE > (SELECT MIN(HIREDATE)
                                        FROM EMP));
-- ANSI
SELECT  A.ENAME, A.HIREDATE, B.DNAME
FROM    EMP A INNER JOIN DEPT B
ON   A.DEPTNO = B.DEPTNO
AND     A.HIREDATE = (SELECT MIN(HIREDATE)
                      FROM EMP
                      WHERE HIREDATE > (SELECT MIN(HIREDATE)
                                        FROM EMP));
                                                                               

-- 16. DALLAS�� ��ġ�� �μ��� ��� �� �ִ� �޿��� �޴� ����� �޿����� �ּ� �޿��� �޴� ����� �޿��� �� ����� ���

SELECT DEPTNO
FROM   DEPT
WHERE  LOC LIKE 'DALLAS'; -- 20;


SELECT distinct (SELECT (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 20)
                       -
                      (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 20)
                       FROM DUAL)
FROM    EMP;

SELECT MAX(SAL) - MIN(SAL) 
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND B.LOC = 'DALLAS';

SELECT MAX(SAL) - MIN(SAL) 
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
AND B.LOC = 'DALLAS';
 

