-- ORA_USER계정 접속시 테이블 정보 확인.
-- 대소문자 구분을 하지 않는다.
-- 코드를 실행하려면, 코드 블록선택
SELECT TABLE_NAME FROM USER_TABLES;

-- 테이블 : 데이터 저장 및 관리하는 개체,
-- 테이블 : 1) 사용자 테이블 2) 시스템 뷰
/*
가장 기본적인 SQL문으로 테이블이나 뷰에 있는 데이터를 조회할 때 사용하는 문장이다. 
SQL문 중 사용빈도로 볼 때 가장 많이 사용하는 것이 SELECT문이며, 기본 구문은 다음과 같다.

    SELECT * 혹은 컬럼
    FROM [스키마.]테이블명 혹은 [스키마.]뷰명
    WHERE 조건
    ORDER BY 컬럼;
*/
-- SELECT 문 명령어. 



-- 질의> 사원 테이블에서 급여가 5000이 넘는 사원번호와 사원명을 조회

SELECT  employee_id, emp_name
FROM employees
WHERE salary > 5000;

SELECT EMPLOYEE_ID, EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 5000;


-- 질의> 사원 테이블에서 급여가 5000이 넘는 사원번호와 사원명을 조회(단, 사번으로 오름차순 정렬)

SELECT  employee_id, emp_name
FROM employees
WHERE salary > 5000
ORDER BY employee_id; -- ASC 생략. 기본값

SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID ASC;

-- 질의> 사원 테이블에서 급여가 5000이 넘는 사원번호와 사원명을 조회(단, 사번으로 내림차순 정렬)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY EMPLOYEE_ID DESC;

-- 이름컬럼을 오름차순 정렬 (컬럼 1개)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY EMP_NAME ASC; -- ASC 생략가능

-- 컬럼을 여러개 정렬
SELECT JOB_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY JOB_ID ASC /* 1차정렬*/, EMP_NAME  ASC /*2차 정렬*/;

-- EMPLOYEE_ID 컬럼이 pk이므로, 중복된 데이타가 존재안한다.
-- EMPLOYEE_ID 컬럼을 1차 정렬하는 경우는 2차정렬부터는 의미가 없다.
-- 사원번호, 이름을 정렬하라.
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID ASC, EMP_NAME ASC;

-- 별칭사용
SELECT EMPLOYEE_ID AS E_ID, EMP_NAME  ENAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID ASC

-- 컬럼에 연산식 적용.(단 컬럼이 숫자데이터 타입)
SELECT EMPLOYEE_ID, EMP_NAME, SALARY, SALARY * 1.5 AS SALARY2
FROM EMPLOYEES;

-- 여기까지. 


-- 컬럼끼리 연결문자열을 통한 하나의 컬럼으로 조회
SELECT EMPLOYEE_ID || ' / ' || MANAGER_ID AS ID_MANAGER
FROM EMPLOYEES;

-- 컬럼의 순서 바꾸기
SELECT EMP_NAME, EMPLOYEE_ID, EMP_NAME, EMPLOYEE_ID 
FROM EMPLOYEES;

-- 조건식을 추가시 AND, OR 연산자 사용.
-- 질의? 급여가 5000 이상이고 job_id가 ‘IT_PROG’인 사원을 조회한다면, AND 연산자와 job_id를 검색하는 조건을 추가한다.

SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
  AND job_id = 'IT_PROG'
ORDER BY employee_id;


-- 문자열 데이타는 대,소문자 구분한다.
-- 결과가 있다.
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY >= 5000 AND JOB_ID = 'IT_PROG'  -- 대문자
ORDER BY EMPLOYEE_ID;

-- 결과가 없다.
SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
  AND job_id = 'it_prog'    -- 소문자
ORDER BY employee_id;

-- 질의? 급여가 5000 이상이거나 job_id가 ‘IT_PROG’인 사원, 즉 급여가 5000 이상인 사원 혹은 job_id 값이 ‘IT_PROG’인 사원을 조회한다면, AND 대신 OR 연산자와 조건을 추가로 붙이면 된다.

