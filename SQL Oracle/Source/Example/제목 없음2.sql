-- 사원테이블 (EMP)에서 이름 (ENAME)에서 SC로 시작하는 이름 검색

SELECT  *
FROM    EMP
WHERE   ENAME LIKE 'SC%';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 ER로 끝나는 이름 검색

SELECT  *
FROM    EMP
WHERE   ENAME LIKE '%ER';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 AN을 포함하고 있는 이름 검색

SELECT *
FROM EMP
WHERE ENAME LIKE '%AN%';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 N I를 포함하고 있는 이름검색

SELECT *
FROM EMP
WHERE ENAME LIKE '%N%' OR ENAME LIKE '%I%';
