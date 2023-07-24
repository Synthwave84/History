-- 조인 실습
-- 질의? 사원테이블에서 사원번호, 이름, 급여, 입사일자, 부서코드를 출력하라.
SELECT employee_id, EMP_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES;

-- 질의? 사원테이블에서 사원번호, 이름, 급여, 입사일자, 부서이름을 출력하라.
-- 사원테이블 : 사원번호, 이름, 급여, 입사일자, [부서코드]
-- 부서테이블 : 부서이름, [부서코드]
-- 공통점 : 부서코드로 2개 테이블을 연결, 비교할수가 있다.

-- 테이블 별칭 사용 안한 경우
SELECT EMPLOYEES.employee_id, EMPLOYEES.EMP_NAME, EMPLOYEES.SALARY, EMPLOYEES.HIRE_DATE, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.department_id = DEPARTMENTS.department_id;

-- 테이블 별칭 사용 경우
SELECT e.employee_id, e.EMP_NAME, e.SALARY, e.HIRE_DATE, d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.department_id;

-- SELECT절의 컬럼명에 별칭생략
SELECT employee_id, EMP_NAME, SALARY, HIRE_DATE, DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.department_id;


-- 내부조인(INNER JOIN) , 동등조인
-- 즉 사원 테이블의 전체 건수가 107건이지만 부서번호가 없는 사원이 한 건 존재하므로 106건이 조회된 것이다.
-- 사원테이블에 부서코드가 NULL 인 데이타 1건 존재함.
--1)오라클 조인
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id;  --   조인조건식. 106건
 
 -- 사원테이블에 부서코드가 NULL 인 데이타를 포함하여 조회 할 경우에는 OUTER JOIN사용
 -- 일치하지 않는 데이타도 포함
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id(+);
 
 --2) ANSI-SQL 조인
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id;
 
-- 테이블 3개, 4를 참조하여, 조인하는 구문
--1)오라클 조인
-- 3개
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
  FROM employees a,
       departments b,
       job_history jh
 WHERE a.department_id = b.department_id
 AND a.employee_id = jh.employee_id;
 -- 4개
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id, j.job_title
  FROM employees a,
       departments b,
       job_history jh,
       jobs j
 WHERE a.department_id = b.department_id
 AND a.employee_id = jh.employee_id
 AND j.job_id = jh.job_id;
 
  --2) ANSI-SQL 조인
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id;
 
 -- 3개
 SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id
 INNER JOIN job_history jh
 ON a.employee_id = jh.employee_id;
  
 -- 4개 ( 4 - 1 = 3)
  SELECT a.employee_id, a.emp_name, a.department_id, b.department_name, jh.job_id, j.job_title
 FROM employees a INNER JOIN departments b
 ON a.department_id = b.department_id
 INNER JOIN job_history jh
 ON a.employee_id = jh.employee_id
 INNER JOIN jobs j
 ON j.job_id = jh.job_id;
 
 
 
 
 
 
 
 
 
 
 
 
 
 


-- 세미조인
/*
세미 조인(SEMI-JOIN)은 서브 쿼리를 사용해 서브 쿼리에 존재하는 데이터만 메인 쿼리에서 추출하는 조인 방법으로 IN과 EXISTS 연산자를 사용한 조인이다.
*/
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;


SELECT department_id, department_name
  FROM departments a
 WHERE a.department_id  IN ( SELECT b.department_id
                               FROM employees b
                              WHERE b.salary > 3000)
ORDER BY department_name;


SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;


-- 안티조인
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id NOT IN ( SELECT department_id
                                  FROM departments 
                                 WHERE manager_id IS NULL) ;


SELECT count(*)
  FROM employees a
 WHERE NOT EXISTS ( SELECT 1
                      FROM departments c
                   WHERE a.department_id = c.department_id 
AND manager_id IS NULL) ;


-- 셀프조인
/*
셀프란 말에서 알 수 있듯이, 셀프 조인(SELF-JOIN)은 서로 다른 두 테이블이 아닌 동일한 한 테이블을 사용해 조인하는 방법을 말한다.
*/

SELECT employee_id, emp_name FROM employees;

