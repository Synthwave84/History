/*
시스템 예외로는 
1)나눗셈 연산을 할 때 0으로 나눈다거나 
2)SELECT INTO 절을 사용해 데이터를 가져올 때 조건에 만족하는 데이터가 없으면 발생하는 예외 등이 있다. 
즉 시스템 예외는 오라클 내부에 미리 정의된 예외라고 할 수 있다.
*/

-- 예외처리구문
-- 익명블록
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 vi_num := 10 / 0; -- 예외발생.   몫을 0으로 나누었을 때.
	 
	 DBMS_OUTPUT.PUT_LINE('Success!');
	 
END;


-- 예외처리 구문.
SET SERVEROUTPUT ON;
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 vi_num := 10 / 0;
	 
	 DBMS_OUTPUT.PUT_LINE('Success!');
	 
EXCEPTION WHEN OTHERS THEN
	 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');	

END;

-- 프로시저 형태로 생성해서 작업.
-- 예외처리가 없는 프로시저생성
CREATE OR REPLACE PROCEDURE ch10_no_exception_proc
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;   -- 예외발생.
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
END;

-- 프로시저 호출
EXEC ch10_no_exception_proc; -- 실행시 예외오류 확인. 오라클 시스템에서 오류메세지 제어를 하여 제공.

-- 예외처리가 있는 프로시저 생성
CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!'); -- 예외처리로 인하여, 실행안됨.
	
EXCEPTION WHEN OTHERS THEN
	 
	 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');		
	
END;	

-- 1)프로시저 호출
EXEC ch10_exception_proc;


-- 2)예외처리가 없는 프로시저 호출
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 ch10_no_exception_proc;
	 	 
	 DBMS_OUTPUT.PUT_LINE('Success!'); -- 정상실행이 안됨

END;


-- 3)예외처리가 있는 프로시저 호출
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 ch10_exception_proc;
	 	 
	 DBMS_OUTPUT.PUT_LINE('Success!');

END;

-- 예외가 발생되었을때, 예외코드, 예외메세지를 보여주는 명령어
-- SQLCODE, SQLERRM을 이용한 예외정보 참조

CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN OTHERS THEN

-- 프로그래밍 명령어로 예외관련 메시지를 제공	 
 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');		
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR CODE: ' || SQLCODE);
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR MESSAGE: ' || SQLERRM); -- 매개변수 없는 SQLERRM
 DBMS_OUTPUT.PUT_LINE( SQLERRM(SQLCODE)); -- 매개변수 있는 SQLERRM

	
END;	

EXEC ch10_exception_proc;

-----------------------------------------------------------------------------------
--학습 권장안함.
/*
CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN OTHERS THEN
	 
 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');		
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR CODE: ' || SQLCODE);
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR MESSAGE: ' || SQLERRM); 
 
 DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
	
END;	
*/

-- 시스템 예외 
-- https://thebook.io/006696/0252/ 예외 참고.

CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN ZERO_DIVIDE THEN -- 예외처리명을 모르는 경우 OTHERS 사용.
	 
	 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');		
	 DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' || SQLCODE);
	 DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' || SQLERRM);
	
END;	

EXEC ch10_exception_proc;



CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');

-- 다중예외처리.	
EXCEPTION WHEN ZERO_DIVIDE THEN
	          	 DBMS_OUTPUT.PUT_LINE('오류1');		
	             DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE1: ' || SQLERRM);
	        WHEN OTHERS THEN
	          	 DBMS_OUTPUT.PUT_LINE('오류2');		
	             DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE2: ' || SQLERRM);	
END;	

EXEC ch10_exception_proc;

