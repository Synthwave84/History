/*
PL/SQL : Procedure, Function, Trigger 를 생성할수 가 있다.
  - SQL의 단점부분을 보완하기위한 언어.
*/

-- PL/SQL 기본블록
DECLARE
    -- 변수, 상수선언
BEGIN
    -- 변수, 상수사용
    -- 각종 제어문
END;


-- IF 문

DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2 ;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'이 큰 수');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'이 큰 수');	 
	 END IF;
	
END;

SET SERVEROUTPUT ON; -- 세션단위
-- DBMS_OUTPUT.PUT_LINE() 출력을 보기위하여, 위의 명령을 실행해야 한다.

DECLARE
    vn_num1 NUMBER := 1;
    vn_num2 NUMBER := 2;
BEGIN   -- {
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '이 큰 수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '이 큰 수');
    END IF;
END;   --  }

-- 명령어 설명
SELECT DBMS_RANDOM.VALUE(10, 120) FROM DUAL;    --41.6872300116375742668415741351466848082
SELECT ROUND(41.6872300116375742668415741351466848082, -1) FROM DUAL;  -- 40

-- SALARY컬럼의 값을 변수명에 저장
SELECT SALARY INTO 변수명 FROM employees WHERE department_id = 60 AND ROWNUM = 1;




-- 예제1)
DECLARE
   -- 변수선언및 초기화구문
   vn_salary NUMBER := 0;       -- 급여
   vn_department_id NUMBER := 0;        -- 부서코드
BEGIN
	-- 변수에 값을 할당. 부서코드 변수값을 10, 20, .... 120
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  -- 다중 IF문
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('낮음');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('중간');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('높음');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('최상위');
  END IF;  
   
	
END;



-- 예제2)
DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
   vn_commission NUMBER := 0;   -- 커미션 변수
BEGIN
	-- 부서코드를 10~120범위에서 랜덤으로 받아오는 구문.
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary, commission_pct
     INTO vn_salary, vn_commission
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);  -- 급여출력
  
  -- 중첩IF문
  IF vn_commission > 0 THEN
     IF vn_commission > 0.15 THEN
        DBMS_OUTPUT.PUT_LINE(vn_salary * vn_commission );
     END IF;  
  ELSE
     DBMS_OUTPUT.PUT_LINE(vn_salary);
  END IF;  
END;

-- CASE 문
/*
 <유형 1>
    CASE 표현식
        WHEN 결과1 THEN
             처리문1;
        WHEN 결과2 THEN
             처리문2;
        ...
        ELSE
             기타 처리문;
    END CASE;
     
    <유형 2>
    CASE WHEN 표현식1 THEN
             처리문1;
        WHEN 표현식2 THEN
             처리문2;
        ...
        ELSE
             기타 처리문;
    END CASE;
*/

-- 예제3)  예제1)의 다중 IF문을 CASE문으로 변환시킴
DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  -- 다중 IF문
  /*
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('낮음');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('중간');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('높음');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('최상위');
  END IF; 
  */
  CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
            DBMS_OUTPUT.PUT_LINE('낮음');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('높음');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('최상위');
  END CASE;

END;

-- 반복문

-- 유형1> LOOP 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt가 9보다 크면 루프 종료
   
   END LOOP;
    
END;


-- 유형2> WHILE 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
   END LOOP;
    
END;

-- 유형3>
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
   END LOOP;    
END;

-- 유형3>같은 구문.
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 5 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
   END LOOP;    
END;



-- FOR 문
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9  -- i값이 1에서 9까지
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;


DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN REVERSE 1..9 -- i변수의 값이 9에서 1로 진행
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;

-- CONTINUE 문
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5; -- 조건식 true이면, 아래구문이 실행이 안되고, for문에서 i값이 증가되어 실행된다.
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
    
END;

-- GOTO문
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   <<third>>    -- <<레이블명>>
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
      IF i = 3 THEN
         GOTO fourth;
      END IF;   
   END LOOP;
   
   <<fourth>>
   vn_base_num := 4;
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;   
    
END;