/*
사원 테이블을 A, B로 나누어 조인을 하는데, 
같은 부서번호를 가진 사원 중 A 사원번호가 B 사원번호보다 작은 건을 조회하는 쿼리다. 
사원 테이블에서 부서번호가 20인 건은 단 2건 뿐인데(201과 202), ①조건에 의해 결과는 1건만 추출된 점에 유념하자.
*/
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
  FROM employees a,
        employees b
 WHERE a.employee_id < b.employee_id      --  A 사원번호가 B 사원번호보다 작은 건
   AND a.department_id = b.department_id    -- 같은 부서번호
   AND a.department_id = 20;    -- 부서번호가 20인 건
   




-- 외부조인(outer join)
-- 3가지 구분 left outer join, right outer join, 
--  full outer join 오라클에서는 지원안함. ANSI-SQL에서는 지원함.

-- 내부조인(INNER JOIN)
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id;

SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id;   -- 10건.



-- 1)오라클 OUTER JOIN
-- DEPARTMENTS 부서테이블에 프로젝트가 존재하지않는 부서가 존재.
-- left outer join
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id(+);   -- 10건.
-- right outer join
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE b.department_id(+) = a.department_id;   -- 10건.


SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id (+) ;

-- 2)ANSI-SQL OUTER JOIN
-- LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
-- 테이블의 위치를 가리키는 의미로 LEFT OR RIGHT 로 OUTER JOIN에 사용됨.
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a LEFT OUTER JOIN job_history b
ON a.department_id = b.department_id;

SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM  job_history b RIGHT OUTER JOIN departments a
ON a.department_id = b.department_id;


-- FULL OUTE JOIN
--오라클 지원안함.(에러발생)
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id(+) = b.department_id (+) ;

-- ANSI-SQL
-- job_history테이블의 부서는 departments 테이블의 부분집합에 해당된다.
-- RIGHT OUTER JOIN 사용하면, 아래 결과와 동일하다.
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM  job_history b FULL OUTER JOIN departments a
ON a.department_id = b.department_id;


SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM DEPARTMENTS a, JOB_HISTORY b
WHERE a.department_id = b.department_id;   -- 10건.


-- employees 테이블 (모든사원 - 프로젝트 참여한 사원, 프로젝트 참여하지 않은 사원)
-- job_history 테이블 : 프로젝트에 참여한 사원정보
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a,
       job_history b
 WHERE a.employee_id = b.employee_id(+)
   AND a.department_id = b.department_id;


select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);


-- 카타시안 조인
/*
카타시안 조인(CATASIAN PRODUCT)은 WHERE 절에 조인 조건이 없는 조인을 말한다. 
즉 FROM 절에 테이블을 명시했으나, 두 테이블 간 조인 조건이 없는 조인이다. 
조인 조건이 없으므로 엄밀히 말해 조인이라 말할 수 없을 수도 있지만, 
FROM 절에 2개 이상 테이블을 명시했으므로 일종의 조인이다. 
조인 조건이 없으므로 그 결과는 두 테이블 건수의 곱이다. 
즉 A 테이블 건수가 n1, B 테이블 건수가 n2라고 한다면, 결과 건수는 ‘n1 * n2’가 된다.
*/
-- 107 * 27 = 2889 수평적 결합의 데이터행이 존재한다.
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,  -- 107
       departments b;  -- 27


-- ANSI 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    ON (a.department_id = b.department_id )
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


SELECT a.employee_id, a.emp_name, department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


-- ANSI 외부조인
select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT OUTER JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM job_history b 
  RIGHT OUTER JOIN employees a
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;


-- CROSS 조인

-- 오라클 : 카타시안 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;

-- ANSI-SQL CROSS JOIN
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a 
CROSS JOIN departments b;


-- FULL OUTER 조인
CREATE TABLE HONG_A  (EMP_ID INT);

CREATE TABLE HONG_B  (EMP_ID INT);

INSERT INTO HONG_A VALUES ( 10);

INSERT INTO HONG_A VALUES ( 20);

INSERT INTO HONG_A VALUES ( 40);

INSERT INTO HONG_B VALUES ( 10);

INSERT INTO HONG_B VALUES ( 20);

INSERT INTO HONG_B VALUES ( 30);

