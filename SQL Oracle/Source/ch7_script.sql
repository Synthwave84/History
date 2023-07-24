-- 계층형 쿼리
/*
계층형 쿼리HierarchicalQuery 는 2차원 형태의 테이블에 저장된 데이터를 계층형 구조로 결과를 반환하는 쿼리를 말한다. 
계층형 구조란 상하 수직 관계의 구조로 사원-대리-과장-부장과 같은 직급, 판매부-영업부 같은 부서 구조, 대학의 학과, 정부 부처 등이 계층형 구조에 속한다.
또한 엑셀과 같은 프로그램의 메뉴 구조, 답변형 게시판뿐만 아니라 이 책의 목차도 이에 포함된다.
*/

-- 오라클의 계층형쿼리 문법이 지원 안될 때에는 아래 구문으로 계층형 구조결과를 대신하는 쿼리.
SELECT department_id, 
       department_name, 
       0 AS PARENT_ID,
       1 as levels,
        parent_id || department_id AS sort
FROM departments 
WHERE parent_id IS NULL
UNION ALL
SELECT t2.department_id, 
       LPAD(' ' , 3 * (2-1)) || t2.department_name AS department_name, 
       t2.parent_id,
       2 AS levels,
       t2.parent_id || t2.department_id AS sort
FROM departments t1,
     departments t2
WHERE t1.parent_id is null
  AND t2.parent_id = t1.department_id
UNION ALL
SELECT t3.department_id, 
       LPAD(' ' , 3 * (3-1)) || t3.department_name AS department_name, 
       t3.parent_id,
       3 as levels,
       t2.parent_id || t3.parent_id || t3.department_id as sort
FROM departments t1,
     departments t2,
     departments t3
WHERE t1.parent_id IS NULL
  AND t2.parent_id = t1.department_id
  AND t3.parent_id = t2.department_id
UNION ALL
SELECT t4.department_id, 
       LPAD(' ' , 3 * (4-1)) || t4.department_name as department_name, 
       t4.parent_id,
       4 as levels,
       t2.parent_id || t3.parent_id || t4.parent_id || t4.department_id AS sort
FROM departments t1,
     departments t2,
     departments t3,
     departments t4
WHERE t1.parent_id IS NULL
  AND t2.parent_id = t1.department_id
  AND t3.parent_id = t2.department_id
  and t4.parent_id = t3.department_id
ORDER BY sort;

/*
    SELECT expr1, expr2, ...
      FROM 테이블
     WHERE 조건
     START WITH[최상위 조건] -- 최상위 데이터를 지정
    CONNECT BY [NOCYCLE][PRIOR 계층형 구조 조건];
*/    

/*
department_id : 자식컬럼
parent_id : 부모컬럼
*/

--1)  상위레벨 -> 하위레벨 수준으로 데이타 출력
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL  -- 루트가 상위로 본다.
  CONNECT BY PRIOR department_id  = parent_id;  -- prior 키워드가 자식컬럼(department_id) 앞에 사용
  

--2)  하위레벨 -> 상위레벨 수준으로 데이타 출력  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH parent_id IS NULL -- 루트가 하위로 본다.
CONNECT BY department_id  = PRIOR parent_id;  -- prior 키워드가 부모컬럼(parent_id) 앞에 사용


-- 구매/생산부를 루트로 지정하여, 하위레벨에서 상위레벨로 출력하라.
SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH department_id = 30   -- 30   구매/생산부
CONNECT BY department_id = PRIOR parent_id;

-- 구매/생산부를 루트로 지정하여, 상위레벨에서 하위레벨로 출력하라.
SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH department_id = 30   -- 30   구매/생산부
CONNECT BY PRIOR department_id =  parent_id;


-- 상급자에서 하급자레벨로 출력하라.  
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 START WITH a.manager_id IS NULL
 CONNECT BY PRIOR a.employee_id = a.manager_id;


--1) START WITH a.manager_id IS NULL 루트지정한 데이타가 출력안됨.
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name, a.DEPARTMENT_ID
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id = 30 -- 부서가 30번이 데이타를 전제조건.
 START WITH a.manager_id IS NULL
 CONNECT BY NOCYCLE PRIOR a.employee_id = a.manager_id;

