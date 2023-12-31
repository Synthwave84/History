-- hr 계정 접속 사용


--오라클 11g hr계정 연습문제


--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 

-- 출력 시 년도를 기준으로 오름차순 정렬하시오. 

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

--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
-- LOCATIONS, EMPLOYEES, DEPARTMENTS
-- 평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 

-- 단, 도시에 근 무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.

-- 3개 테이블 조인

SELECT      AVG(A.SALARY), MIN(A.SALARY), C.CITY, COUNT(C.CITY)
FROM        EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND         B.LOCATION_ID = C.LOCATION_ID
GROUP BY    C.CITY 
HAVING      COUNT(*) < 10
ORDER BY    AVG(A.SALARY) ASC;




--3. ‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 

-- (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.) 

-- 이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.

-- 필요 테이블. JOBS, JOB_HISTORY,EMPLOYEES 테이블 참조

SELECT  A.EMPLOYEE_ID, A.FIRST_NAME || '-' || A.LAST_NAME AS NAME
FROM    EMPLOYEES A, JOBS B, JOB_HISTORY C
WHERE   A.EMPLOYEE_ID = C.EMPLOYEE_ID
AND     B.JOB_ID = C.JOB_ID
AND     B.JOB_TITLE = 'Public Accountant';




--4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과 연봉(salary)를 출 력하시오. 

-- EMPLOYEES 테이블 참조. SELF JOIN

SELECT E.LAST_NAME, E.SALARY 
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.EMPLOYEE_ID
AND E.SALARY > M.SALARY;





--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 

-- 부서명(department_name)을 조회합니다. 

-- 이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오. 


SELECT  A.EMPLOYEE_ID, A.HIRE_DATE, A.FIRST_NAME, A.LAST_NAME, B.DEPARTMENT_NAME
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     A.HIRE_DATE BETWEEN '07-01-01' AND '08-01-01';

SELECT  A.EMPLOYEE_ID, A.HIRE_DATE, A.FIRST_NAME, 
        A.LAST_NAME, NVL(B.DEPARTMENT_NAME, '<Not Assigned>')
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
AND     TO_CHAR(A.HIRE_DATE, 'YYYY') = 2007;



--6. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000이상, 10,000 이하인 

-- 직원들의 이름(first_name), 성(last_name)과 연봉(salary)를 출력하시오

SELECT  A.FIRST_NAME, A.LAST_NAME, A.SALARY, B.JOB_TITLE
FROM    EMPLOYEES A , JOBS B
WHERE   A.JOB_ID = B.JOB_ID
AND     A.SALARY BETWEEN 9000 AND 10000
AND     JOB_TITLE LIKE 'Sales Representative';

--7. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 

-- 이름은 last_name만 출력하며, 부서이름으로 오름차순 정렬하고, 

-- 부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 출력합니다. 
-- INLINE VIEW : FROM절의 서브쿼리.

-- 기초 데이터
SELECT  *
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- 서브 쿼리
SELECT      B.DEPARTMENT_NAME, MIN(A.SALARY)
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME;


-- 1) 데이터 오류
SELECT      A.LAST_NAME , B.*
FROM        EMPLOYEES A,
            (
                SELECT      B.DEPARTMENT_NAME, MIN(A.SALARY) AS MIN_SALARY
                FROM        EMPLOYEES A, DEPARTMENTS B
                WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
                GROUP BY    B.DEPARTMENT_NAME
            ) B
WHERE       A.SALARY = B.MIN_SALARY;

-- 2) 옳은 방법
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


-- 명령어 공부 필요. RANK() 함수 사용.
--8. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 

-- 5명의 last_name, first_name, salary를 조회하는 sql문장을 작성하시오.



--9. 사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름, 해당 사원의 매니저 이름, 사원 의 부서이름을 출력하시오. 
-- 이때 사원의 매니저가 없을 경우 ‘<없음>’이라고 출력하시오. 이름은 last_name만 출력하며, 
-- 사원의 이름을 오름차순으로 정렬하시오. 

-- 테이블 : EMPLOYEES, DEPARTMENTS, LOCATIONS

-- SELF JOIN을 사용해야 하는 이유
SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
FROM    EMPLOYEES;

-- SELF JOIN 기초데이터
SELECT      B.EMPLOYEE_ID AS E_ID, A.MANAGER_ID AS M_ID, A.FIRST_NAME, A.LAST_NAME
FROM        EMPLOYEES A LEFT OUTER JOIN EMPLOYEES B 
ON          A.MANAGER_ID = B.EMPLOYEE_ID;


