-- 숫자함수
/*
숫자 함수란 수식 연산을 하는 함수로 연산 대상 즉, 매개변수나 반환 값이 대부분 숫자 형태다.
*/
/*
① ABS(n)
ABS 함수는 매개변수로 숫자를 받아 그 절대값을 반환하는 함수다.
절댓값 = -고 +고 그냥 진짜 숫자
*/

SELECT ABS(10), ABS(-10), ABS(-10.123)
  FROM DUAL;

/*
② CEIL(n)과 FLOOR(n)
CEIL 함수는 매개변수 n과 같거나 가장 큰 정수를 반환한다.
*/

-- 올림함수 : 소수부분을 무조건 올림하여, 정수값으로 반환
SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001), CEIL(11.000)
  FROM DUAL;
  
-- 
-- 내림함수  : 소수부분을 제거하여, 정수값으로 반환
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
  FROM DUAL;
  
/*
③ ROUND(n, i)와 TRUNC(n1, n2)
ROUND 함수는 매개변수 n을 소수점 기준 (i+1)번 째에서 반올림한 결과를 반환한다. i는 생략할 수 있고 디폴트 값은 0, 즉 소수점 첫 번째 자리에서 반올림이 일어나 정수 부분의 일의 자리에 결과가 반영된다.
*/

-- 1) 매개변수 1개 사용  
-- 기본은 소수부분 첫째자리를 반올림 대상(여부)으로 본다.
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
  FROM DUAL;

  
-- 2) 2개의 매개변수가 사용. 첫번째는 대상, 
-- 두번째 매개변수의 값이 양수일 경우 지정한 소수 자리를 반올림하여 결과를 만들어준다.
-- 소수 자리수까지 결과를 보여준다.
SELECT ROUND(10.154, 1), ROUND(10.154, 2), ROUND(10.154, 3)
  FROM DUAL;
  
 -- 두번째 매개변수의 값이 음수일 경우, 정수자리수를 반올림 대상(여부)으로 본다. 
SELECT ROUND(0, 3), ROUND(115.155, -1), ROUND(115.155, -2)
  FROM DUAL;   
 
/*
TRUNC 함수는 반올림을 하지 않고 n1을 소수점 기준 n2자리에서 무조건 잘라낸 결과를 반환한다. 
n2 역시 생략할 수 있으며 디폴트 값은 0이고, 양수일 때는 소수점 기준으로 오른쪽, 음수일 때는 소수점 기준 왼쪽 자리에서 잘라낸다.
*/

-- 2번째 매개변수가 양수이면, 지정한 소수자리까지 보호하고, 나머지는 제거한다.
--                음수이면, 지정한 정수자리에서부터 제거한다.
SELECT TRUNC(115.155), TRUNC(115.155, 1), TRUNC(115.155, 2), TRUNC(115.155, -2)
  FROM DUAL;   
  
 /*
 ④ POWER(n2, n1)와 SQRT(n)
POWER 함수는 n2를 n1 제곱한 결과를 반환한다. n1은 정수와 실수 모두 올 수 있는데, n2가 음수일 때 n1은 정수만 올 수 있다.
*/
SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001)
  FROM DUAL;  
  
  
SELECT POWER(-3, 3.0001)
  FROM DUAL;  -- SQL. 오류: ORA-01428: '-3' 인수가 범위를 벗어났습니다.


-- SQRT는 루트를 씌우는 함수다  
SELECT SQRT(2), SQRT(5)
  FROM DUAL;   
  
/*
⑤ MOD(n2, n1)와 REMAINDER(n2, n1)
MOD 함수는 n2를 n1으로 나눈 나머지 값을 반환한다.
*/
SELECT MOD(19,4), MOD(19.123, 4.2)
  FROM DUAL;   

/*
REMAINDER 함수 역시 n2를 n1으로 나눈 나머지 값을 반환하는데, 나머지를 구하는 내부적 연산 방법이 MOD 함수와는 약간 다르다.

? MOD → n2 - n1 * FLOOR (n2/n1)

? REMAINDER → n2 - n1 * ROUND (n2/n1)
*/
-- 20 - 4*4 = -1
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
  FROM DUAL;     
/*
⑥ EXP(n), LN(n) 그리고 LOG(n2, n1)
EXP는 지수 함수로 e(e=2.71828183…)의 n제곱 값을 반환하고, LN 함수는 자연 로그 함수로 밑수가 e인 로그 함수다. 반면 LOG는 n2를 밑수로 하는 n1의 로그 값을 반환한다
*/
SELECT EXP(2), LN(2.713), LOG(10, 100)
  FROM DUAL;
  
  