--2)계층형쿼리 이후에 조건식이 사용되면, 루트지정한 데이타가 포함되어 출력된다.
SELECT a.employee_id, LPAD(' ' , 3 * (LEVEL-1)) || a.emp_name, 
       LEVEL,
       b.department_name, a.DEPARTMENT_ID
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 START WITH a.manager_id IS NULL
 CONNECT BY NOCYCLE PRIOR a.employee_id = a.manager_id
     AND a.department_id = 30; -- 
  
-- 계층형 정렬하기.  

-- ORDER BY 키워드 사용시, 계층형 구조가 유지되지 않고, 단순하게 정렬된다.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER BY department_name;  

-- ORDER SIBLINGS BY : 계층형 구조가 유지된 상태에서 정렬  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER SIBLINGS BY department_name;    

/*
② CONNECT_BY_ROOT
CONNECT_BY_ROOT는 계층형 쿼리에서 최상위 로우를 반환하는 연산자다
*/

-- 에러발생.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, CONNECT_BY_ROOT
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id
  ORDER SIBLINGS BY department_name;      
  
  
-- 최상위 부서명을 출력함.  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       CONNECT_BY_ROOT department_name AS root_name
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;
/*
③ CONNECT_BY_ISLEAF : 하위레벨 존재유무를 확인가능하다.
CONNECT_BY_ISLEAF는 CONNECT BY 조건에 정의된 관계에 따라 
해당 로우가 최하위 자식 로우이면 1을, 그렇지 않으면 0을 반환하는 의사 컬럼이다.
*/
  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, CONNECT_BY_ISLEAF
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;  
 
/*
④ SYS_CONNECT_BY_PATH (colm, char)
SYS_CONNECT_BY_PATH는 계층형 쿼리에서만 사용할 수 있는 함수로, 
루트 노드에서 시작해 자신의 행까지 연결된 경로 정보를 반환한다. 
이 함수의 첫 번째 파라미터로는 컬럼이, 두 번째 파라미터인 char은 컬럼 간 구분자를 의미한다.
*/
  
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       SYS_CONNECT_BY_PATH( department_name, '|')
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;   
 
 /*
 SYS_CONNECT_BY_PATH( department_name, '/')
 두 번째 매개변수인 구분자로 해당 컬럼 값에 포함된 문자는 사용할 수 없다는 점을 주의해야 한다. 
구매/생산부는 ‘/’문자가 속해 있는데, 구분자로 ‘/’를 사용하면 다음과 같은 오류가 발생한다
 */
 
 -- 에러발생 :  department_name컬럼에 "구매/생산부"   데이터가 존재한다. / 를 포함하고 있다.
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       SYS_CONNECT_BY_PATH( department_name, '/')
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;     
 
/*
⑤ CONNECT_BY_ISCYCLE
눈치챘는지는 모르겠지만 오라클의 계층형 쿼리는 루프(반복) 알고리즘을 사용한다. 
계층형 구조나 레벨은 테이블에 있는 데이터에 따라 동적으로 변경되므로, 내부적으로는 루프를 돌며 자식 노드를 찾아간다. 
루프 알고리즘에서 주의할 점은 조건을 잘못 주면 무한루프를 타게 된다는 점인데, 
계층형 쿼리에서도 부모-자식 간의 관계를 정의하는 값이 잘못 입력되면 무한루프를 타고 오류가 발생한다.
*/
 
/*
무한 루프가 발생되는 데이타 변경작업을하여, 테스트하는 시나리오.

예를 들어, 생산팀(170)의 부모 부서는 구매/생산부(30)인데, 
구매/생산부의 parent_id 값을 생산부로 바꾸면 두 부서가 상호 참조가 되어 무한루프가 발생할 것이다. 직접 확인해 보자.
*/

--   구매/생산부의 parent_id 값을 생산부 10번에서 170번으로 변경작업을 한다. 결과는 계층형쿼리에서 무한루프가 발생된다.
UPDATE departments
   SET parent_id = 170
 WHERE department_id = 30;
 
 
-- 부서코드가 30을 루트지정 .
-- 상위레벨에서 하위레벨로 출력
-- 데이터가 잘못 입력되어, 무한루프 에러 발생. CONNECT BY loop in user data
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL, 
       parent_id
  FROM departments
  START WITH department_id = 30 -- 상위레벨