SELECT  employee_id, emp_name
FROM employees
WHERE salary >= 5000
   OR job_id = 'IT_PROG'
ORDER BY employee_id;

-- 별칭
-- 컬럼명 별칭
-- 테이블명 별칭
SELECT a.employee_id, a.emp_name, a.department_id, 
b.department_name AS dep_name
 FROM employees a, 
       departments b
 WHERE a.department_id = b.department_id;
 
 -- 시나리오?
 -- DEPARTMENT_ID가 60 이고, JOB_ID가 'IT_PROG'인 데이타 조회하라, DEPARTMENT_ID -> DEPT_ID, JOB_ID -> J_ID 별칭이용
 SELECT DEPARTMENT_ID AS DEPT_ID, JOB_ID AS J_ID
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60 AND JOB_ID = 'IT_PROG';
 
 
 -- 급여가 4000이상이고, 8000이하인 데이타 조회하라.(사원번호, 이름, 급여). 급여를 오름차순 정렬.
 SELECT EMPLOYEE_ID, EMP_NAME, SALARY
 FROM EMPLOYEES 
 WHERE SALARY >= 4000 AND SALARY <= 8000
 ORDER BY SALARY ASC;  -- 출력 데이타가 결정된 이후에 사용.(결과에 영향을 미치지 않음)
 
 /*
 동작순서: 
 FROM EMPLOYEES(107건) -> WHERE SALARY >= 4000 AND SALARY <= 8000(필터링) -> SELECT EMPLOYEE_ID, EMP_NAME, SALARY
 */



-- INSERT : 테이블에 데이터를 추가하는 명령어
/*
 INSERT INTO [스키마.]테이블명 (컬럼1, 컬럼2, ...)
    VALUES (값1, 값2, ...);
    컬럼의 개수와 값의 개수, 타입은 일치해야 한다.
*/
CREATE TABLE ex3_1 (
    col1   VARCHAR2(10),  -- NULL
    col2   NUMBER,       -- NULL
    col3   DATE    );    -- NULL
    
-- 컬럼의 개수와 값이, 타입이 일치해야 한다.  성공
INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, SYSDATE);  

-- 컬럼의 순서를 변경하여, 값을 삽입할수가 있다.  성공
INSERT INTO ex3_1 (col3, col1, col2)
VALUES (SYSDATE, 'DEF', 20);  

-- col3 DATE 타입에 30 숫자데이터를 값으로 사용. 데이타타입 불일치로 에러발생.
INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, 30);  



-- 컬럼 생략한 상태. 테이블의 모든컬럼을 입력하는 의미. 컬럼순서는 테이블 생성때 작성한 순서 COL1, COL2, COL3
INSERT INTO ex3_1 
VALUES ('GHI', 10, SYSDATE);  

-- COL3 컬럼이 NULL 허용이므로 생략한 형태. COL3컬럼은 INSERT문 실행시 NULL 처리가 된다.
INSERT INTO ex3_1  (col1, col2 )
VALUES ('GHI', 20);

-- 컬럼이 생략한 형태. 모든 컬럼명 사용.
-- 1), 2)문장은 동일한 의미로 해석된다.
-- 1) 컬럼은 3개인데 값은 3개로 사용하여, 에러발생
INSERT INTO ex3_1  
VALUES ('GHI', 30);

--2)
INSERT INTO ex3_1 (COL1, COL2, COL3) 
VALUES ('GHI', 30);

/*
참고> VALUES절이 없다.
INSERT ~ SELECT 형태
    INSERT INTO [스키마.]테이블명 (컬럼1, 컬럼2, ...)
    SELECT 문; -- 데이터 역할. 즉 VALUES 기능목적을 한다.
*/    


-- employees테이블을 참조하여, 생성함.

CREATE TABLE ex3_2 (
       emp_id    NUMBER,    -- 사원번호
       emp_name  VARCHAR2(100));    -- 사원이름