-- 문자함수
/*
① INITCAP(char), LOWER(char), UPPER(char)
INITCAP 함수는 매개변수로 들어오는 char의 첫 문자는 대문자로, 나머지는 소문자로 반환하는 함수다. 
이때 첫 문자를 인식하는 기준은 공백과 알파벳(숫자 포함)을 제외한 문자다. 
즉 공백이나 알파벳이 아닌 문자를 만난 후 다음 첫 알파벳 문자를 대문자로 변환한다.
*/
-- 단어의 첫문자를 대문자로 변환
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye')
  FROM DUAL;  

-- 대문자를 소문자로 변환,            소문자를 대문자로 변환  
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye')
  FROM DUAL;  
  
 /*
 ② CONCAT(char1, char2), SUBSTR(char, pos, len), SUBSTRB(char, pos, len)
CONCAT 함수는 ‘||’ 연산자처럼 매개변수로 들어오는 두 문자를 붙여 반환한다.
*/

-- 즉 둘이 동일하다
SELECT CONCAT('I Have', ' A Dream'), 'I Have' || ' A Dream'
  FROM DUAL;
  
SELECT CONCAT (EMP_NAME, EMAIL) AS EMPINFO, 
EMPLOYEE_ID || EMP_NAME || EMAIL  AS EMPINFO2 
FROM EMPLOYEES;
/*
SUBSTR는 문자 함수 중 가장 많이 사용되는 함수로, 
잘라올 대사 문자열인 char의 pos번째 문자부터 len길이만큼 잘라낸 결과를 반환하는 함수다. 
pos 값으로 0이 오면 디폴트 값인 1, 즉 첫 번째 문자를 가리키며, 음수가 오면 
char 문자열 맨 끝에서 시작한 상대적 위치를 의미한다. 또한 len 값이 생략되면 
pos번째 문자부터 나머지 모든 문자를 반환한다.
*/
SELECT SUBSTR('ABCD EFG', 1, 4)
  FROM DUAL;

--   3번째 매개변수의 기능은 문자개수이다.
SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4)
  FROM DUAL;  
  
SELECT EMP_NAME, SUBSTR(EMP_NAME,1 ,2) || '...' AS EMP_NAME_INFO FROM EMPLOYEES;

-- 3번째 매개변수의 기능은 바이트 의미이다. 한글은 3바이트로 설정. 
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 6)
  FROM DUAL;    

/*
③ LTRIM(char, set), RTRIM(char, set)
LTRIM 함수는 매개변수로 들어온 char 문자열에서 set으로 지정된 문자열을 왼쪽 끝에서 제거한 후 나머지 문자열을 반환한다. 
두 번째 매개변수인 set은 생략할 수 있으며, 디폴트로 공백 문자 한 글자가 사용된다.
RTRIM 함수는 LTRIM 함수와 반대로 오른쪽 끝에서 제거한 뒤 나머지 문자열을 반환한다.
*/
-- SELECT LTRIM(문자열타입의 컬럼명, '왼쪽에서 제거할 문자열') FROM 테이블명;

SELECT LTRIM('ABCDEFGABC', 'ABC'), 
       LTRIM('가나다라', '가'),
       RTRIM('ABCDEFGABC', 'ABC'), 
       RTRIM('가나다라', '라')
  FROM DUAL;    

-- 2번째 매개변수의 문자열과 일치되지 않으면, 제거되는 게 없어서, 첫번째 매개변수의 값이 그대로 반환된다.  
SELECT LTRIM('가나다라', '나'), RTRIM('가나다라', '나')
  FROM DUAL;    

/*
④ LPAD(expr1, n, expr2), RPAD(expr1, n, expr2)
LPAD 함수는 매개변수로 들어온 expr2 문자열(생략할 때 디폴트는 공백 한 문자)을 n자리만큼 왼쪽부터 채워 expr1을 반환하는 함수다.
매개변수 n은 expr2와 expr1이 합쳐져 반환되는 총 자릿수를 의미한다. 
예를 들어, 서울의 지역 전화번호는 ‘02’인데 전화번호 컬럼에 지역번호가 없으면 LPAD 함수로 번호 02를 자동으로 채워 넣을 수 있다.
*/
  
CREATE TABLE ex4_1 (
       phone_num VARCHAR2(30));


INSERT INTO ex4_1 VALUES ('111-1111');

INSERT INTO ex4_1 VALUES ('111-2222');

INSERT INTO ex4_1 VALUES ('111-3333');

SELECT *
FROM ex4_1;

