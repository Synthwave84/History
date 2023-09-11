--JOIN , SUB QUARY

-- 1. 최소급여를 받는 사원과 같은 부서에서 근무하는 모든 사원명, 부서명을 출력

-- 최소 급여를 받는 사원
SELECT  MIN(SAL) 
FROM    EMP;

-- 최소 급여를 받는 사원의 부서
SELECT  DEPTNO 
FROM    EMP 
WHERE   SAL = (SELECT MIN(SAL) FROM EMP);

-- 그 부서의 같은 사원명, 부서명 출력
SELECT  A.ENAME, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     B.DEPTNO = (SELECT DEPTNO 
                    FROM EMP 
                    WHERE SAL = (SELECT MIN(SAL) FROM EMP));

-- 2. CLARK 보다 입사일이 늦은 사원과 같은 부서에서 근무하는 사원들의 부서명, 이름, 급여를 출력 

-- CLARK 입사일
SELECT  HIREDATE 
FROM    EMP
WHERE   ENAME = 'CLARK';

-- CLARK 보다 입사일이 늦은 사원과 같은 부서
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

-- 3. 이름에 'K'자가 들어가는 사원들 중 급여가 가장 적은 사원의 부서명, 사원명, 급여를 출력 


SELECT  MIN(SAL),
FROM    EMP
WHERE   ENAME LIKE '%K%';

SELECT  B.DNAME, A.ENAME, A.SAL
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.SAL = (SELECT MIN(SAL)
                 FROM EMP
                 WHERE ENAME LIKE'%K');


-- 4. 커미션 계약이 없는 사원중 입사일이 가장 빠른 사원의 부서명, 사원명, 입사일을 출력

SELECT MIN(HIREDATE)
FROM EMP
WHERE COMM IS NULL;

SELECT  A.ENAME, A.HIREDATE, B.DNAME
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     A.HIREDATE =( SELECT MIN(HIREDATE)
                      FROM EMP
                      WHERE COMM IS NULL);


-- 5. 위치가 시카고인 부서에 속한 사원들의 이름과 부서명을 출력.

SELECT  A.ENAME, B.DNAME, B.LOC
FROM    EMP A, DEPT B
WHERE   A.DEPTNO = B.DEPTNO
AND     LOC = (SELECT LOC
               FROM DEPT
               WHERE LOC LIKE 'CHICAGO');
-- 6. KING의 급여에서 CLARK의 급여를 뺀 결과보다 적은 급여를 받는 사원의 부서명, 이름, 급여를 출력 

SELECT SAL FROM EMP WHERE ENAME = 'KING';

SELECT SAL FROM EMP WHERE ENAME = 'CLARK';
-- 급여차이
-- 서브쿼리는 FROM절, WHERE절, SELECT절에 다 올 수 있다. 
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

-- 7. DALLAS에 위치한 부서에 속한 사원의 총사원수, 평균급여,전체급여,최고급여,초저급여를 구하세요. 

SELECT  COUNT(*)
FROM DEPT , EMP
WHERE LOC LIKE 'DALLAS'

-- 8. 커미션 계약조건이 있으며 이름에 'N'자가 들어가는 사원들 중 급여가 가장 적은 사원의 사원명, 급여,부서명을 출력

?

-- 9. ALLEN 보다 입사일이 빠른 사원의 부서명,사원명을 출력

?

?

-- 10. EMP 테이블에서 이름이 5글자인 사원중 급여가 가장 높은 사원의 이름, 급여 , 부서명을 출력

?

?

-- 11. CLARK 이 속한 부서의 평균 연봉보다 급여가 높은 사원중 입사일이 가장 빠른 사원의 부서명, 사원명, 급여를 출력

?

?

?

-- 12. ALLEN의 부서명을 출력

?

?

-- 13. 이름에 J가 들어가는 사원들 중, 급여가 가장 높은 사원의 사원번호, 이름, 부서명, 급여, 부서위치를 출력

?

?

?

?

-- 14. 두번째로 많은 급여를 받는 사원의 이름과 부서명,급여를 출력

?

?

?

-- 15. 입사일이 2번째로 빠른 사원의 부서명과 이름, 입사일을 출력

?

?

-- 16. DALLAS에 위치한 부서의 사원 중 최대 급여를 받는 사원의 급여에서 최소 급여를 받는 사원의 급여를 뺀 결과를 출력