--   employees테이블의 데이타를   ex3_2테이블에 데이타 삽입하는 문법   
INSERT INTO ex3_2 ( emp_id, emp_name ) 
SELECT employee_id, emp_name
 FROM employees
WHERE salary > 5000;

INSERT INTO ex3_2(emp_id, emp_name)
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;  -- 58건의 데이타가 ex3_2테이블에 추가됨.

-- 유사한 문법
-- SELECT문의 실행된 구조와 데이타를 이용하여, ex3_2_2테이블 생성을 한다.
-- PRIMARY KEY는 제약조건 복사가 안됨.
CREATE TABLE ex3_2_2
AS
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

       
--  데이터 타입을 맞추지 않아도 INSERT가 성공하는 경우가 있다 (자동 형변환)
/*
COL1    VARCHAR2(10)  값 10
COL2    NUMBER        값 '10'
COL3    DATE          값 '2014-01-01'
*/
INSERT INTO ex3_1 (col1, col2, col3)
VALUES (10, '10', '2014-01-01');

-- 테이블 구조확인
DESC ex3_1;

       
-- UPDATE
/*
테이블에 있는 기존 데이터를 수정할 때 사용하는 문장이 UPDATE문이다.

    UPDATE [스키마.]테이블명
    SET 컬럼1 = 변경값1,
        컬럼2 = 변경값2,
    ...
    WHERE 조건;
*/    
SELECT *
FROM ex3_1;

-- ex3_1테이블의 col2 값을 모두 50으로 변경해 보자. 조건이 존재하지 않는다.
UPDATE ex3_1 -- 조건 WHERE절이 없으면, 테이블의 모든데이타를 수정한다는 의미가된다.
   SET col2 = 50;
   
SELECT *
FROM ex3_1;

/*
네 번째 로우의 col3 값이 비어 있는데, 
이 값을 현재 날짜로 갱신해 보자. 이를 위해서는 네 번째 로우를 검색하는 조건이 필요한데, 
col3 값이 NULL인 것을 찾으면 된다.
*/
--1)'' 은 NULL의미가 아니다. 0개 행 이(가) 업데이트되었습니다.
UPDATE ex3_1
   SET col3 = SYSDATE
WHERE col3 = '';    -- 조건식에 '' 사용하면, NULL 의미가 아니라, 공백을 의미한다. INSERT문만 ''사용시 NULL의미.

--2) IS NULL.  1 행 이(가) 업데이트되었습니다.   참고> IS NOT NULL
UPDATE ex3_1
   SET col3 = SYSDATE
WHERE col3 IS NULL; -- COL3컬럼중 데이타가 입력되어 있지않은 의미.

UPDATE ex3_1
    SET COL3 = NULL
WHERE COL1 = 'GHI';

UPDATE ex3_1
    SET COL3 = ''  -- NULL 로처리가 됨.
WHERE COL1 = 'GHI';

-- 질의? COL3가 데이타가 존재하는 것만 조회
SELECT *
FROM ex3_1
WHERE COL3 IS NOT NULL;


CREATE TABLE ex3_3 (
       employee_id NUMBER, 
       bonus_amt   NUMBER DEFAULT 0);

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id 
  FROM employees e, sales s
 WHERE e.employee_id = s.employee_id
   AND s.SALES_MONTH BETWEEN '200010' AND '200012'
 GROUP BY e.employee_id;
 
SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
  
 
 SELECT employee_id, manager_id, salary, salary * 0.01
   FROM employees 
  WHERE employee_id IN (  SELECT employee_id
                            FROM ex3_3 ); 
 
 SELECT employee_id, manager_id, salary, salary * 0.001
   FROM employees 
  WHERE employee_id NOT IN (  SELECT employee_id
                                FROM ex3_3 )
    AND manager_id = 146; 


-- MERGE 
-- ORACLE 9i 지원, DELETE 구문은 10g 부터 사용가능.
-- 설명 : 테이블에 데이타가 존재를 하지않으면, INSERT 구문작업을 진행하고, 존재하면 UPDATE 구문작업을 진행하게 하는 경우.