-- 3번째 매개변수의 값을 왼쪽에 채운다.
SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

-- 3번째 매개변수의 값을 오른쪽에 채운다.
SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;
          
 /*
 ⑤ REPLACE(char, search_str, replace_str), TRANSLATE(expr, FROM_str, to_str)
REPLACE 함수는 char 문자열에서 search_str 문자열을 찾아 이를 replace_str 문자열로 대체한 결과를 반환하는 함수다.
*/
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너')
  FROM DUAL;   

-- LTRIM, RTRIM 함수.
-- 매개변수가 1개면, 왼쪽 또는 오른쪽 공백제거 기능이다.
-- 매개변수가 2개면, 2번째 매개변수의 기능은 왼쪽 또는 오른쪽에 일치되는 문자열 제거 기능이다.
SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ', ' ', '')  -- 공백제거
  FROM DUAL;            
 
--   REPLACE 와 TRANSLATE 차이점.
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS rep,  -- '나는' -> '너를'
       TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS trn  -- '나' -> '너',   '는' -> '를'
  FROM DUAL; 
    
/*
⑥ INSTR(str, substr, pos, occur), LENGTH(chr), LENGTHB(chr)
INSTR 함수는 str 문자열에서 substr과 일치하는 위치를 반환하는데, pos는 시작 위치로 디폴트 값은 1, 
occur은 몇 번째 일치하는지를 명시하며 디폴트 값은 1이다.
*/
    
SELECT INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약') AS INSTR1, 
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5) AS INSTR2, 
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5, 2) AS INSTR3 
  FROM DUAL;   
-- LENGTH 함수는 매개변수로 들어온 문자열의 개수를 반환하며, LENGTHB 함수는 해당 문자열의 바이트 수를 반환한다.  
SELECT LENGTH('대한민국'),
       LENGTHB('대한민국')
  FROM DUAL;     
  
  
SELECT employee_id, TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou') AS TRANS_NAME
  FROM employees;
  
    
--날짜 함수
-- 날짜 데이터타입 : DATE, TIMESTAP

-- SYSDATE : 초까지 반환, SYSTIMESTAMP : 밀리세컨드까지 반환
SELECT SYSDATE, SYSTIMESTAMP
  FROM DUAL;    

-- ② ADD_MONTHS (date, integer)
-- ADD_MONTHS 함수는 매개변수로 들어온 날짜에 interger 만큼의 월을 더한 날짜를 반환한다.  
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
  FROM DUAL;  

/*
③ MONTHS_BETWEEN(date1, date2)
MONTHS_BETWEEN 함수는 두 날짜 사이의 개월 수를 반환하는데, date2가 date1보다 빠른 날짜가 온다.
*/
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1, 
       MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
  FROM DUAL;    
 
 -- ④ LAST_DAY(date)
-- LAST_DAY는 date 날짜를 기준으로 해당 월의 마지막 일자를 반환한다. 
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;  
  
  SELECT HIRE_DATE, LAST_DAY(HIRE_DATE)
  FROM EMPLOYEES;
  
  -- 사원테이블에서 근속년수를 조회하라.
  -- RETIRE_DATE컬럼의 값이 NULL 일 경우는 반환값이 NULL 이된다.
  -- 함수안에 매개변수가 함수가 사용될 수도 있다.
  SELECT HIRE_DATE, RETIRE_DATE, MONTHS_BETWEEN(RETIRE_DATE, HIRE_DATE), 
  TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
  FROM EMPLOYEES;

/*
⑤ ROUND(date, format), TRUNC(date, format)
ROUND와 TRUNC는 숫자 함수이면서 날짜 함수로도 쓰이는데, 
ROUND는 format에 따라 반올림한 날짜를, TRUNC는 잘라낸 날짜를 반환한다.
ROUND 함수에서 보면 현재가 16일이므로 월(MONTH) 기준으로 반올림하면 다음 달로 넘어가 4월 1일이 되었다. 
반면 TRUNC에서는 무조건 월을 기준으로 잘라내므로 3월 1일이 된 것이다. 
ROUND나 TRUNC나 숫자 함수에서 배웠던 것처럼 반올림과 잘라내기 기능을 하는데 매개변수가 날짜이면
해당 날짜를 반올림하고 잘라낸 결과를 반환한다.
*/
-- 2번째 매개변수의 값은 반올림의 효과를 보는 용도.
-- ROUND함수 : 일단위가 16일 이상 일때 반올림이 된다.
SELECT SYSDATE, ROUND(SYSDATE, 'month'), ROUND(TO_DATE('2023-03-15'), 'month'), 
ROUND(TO_DATE('2023-03-16'), 'month'), 
TRUNC(SYSDATE, 'month')
  FROM DUAL;   
  