--  p_job_id 매개변수에 제공한 값이 존재하면, 업데이트 하는 프로시저를 작성.
--1) 예외처리 로직이 없는 프로시저
CREATE OR REPLACE PROCEDURE ch10_upd_jobid_proc 
                  ( p_employee_id employees.employee_id%TYPE,
                    p_job_id      jobs.job_id%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE JOB_ID = p_job_id;
	 
	IF vn_cnt = 0 THEN
	   DBMS_OUTPUT.PUT_LINE('job_id가 없습니다');
	   RETURN; -- 프로시저 종료
	ELSE
	   UPDATE employees
	      SET job_id = p_job_id
	    WHERE employee_id = p_employee_id;
	
  END IF;
  
  COMMIT;
	
END;

EXEC ch10_upd_jobid_proc (200, 'SM_JOB2');


--2) 예외처리 로직이 있는 프로시저
CREATE OR REPLACE PROCEDURE ch10_upd_jobid_proc 
                  ( p_employee_id employees.employee_id%TYPE,
                    p_job_id      jobs.job_id%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	SELECT 1        -- EXISTS() 함수
	  INTO vn_cnt
	  FROM JOBS
	 WHERE JOB_ID = p_job_id; -- 일치하는 데이타가 존재하면 1 값이 vn_cnt변수에 저장. 존재하지 않으면 예외발생.
	 
   UPDATE employees
      SET job_id = p_job_id
    WHERE employee_id = p_employee_id;
	
  COMMIT;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 DBMS_OUTPUT.PUT_LINE(p_job_id ||'에 해당하는 job_id가 없습니다');
            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('기타 에러: ' || SQLERRM);
END;
                   
-- 'SM_JOB2' 가 존재하지 않아, 프로시저 실행에서 예외발생된다.
EXEC ch10_upd_jobid_proc (200, 'SM_JOB2');


CREATE OR REPLACE PROCEDURE ch10_upd_jobid_proc 
                  ( p_employee_id employees.employee_id%TYPE,
                    p_job_id      jobs.job_id%TYPE)
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	SELECT 1
	  INTO vn_cnt
	  FROM JOBS
	 WHERE JOB_ID = p_job_id;
	 
   UPDATE employees
      SET job_id = p_job_id
    WHERE employee_id = p_employee_id;
	
  COMMIT;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 DBMS_OUTPUT.PUT_LINE(p_job_id ||'에 해당하는 job_id가 없습니다');
            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('기타 에러: ' || SQLERRM);
END;

-- 사용자 정의 예외
/*
CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
BEGIN
	
	 -- 부서테이블에서 해당 부서번호 존재유무 체크
	 SELECT COUNT(*)
	   INTO vn_cnt
	   FROM departments
	  WHERE department_id = p_department_id;
	  
	 IF vn_cnt = 0 THEN
	    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
	 END IF;
	 
	 -- employee_id의 max 값에 +1
	 SELECT MAX(employee_id) + 1
	   INTO vn_employee_id
	   FROM employees;
	 
	 -- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
	 INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
              VALUES ( vn_employee_id, p_emp_name, vd_curr_date, p_department_id );
              
   COMMIT;              
              
EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               DBMS_OUTPUT.PUT_LINE('해당 부서번호가 없습니다');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);              
	
END;                	


EXEC ch10_ins_emp_proc ('홍길동', 999);


CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month  VARCHAR2  )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
   
   ex_invalid_month EXCEPTION; -- 잘못된 입사월인 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- 예외명과 예외코드 연결
BEGIN
	
	 -- 부서테이블에서 해당 부서번호 존재유무 체크
	 SELECT COUNT(*)
	   INTO vn_cnt
	   FROM departments
	  WHERE department_id = p_department_id;
	  
	 IF vn_cnt = 0 THEN
	    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
	 END IF;
	 
	 -- 입사월 체크 (1~12월 범위를 벗어났는지 체크)
	 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
	    RAISE ex_invalid_month; -- 사용자 정의 예외 발생
	 
	 END IF;
	 
	 
	 -- employee_id의 max 값에 +1
	 SELECT MAX(employee_id) + 1
	   INTO vn_employee_id
	   FROM employees;
	 
	 -- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
	 INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
              VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );
              
   COMMIT;              
              
EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               DBMS_OUTPUT.PUT_LINE('해당 부서번호가 없습니다');
          WHEN ex_invalid_month THEN -- 입사월 사용자 정의 예외 처리
               DBMS_OUTPUT.PUT_LINE(SQLCODE);
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               DBMS_OUTPUT.PUT_LINE('1~12월 범위를 벗어난 월입니다');               
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);              
	
END;    

EXEC ch10_ins_emp_proc ('홍길동', 110, '201314');


-- RAISE와 RAISE_APPLICATOIN_ERROR

CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS

BEGIN
	IF p_num <= 0 THEN
	   RAISE INVALID_NUMBER;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(p_num);
  
EXCEPTION WHEN INVALID_NUMBER THEN
               DBMS_OUTPUT.PUT_LINE('양수만 입력받을 수 있습니다');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END;

EXEC ch10_raise_test_proc (-10);               



CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS

BEGIN
	IF p_num <= 0 THEN
	   --RAISE INVALID_NUMBER;
	   RAISE_APPLICATION_ERROR (-20000, '양수만 입력받을 수 있단 말입니다!');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(p_num);
  
EXCEPTION WHEN INVALID_NUMBER THEN
               DBMS_OUTPUT.PUT_LINE('양수만 입력받을 수 있습니다');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLCODE);
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END;

EXEC ch10_raise_test_proc (-10);               



-- 현장 노하우

CREATE TABLE error_log (
             error_seq     NUMBER,        -- 에러 시퀀스
             prog_name     VARCHAR2(80),  -- 프로그램명
             error_code    NUMBER,        -- 에러코드
             error_message VARCHAR2(300), -- 에러 메시지
             error_line    VARCHAR2(100), -- 에러 라인
             error_date    DATE DEFAULT SYSDATE -- 에러발생일자
             );
             
CREATE SEQUENCE error_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE error_log_proc (
                  p_prog_name      error_log.prog_name%TYPE,
                  p_error_code     error_log.error_code%TYPE,
                  p_error_messgge  error_log.error_message%TYPE,
                  p_error_line     error_log.error_line%TYPE  )
IS

BEGIN
	
	INSERT INTO error_log (error_seq, prog_name, error_code, error_message, error_line)
	VALUES ( error_seq.NEXTVAL, p_prog_name, p_error_code, p_error_messgge, p_error_line );
	
	COMMIT;
	
END;                  


CREATE OR REPLACE PROCEDURE ch10_ins_emp2_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month     VARCHAR2 )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_depid, -20000); -- 예외명과 예외코드 연결

   ex_invalid_month EXCEPTION; -- 잘못된 입사월인 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- 예외명과 예외코드 연결
   
   v_err_code error_log.error_code%TYPE;
   v_err_msg  error_log.error_message%TYPE;
   v_err_line error_log.error_line%TYPE;
BEGIN
 -- 부서테이블에서 해당 부서번호 존재유무 체크
 SELECT COUNT(*)
   INTO vn_cnt
   FROM departments
  WHERE department_id = p_department_id;
	  
 IF vn_cnt = 0 THEN
    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
 END IF;

-- 입사월 체크 (1~12월 범위를 벗어났는지 체크)
 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
    RAISE ex_invalid_month; -- 사용자 정의 예외 발생
 END IF;

 -- employee_id의 max 값에 +1
 SELECT MAX(employee_id) + 1
   INTO vn_employee_id
   FROM employees;
 
-- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );              
 COMMIT;

EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_msg  := '해당 부서가 없습니다';
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN ex_invalid_month THEN -- 입사월 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN OTHERS THEN
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;  
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line);        	
END;


EXEC ch10_ins_emp2_proc ('HONG', 1000, '201401'); -- 잘못된 부서

EXEC ch10_ins_emp2_proc ('HONG', 100, '201413'); -- 잘못된 월


SELECT *
  FROM  error_log ;
  
  

CREATE TABLE app_user_define_error (
             error_code    NUMBER,         -- 에러코드
             error_message VARCHAR2(300),  -- 에러 메시지
             create_date   DATE DEFAULT SYSDATE, -- 등록일자 
             PRIMARY KEY (error_code)
             );
             
             
INSERT INTO app_user_define_error ( error_code, error_message ) VALUES (-1843, '지정한 월이 부적합합니다');
INSERT INTO app_user_define_error ( error_code, error_message ) VALUES (-20000, '해당 부서가 없습니다');

COMMIT;
             
             
CREATE OR REPLACE PROCEDURE error_log_proc (
                  p_prog_name      error_log.prog_name%TYPE,
                  p_error_code     error_log.error_code%TYPE,
                  p_error_messgge  error_log.error_message%TYPE,
                  p_error_line     error_log.error_line%TYPE  )
IS
  vn_error_code     error_log.error_code%TYPE    := p_error_code;
  vn_error_message  error_log.error_message%TYPE := p_error_messgge;
  
BEGIN
	
	-- 사용자 정의 에러 테이블에서 에러 메시지를 받아오는 부분을 BLOCK으로 감싼다.
	-- 해당 메시지가 없을 경우 처리를 위해서....
	BEGIN
	  -- 
	  SELECT error_message 
	    INTO vn_error_message
	    FROM app_user_define_error 
	   WHERE error_code = vn_error_code;
	 
   	-- 해당 에러가 테이블에 없다면 매개변수로 받아온 메시지를 그대로 할당한다. 
	  EXCEPTION WHEN NO_DATA_FOUND THEN
	               vn_error_message :=  p_error_messgge;
	
  END;
	
	INSERT INTO error_log (error_seq, prog_name, error_code, error_message, error_line)
	VALUES ( error_seq.NEXTVAL, p_prog_name, vn_error_code, vn_error_message, p_error_line );
	
	COMMIT;
	
END;                 


CREATE OR REPLACE PROCEDURE ch10_ins_emp2_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month     VARCHAR2 )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_depid, -20000); -- 예외명과 예외코드 연결

   ex_invalid_month EXCEPTION; -- 잘못된 입사월인 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- 예외명과 예외코드 연결
   
  -- 예외 관련 변수 선언
   v_err_code error_log.error_code%TYPE;
   v_err_msg  error_log.error_message%TYPE;
   v_err_line error_log.error_line%TYPE;
BEGIN
 -- 부서테이블에서 해당 부서번호 존재유무 체크
 SELECT COUNT(*)
   INTO vn_cnt
   FROM departments
  WHERE department_id = p_department_id;
	  
 IF vn_cnt = 0 THEN
    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
 END IF;

-- 입사월 체크 (1~12월 범위를 벗어났는지 체크)
 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
    RAISE ex_invalid_month; -- 사용자 정의 예외 발생
 END IF;

 -- employee_id의 max 값에 +1
 SELECT MAX(employee_id) + 1
   INTO vn_employee_id
   FROM employees;
 
-- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );              
 COMMIT;

EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN ex_invalid_month THEN -- 입사월 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN OTHERS THEN
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;  
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line);        	
END;

-- 잘못된 부서
EXEC ch10_ins_emp2_proc ('HONG', 1000, '201401');
 
-- 잘못된 월
EXEC ch10_ins_emp2_proc ('HONG', 100, '201413'); 


SELECT *
  FROM  error_log ;

*/
-- 트랜잭션(TRANSACTION) : 1개이상의 명령어를 하나의 논리집합으로 묶어놓은 단위
-- 트랜잭션 환경에서 관리되는 명령어 : DML(INSERT, UPDATE, DELETE, MERGE ) 데이터 조작명령어.

-- COMMIT 과 ROLLBACK, SAVEPOINT

-- PRIMARY KEY 설정이 안된 상태.
CREATE TABLE ch10_sales (
       sales_month   VARCHAR2(8),
       country_name  VARCHAR2(40),
       prod_category VARCHAR2(50),
       channel_desc  VARCHAR2(20),
       sales_amt     NUMBER );
       
-- commit 키워드 없는 프로시저      
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month IN ch10_sales.sales_month%TYPE )
IS