CREATE TABLE TEST_07 (
    EMPNO   NUMBER NOT NULL,
    ENAME   VARCHAR2(20)    NOT NULL,
    DEPTNO  NUMBER NOT NULL
);

SELECT EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;

SELECT * FROM  TEST_07;

-- 1)단일테이블 사용. WHERE절 사용안함.
MERGE 
    INTO TEST_07 a  -- 대상테이블
USING DUAL
    ON (a.EMPNO = 114)  -- 조건식
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    -- DELETE
WHEN NOT MATCHED THEN
    INSERT (a.EMPNO, a.ENAME, a.DEPTNO)
    VALUES(114, 'SCOTT', 30);

-- 2)조인을 사용
-- 조인
SELECT * FROM JOB_HISTORY a, TEST_07 b
WHERE a.EMPLOYEE_ID = 114 AND a.EMPLOYEE_ID = b.EMPNO;


MERGE
    INTO JOB_HISTORY a
USING TEST_07 b
    ON (a.EMPLOYEE_ID = 114 AND a.EMPLOYEE_ID = b.EMPNO)  -- 조건식에 참조되는 열은 업데이트 불가능
 WHEN MATCHED THEN
    UPDATE
        SET a.JOB_ID = 'ST_CLERK'     -- 'ST_CLERK'
 WHEN NOT MATCHED THEN
    INSERT (a.EMPLOYEE_ID, a.START_DATE, a.END_DATE, a.JOB_ID, a.DEPARTMENT_ID)
    VALUES (b.EMPNO, sysdate, sysdate, null, null);

-- 3)인라인 뷰  사용
MERGE 
    INTO TEST_07 a  -- 대상테이블
USING (SELECT ~~~ FROM  ON 조건식)  -- 조건식
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    WHERE a.ENAME = 'SCOTT';

-- 4) WHERE 절 사용. ORACLE 10g 부터 UPDATE, DELETE 문에서 WHERE절 사용가능
--ㄱ)
MERGE 
    INTO TEST_07 a  -- 대상테이블
USING DUAL
    ON (a.EMPNO = 114)  -- 조건식
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
    WHERE a.ENAME = 'SCOTT';
    
-- ㄴ)    
MERGE 
    INTO TEST_07 a  -- 대상테이블
USING DUAL
    ON (a.EMPNO = 114)  -- 조건식
WHEN MATCHED THEN
    UPDATE 
        SET a.DEPTNO = 30
        WHERE a.ENAME = 'SCOTT'
    -- DELETE문 사용시 위의 UPDATE 문 사용해야 함.
    DELETE 
        WHERE a.ENAME = 'SCOTT';    




