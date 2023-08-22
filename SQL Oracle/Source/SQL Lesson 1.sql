-- 사원테이블 (EMP)에서 이름 (ENAME)에서 SC로 시작하는 이름 검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE 'SC%';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 ER로 끝나는 이름 검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%ER';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 AN을 포함하고 있는 이름 검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%AM%';

-- 사원테이블 (EMP)에서 이름 (ENAME)로 N I를 포함하고 있는 이름검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%M%I%' OR ENAME LIKE '%I%M%';


SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '%M%I%';

-- 사원테이블(EMP) 에서 이름 (ENAME)이 5글자이고 마지막문자가 'S'인 이름 검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '____S';

-- 사원테이블 EMP에서 이름 ENAME이 2번째 위치가 A인 이름 검색

SELECT  ENAME
FROM    EMP
WHERE   ENAME LIKE '__A%';