SELECT  E.E_NAME, NVL(E.M_NAME, '<없음>'), D.DEPARTMENT_NAME
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




-- 10. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 
-- 업무명(job_title)과 연봉 총합을 조회하시오. 단 연봉총합이 30,000보다 큰 업무만 출력하시오. 

-- 참조 테이블 : JOBS, EMPLOYEES

-- 기초 데이터

SELECT      *
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID;

-- 각 업무(JOB) 별로 연봉(SALARY)의 총합
SELECT      J.JOB_TITLE, SUM(E.SALARY)
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID
GROUP BY    J.JOB_TITLE;


-- 조건 : 연봉 총합이 30000 보다 큰 업무만 출력
SELECT      J.JOB_TITLE, SUM(E.SALARY)
FROM        EMPLOYEES E, JOBS J
WHERE       E.JOB_ID= J.JOB_ID
GROUP BY    J.JOB_TITLE
HAVING      SUM(E.SALARY) > 30000
ORDER BY    SUM(E.SALARY) DESC;




--11. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 업무명(job_title), 
-- 부서 명(department_name)을 조회하시오. 
-- 단 도시명(city)이 ‘Seattle’인 지역(location)의 부서 (department)에 근무하는 직원을 사원번호 오름차순순으로 출력하시오.

-- 필요테이블 : EMPLOYEES, DEPARTMENTS, LOACATIONS, JOBS

SELECT      E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM        EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, JOBS J
WHERE       E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND         D.LOCATION_ID = L.LOCATION_ID
AND         J.JOB_ID =  E.JOB_ID
AND         L.CITY = 'Seattle'
ORDER BY    E.EMPLOYEE_ID ASC;


--12. 2001~20003년사이에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 
-- 관리자 이름(fist_name)을 조회합니다. 단, 관리자가 없는 사원정보도 출력 결과에 포함시켜 출력한다.

-- 필요 테이블 Employees

-- 2001~2003
SELECT  * 
FROM    EMPLOYEES
WHERE   TO_CHAR(HIRE_DATE,'YYYY') BETWEEN '2001' AND '2003';

-- 기초 데이터
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



--13. ‘Sales’ 부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 

-- 단, 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다. 

-- 테이블 : EMPLOYEES, DEPARTMENTS

-- 기초 데이터
SELECT  *
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 조건 'SALES' 부서

SELECT  *
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Sales';

-- 조건 : 급여는 100번 부서의 평균
SELECT  AVG(SALARY)
FROM    EMPLOYEES 
WHERE   DEPARTMENT_ID = '100';

-- 결과
SELECT  E.FIRST_NAME, E.SALARY, D.DEPARTMENT_NAME
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Sales'
AND     E.SALARY < (
                    SELECT  AVG(SALARY)
                    FROM    EMPLOYEES 
                    WHERE   DEPARTMENT_ID = '100'
                    );




--14. Employees 테이블에서 입사한달(hire_date)별로 인원수를 조회하시오.

SELECT  COUNT(*), TO_CHAR(HIRE_DATE ,'MM')  
FROM    EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE ,'MM');

--15. 부서별 직원들의 최대, 최소, 평균급여를 조회하되, 

-- 평균급여가 ‘IT’ 부서의 평균급여보다 많고, ‘Sales’ 부서의 평균보다 적은 부서 정보만 출력하시오. 

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




-- 문제오류
/*
        각 부서별 직원의 근무 인원수를 조회하라. 단 직원이 없는 부서에 대해서는
        <신생부서>또는 0 라는 문자열 출력.
*/

--16. 각 부서별로 직원이 한명만 있는 부서만 조회하시오. 
-- 단, 직원이 없는 부서에 대해서는 ‘<신생부서>’라는 문자열이 출력되도록 하고,
-- 출력결과는 다음과 같이 부서명이 내림차순 으로 정렬되어야한다. 

/*      문제 수정
        각 부서별 직원의 근무 인원수를 조회하라. 단 직원이 없는 부서에 대해서는
        <신생부서>또는 0 라는 문자열 출력.
*/


-- EMPLOYEES, DEPARTMENTS

SELECT  *
FROM    EMPLOYEES A, DEPARTMENTS B
WHERE   A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- 부서원이 없는 데이터.

SELECT  *
FROM    EMPLOYEES A RIGHT OUTER JOIN DEPARTMENTS B
ON      A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND     B.DEPARTMENT_ID IS NULL;


-- 사원테이블에 존재하는 부서

SELECT  DISTINCT DEPARTMENT_ID
FROM    EMPLOYEES;