CONNECT BY PRIOR department_id  = parent_id; 

/*
이때는 루프가 발생된 원인을 찾아 잘못된 데이터를 수정해야 하는데, 
이를 위해서는 먼저 CONNECT BY 절에 NOCYCLE을 추가하고 
SELECT 절에 CONNECT_BY_ISCYCLE 의사 컬럼을 사용해 찾을 수 있다. 
CONNECT_BY_ISCYCLE은 다음과 같이 현재 로우가 자식을 갖고 있는데 
동시에 그 자식 로우가 부모 로우이면 1을, 그렇지 않으면 0을 반환한다.
*/



SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name AS depname, LEVEL, 
       CONNECT_BY_ISCYCLE IsLoop,
       parent_id
  FROM departments
  START WITH department_id = 30
CONNECT BY NOCYCLE PRIOR department_id  = parent_id; 

-- 루프 발생시킨 데이타를 확인한다.
-- 원래 상태로 다시 변경한다. 170 -> 10 코드로 변경
UPDATE departments
   SET parent_id = 10
 WHERE department_id = 30;
  
  
-- 계층형 쿼리 응용 
-- 샘플 데이터 생성  

-- 시스템 패키지 : 오라클에서 제공하는 명령어의 집합체.
-- DBMS_RANDOM 패키지.
-- 주요기능 : 랜덤한 숫자나 문자열 만들때 사용.

SET SERVEROUTPUT ON;

SET SERVEROUTPUT OFF;

-- 랜덤값 생성(양수 또는 음수)
SELECT DBMS_RANDOM.RANDOM FROM DUAL;

-- 0~1 범위 사이의 랜덤 값 생성
SELECT SYS.dbms_random.VALUE FROM DUAL;

-- 1~1000 사이의 랜덤 값 생성
SELECT DBMS_RANDOM.VALUE(1, 1000) FROM DUAL;

SELECT TRUNC(DBMS_RANDOM.VALUE(1, 1000), -1) FROM DUAL;

-- 12자리 랜덤값 생성
SELECT DBMS_RANDOM.VALUE(100000000000, 999999999999) FROM DUAL;

-- 대문자 20자리 랜덤 문자열 생성
SELECT DBMS_RANDOM.STRING('U', 20) FROM DUAL; -- NVWTRENTWJWZTFHAFIYO

-- 소문자 20자리 랜덤 문자열 생성
SELECT DBMS_RANDOM.STRING('L', 20) FROM DUAL; -- gfjxzhhkqhogifqlnaig

-- 대소문자 혼합 20자리 랜덤 문자열 생성
SELECT DBMS_RANDOM.STRING('A', 20) FROM DUAL; -- FWqmZRnYSooxFRWrSsfn

-- 대문자, 숫자 혼합 20자리 랜덤 문자열 생성
SELECT DBMS_RANDOM.STRING('X', 20) FROM DUAL; -- A77BYPBI7IJJY339H0E8

