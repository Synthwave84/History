-- hr 정렬

-- 문제1) EMPLOYEES 테이블에서 입사일자 순으로 정렬하여 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.
-- ASC는 안적어도 되지만 가독성을 위해 적어준다.

SELECT      EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY, HIRE_DATE
FROM        EMPLOYEES
ORDER BY    HIRE_DATE ASC;



-- 문제2) EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.

SELECT      EMPLOYEE_ID, LAST_NAME,JOB_ID, SALARY, DEPARTMENT_ID
FROM        EMPLOYEES
ORDER BY    HIRE_DATE ASC;

-- 문제3) EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은 순으로 정렬하여 
-- 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라.

SELECT      EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY
FROM        EMPLOYEES
ORDER BY    DEPARTMENT_ID ASC, SALARY DESC;


-- 문제4) EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째 정렬은 급여가 많은 순으로 정렬하여 

-- 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력하여라.

SELECT      EMPLOYEE_ID, LAST_NAME, HIRE_DATE, JOB_ID, DEPARTMENT_ID, SALARY
FROM        EMPLOYEES
ORDER BY    DEPARTMENT_ID ASC, JOB_ID ASC, SALARY DESC;


-- hr 그룹핑

-- 문제1) EMPLOYEES 테이블에서 모든 SALESMAN(SA_)에 대하여 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하여라.

SELECT 
        SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM    EMPLOYEES
WHERE   JOB_ID LIKE 'SA%';



-- 문제2) EMPLOYEES 테이블에 등록되어 있는 인원수, 
-- 보너스가 NULL이 아닌 인원수, 보너스의 평균, 등록되어 있는 부서의 수를 구하여 출력하라.

SELECT  COUNT(*), COUNT(COMMISSION_PCT),
        ROUND(AVG(COMMISSION_PCT* SALARY)),
        COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;



-- 문제3) EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고 급여, 급여의 합을 구하여 출력하라.

SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



-- 문제4) EMPLOYEES 테이블에서 각 부서별로 인원수,급여의 평균, 최저 급여, 최고 급여, 
-- 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라.

SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY TOTAL_SALARY DESC;



-- 문제5) EMPLOYEES 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 
-- 급여의 합을 구하여 출력하여라.

SELECT COUNT(*), DEPARTMENT_ID, JOB_ID, ROUND(AVG(SALARY),2), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

-- 문제6) EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라

SELECT DEPARTMENT_ID, SUM(SALARY), COUNT(*) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 4;


-- 문제7) EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서 부서번호, 평균 급여, 급여의 합을 구하여 출력하여라.

SELECT MAX(SALARY), ROUND(AVG(SALARY),2), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 10000;


-- 문제8) EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명,평균 급여, 급여의 합을 구하여 출력하라.

SELECT JOB_ID,AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;





-- 문제9) EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 
-- 단 판매원(SA_)은 제외하고 월 급여 합계로 정렬(내림차순)하라.

SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID NOT LIKE 'SA%'
GROUP BY JOB_ID
HAVING SUM(SALARY) >= 10000
ORDER BY SUM(SALARY) DESC;