COMMIT;

SELECT * FROM HONG_A;
SELECT * FROM HONG_B;


-- INNER JOIN
--1)오라클 버전
SELECT a.emp_id, b.emp_id
FROM HONG_A a, HONG_B b
WHERE a.emp_id = b.emp_id;

--2)ansi-sql
SELECT a.emp_id, b.emp_id
FROM HONG_A a INNER JOIN HONG_B b
ON a.emp_id = b.emp_id;

-- left outer join
-- ORACLE 
SELECT a.emp_id, b.emp_id
FROM hong_a a, 
     hong_b b
WHERE a.emp_id = b.emp_id(+);

-- ansi-sql
SELECT a.emp_id, b.emp_id
FROM hong_a a LEFT OUTER JOIN     hong_b b
ON a.emp_id = b.emp_id;

-- RIGHT OUTER JOIN
-- ORACLE 
SELECT a.emp_id, b.emp_id
FROM hong_b b, hong_a a      
WHERE a.emp_id(+) = b.emp_id;

-- ansi-sql
SELECT a.emp_id, b.emp_id
FROM hong_a a RIGHT OUTER JOIN hong_b b
ON a.emp_id = b.emp_id;

-- FULL OUTER JOIN
-- ORACLE : 지원안함. 에러발생
SELECT a.emp_id, b.emp_id
FROM hong_b b, hong_a a      
WHERE a.emp_id(+) = b.emp_id(+);

-- ANSI-SQL

SELECT a.emp_id, b.emp_id
FROM hong_a a
FULL OUTER JOIN hong_b b
ON ( a.emp_id = b.emp_id);


-- 서브쿼리 : Sub-Query 란 한 SQL 문장 안에서 보조로 사용되는 또 다른 SELECT문을 의미한다
-- 하위질의, 부질의 동의어.
/*
    구분 - 메인쿼리와 서브쿼리가 연관 관계(관련) 유무.
    1)연관성이 없는 서브쿼리 - 서브쿼리가 메인쿼리에서 사용하는 테이블의 컬럼을 참조 안하는 유형.
       - 서브쿼리가 독립적인 실행이 가능한 구문.
       - 조건식에서 사용시 서브쿼리의 실행이 먼저되어 결과값을 가지고 조건식에 사용된다.
    2)연관성이 있는 서브쿼리 - 메인쿼리와 관계가 있다. 독립적으로 실행이 불가능하다. 이유는 서브쿼리 내용의 일부가 메인쿼리 테이블을 참조하기 때문
*/

-- 연관성 없는 서브쿼리 

-- 유형1>
-- 질의?  전 사원의 평균 급여 이상을 받는 사원 수를 조회하는 쿼리다.

-- 전 사원의 평균 급여
SELECT AVG(SALARY) FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841

SELECT COUNT(*) -- 메인쿼리
FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES);  -- 51.. 서브쿼리



SELECT count(*)
  FROM employees 
 WHERE salary >=  ( SELECT AVG(salary)
                      FROM employees );

-- 유형2>

-- 질의? 부서 테이블에서 parent_id가 NULL인 부서번호를 가진 사원의 총 건수를 반환하는 쿼리다
-- 총무기획부(10)에 소속된 사원 수는 몇명?

-- 단계1> 부서 테이블에서 parent_id가 NULL인 부서번호
SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE PARENT_ID IS NULL;


-- 서브쿼리가 WHERE 조건식에서 사용시 = , IN 차이점.

--1) = 사용 : 서브쿼리가 단일값이어야 한다. ( 값이 하나 )

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = (50, 70);  -- 에러

SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE PARENT_ID IS NULL);


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (50, 70);
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 OR  DEPARTMENT_ID = 70;

--2) IN : 서브쿼리의 결과가 1개 이상일 경우.
SELECT count(*)
  FROM employees 
 WHERE department_id IN ( SELECT department_id
                            FROM departments
                           WHERE parent_id IS NULL);


-- 유형3 : 여러개의 컬럼을 비교하는 서브쿼리.
-- 조건식에서 비교하는 컬럼의 개수와 데이타타입이 일치해야 한다.

SELECT employee_id, job_id FROM job_history;