-------------------------------------------------------------------------------------
MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 146) b
        ON (d.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
 WHEN NOT MATCHED THEN 
      INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
       WHERE (b.salary < 8000);
       

 SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
 
MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 146) b
        ON (d.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
      DELETE WHERE (B.employee_id = 161)
 WHEN NOT MATCHED THEN 
      INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
      WHERE (b.salary < 8000);

 SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
 

 -- DELETE
 /*
 테이블에 있는 데이터를 삭제할 때 DELETE문을 사용한다.

    ① 일반 구문
    DELETE [FROM] [스키마.]테이블명
    WHERE delete 조건; 

    -- 테이블 생성시 파티션 작업을 포함했 을 경우에 사용.
    ② 특정 파티션만 삭제할 경우의 구문
    DELETE [FROM] [스키마.]테이블명 PARTITION (파티션명)
    WHERE delete 조건;
*/

-- 조건 WHERE절이 없으면, 테이블의 모든 데이타를 삭제
 DELETE ex3_3;
 
  SELECT * 
  FROM ex3_3 
 ORDER BY employee_id;  
 
SELECT partition_name
  FROM user_tab_partitions
 WHERE table_name = 'SALES';


-- 3월20일(월) 부터 설명할 것.
-- COMMIT, ROLLBACK, TRUNCATE
/*
COMMIT은 변경한 데이터를 데이터베이스에 마지막으로 반영하는 역할을, 
ROLLBACK은 그 반대로 변경한 데이터를 변경하기 이전 상태로 되돌리는 역할을 한다.
UPDATE, INSERT, MERGE, DELETE문을 실행하면 데이터에 변화가 생긴다. 하지만 영구적으로 변경되는 것은 아니다.


뒷부분에 트랜재션(Transaction) 개념에서 내용을 다룸.
*/

DROP TABLE ex3_4;
CREATE TABLE ex3_4 (
       employee_id NUMBER);


INSERT INTO ex3_4 VALUES (100);

SELECT employee_id, rowid
  FROM ex3_4;
  
Rollback; -- 앞에 insert문 실행한 데이타작업이 물리적디스크에 반영되지 않고, 취소가 된다.
commit; -- 앞에 insert문 실행한 데이타작업이 물리적디스크에 반영됨.

-- 데이타 삭제하는 명령어.  
TRUNCATE TABLE ex3_4; -- commit, rollback 지원안함.



-- 의사컬럼
/*
의사컬럼Pseudo-column이란 테이블의 컬럼처럼 동작하지만 실제로 테이블에 저장되지는 않는 컬럼을 말한다.
SELECT 문에서는 의사컬럼을 사용할 수 있지만, 의사컬럼 값을 INSERT, UPDATE, DELETE 할 수는 없다.
*/

-- ROWNM은 쿼리에서 반환되는 각 로우들에 대한 순서 값을 나타내는 의사컬럼이다
SELECT ROWNUM, employee_id
  FROM employees;
  
SELECT ROWNUM, employee_id FROM EMPLOYEES;

-- 데이타 출력시 조회 건수 제한할 때 사용. 스프링에서 게시판 페이징기능에 사용할 명령어.
SELECT ROWNUM, employee_id
FROM employees
WHERE ROWNUM < 5;

-- ROWID는 테이블에 저장된 각 로우가 저장된 주소 값을 가리키는 의사컬럼이다.  
-- 각 로우를 식별하는 값이므로 ROWID는 유일한 값을 가진다.
SELECT ROWNUM, employee_id, ROWID
FROM employees      -- 107건
WHERE ROWNUM < 5;

SELECT ROWNUM, employee_id
  FROM employees;

-- 아래처럼 WHREE ROWNUM 조건식을 사용하면 결과를 가져올 수가 없다.(중요)
SELECT ROWNUM, employee_id
  FROM employees
  WHERE ROWNUM >= 5 AND ROWNUM <= 10;



-- 연산자. || 문자열 또는 컬럼 연결연산자기능
SELECT employee_id || '-' || emp_name AS employee_info
  FROM employees
 WHERE ROWNUM < 5;
 
-- 표현식
-- CASE 문 - 2종류(ANSI-SQL표준구문)
/*
1)IF문 유형
CASE 
    WHEN 조건1 THEN 값1
    WHEN 조건2 THEN 값2
    ...
    ELSE 기타 값
END
*/
-- 질의> 사원 테이블에서 각 사원의 급여에 따라 5000 이하로 급여를 받는 사원은 C, 5000~15000은 B, 15000 이상은 A등급을 반환하는 쿼리를 작성해 보자.
 SELECT employee_id, salary, 
         CASE WHEN salary <= 5000 THEN 'C등급'
            WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
            ELSE 'A등급'
       END AS salary_grade
  FROM employees;
  
  SELECT employee_id, salary,
            CASE 
                WHEN salary <= 5000 THEN 'C등급'
                WHEN salary >5000 AND salary < 15000 THEN 'B등급'
                WHEN salary >= 15000 THEN 'A등급'
            END AS salary_grade
  FROM employees;
  
  
/*
2)SWITCH문 유형
CASE 컬럼명
    WHEN 조건값 THEN 값1
    WHEN 조건값 THEN 값2
    ...
    ELSE 기타 값
END
*/
CREATE TABLE TEST_05 (
    CODE    NUMBER PRIMARY KEY,
    ENAME   VARCHAR2(20)     NOT NULL
);

INSERT INTO TEST_05 VALUES(1, 'JAVA');
INSERT INTO TEST_05 VALUES(2, 'ORACLE');
INSERT INTO TEST_05 VALUES(3, 'SPRING');

SELECT * FROM TEST_05;

-- 질의? 코드가 1이면 자바, 2이면 오라클 3이면 스프링 으로 출력하자.
SELECT CODE, ENAME, 
        CASE CODE
            WHEN 1 THEN '자바'
            WHEN 2 THEN '오라클'
            WHEN 3 THEN '스프링'
        END AS KNAME
FROM TEST_05;

-- 연습>
-- 사원테이블에서 부서코드가 10이면 New York, 20이면 Dallas, 아니면 Unknown 결과값을 처리하고, 조회 컬럼별칭 loc_name
-- 사원이름, 부서코드, loc_name
SELECT EMP_NAME, DEPARTMENT_ID, 
    CASE 
        WHEN DEPARTMENT_ID = 10 THEN 'New York'
        WHEN DEPARTMENT_ID = 20 THEN 'Dallas'
        ELSE 'Unknown'
    END AS loc_name
FROM EMPLOYEES;

-- ELSE생략후 일치되는 데이타가 없으면 NULL리턴
SELECT EMP_NAME, DEPARTMENT_ID, 
    CASE 
        WHEN DEPARTMENT_ID = 10 THEN 'New York'
        WHEN DEPARTMENT_ID = 20 THEN 'Dallas'
        -- ELSE 'Unknown'
    END AS loc_name
FROM EMPLOYEES;

-- 함수를 이용한 CASE문
SELECT EMP_NAME, HIRE_DATE,
    CASE
        WHEN TO_CHAR(HIRE_DATE, 'q') = '1' THEN '1분기'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '2' THEN '2분기'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '3' THEN '3분기'
        WHEN TO_CHAR(HIRE_DATE, 'q') = '4' THEN '4분기'
    END AS HIRE_QUARTER
FROM EMPLOYEES;

-- 중첩을 이용한 CASE문
/*
부서마다 등급기준이 다른 경우
부서코드 10 이면 급여가 2000 이상 1등급, 급여가 1500 이상 2등급, 급여가 1000 이상 3등급
부서코드 20 이면 급여가 3000 이상 1등급, 급여가 2500 이상 2등급, 급여가 2000 이상 3등급
부서코드 50 이면 급여가 2500 이상 1등급, 급여가 2000 이상 2등급, 급여가 1500 이상 3등급
나머지 부서코드는  급여가 4000 이상 1등급, 급여가 3500 이상 2등급, 급여가 2500 이상 3등급
*/

SELECT EMP_NAME, SALARY, DEPARTMENT_ID,
    CASE
        WHEN DEPARTMENT_ID = 10 THEN 
            CASE
                WHEN SALARY >= 2000 THEN '1등급'
                WHEN SALARY >= 1500 THEN '2등급'
                WHEN SALARY >= 1000 THEN '3등급'
            END
        WHEN DEPARTMENT_ID = 20 THEN 
            CASE
                WHEN SALARY >= 3000 THEN '1등급'
                WHEN SALARY >= 2500 THEN '2등급'
                WHEN SALARY >= 2000 THEN '3등급'
            END
        WHEN DEPARTMENT_ID = 30 THEN 
            CASE
                WHEN SALARY >= 2500 THEN '1등급'
                WHEN SALARY >= 2000 THEN '2등급'
                WHEN SALARY >= 1500 THEN '3등급'
            END
        ELSE
            CASE
                WHEN SALARY >= 4000 THEN '1등급'
                WHEN SALARY >= 3500 THEN '2등급'
                WHEN SALARY >= 2500 THEN '3등급'
            END
    END AS SAL_GRADE
FROM EMPLOYEES;


  
-- 조건식
-- 비교조건식
/*
비교 조건식은 논리 연산자나 ANY, SOME, ALL 키워드로 비교하는 조건식을 말한다. 
여기서는 ANY, SOME, ALL 비교에 대해서 알아 볼텐데 먼저 ANY를 살펴 보자.
*/

-- ANY(값1, 값2, 값3) : 열거된 값중 하나라도 일치하면, 일치한 데이타를 조회한다.
/*
이 쿼리는 급여가 2000이거나 3000, 4000인 사원을 추출하는 것이다. 
ANY가 ‘아무것’이나 ‘하나’란 뜻이 있으므로 위 문장은 세 가지 값, 즉 급여가 2000이나 3000이나 4000 중 하나라도 일치하는 
모든 사원을 추출한 것이다. 따라서 ANY는 OR 조건으로 변환이 가능하며 다음 문장도 같은 결과를 반환한다.
*/
SELECT employee_id, salary 
  FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY(2000, 3000, 4000)
ORDER BY employee_id;

-- ANY -> OR 변환가능   
SELECT employee_id, salary 
  FROM employees
WHERE salary = 2000
   OR salary = 3000
   OR salary = 4000
ORDER BY employee_id;   

-- ALL은 열거된 값이 모두 조건을 동시에 만족해야 한다. 
--  한 사원의 급여는 한 가지 값만 가지고 있으므로 논리적으로 봐도 잘못된 쿼리다
-- (=) 같다 등호연산자는 모순이 존재하고,  부등호(<, >, >=, <=) 사용가능.
SELECT employee_id, salary 
  FROM employees
WHERE salary = ALL (2000, 3000, 4000)
ORDER BY employee_id;

-- 부등호(<, >, >=, <=) 사용가능
SELECT employee_id, salary 
  FROM employees
WHERE salary > ALL (2000, 3000, 4000)  -- 최대 4000 보다 큰 경우의 데이타
ORDER BY employee_id;


-- SOME은 ANY와 동일하게 사용되며 동작한다.
SELECT employee_id, salary 
  FROM employees
WHERE salary = SOME (2000, 3000, 4000)
ORDER BY employee_id;

-- 논리조건식
/*
논리 조건식은 조건절에서 AND, OR, NOT을 사용하는 조건식을 말한다. 
AND는 모든 조건을 만족해야 하고 OR는 여러 조건 중 하나만 만족해도 TRUE를 반환된다. NOT은 조건식 평가 결과가 거짓(FALSE)일 때 원하는 결과, 즉 TRUE를 반환한다.
*/

-- 질의? 이 쿼리는 NOT으로 급여가 2500보다 크거나 같지 않은 사원, 즉 급여가 2500 미만인 사원을 반환하고 있다.
-- not 을 사용하는 목적? 데이타의 분포를 판단하여, 조회되는 성능을 목적으로 하기때문에 사용.
SELECT employee_id, salary 
  FROM employees
WHERE NOT ( salary >= 2500)
ORDER BY employee_id;
/*
127	2400
128	2200
132	2100
135	2400
136	2200
*/

SELECT employee_id, salary 
  FROM employees
WHERE salary < 2500
ORDER BY employee_id;
/*
127	2400
128	2200
132	2100
135	2400
136	2200
*/

-- 급여가 2000~2500 인 데이타 조회.
-- BETWEEN AND 조건식 : 일정한 범위
-- 1) 2)구문은 동일한 결과.
-- 1)
SELECT employee_id, salary 
  FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;