BEGIN
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
	
END;  

/*
삽입될 데이타 확인 목적

	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = '199801'
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
*/
--프로시저 실행(commit 키워드 없음)
EXEC iud_ch10_sales_proc ( '199801');

-- 프로시저 실행 후 데이타 확인
SELECT COUNT(*)
FROM ch10_sales ;   -- 2건


/*
위의 구문을 SQLPLUS 또는 스프링개발 쪽에서 실행하면, 데이타 건수가 0건이 나온다.
즉, 타 세션에서 접근시 커밋하지 않은 상태의 값을 읽어오게 된다.(중요)
즉 이전, 커밋이 된 데이터만 읽어온다.
*/

-- COMMIT; 이 있는 프로시저 생성
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month ch10_sales.sales_month%TYPE )
IS

BEGIN
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
       
 COMMIT;
 --ROLLBACK;
	
END;         

-- 데이타 삭제. 트랜잭션이 지원안됨.
TRUNCATE TABLE ch10_sales;

-- commit 이 있는 프로시저 실행
EXEC iud_ch10_sales_proc ( '199801');

SELECT COUNT(*)
FROM ch10_sales ;

-- 데이타 삭제.
TRUNCATE TABLE ch10_sales;

-- PRIMARY KEY 제약조건 추가
ALTER TABLE ch10_sales 
ADD CONSTRAINTS pk_ch10_sales 
PRIMARY KEY (sales_month, country_name, prod_category, channel_desc);