SELECT  E.DEPARTMENT_ID, D.DEPARTMENT_ID
FROM    DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON      E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 각 부서별 직원

SELECT      B.DEPARTMENT_NAME
FROM        EMPLOYEES A, DEPARTMENTS B
WHERE       A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME
HAVING      COUNT(*) = 1
ORDER BY    B.DEPARTMENT_NAME;

 SELECT     D.DEPARTMENT_NAME , COUNT(E.DEPARTMENT_ID)
            FROM        DEPARTMENTS D   RIGHT OUTER JOIN EMPLOYEES E
            ON          E.DEPARTMENT_ID = D.DEPARTMENT_ID
            GROUP BY    D.DEPARTMENT_NAME
            HAVING COUNT(*) = 1;

-- 기초데이터
SELECT  *
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID;

SELECT  E.DEPARTMENT_ID, D.DEPARTMENT_ID
FROM    DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E 
ON      E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 부서안에 부서원이 없는 데이타

-- 사원테이블에 존재하는 부서 : 11건
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

-- 부서테이블 : 27건
SELECT COUNT(*) FROM DEPARTMENTS;

SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 사원이 없는 부서코드
SELECT DEPARTMENT_ID FROM DEPARTMENTS
MINUS
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

-- 사원이 없는 부서 : 27건 - 11건 = 16건..  대표이사 부서소속 NULL



--1)
SELECT      NVL2(E.DEPARTMENT_ID, D.DEPARTMENT_NAME, '<부서없음>'), COUNT(E.DEPARTMENT_ID)
FROM        DEPARTMENTS D LEFT JOIN EMPLOYEES E
ON          D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY    NVL2(E.DEPARTMENT_ID, D.DEPARTMENT_NAME, '<부서없음>');
--2)
SELECT      NVL2(E.DEPARTMENT_ID, D.DEPARTMENT_NAME, '<부서없음>'), COUNT(D.DEPARTMENT_NAME)
FROM        DEPARTMENTS D LEFT JOIN EMPLOYEES E
ON          D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY    NVL2(E.DEPARTMENT_ID, D.DEPARTMENT_NAME, '<부서없음>');

--17. 부서별 입사월별 직원수를 출력하시오. 

-- 단, 직원수가 5명 이상인 부서만 출력되어야 하며 출력결과는 부서이름 순으로 한다.

-- 기초 데이터
SELECT  *
FROM    EMPLOYEES A INNER JOIN DEPARTMENTS B
ON      A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- (부서별 입사일별 : 직원수 )

SELECT      B.DEPARTMENT_NAME, TO_CHAR(A.HIRE_DATE, 'MM') ,COUNT(*) 
FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    B.DEPARTMENT_NAME, TO_CHAR(A.HIRE_DATE, 'MM')
HAVING      COUNT (*) >= 5
ORDER BY    B.DEPARTMENT_NAME ASC;



--18. 국가(country_name) 별 도시(city)별 직원수를 조회하시오. 

-- 단, 부서에 속해있지 않은 직원 이 있기 때문에 106명의 직원만 출력이 된다. 

-- 부서정보가 없는 직원은 국가명과 도시명 대신에 ‘<부서없음>’이 출력되도록 하여 107명 모두 출력되게 한다.

-- 테이블명 : COUNTRIES, DEPARTMENTS, LOCATIONS, EMPLOYEES

-- 기초데이터 

SELECT  *
FROM    EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        INNER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
        INNER JOIN COUNTRIES C ON L.COUNTRY_ID  = C.COUNTRY_ID;
        
-- LEFT OUTER JOIN

SELECT      NVL(C.COUNTRY_NAME , '<부서 없음>') AS COUNTRY_NAME,
            NVL(L.CITY, '<부서없음>'), COUNT(*)
FROM        
            EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
            LEFT JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
            LEFT JOIN COUNTRIES C ON L.COUNTRY_ID  = C.COUNTRY_ID
GROUP BY    C.COUNTRY_NAME, L.CITY;

--19. 각 부서별 최대 급여자의 아이디(employee_id), 이름(first_name), 급여(salary)를 출력하시오. 

-- 단, 최대 급여자가 속한 부서의 평균급여를 마지막으로 출력하여 평균급여와 비교할 수 있게 할 것.

-- 테이블 : DEPARTMENTS, EMPLOYEES

-- EMPLOYEE_ID는 GROUP BY의 직계함수가 아니라 작성이 안된다.
SELECT      A.DEPARTMENT_ID, MAX(A.SALARY), TRUNC(AVG(A.SALARY), 2) AS AVG
FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY    A.DEPARTMENT_ID;