/*
⑥ NEXT_DAY (date, char)
NEXT_DAY는 date를 char에 명시한 날짜로 다음 주 주중 일자를 반환한다.
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금요일')
  FROM DUAL;
  
-- 변환함수
/*
① TO_CHAR (숫자 혹은 날짜, format)
숫자나 날짜를 문자로 변환해 주는 함수가 바로 TO_CHAR로, 
매개변수로는 숫자나 날짜가 올 수 있고 반환 결과를 특정 형식에 맞게 출력할 수 있다.
*/

SELECT 123456789, '123,456,789' FROM DUAL;


 -- https://thebook.io/006696/0110/ 2번째 매개변수의 포맷 키워드 참조.
SELECT TO_CHAR(123456789, '999,999,999')
  FROM DUAL;   
  
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;


SELECT HIRE_DATE, TO_CHAR(HIRE_DATE, 'MONTH'), TO_CHAR(HIRE_DATE, 'DDD')
FROM EMPLOYEES; 

-- ② TO_NUMBER(expr, format)
--문자나 다른 유형의 숫자를 NUMBER 형으로 변환하는 함수다

SELECT TO_NUMBER('123456')
FROM DUAL;

/*
③ TO_DATE(char, format), TO_TIMESTAMP(char, format)
문자를 날짜형으로 변환하는 함수다. 형식 매개변수로는 [표 4-1]에 있는 항목이 올 수 있으며, 
TO_DATE는 DATE 형으로 TO_TIMESTAMP는 TIMESTAMP 형으로 변환해 값을 반환한다.
*/


-- 성능
-- 질의? 입사일이 2000년 이전 사원을 조회하라.
-- 1)
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < '2000-01-01'  -- 자동 형변환
ORDER BY EMPLOYEE_ID;       -- 15건
-- 2)
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('2000-01-01')  -- 명시적 형변환
ORDER BY EMPLOYEE_ID;   -- 15건

--3) 권장하지 않는다.(성능에 안좋다.)
-- WHERE 절의 조건식에서 컬럼에 함수를 적용하는 것은 데이타수만큼 작업이 발생되므로, 성는에 좋지않다.
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') < '2000-01-01'  -- 15건
ORDER BY EMPLOYEE_ID;

-- 초 단위까지 반환
SELECT TO_DATE('20140101', 'YYYY-MM-DD')
  FROM DUAL;
  
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;  
  
-- NULL 관련함수
-- WHERE 컬럼명 IS NULL
-- WHERE 컬럼명 IS NOT NULL

/*
① NVL(expr1, expr2), NVL2((expr1, expr2, expr3)
NVL 함수는 expr1이 NULL일 때 expr2를 반환한다.
*/

-- manager_id컬럼이 NULL이면, 2번째 매개변수의 employee_id컬럼의 값이 반환,
-- manager_id컬럼이 NOT NULL이면, manager_id컬럼 값이 반환된다.

-- 
SELECT NVL(manager_id, employee_id)
  FROM employees
 WHERE manager_id IS NULL;  
 
 SELECT manager_id, NVL(manager_id, employee_id) 
 FROM employees  WHERE manager_id IS NULL;
 
 
 -- NVL2는 NVL을 확장한 함수로 expr1이 NULL이 아니면 expr2를, NULL이면 expr3를 반환하는 함수다.
 -- NVL2(expr1, expr2, expr2)
 -- 커미션이 not null이면, 급여에 커미션 적용되고, null이면 급여만 지급되게 조회.
SELECT employee_id, salary,
       NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
  FROM employees;
  
SELECT employee_id, salary,
        NVL2(commission_pct, salary + ( salary * commission_pct), salary) AS "커미션이 적용된 급여"
FROM   employees;      
  
/*
② COALESCE (expr1, expr2, …)
COALESCE 함수는 매개변수로 들어오는 표현식에서 NULL이 아닌 첫 번째 표현식을 반환하는 함수다.
매개변수를 NOT NULL 이 나올때 까지 순서대로 체크 후, NOT NULL이 나오는 매개변수의 값을 반환.
*/

-- NULL 이 포함된 연산식의 결과는 NULL이된다.(중요)
SELECT NULL + 10 FROM DUAL;
SELECT NULL * 10 FROM DUAL;

SELECT 5 * NULL + 10 FROM DUAL;