-- 예외처리 작업이 있는 프로시저 생성(수정)
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month ch10_sales.sales_month%TYPE )
IS

BEGIN
	
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
       
 COMMIT;

-- 예외처리구문
EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);  -- ORA-00001: unique constraint (ORA_USER.PK_CH10_SALES) violated
               ROLLBACK;
	
END;   



-- 프로시저 호출. 연속 2번 실행.
EXEC iud_ch10_sales_proc ( '199801');

SELECT COUNT(*)
FROM ch10_sales ; -- 프로시저 한번 실행 후 데이타 확인.

/*
보통 ROLLBACK을 명시하면 INSERT, DELETE, UPDATE, MERGE 작업 전체가 취소되는데 
전체가 아닌 특정 부분에서 트랜잭션을 취소시킬 수 있다. 
이렇게 하려면 취소하려는 지점을 명시한 뒤, 그 지점까지 작업을 취소하는 식으로 사용하는데 이 지점을 SAVEPOINT라고 한다. 
SAVEPOINT를 명시하는 방법은 다음과 같다.

    SAVEPOINT 세이브포인트명;
*/



CREATE TABLE ch10_country_month_sales (
               sales_month   VARCHAR2(8),
               country_name  VARCHAR2(40),
               sales_amt     NUMBER,
               PRIMARY KEY (sales_month, country_name) );
              