-- PL/SQL에서는 NULL문을 사용할 수 있다. NULL문은 아무것도 처리하지 않는 문장이다
-- NULL 문
IF vn_variable = 'A' THEN
   처리로직1;
ELSIF vn_variable = 'B' THEN
   처리로직2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          처리로직1;
     WHEN vn_variable = 'B' THEN
          처리로직2;      
     ...
     ELSE NULL;
END CASE;     

/*
시나리오 : 구구단 예제

newcomsa@nate.com sql코드 메일 보내주세요.

dbms_output.put();  -- 줄바꿈 없이 출력
dbms_output.put_line('');  -- 줄바꿈
lpad(i*j, 2) -- 2자리 출력
*/


-- 함수 : 리턴값이 있는 특징.
/*
 CREATE OR REPLACE FUNCTION 함수 이름 (매개변수1, 매개변수2, ...)
    RETURN 데이터타입;
    IS[AS]
      변수, 상수 등 선언
    BEGIN
      실행부
    　
      RETURN 반환값;
    [EXCEPTION
      예외 처리부]
    END [함수 이름];
*/

/*
함수 호출
이제 실제로 함수를 호출해 보자. 
함수 호출 방식은 매개변수의 존재 유무에 따라 함수명과 매개변수를 명시하기도 하고, 함수명만 명시하기도 한다. 
그리고 함수는 반환 값이 있으므로 SELECT 문장에서 사용할 수도 있고 PL/SQL 블록 내에서도 사용할 수 있다.

    <매개변수가 없는 함수 호출>
    함수명 혹은 함수명()
     
    <매개변수가 있는 함수 호출>
    함수명(매개변수1, 매개변수2,...)
*/    


-- 나머지 구하는 함수.
SELECT MOD(10, 3) FROM DUAL;    -- 1
SELECT 10 / 3 FROM DUAL; -- 3.33333333333333333333333333333333333333
SELECT FLOOR(10 / 3) FROM DUAL;     -- 3


CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )      -- 10     3
   RETURN NUMBER  -- 반환 데이터타입은 NUMBER
IS  -- 변수 또는 상수선언
   vn_remainder NUMBER := 0; -- 반환할 나머지
   vn_quotient  NUMBER := 0; -- 몫 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- 피제수/제수 결과에서 정수 부분을 걸러낸다
	 vn_remainder := num1 - ( num2 * vn_quotient); --나머지 = 피제수 - ( 제수 * 몫)
	 
	 RETURN vn_remainder;  -- 나머지를 반환
	
END;	
  
SELECT MOD(10, 3) FROM DUAL;    -- 1  
SELECT my_mod(10, 3) reminder FROM DUAL;   -- 1 

-- 국가(countries) 테이블을 읽어 국가번호를 받아 국가명을 반환하는 함수를 만들어보자.  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   -- COUNTRIES테이블의 COUNTRY_NAME컬럼명의 데이터타입을 참조
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE; -- 변수명 테이블명.컬럼명%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- 국가명 반환
	
END;	

-- 설명
SELECT country_name  FROM countries WHERE country_id = 52778;  -- Spain

-- 함수 호출(실행)
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;

-- 설명. 국가코드가 존재하면, 1 이되고, 존재하지 않으면 0
SELECT COUNT(*) FROM countries WHERE country_id = 10000;

-- 국가코드가 10000   번이 존재하지 않을 경우 NULL이 출력된다. '해당국가 없음' 으로 출력
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
		
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  -- 국가코드가 존재하지 않을 경우
  IF vn_count = 0 THEN
     vs_country_name := '해당국가 없음';
  ELSE
	
	  -- country_name 컬럼이 NULL이면 INTO 변수에 영향을 주지 않는다.
      SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- 국가명 반환
	
END;	  
  
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;

-- 설명
-- USER 함수 : 로그인한 사용자정보
SELECT USER FROM DUAL; -- ORA_USER
  
-- 매개변수가 없는 사용자정의 함수. 매개변수가 없는 경우는 함수명에 () 제외한다.
CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- 반환 데이터타입은 VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- 사용자이름 반환
	
END;	 	

--함수호출
SELECT fn_get_user(),fn_get_user
  FROM DUAL;