SELECT COALESCE(NULL, NULL, NULL) FROM DUAL;
SELECT COALESCE(NULL, 1, NULL) FROM DUAL;
SELECT COALESCE(1, NULL, NULL) FROM DUAL;


-- commission_pct 컬럼이 NULL 허용으로 설정되어 있다.
--  커미션이 not null이면, 급여에 커미션 적용되고, null이면 급여만 지급되게 조회.(NVL2함수도 사용할수 가 있다.)
SELECT employee_id, salary, commission_pct, 
       COALESCE (salary * commission_pct, salary) AS salary2
  FROM employees;  
  
    
 
  /*
 ③ LNNVL(조건식)
LNNVL은 매개변수로 들어오는 조건식의 결과가 FALSE 나 UNKNOWN 이라면 TRUE 반환. TRUE 라면 FALSE 로 반환
*/
    
-- commission_pct 컬럼에 NULL 데이타는 포함되지 않는다.(중요)
SELECT employee_id, commission_pct
  FROM employees
 WHERE commission_pct < 0.2;    -- 11 건
 
-- 아래 1)NVL함수이용 2)LNNVEL함수이용 결과는 동일하다.(NULL 데이타를 포함한 부분) 
 -- commission_pct 컬럼에 NULL 데이타는 0 으로 처리하고, 0.2보다는 작은 조건에 포함한다.
-- 1)
SELECT COUNT(*)
  FROM employees
 WHERE NVL(commission_pct, 0) < 0.2;    -- 83건 (72개의 NULL인 데이타 포함)

-- LNNVL(commission_pct >= 0.2)
-- commission_pct >= 0.2 조건식에 만족하는 데이타가 있다면 TRUE 가 반환되고, LNNVL함수가 FALSE 반환
-- commission_pct >= 0.2 조건식에 만족하지 않는 데이타가 있다.  
    --그 데이타는 0.2보다 작은 의미. FALSE LNNVL함수가 TRUE반환
    -- NULL 데이타. UNKNOWN 반환. LNNVL함수가 TRUE반환
-- 2) WHERE 절에서는   LNNVL(commission_pct >= 0.2) 이 구문이 TRUE인 데이타만 조회된다. 
SELECT COUNT(*)
  FROM employees
 WHERE LNNVL(commission_pct >= 0.2) ;  -- 83건.   commission_pct < 0.2 + NULL데이타 포함.

/*
④ NULLIF (expr1, expr2)
NULLIF 함수는 expr1과 expr2을 비교해 같으면 NULL을, 같지 않으면 expr1을 반환한다.
*/
SELECT NULLIF(NULL, NULL) FROM DUAL; -- 에러발생. 둘다 NULL 일 경우
SELECT NULLIF(1, 1) FROM DUAL; -- 2개의 매개변수 값이 같으면 NULL
SELECT NULLIF(1, 2) FROM DUAL;  -- 2개의 매개변수 값이 같지않으면, 첫번째 매개변수 값이 반환된다.  1

--job_history 테이블에서 start_date와 end_date의 연도만 추출해 두 연도가 같으면(당해년도) NULL을, 같지 않으면 종료년도를 출력하는 쿼리다. 
SELECT employee_id,
       TO_CHAR(start_date, 'YYYY') start_year,
       TO_CHAR(end_date, 'YYYY') end_year,
       NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY') ) nullif_year
FROM job_history;

SELECT employee_id,
        TO_CHAR(start_date, 'YYYY')  start_year,
        TO_CHAR(end_date, 'YYYY') end_year,
        NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY')) nullif_year
FROM job_history;

--------------------------------------------
/*
① GREATEST(expr1, expr2, …), LEAST(expr1, expr2, …)
GREATEST는 매개변수로 들어오는 표현식에서 가장 큰 값을, LEAST는 가장 작은 값을 반환하는 함수다.
*/

SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;
  
SELECT GREATEST('이순신', '강감찬', '세종대왕'),
       LEAST('이순신', '강감찬', '세종대왕')
  FROM DUAL;  
 /*
 ② DECODE (expr, search1, result1, search2, result2, …, default)
DECODE는 expr과 search1을 비교해 두 값이 같으면 result1을, 
같지 않으면 다시 search2와 비교해 값이 같으면 result2를 반환하고, 
이런 식으로 계속 비교한 뒤 최종적으로 같은 값이 없으면 default 값을 반환한다
*/
  
  SELECT prod_id,
         DECODE(channel_id, 3, 'Direct', 
                            9, 'Direct',
                            5, 'Indirect',
                            4, 'Indirect',
                               'Others')  decodes
  FROM sales
  WHERE rownum < 10;