-- 2개의 컬럼에 서브쿼리의 조건식 값이 일치되는 데이타 조회
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id ) IN ( SELECT employee_id, job_id
                                    FROM job_history);

-- INSERT, UPDATE, MERGE, DELETE 문에서도 서브쿼리 사용이 지원된다.
UPDATE employees
   SET salary = ( SELECT AVG(salary)
                    FROM employees );


DELETE employees
 WHERE salary >= ( SELECT AVG(salary)
                    FROM employees );
                    
ROLLBACK;                    


-- 연관성 있는 서브쿼리  
-- 동작?

SELECT 1 FROM job_history b
                WHERE a.department_id = b.department_id;

-- 메인쿼리의 departments테이블 데이타 27개가 서브쿼리에서 비교되어, 
-- 일치되는 데이타는 메인쿼리로 보내고, 일치되지 않는 데이타는 버린다.
-- 메인쿼리에서는 일치된 리턴받은 데이타를 가지고, SELECT 절에서 출력된다.


-- EXISTS(SELECT 문) : SELECT 문이 실행되어 결과값이 존재할 때 TRUE

-- EXISTS() 함수 사용법
SELECT 1 FROM DUAL WHERE 0 = 0;
-- 서브쿼리의 결과값이 존재하면, EXISTS()  반환값이 TRUE
SELECT 'YES' FROM DUAL WHERE EXISTS(SELECT 1 FROM DUAL WHERE 0 = 0);


SELECT 1 FROM DUAL WHERE 0 = 1;
-- 서브쿼리의 결과값이 존재하지 않으면, EXISTS()  반환값이 FALSE
SELECT 'YES' FROM DUAL WHERE EXISTS(SELECT 1 FROM DUAL WHERE 0 = 1);

-- 중복된 데이탁 존재 안한다.
SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );
/*
20,마케팅
50,배송부
60,IT
80,영업부
90,기획부
110,경리부
*/
                
-- 위의 구문을 조인으로 변환 : 중복된 데이타가 존재한다.
SELECT a.department_id, a.department_name
FROM departments a, job_history b
WHERE a.department_id = b.department_id;
/*
20	마케팅
50	배송부
50	배송부
60	IT
80	영업부
80	영업부
90	기획부
90	기획부
110	경리부
110	경리부
*/
                

-- select 절 : 테이블의 컬럼명, 함수사용, 서브쿼리
SELECT a.employee_id, 
       ( SELECT b.emp_name
           FROM employees b
          WHERE a.employee_id = b.employee_id) AS emp_name,
       a.department_id,
       ( SELECT b.department_name
           FROM departments b
          WHERE a.department_id = b.department_id) AS dep_name     
FROM job_history a;  -- 10건

-- 조인구문으로 변환
-- 결과가 동일한 경우에는 성능적으로 볼때, 조인이 연관성있는 서브쿼리보다는 비교적 좋은편이다.
SELECT a.employee_id, b.emp_name, c.department_name
FROM job_history a, employees b, departments c
WHERE a.employee_id = b.employee_id
AND a.department_id = c.department_id
ORDER BY a.employee_id ASC;
/*
101,Neena Kochhar,경리부
101,Neena Kochhar,경리부
102,Lex De Haan,IT
114,Den Raphaely,배송부
122,Payam Kaufling,배송부
176,Jonathon Taylor,영업부
176,Jonathon Taylor,영업부
200,Jennifer Whalen,기획부
200,Jennifer Whalen,기획부
201,Michael Hartstein,마케팅
*/


-- 서브쿼리가 중첩되어 있는 구조.
SELECT a.department_id, a.department_name
  FROM departments a
 WHERE EXISTS ( SELECT 1
                  FROM employees b  
                 WHERE a.department_id = b.department_id 
                   AND b.salary > ( SELECT AVG(salary)  
                                      FROM employees )
               );
               
-- 질의? 부서 테이블에서 상위 부서가 기획부(부서번호가 90)에 속하는 사원들의 부서별 평균 급여를 조회해 보자.               
SELECT department_id,department_name FROM departments WHERE parent_id = 90;
/*
기획부(90) 하위부서
60,IT
70,홍보부
100,자금부
110,경리부
*/