/*
함수는 특정 연산을 수행한 뒤 결과 값을 반환하지만 
프로시저는 특정한 로직을 처리하기만 하고 결과 값을 반환하지는 않는 서브 프로그램이다
*/
-- 프로시저 생성
/*
프로시저 생성
함수나 프로시저 모두 DB에 저장된 객체이므로 프로시저를 스토어드(Stored, 저장된) 프로시저라고 부르기도 하는데 이 책에서는 그냥 프로시저라고 하겠다(함수도 스토어드 함수라고도 한다). 프로시저의 생성 구문은 다음과 같다.

    CREATE OR REPLACE PROCEDURE 프로시저 이름
        (매개변수명1[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         매개변수명2[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         ...
        )
    IS[AS]
      변수, 상수 등 선언
    BEGIN
      실행부
    　
    [EXCEPTION
      예외 처리부]
    END [프로시저 이름];
*/    
/*
 jobs 테이블에 신규 JOB을 넣는 프로시저를 만들어 보자. 
 jobs 테이블에는 job 번호, job명, 최소, 최대 금액, 생성일자, 갱신일자 컬럼이 있는데,
 생성일과 갱신일은 시스템 현재일자로 등록할 것이므로 매개변수는 총 4개를 받도록 하자.
*/
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS

BEGIN
	
	INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	          VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	          
	COMMIT;
	
	
END ; 


CREATE OR REPLACE PROCEDURE my_new_job_proc
(
   p_job_id     IN      JOBS.JOB_ID%TYPE,
   p_job_title  IN   JOBS.JOB_TITLE%TYPE,
   p_min_salary IN  JOBS.MIN_SALARY%TYPE,
   p_max_salary IN  JOBS.MAX_SALARY%TYPE   
)
IS
    -- 변수, 상수선언
BEGIN
   INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY,CREATE_DATE, UPDATE_DATE )
   VALUES(p_job_id, p_job_title, p_min_salary, p_max_salary, SYSDATE, SYSDATE);
   
   COMMIT;
END;

-- 프로시저 실행
/*
EXEC 프로시저이름(값1, 값2, 값3, 값4);
*/

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000);

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 -- 2번째 실행했을 때, JOB_ID컬럼이 PRIMARY KEY제약조건 위배가 되어 에러발생
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
-- 동일한 job_id가 들어오면 신규 INSERT 대신 다른 정보를 갱신 UPDATE 하도록 프로시저를 수정해 보자
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;  -- 중복체크.
BEGIN
	
	-- 동일한 job_id가 있는지 체크 
	SELECT COUNT(*) INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
    END IF;
	          
	COMMIT;
	
	
END ;   

-- 프로시저 실행
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);


SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 /*
 프로시저의 매개변수가 많으면 실행할 때 매개변수 값의 개수나 순서를 혼동할 소지가 매우 많다. 
 이런 경우에는 다음과 같은 형태로 매개변수와 입력 값을 매핑해 실행하면 매우 편리하다.

    <프로시저 실행2>
    ? EXEC 혹은 EXECUTE 프로시저명(매개변수1 => 매개변수1 값,
    　　　　　　　　　　  　　　　　매개변수2 => 매개변수2 값, ...);
‘=>’ 기호를 사용해 해당 매개변수명과 값을 연결하는 형태로 실행할 수 있다. my_new_job_proc 프로시저를 이 형태로 실행해 보자.

입력
*/
-- 값만 제공
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);

-- 매개변수를 지정하여 값을 대입.
EXECUTE my_new_job_proc (p_job_id => 'SM_JOB1', p_job_title => 'Sample JOB1', p_min_sal => 2000, p_max_sal => 7000);
        
 
 
-- 매개변수 디폴트 값 설정. p_min_sal, p_max_sal 매개변수 값을 생략
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1');  -- 매개변수 3, 4번째가 기본값 적용
-- EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 10, 100);  같은 의미

-- 매개변수 디폴트 값이 무시됨.
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
  END IF;
	          
	COMMIT;
	
	
END ;    


EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1');

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
-- OUT 매개변수 : 프로시저가 실행했을 때 프로시저 내부의 값(특정 값)을 호출한 쪽으로 내보내는 매개변수 
                 -- 값을 제공 받을수는 없다.

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100,
            p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  )