-- 예외처리를 이용한 트랜잭션제어가 포함되어 있는 프로시저
-- 1)delete, 2)insert 3)update번 작업은 관련성이 있는 작업이다.(ch10_sales테이블)  
-- 4)insert번은 관련성이 없다(ch10_country_month_sales테이블) 라는 시나리오. 이런 경우 SAVEPOINT 를 이용한다.(중요)
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month IN  ch10_sales.sales_month%TYPE, 
              p_country_name IN  ch10_sales.country_name%TYPE )
IS

BEGIN
	
	--1)기존 데이터 삭제
	DELETE ch10_sales
	 WHERE sales_month  = p_sales_month
	   AND country_name = p_country_name;
	   
	   
	-- 2)신규로 월, 국가를 매개변수로 받아 INSERT 
	-- DELETE를 수행하므로 PRIMARY KEY 중복이 발생치 않음
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH  = p_sales_month       -- 매개변수 사용
   AND C.COUNTRY_NAME = p_country_name      -- 매개변수 사용
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
 /*
 어떤 데이타가 삽입되는 지 확인
 SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH  = '199801'       -- 매개변수 사용
   AND C.COUNTRY_NAME = 'Japan'      -- 매개변수 사용
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
 
 -- 199801	Japan	Peripherals and Accessories	Direct Sales	335.98
 
 */
 
       
 -- 3)SAVEPOINT 확인을 위한 UPDATE
  -- 현재시간에서 초를 가져와 숫자로 변환한 후 * 10 (매번 초는 달라지므로 성공적으로 실행 시 이 값은 매번 달라짐)
 UPDATE ch10_sales
    SET sales_amt = 10 * to_number(to_char(sysdate, 'ss'))
  WHERE sales_month  = p_sales_month
	   AND country_name = p_country_name;