--2)
SELECT employee_id, salary 
  FROM employees
WHERE salary >= 2000 AND salary <= 2500
ORDER BY employee_id;

-- IN 조건식
-- IN 조건식은 조건절에 명시한 값이 포함된 건을 반환하는데 앞에서 배웠던 ANY와 비슷하다.
-- or 변환가능.
-- 질의? 급여가 2000 또는 3000 또는 4000 에 해당하는 데이타 조회
SELECT employee_id, salary 
  FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

-- 질의? 급여가 2000 또는 3000 또는 4000 을 포함하지 않는 데이타 조회. 1), 2) 3) 동일한 결과.
--1)
SELECT employee_id, salary 
  FROM employees
WHERE salary NOT IN (2000, 3000, 4000)
ORDER BY employee_id;
--2)
SELECT employee_id, salary 
  FROM employees
WHERE salary <> 2000 AND salary <> 3000 AND salary <> 4000
ORDER BY employee_id;
--3)
SELECT employee_id, salary 
  FROM employees
WHERE salary  <> ALL (2000, 3000, 4000)
ORDER BY employee_id;
---------------------------------------------


-- EXISTS 조건식 : 6장에서 서브쿼리와 함께 설명할 것.
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;

-- LIKE 조건식
/*
LIKE 조건식은 문자열의 패턴을 검색할 때 사용하는 조건식이다. 
예를 들어, 사원 테이블에서 사원이름이 ‘A’로 시작되는 사원을 조회하는 쿼리를 작성한다면 
다음과 같이 LIKE 조건식을 사용한다.
*/
SELECT emp_name
  FROM employees
 WHERE emp_name LIKE 'A%'   -- 'A' 글자 1개이상으로 시작하는 문자열
 ORDER BY emp_name;
 
 -- Al로 시작되는 모든 사원을 조회한 쿼리다. (Al 이라는 두글자 이상의 문자열)
