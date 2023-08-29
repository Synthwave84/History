-- scott

--19) emp 테이블에서 사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오.

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;


--20) emp 테이블에서 사원이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬하시오.

SELECT ENAME, SAL, MGR
FROM EMP
ORDER BY MGR DESC;


--21)10번 부서와 20번부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데 이름을 영문자순으로 표시하시오.

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO BETWEEN 10 AND 20
ORDER BY ENAME ASC;


--22) 커미션을 받는 모든 사원의 이름,급여 및 커미션을 커미션을 기준으로 내림차순으로 정렬하여 표시하십시오.

SELECT ENAME,SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM ASC;


--23) emp테이블의 업무(job)을 첫글자는 대문자 나머지는 소문자로 출력하시오. INITCAP() 
--업무(job)의 중복은 제거해주십시오.

SELECT DISTINCT INITCAP(JOB)
FROM EMP;


--24) emp테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력

SELECT SUBSTR(ENAME,1,3)
FROM EMP
WHERE ENAME LIKE '%A%';



--25) 이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오.

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';


-- 26) 이름이 J,A 또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 
-- 이름의 길이를 표시하시오.(열 레이블은 name과 length로 표시)

SELECT INITCAP(ENAME), ENAME, LENGTH(ENAME)
FROM EMP
WHERE ENAME LIKE 'J%' OR ENAME LIKE 'A%' OR ENAME LIKE 'M%';



--27) 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오


SELECT LOWER(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 6;

--28) 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 출력하시오.

SELECT SUBSTR(LOWER(ENAME),1,3) AS LENGTH
FROM EMP
WHERE LENGTH(ENAME) >=6;


--29) 모든 사원의 이름과 급여를 표시하시오. 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열레이블을 SALARY로 지정하시오.

SELECT ENAME, LPAD(SAL, 15, '$') AS SALARY
FROM EMP;

-- EMP테이블과 더이상 관계가 없다.
--30) 오늘부터 이번달의 마지막날까지의 남은 날 수를 구하시오.
SELECT SYSDATE
FROM DUAL;
-- 오늘 날짜

SELECT  LAST_DAY(SYSDATE)
FROM    DUAL;

SELECT TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE), 'YYMMDD')) FROM DUAL;
SELECT TO_NUMBER(TO)CHAR(SYSDATE, 'YYMMDD')) FROM DUAL;

SELECT TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE), 'YYMMDD'))
- TO_NUMBER(TO_CHAR(SYSDATE,'YYMMDD')) FROM DUAL;

SELECT LAST_DAY(SYSDATE) - SYSDATE FROM DUAL;

--31) emp테이블에서 각 사원에 대해 사원번호, 이름, 급여 및 15% 인상된 급여를 정수(반올림)로 표시하시오.
--    인상된 급여열의 레이블을 New Salary로 지정하시오.

SELECT EMPNO, ENAME, SAL, CEIL(SAL*1.15) AS "NEW SALARY"
FROM EMP;



--32) emp테이블에서 월급의 4의 배수(mod(sal,4)=0)인 사원의 이름과 월급을 출력하시오.(세자리 단위 쉼표 표시)




-- 33) 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달수)를 계산하여 열 레이블을 MONTHS_WORKED로 지정하시오. 
-- 결과는 정수로 반올림하여 표시하고 근무달 수를 기준으로 오름차순으로 정렬하시오.
-- 적고싶은 날짜가 있을 시 TO_DATE('00000000','YYYYMMDD') 사용




-- 34)emp테이블에서 이름, 업무, 근무연차를 출력하시오.




-- 35)emp테이블에서 사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여라고 해서 출력.
-- 단, NULL값은 나타나지 않게 작성하시오. NVL




-- 36)월급과 커미션을 합친 금액이 2,000이상인 급여를 받는 사원의 이름,업무,월급,커미션,고용날짜를 출력하시오. 단, 고용날짜는 1980-12-17 형태로 출력하시오.




-- 38)모든 사원의 급여의 최고액, 최저액, 총액 및 평균액을 표시하시오. 
-- 열 레이블을 각각 maximum,minimum,sum 및 average로 지정하고 
-- 결과를 정수로 반올림하고 세자리 단위로 ,를 명시하시오.




-- 39) 업무가 동일한 사원 수를 표시하는 질의를 작성하시오.




-- 40) emp테이블에서 30번부서의 사원수를 구하시오.




-- 41) emp테이블에서 업무별 최고 월급을 구하고 업무,최고 월급을 출력하시오.




-- 42) emp테이블에서 20번부서의 급여 합계를 구하고 급여 합계 금액을 출력하시오.




-- 43) emp테이블에서 부서별로 지급되는 총월급에서 금액이 7,000이상인 부서번호, 총월급을 출력하시오.



 
-- 44) emp테이블에서 업무별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 79로 시작하는 결과만 보여주시오.




-- 45) emp테이블에서 업무별 총월급을 출력하는데 업무가 'MANAGER'인 사원들은 제외하고 
-- 총월급이 5,000보다 큰 업무와 총월급만 출력하시오.




-- 46)emp테이블에서 업무별로 사원수가 4명 이상인 업무와 인원수를 출력하시오.




-- 47)emp테이블에서 사원수가 5명이 넘는 부서의 부서번호와 사원수를 구하시오.




-- 48)emp테이블에서 부서별 급여평균을 구할 때 소수점 3자리에서 반올림해서 2자리까지 구하고 
-- 부서번호, 급여평균을 출력하시오.