/*
SELECT sysdate, to_char(sysdate, 'ss'), 10 * to_number(to_char(sysdate, 'ss')) FROM DUAL;
*/

	   
 -- SAVEPOINT 지정      
 SAVEPOINT mysavepoint;      
 
 
 -- 4)ch10_country_month_sales 테이블에 INSERT. 프로시저 처음실행시는 데이타작업 성공, 두번째 실행시 제약조건 에러발생
 -- 중복 입력 시 PRIMARY KEY 중복됨
 INSERT INTO ch10_country_month_sales 
       SELECT sales_month, country_name, SUM(sales_amt)
         FROM ch10_sales
        WHERE sales_month  = p_sales_month
	        AND country_name = p_country_name
	      GROUP BY sales_month, country_name;         
       
 COMMIT;

EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               
               -- 위의 4)번 작업이 예외발생시 1) 2) 3) 4)번 4가지작업이 관련성있는 작업이라면, ROLLBACK 처리해야 한다.(중요)
               
               /*
               1), 2), 3)번 3가지작업은 관련성이 있어서 성공 또는 실패로 처리해야 한다.
               4)번 작업은 위의 3가지 작업과 관련성이 없다. 이런 경우에
               4)번 작업이 예외발생되면, 위의 3가지 작업은 영향을 안받게 COMMIT 성공처리를 한다.
               그리고, 4번작업을 mysavepoint SAVEPOINT를 이용하여, 처리한다.
               */
               ROLLBACK TO mysavepoint; -- SAVEPOINT 까지만 ROLLBACK
               COMMIT; -- SAVEPOINT 이전까지는 COMMIT. 결과적으로 1) 2) 3)번은 작업이 완료

	
END;   


-- 데이타 삭제.
TRUNCATE TABLE CH10_COUNTRY_MONTH_SALES;
TRUNCATE TABLE ch10_sales;

-- 첫번째 프로시저 실행
EXEC iud_ch10_sales_proc ( '199801', 'Japan');

--EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales; -- 250


-- 두번째 프로시저 실행. 4)번작업이 PRIMARY KEY제약조건검사 위배가되어 예외발생.
EXEC iud_ch10_sales_proc ( '199801', 'Japan');

--EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales;


-- 트랜잭션으로 인한 작업시 주의사항 시나리오.
-- 현재 세션에서 데이터변경작업을 하고, commit or rollback을 하지않으면 트랜잭션 락(lock) 때문에,
-- 타 세션에서 데이터변경 작업이 진행되지 않고, 대기상태가 된다.(중요)
UPDATE CH10_SALES
    SET SALES_AMT = 100
WHERE  SALES_MONTH = '199801' AND COUNTRY_NAME = 'Japan';


rollback;