SELECT emp_name
  FROM employees
 WHERE emp_name LIKE 'Al%'
 ORDER BY emp_name; 
 
/*
‘%’는 앞, 뒤, 중간 어디나 올 수 있으며 조건식을 검색할 때 대소문자를 구분한다는 점을 주의하자. 0개 이상의 문자열
‘%’와는 다르게 ‘_’(밑줄, 언더스코어)는 나머지 글자 전체가 아닌 한 글자만 비교한다.
*/
 
CREATE TABLE ex3_5 (
     names VARCHAR2(30));
     
INSERT INTO ex3_5 VALUES ('홍길');
   
INSERT INTO ex3_5 VALUES ('홍길동');

INSERT INTO ex3_5 VALUES ('홍길용');

INSERT INTO ex3_5 VALUES ('홍길상');

INSERT INTO ex3_5 VALUES ('홍길상동');

SELECT * FROM ex3_5;



SELECT *
  FROM ex3_5
 WHERE names LIKE '홍길%';  -- '홍길' 길이가 2글자 자신도 포함하고, 시작되는 문자열을 의미한다.
 
 
 SELECT *
  FROM ex3_5
 WHERE names LIKE '%홍길%';  -- '홍길' 길이가 2글자 자신도 포함하고, 앞, 뒤에는 어떤 문자열이 와도 상관없다.
 
 SELECT *
  FROM ex3_5
 WHERE names LIKE '홍길_';  -- '홍길' 이라는 2글자에 3번째 위치의 마지막1개의 문자는 어떤것이 와도 상관없는 전체길이가 3글자여야 한다.
 
 -- 사원테이블의 이름에서  '~S' 끝나는 데이타를 조회하라.
 SELECT EMP_NAME 
 FROM EMPLOYEES
 WHERE EMP_NAME LIKE '%s';
 
 -- 사원테이블의 이름에서 3번째 위치가 n 에 해당하는 데이터를 조회하라.
  SELECT EMP_NAME 
 FROM EMPLOYEES
 WHERE EMP_NAME LIKE '__n%';
 
 -- JOB_ID 컬럼에서 'H로 시작하면서, REP 끝나는 문자열을 조회하라.'
 SELECT JOB_ID
 FROM EMPLOYEES
 WHERE JOB_ID LIKE 'H%REP';
 
 -- JOB_ID 'IT~', 'ST~' 'PU~' 시작하는 문자열을 조회하라.
 SELECT JOB_ID
 FROM EMPLOYEES
 WHERE JOB_ID LIKE 'IT%'  OR JOB_ID LIKE 'ST%' OR JOB_ID LIKE 'PU%';
 
 
 