IS
  vn_cnt NUMBER := 0;   -- 중복체크
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT 매개변수에 일자 할당.  중요.
	p_upd_date := vn_cur_date; 
	          
	COMMIT;
	
	
END ;   

-- 프로시저 호출
-- 프로시저에 매개변수가 out 이면, 호출하는 구문이 다르다.
-- 익명블록 구문사용
SET SERVEROUTPUT ON;

-- 익명블록 구문으로 프로시저 호출.
DECLARE
   vd_cur_date JOBS.UPDATE_DATE%TYPE;   -- out매개변수의 값을 받는 용도의 변수.
BEGIN
	 -- exec 키워드 사용안함.
     my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000, vd_cur_date);
	 
	 DBMS_OUTPUT.PUT_LINE(vd_cur_date);
END;


-- IN OUT 매개변수  : 매개변수가 프로시저에서 사용할 값을 받을수도 있고, 호출한 쪽으로 값을 내보낼수도 있는 2가지 기능.

CREATE OR REPLACE PROCEDURE my_parameter_test_proc (
               p_var1        VARCHAR2,  -- 기본값 IN
               p_var2 OUT    VARCHAR2,  -- 값을 내보내는 용도
               p_var3 IN OUT VARCHAR2 )  -- 값을 받고, 내보내는 2가지 용도
IS

BEGIN
	 DBMS_OUTPUT.PUT_LINE('p_var1 value = ' || p_var1);  -- IN 호출시 받은 값출력
	 DBMS_OUTPUT.PUT_LINE('p_var2 value = ' || p_var2);  -- OUT 호출시 값을 받을수가 없어서 NULL
	 DBMS_OUTPUT.PUT_LINE('p_var3 value = ' || p_var3);  -- IN OUT 호출시 받은 값은 먼저출력
	 
     -- OUT 매개변수에 값을 할당. 프로시저 호출한 쪽으로 값을 내보내는 목적
	 p_var2 := 'B2';  -- OUT
	 p_var3 := 'C2';  -- IN OUT
	
END;               

-- 프로시저 호출
DECLARE 
   v_var1 VARCHAR2(10) := 'A';
   v_var2 VARCHAR2(10) := 'B';
   v_var3 VARCHAR2(10) := 'C';
BEGIN
    --                     p_var1 IN, p_var2 OUT, p_var3 IN OUT
	 my_parameter_test_proc (v_var1,  v_var2,       v_var3);
	 
	 -- p_var2 OUT, p_var3 IN OUT 변수의 값을 받아서, 출력
     DBMS_OUTPUT.PUT_LINE('v_var2 value = ' || v_var2);  -- 'B2'
	 DBMS_OUTPUT.PUT_LINE('v_var3 value = ' || v_var3);  -- 'C2'
END;


-- RETURN 문 : 결과값을 반환하는 목적은 아니다.
/*
함수에서는 일정한 연산을 수행하고 결과 값을 반환하는 역할을 했지만, 
프로시저에서는 RETURN문을 만나면 이후 로직을 처리하지 않고 수행을 종료, 
즉 프로시저를 빠져나가 버린다. 
반복문에서 일정 조건에 따라 루프를 빠져나가기 위해 EXIT를 사용하는 것과 유사하다.
*/
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100
            --p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  
            )
IS
  vn_cnt NUMBER := 0;
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	-- 1000 보다 작으면 메시지 출력 후 빠져나간다
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('최소 급여값은 1000 이상이어야 합니다');
	   RETURN; -- 프로시저 종료.
    END IF;
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	          
	COMMIT;
	
	
END ;   


EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 999, 6000);


--- 현장 노하우 1
DECLARE
  emp_name VARCHAR2(80);
BEGIN
	emp_name := 'hong';
	
	UPDATE employees
	   SET emp_name = emp_name
	 WHERE employee_id = 100;
	 
	SELECT emp_name
	  INTO emp_name
	  FROM employees
	 WHERE employee_id = 100;
	 
	DBMS_OUTPUT.PUT_LINE(emp_name);
	
END;