-- 출력가능한 특수문자포함 20자리 랜덤 문자열 생성
SELECT DBMS_RANDOM.STRING('P', 20) FROM DUAL; -- )ge]&h\yTf8 e>%s+K`a

-- CONNECT BY LEVEL <= 숫자
SELECT DBMS_RANDOM.VALUE(1000, 10000) FROM DUAL;

SELECT CEIL(DBMS_RANDOM.VALUE(1000, 10000)) FROM DUAL;

-- 정수로만 1000~10000 범위에서 임의의 수를 10개 생성하자.
SELECT CEIL(DBMS_RANDOM.VALUE(1000, 10000)) FROM DUAL
CONNECT BY LEVEL <= 10;

-- 테이블 생성(데이타포함) : 데이타 백업 
-- 샘플데이타 작업
CREATE TABLE ex7_1 AS  
SELECT ROWNUM seq, 
       '2014' || LPAD(CEIL(ROWNUM/1000) , 2, '0' ) month,
        ROUND(DBMS_RANDOM.VALUE (100, 1000)) amt
FROM DUAL
CONNECT BY LEVEL <= 12000;

-- 2014년도 01월~12월 데이타를 가공작업
-- ROWNUM 1~1000
SELECT CEIL(1/1000), CEIL(999/1000), CEIL(1000/1000) FROM DUAL;

-- -- ROWNUM 1001~2000
SELECT CEIL(1001/1000), CEIL(1999/1000), CEIL(2000/1000) FROM DUAL;


-- 참고. INSERT~SELECT 구문.
/*
INSERT INTO 테이블명A
SELECT 컬럼1, 컬럼2 FROM 테이블명B
*/


-- 3월29일까지 진행됨.

SELECT *
  FROM ex7_1;
  
SELECT month, SUM(amt)
FROM ex7_1
GROUP BY month
ORDER BY month;

SELECT ROWNUM
FROM (
       SELECT 1 AS row_num
         FROM DUAL
        UNION ALL
       SELECT 1 AS row_num
         FROM DUAL
)
CONNECT BY LEVEL <= 4;
  
-- 로우를 컬럼으로

CREATE TABLE ex7_2 AS
  SELECT department_id,
         listagg(emp_name, ',') WITHIN GROUP (ORDER BY emp_name) as empnames
  FROM employees
 WHERE department_id IS NOT NULL
  GROUP BY department_id;
  
  
SELECT *
FROM ex7_2;

-- 컬럼을 로우로
  
SELECT empnames,
       DECODE(level, 1, 1, instr(empnames, ',', 1, level-1)) st,
       INSTR(empnames, ',', 1, level) ed,
       LEVEL as lvl
 FROM ( SELECT empnames || ',' as empnames,
               LENGTH(empnames) ori_len,
               LENGTH(REPLACE(empnames, ',', '')) new_len
          FROM ex7_2
         WHERE department_id = 90
       )
 CONNECT BY LEVEL <= ori_len - new_len + 1;
 
 
SELECT empnames,
       DECODE(level, 1, 1, INSTR(empnames, ',', 1, LEVEL-1)) start_pos,
       INSTR(empnames, ',', 1, LEVEL) end_pos,
       LEVEL as lvl
  FROM (  SELECT empnames || ',' as empnames,
                 LENGTH(empnames) ori_len,
                 LENGTH(REPLACE(empnames, ',', '')) new_len
            FROM ex7_2
           WHERE department_id = 90
        )
  CONNECT BY LEVEL <= ori_len - new_len + 1; 
  
  
SELECT REPLACE(SUBSTR(empnames, start_pos, end_pos - start_pos), ',', '') AS emp
FROM ( SELECT empnames,
              DECODE(level, 1, 1, INSTR(empnames, ',', 1, level-1)) start_pos,
              INSTR(empnames, ',', 1, LEVEL) end_pos,
              LEVEL as lvl
      FROM (  SELECT empnames || ',' as empnames,
                     LENGTH(empnames) ori_len,
                     LENGTH(REPLACE(empnames, ',', '')) new_len
                FROM ex7_2
               WHERE department_id = 90
           )
      CONNECT BY LEVEL <= ori_len - new_len + 1
) ;
                  
  
-- WITH 절
  
SELECT b2.*
FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
         FROM kor_loan_status 
         GROUP BY period, region
      ) b2,      
      ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
         FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
                  FROM kor_loan_status 
                 GROUP BY period, region
              ) b,
              ( SELECT MAX(PERIOD) max_month
                  FROM kor_loan_status
                 GROUP BY SUBSTR(PERIOD, 1, 4)
              ) a
         WHERE b.period = a.max_month
         GROUP BY b.period
      ) c   
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;


WITH b2 AS ( SELECT period, region, sum(loan_jan_amt) jan_amt
               FROM kor_loan_status 
              GROUP BY period, region
           ),
     c AS ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
              FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
                      FROM kor_loan_status 
                     GROUP BY period, region
                   ) b,
                   ( SELECT MAX(PERIOD) max_month
                       FROM kor_loan_status
                      GROUP BY SUBSTR(PERIOD, 1, 4)
                   ) a
             WHERE b.period = a.max_month
             GROUP BY b.period
           )
SELECT b2.*
  FROM b2, c
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;           
           
           
-- 순환 서브쿼리
           
SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
  FROM departments
  START WITH parent_id IS NULL
  CONNECT BY PRIOR department_id  = parent_id;
  
WITH recur ( department_id, parent_id, department_name, lvl)
        AS ( SELECT department_id, parent_id, department_name, 1 AS lvl
               FROM departments
              WHERE parent_id IS NULL
              UNION ALL
             SELECT a.department_id, a.parent_id, a.department_name, b.lvl + 1 
               FROM departments a, recur b
              WHERE a.parent_id = b.department_id 
              )             
SELECT department_id, LPAD(' ' , 3 * (lvl-1)) || department_name, lvl
 FROM recur;
 
 
WITH recur ( department_id, parent_id, department_name, lvl)
        AS ( SELECT department_id, parent_id, department_name, 1 AS lvl
               FROM departments
              WHERE parent_id IS NULL
              UNION ALL
             SELECT a.department_id, a.parent_id, a.department_name, b.lvl + 1 
               FROM departments a, recur b
              WHERE a.parent_id = b.department_id 
              )       
SEARCH DEPTH FIRST BY department_id SET order_seq                       
SELECT department_id, LPAD(' ' , 3 * (lvl-1)) || department_name, lvl, order_seq
 FROM recur; 


-- 분석함수

SELECT department_id, emp_name, 
       ROW_NUMBER() OVER (PARTITION BY department_id 
                          ORDER BY emp_name ) dep_rows
  FROM employees;
  
  
SELECT department_id, emp_name, 
       salary,
       RANK() OVER (PARTITION BY department_id 
                    ORDER BY salary ) dep_rank
  FROM employees;
  
SELECT department_id, emp_name, 
       salary,
       DENSE_RANK() OVER (PARTITION BY department_id 
                    ORDER BY salary ) dep_rank
  FROM employees;
  
SELECT *
FROM ( SELECT department_id, emp_name, 
              salary, 
              DENSE_RANK() OVER (PARTITION BY department_id 
                                 ORDER BY salary desc) dep_rank
         FROM employees
     )
WHERE dep_rank <= 3;  
    
    
SELECT department_id, emp_name, 
       salary,
       CUME_DIST() OVER (PARTITION BY department_id 
                         ORDER BY salary ) dep_dist
  FROM employees;    
  
  
SELECT department_id, emp_name, 
       salary
      ,rank() OVER (PARTITION BY department_id 
                         ORDER BY salary ) raking
      ,CUME_DIST() OVER (PARTITION BY department_id 
                         ORDER BY salary ) cume_dist_value
      ,PERCENT_RANK() OVER (PARTITION BY department_id 
                         ORDER BY salary ) percentile
  FROM employees
WHERE department_id = 60;  

SELECT department_id, emp_name, 
       salary
      ,NTILE(4) OVER (PARTITION BY department_id 
                         ORDER BY salary 
                      ) NTILES
  FROM employees
WHERE department_id IN (30, 60) ;

SELECT emp_name, hire_date, salary,
       LAG(salary, 1, 0)  OVER (ORDER BY hire_date) AS prev_sal,
       LEAD(salary, 1, 0) OVER (ORDER BY hire_date) AS next_sal
  FROM employees
 WHERE department_id = 30;
 
SELECT emp_name, hire_date, salary,
       LAG(salary, 2, 0)  OVER (ORDER BY hire_date) AS prev_sal,
       LEAD(salary, 2, 0) OVER (ORDER BY hire_date) AS next_sal
  FROM employees
 WHERE department_id = 30;
 
 
-- Window절
 
SELECT department_id, emp_name, hire_date, salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS all_salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                         ) AS first_current_sal,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                         ) AS current_end_sal
  FROM employees
 WHERE department_id IN (30, 90);
 
SELECT department_id, emp_name, hire_date, salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                         ) AS all_salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE 365 PRECEDING
                         ) AS range_sal1,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                         RANGE BETWEEN 365 PRECEDING AND CURRENT ROW
                         ) AS range_sal2
  FROM employees
 WHERE department_id = 30; 
 
 
SELECT department_id, emp_name, hire_date, salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS all_salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS fr_st_to_current_sal,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                 ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
 SELECT department_id, emp_name, hire_date, salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                ) AS all_salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                ) AS fr_st_to_current_sal,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_Date
                                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
SELECT department_id, emp_name, hire_date, salary,
       NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                 ) AS all_salary,
       NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                 ) AS fr_st_to_current_sal,
       NTH_VALUE(salary,2 ) OVER (PARTITION BY department_id ORDER BY hire_Date
                                  ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                                 ) AS fr_current_to_end_sal
  FROM employees
 WHERE department_id IN (30, 90) ; 
 
-- 기타 분석 함수 

SELECT department_id, emp_name, 
       salary
      ,NTILE(4) OVER (PARTITION BY department_id 
                         ORDER BY salary 
                      ) NTILES
      ,WIDTH_BUCKET(salary, 1000, 10000, 4) widthbuacket
  FROM employees
WHERE department_id = 60; 

WITH basis AS ( SELECT period, region, SUM(loan_jan_amt) jan_amt
                  FROM kor_loan_status
                 GROUP BY period, region
              ), 
    basis2 as ( SELECT period, MIN(jan_amt) min_amt, MAX(jan_amt) max_amt
                  FROM basis
                 GROUP BY period
              )
 SELECT a.period, 
        b.region "최소지역", b.jan_amt "최소금액",
        c.region "최대지역", c.jan_amt "최대금액"
   FROM basis2 a, basis b, basis c
  WHERE a.period  = b.period
    AND a.min_amt = b.jan_amt 
    AND a.period  = c.period
    AND a.max_amt = c.jan_amt
  ORDER BY 1, 2;
 
 
WITH basis AS (
               SELECT period, region, SUM(loan_jan_amt) jan_amt
                 FROM kor_loan_status
                GROUP BY period, region
              )
SELECT a.period, 
       MIN(a.region) KEEP ( DENSE_RANK FIRST ORDER BY jan_amt) "최소지역", 
       MIN(jan_amt) "최소금액", 
       MAX(a.region) keep ( DENSE_RANK LAST ORDER BY jan_amt) "최대지역",
       MAX(jan_amt) "최대금액"
FROM basis a
GROUP BY a.period
ORDER BY 1, 2;

SELECT department_id, emp_name, hire_date, salary,
       ROUND(RATIO_TO_REPORT(salary) OVER (PARTITION BY department_id 
                                ),2) * 100 AS salary_percent
  FROM employees
 WHERE department_id IN (30, 90); 
 
 
-- 다중 테이블 INSERT
-- 여러 개의 INSERT문을 한 방에 처리
CREATE TABLE ex7_3 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));


CREATE TABLE ex7_4 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));
       
INSERT INTO ex7_3 VALUES (101, '홍길동'); 

INSERT INTO ex7_3 VALUES (102, '김유신');       

INSERT ALL
INTO ex7_3 VALUES (103, '강감찬')
INTO ex7_3 VALUES (104, '연개소문')
SELECT *
FROM DUAL;

INSERT ALL
INTO ex7_3 VALUES (emp_id, emp_name)
SELECT 103 emp_id, '강감찬' emp_name
FROM DUAL
UNION ALL
SELECT 104 emp_id, '연개소문' emp_name
FROM DUAL;


INSERT ALL
INTO ex7_3 VALUES (105, '가가가')
INTO ex7_4 VALUES (105, '나나나')
SELECT *
FROM DUAL;

-- 조건에 따른 다중 INSERT
TRUNCATE TABLE ex7_3;

TRUNCATE TABLE ex7_4;


INSERT ALL
WHEN department_id = 30 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN department_id = 90 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, 
       employee_id, emp_name 
FROM  employees;


CREATE TABLE ex7_5 (
       emp_id    NUMBER,
       emp_name  VARCHAR2(100));
       
INSERT ALL
WHEN department_id = 30 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN department_id = 90 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
ELSE
  INTO ex7_5 VALUES (employee_id, emp_name)
SELECT department_id, 
       employee_id, emp_name 
FROM  employees;
       
       
SELECT COUNT(*)
FROM EX7_5;
       
SELECT department_id, employee_id, emp_name,  salary
FROM employees
WHERE department_id = 30;

INSERT ALL
WHEN employee_id < 116 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN  salary < 5000 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, employee_id, emp_name,  salary
FROM   employees
WHERE  department_id = 30;  


SELECT *
FROM ex7_3;

SELECT *
FROM ex7_4;

INSERT FIRST
WHEN employee_id < 116 THEN
  INTO ex7_3 VALUES (employee_id, emp_name)
WHEN  salary < 5000 THEN
  INTO ex7_4 VALUES (employee_id, emp_name)
SELECT department_id, employee_id, emp_name,  salary
FROM   employees
WHERE  department_id = 30;   