SELECT department_id , AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90)
GROUP BY    department_id;                     
                           
-- 질의? 기획부 하위부서 직원들의 전체인원수의 평균급여를 조회해 보자.

SELECT department_id,department_name FROM departments WHERE parent_id = 90;

SELECT AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90) ;

/*
상위 부서가 기획부에 속하는 모든 사원의 급여를 자신의 부서별 평균급여로 갱신하는 쿼리는 다음과 같다
*/
-- 단계별로 작은쿼리를 작성.

UPDATE employees a  -- 107건
   SET a.salary = ( SELECT sal
                      FROM ( SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id ) d
                      WHERE a.department_id = d.department_id )
 WHERE a.department_id IN ( SELECT department_id 
                              FROM departments
                             WHERE parent_id = 90 ) ;
/*
기획부(90) 하위부서
60,IT
70,홍보부
100,자금부
110,경리부
*/

/*
상위부서가 기획부인 하위부서별 평균급여
SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id

60,5760
70,10000
100,8601.333333333333333333333333333333333333
110,10154
*/

SELECT department_id , MIN(salary), MAX(salary)
  FROM employees a
 WHERE department_id  IN ( SELECT department_id 
                             FROM departments
                            WHERE parent_id = 90) 
GROUP BY department_id ;


MERGE INTO employees a
  USING ( SELECT b.department_id, AVG(c.salary) as sal
            FROM departments b, 
                  employees c
           WHERE b.parent_id = 90 
             AND b.department_id = c.department_id
            GROUP BY b.department_id ) d
      ON ( a.department_id = d.department_id )
 WHEN MATCHED THEN
 UPDATE SET a.salary = d.sal;

ROLLBACK;

-- 인라인뷰
/*
FROM 절에 사용하는 서브 쿼리를 인라인 뷰InlineView 라고 한다. 연관성 없는 서브쿼리.
원래 FROM 절에는 테이블이나 뷰가 오는데, 서브 쿼리를 FROM 절에 사용해 하나의 테이블이나 뷰처럼 사용할 수 있다.
*/
-- 질의? 위 쿼리는 기획부(90) 산하에 있는 부서에 속한 사원의 평균급여보다 많은 급여를 받는 사원 목록을 추출한 것인데, 
-- 기획부 산하 평균급여를 구하는 부분을 서브 쿼리로 작성했고 이를 FROM 절에 위치시켰다. 


-- 서브쿼리의 질의 :  기획부 산하 평균급여(사원테이블 - 급여, 부서코드, 부서테이블 - 하위부서, 상위부서 참조)
-- 사원테이블의 부서코드는 상위부서인 기획부 코드정보는 없다. 기획부의 하위부서 코드가 사원테이블에 존재한다.
/*
/*
기획부(90) 하위부서
60,IT
70,홍보부
100,자금부
110,경리부
*/

SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.department_id = c.department_id   -- 기획부
            AND b.parent_id = 90;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- 기획부
            AND b.department_id = c.department_id ) d
 WHERE a.department_id = b.department_id 
   AND a.salary > d.avg_salary  /*기획부 평균급여*/;   --7908.285714285714285714285714285714285714


SELECT a.* 
  FROM ( SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'     
          GROUP BY a.sales_month  
       )  a,
       ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'       
       ) b
 WHERE a.month_avg > b.year_avg ;


-- 현장 노하우
SELECT SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id, 
        SUM(a.amount_sold) AS amount_sold
   FROM sales a,
        customers b,
        countries c
  WHERE a.cust_id = b.CUST_ID
    AND b.country_id = c.COUNTRY_ID
    AND c.country_name = 'Italy'     
GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;


SELECT  years, 
        MAX(amount_sold) AS max_sold
 FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
 FROM sales a,
               customers b,
               countries c
  WHERE a.cust_id = b.CUST_ID
          AND b.country_id = c.COUNTRY_ID
          AND c.country_name = 'Italy'     
       GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
      ) K
 GROUP BY years
 ORDER BY years;
 
 
SELECT emp.years, 
       emp.employee_id,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
  ORDER BY years


SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale,
       employees emp2
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
    AND emp.employee_id = emp2.employee_id
ORDER BY years;




               