-- 인라인 뷰

SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A2.SALARY, A2.AVG
FROM   EMPLOYEES A
        INNER JOIN ( 
                    SELECT      A.DEPARTMENT_ID, MAX(A.SALARY) AS SALARY, 
                                TRUNC(AVG(A.SALARY), 2) AS AVG
                    FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
                    ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
                    GROUP BY    A.DEPARTMENT_ID
                    ) A2
ON A.SALARY = A2.SALARY 
AND A.DEPARTMENT_ID = A2.DEPARTMENT_ID;


--20. 커미션(commission_pct)별 직원수를 조회하시오. 

-- 커미션은 아래실행결과처럼 0.2, 0.25는 모두 .2로, 
                          -- 0.3, 0.35는 .3 형태로 출력되어야 한다. 

-- 단, 커미션 정보가 없는 직원들도 있는 데 커미션이 없는 직원 그룹은 ‘<커미션 없음>’이 출력되게 한다.

--  .2, 0.2
SELECT TO_CHAR(TRUNC(0.2,1)), TRUNC(0.25,1) FROM DUAL; 
--  .2, 0.3
SELECT TO_CHAR(TRUNC(0.3,1)), TRUNC(0.35,1) FROM DUAL;

--  데이터를 가공하여 사용한다.
SELECT      NVL(TO_CHAR(TRUNC(COMMISSION_PCT, 1)), '<커미션 없음>'), COUNT(*)
FROM        EMPLOYEES
GROUP BY    NVL(TO_CHAR(TRUNC(COMMISSION_PCT, 1)), '<커미션 없음>');

SELECT      NVL(TO_CHAR(TRUNC(COMMISSION_PCT, 1)), '<커미션 없음>'), COUNT(*) 
FROM        EMPLOYEES
GROUP BY    NVL(TO_CHAR(TRUNC(COMMISSION_PCT, 1)), '<커미션 없음>'); 


--21. 커미션(commission_pct)을 가장 많이 받은 상위 4명의 부서명(department_name), 
-- 직원명 (first_name), 급여(salary), 커미션(commission_pct) 정보를 조회하시오. 
-- 출력결과는 커미션 을 많이 받는 순서로 출력하되 동일한 커미션에 대해서는 
-- 급여가 높은 직원이 먼저 출력 되게 한다

-- 테이블 : EMPLOYEES, DEPARTMENTS

-- TOP N 쿼리 > 상위 ~~를 가져와라.

SELECT      ROWNUM, EMPLOYEE_ID
FROM        EMPLOYEES;

SELECT      ROWNUM, EMPLOYEE_ID 
FROM        EMPLOYEES
WHERE       ROWNUM <= 5;


-- 불가능. 특정범위에 해당하는 조건은 불가능하다.
SELECT      ROWNUM, EMPLOYEE_ID
FROM        EMPLOYEES
WHERE       ROWNUM>= 5
AND         ROWNUM <= 10;  

--  상단의 형태를 사용하면 데이터가 없다. 인라인 뷰를 사용하여
--  결과를 얻을 수 있다. ROWNUM의 동작방식 ?문에, 다음과 같이 사용한다.
SELECT * 
FROM 
    ( 
        SELECT  ROWNUM AS RN, EMPLOYEE_ID
        FROM    EMPLOYEES
    )
WHERE   RN >= 5 AND RN <= 10;

--  기초 데이터

SELECT      A.FIRST_NAME, B.DEPARTMENT_NAME, A.SALARY, A.COMMISSION_PCT
FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
ORDER BY    A.COMMISSION_PCT DESC, A.SALARY DESC;

-- 가장 많이 받는 상위 4명의 데이터

-- 잘못된 쿼리.
SELECT      ROWNUM,A.FIRST_NAME, B.DEPARTMENT_NAME, A.SALARY, A.COMMISSION_PCT
FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
--AND         ROWNUM <= 4 << 잘못된 값이다.
ORDER BY    A.COMMISSION_PCT DESC, A.SALARY DESC;


-- 인라인 뷰 방식을 이용해야 한다.

SELECT      *
FROM        (
            SELECT      ROWNUM AS RN,A.FIRST_NAME, B.DEPARTMENT_NAME, A.SALARY, A.COMMISSION_PCT
            FROM        EMPLOYEES A INNER JOIN DEPARTMENTS B
            ON          A.DEPARTMENT_ID = B.DEPARTMENT_ID
            ORDER BY    A.COMMISSION_PCT DESC, A.SALARY DESC
            )
WHERE       RN >= 4;







