-- 집계함수
/*
집계함수란 대상 데이터를 특정 그룹으로 묶은 다음 이 그룹에 대해 총합, 평균, 최댓값, 최솟값 등을 구하는 함수를 말한다
*/

/*
① COUNT (expr)
COUNT는 쿼리 결과 건수, 
즉 전체 로우 수를 반환하는 집계 함수다. 
테이블 전체 로우는 물론 WHERE 조건으로 걸러진 로우 수를 반환한다.
*/

-- 사원테이블의 데이터 개수 조회
-- * (애스테리스크, ASTERISK)
SELECT COUNT(*)
  FROM employees;    -- 107건

SELECT COUNT(*) FROM employees;

-- 매개변수로 컬럼명을 사용가능하다. 컬럼명은 PRIMARY KEY(UNIQUE + NOT NULL) 해당하는 것을 권장
SELECT COUNT(employee_id)   -- 107건
  FROM employees;
 
 -- department_id컬럼은 NULL 허용, 실제 NULL 인 데이터행이 존재한다. 
SELECT COUNT(department_id)
  FROM employees;     --  106건(NULL 데이타 1개는 제외)
  
-- NULL인 데이터를 출력
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

--  DISTINCT department_id : 컬럼의 중복된 데이타를 중복데이타를 제거해서 단 1개의 데이타로 관리. 
SELECT COUNT(DISTINCT department_id)
  FROM employees;    -- 11건 = 부서의 갯수
  
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES
ORDER BY 1 ASC;

-- 11건의 부서코드를 조회
SELECT DISTINCT department_id
  FROM employees
  ORDER BY 1;  -- 1 의 의미는 SELECT절의 첫번째 컬럼명을 숫자로 가키리는 의미.
  
-- DISTINCT 이해
CREATE TABLE TEST_06 (
    COL1    VARCHAR2(10),
    COL2    VARCHAR2(10),
    COL3    VARCHAR2(10)
);

INSERT INTO TEST_06 VALUES( 'A1', 'B1', 'C1');
INSERT INTO TEST_06 VALUES( 'A1', 'B1', 'C1');
INSERT INTO TEST_06 VALUES( 'A1', 'B1', 'C2');
INSERT INTO TEST_06 VALUES( 'A1', 'B1', 'D1');
INSERT INTO TEST_06 VALUES( 'A2', 'B2', 'D2');

COMMIT;

SELECT * FROM TEST_06;

-- COL1, COL2 컬럼2개에 동시에 만족하는 데이타를 중복된 데이타를 제거해서 하나로 처리.
SELECT DISTINCT COL1, COL2 FROM TEST_06;

SELECT DISTINCT COL1, COL2, COL3 FROM TEST_06;

/*
② SUM(expr)
SUM은 expr의 전체 합계를 반환하는 함수로 매개변수 expr에는 숫자형만 올 수 있다. 
사원 테이블에서 급여가 숫자형이므로 전 사원의 급여 총액을 구해 보자.
*/

-- 사원의 전체 급여총액을 조회하자.  
SELECT SUM(salary)
  FROM employees;  
  
SELECT SUM(salary), SUM(DISTINCT salary)
  FROM employees;    
  
/*
③ AVG(expr)
AVG는 매개변수 형태나 쓰임새는 COUNT, SUM과 동일하며 평균값을 반환한다.
*/

SELECT AVG(salary), AVG(DISTINCT salary)
  FROM employees;     

/*
④ MIN(expr), MAX(expr)
MIN과 MAX는 각각 최솟값과 최댓값을 반환한다. (컬럼명) 수직
*/
-- 급여가 가장 낮은금액과 높은금액을 조회하라.
SELECT MIN(salary), MAX( salary)
  FROM employees;       
  
SELECT MIN(DISTINCT salary), MAX(DISTINCT salary)
  FROM employees;       
 /*
 ⑤ VARIANCE(expr), STDDEV(expr)
VARIANCE는 분산을, STDDEV는 표준편차를 구해 반환한다
*/
SELECT VARIANCE(salary), STDDEV(salary)
  FROM employees; 
  
-- GROUP BY 와 HAVING 절
/*
 모두 사원 전체를 기준으로 데이터를 추출했는데, 전체가 아닌 특정 그룹으로 묶어 데이터를 집계할 수도 있다. 
 이때 사용되는 구문이 바로 GROUP BY 절이다. 
 그룹으로 묶을 컬럼명이나 표현식을 GROUP BY 절에 명시해서 사용하며 GROUP BY 구문은 WHERE와 ORDER BY절 사이에 위치한다.
 */
 
-- 질의? 각 부서별 사원들의 급여 총액을 조회하라.
SELECT DEPARTMENT_ID, SALARY 
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC;

-- GROUP BY 명령어를 사용하면, SELECT 절에 사용컬럼에 제한이 있다.(중요)
-- 즉 구조적으로 하단에 EMP_NAME 을 넣으면 GROUP BY 로 명령어 축약을 해야하는데,
-- EMP_NAME은 107건이 되어 구조적을 ㅗ부ㅜㄹ가능하다.
-- GROUP_BY로 지정된 컬럼명, 집계함수를 사용한 컬럼명만 SELECT 절에 사용이 가능하다.

SELECT DEPARTMENT_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC;







SELECT department_id, SUM(salary)
  FROM employees    -- 107건
 GROUP BY department_id -- 부서코드가 같은 데이타들을 그룹화 작업을 하고, 대상데이터
 ORDER BY department_id;  


/*
CREATE TABLE KOR_LOAN_STATUS (
           PERIOD        VARCHAR2(6),
           REGION        VARCHAR2(10),
           GUBUN         VARCHAR2(30),
           LOAN_JAN_AMT  NUMBER) ; 
*/


SELECT *
FROM kor_loan_status;

SELECT REGION,SUM(LOAN_JAN_AMT) 
FROM KOR_LOAN_STATUS
WHERE PERIOD LIKE '2013%'
GROUP BY REGION;


-- 질의? 2013년 데이타를 가지고, 지역별 가계대출 총 잔액을 구해 보자.
-- 2013년 추출(WHERE),  지역별(GROUP BY), SUM(LOAN_JAN_AMT)

-- 1) 2013년도 데이터 추출
SELECT *
FROM kor_loan_status
WHERE period LIKE '2013%';

-- 2) 지역별 그룹화작업
SELECT REGION,SUM(LOAN_JAN_AMT)
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY REGION -- SELECT 절은 제한이 되어 있다.( 그룹화된 컬럼, 집계함수 만이 사용가능)
ORDER BY REGION;
/* 17개
강원	36543.3
경기	564291.9
경남	112370.5
경북	63313.9
광주	51193.3
대구	85097.8
대전	61804.1
부산	137658.8
서울	667047.6
세종	8406.3
울산	42748.5
인천	139925
전남	40398.9
전북	51823.3
제주	14366.8
충남	65006.8
충북	40855.3
*/

-- 질의? 2013년 데이타를 가지고,  [월별, 지역별] 가계대출 총 잔액을 구해 보자.
SELECT period, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, region    -- 2개의 컬럼에 동시에 일치되는 데이타를 묶어서 그룹화하는 의미.
 ORDER BY period, region; 
 /* 34개
 201310	강원	18190.5
201310	경기	281475.5
201310	경남	55814.4
201310	경북	31391
201310	광주	25421.5
201310	대구	42284.6
201310	대전	30685
201310	부산	68401.4
201310	서울	332984.9
201310	세종	4141.5
201310	울산	21259.7
201310	인천	69796
201310	전남	20086.2
201310	전북	25761.6
201310	제주	7136.5
201310	충남	32337.1
201310	충북	20326.5
201311	강원	18352.8
201311	경기	282816.4
201311	경남	56556.1
201311	경북	31922.9
201311	광주	25771.8
201311	대구	42813.2
201311	대전	31119.1
201311	부산	69257.4
201311	서울	334062.7
201311	세종	4264.8
201311	울산	21488.8
201311	인천	70129
201311	전남	20312.7
201311	전북	26061.7
201311	제주	7230.3
201311	충남	32669.7
201311	충북	20528.8
*/
-- 사원테이블에서 JOB_ID별로 평균급여액을 조회하라.
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID;




-- 2013년 11월 데이타를 가지고,  각 지역별로  총 잔액을 조회하자.
SELECT region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period = '201311'  -- 2013년 11월 데이타
 GROUP BY region
 ORDER BY region;  
 
-- 위의 데이타 중 대출금액이 100000 보다 큰 것을 조회하라.
SELECT period, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period = '201311' 
 GROUP BY period, region
 HAVING SUM(loan_jan_amt) > 100000 -- GROUP BY한 데이타에  조건식
 ORDER BY region;
 
 -- 각 부서별 인원수를 조회하라. 부서코드, COUNT(*)
 -- 인원수가 10이하인 데이터 조회.
 SELECT DEPARTMENT_ID, COUNT(*)
 FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 HAVING COUNT(*) <= 10      -- GROUP BY에 그룹화된 데이타를 대상으로 조건식 사용시 HAVING 사용함.
 ORDER BY DEPARTMENT_ID;
 
 -- DEPARTMENT_ID, JOB_ID 별로 평균급여액을 조회하라. 소수부분 2자리까지
 SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) "사원수", ROUND(AVG(SALARY), 2) "평균급액"
 FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID, JOB_ID
 ORDER BY DEPARTMENT_ID, JOB_ID;
 
 
 
 
-- ROLLUP과 CUBE
/*
ROLLUP과 CUBE는 GROUP BY절에서 사용되어 그룹별 데이타, 소계및 전체합계도 추가로 보여 주는 역할을 한다.
*/

-- GROUP BY절에서 사용되어 그룹별 데이타. [기간+대출종류] 별 대출총액을 조회한다.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, gubun
 ORDER BY period; 
 /*
201310	기타대출	676078
201310	주택담보대출	411415.9
                    소계 (676078 + 411415.9) -> 추가1
201311	기타대출	681121.3
201311	주택담보대출	414236.9
                    소계 (681121.3 + 414236.9) -> 추가2
                    전체합계 (추가1 + 추가2)
*/
 /*
 ROLLUP(expr1, expr2, …)
ROLLUP은 expr로 명시한 표현식을 기준으로 집계한 결과, 즉 추가적인 집계 정보를 보여 준다. 
ROLLUP 절에 명시할 수 있는 표현식에는 그룹핑 대상, 
즉 SELECT 리스트에서 집계 함수를 제외한 컬럼 등의 표현식이 올 수 있으며, 명시한 표현식 수와 순서(오른쪽에서 왼쪽 순으로)에 따라 레벨별로 집계한 결과가 반환된다. 
표현식 개수가 n개이면 n+1 레벨까지, 하위 레벨에서 상위 레벨 순으로 데이터가 집계된다. 
하위레벨에서 상위레벨의 수가 결정된다.(n+1)
*/

-- ROLLUP(컬럼1, 컬럼2) : 컬럼의 개수 2 + 1 = 3
-- 하위레벨 -> 상위레벨 : 총 3개의 레벨데이타 출력

 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(period, gubun); 
 /*
 201310	기타대출	676078
201310	주택담보대출	411415.9
201310		1087493.9 (기간별소계)
201311	기타대출	681121.3
201311	주택담보대출	414236.9
201311		1095358.2(기간별소계)
		2182852.1
 */
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(gubun, period ); -- 컬럼 순서가 변경됨(중간레벨 소계 틀림)
 /*
 201310	기타대출	676078
201311	기타대출	681121.3
	기타대출	1357199.3   (대출종류별 소계)
201310	주택담보대출	411415.9
201311	주택담보대출	414236.9
	주택담보대출	825652.8 (대출종류별 소계)
		2182852.1
*/        

/*
분할(partial) ROLLUP 유형
예를 들어, 
1)GROUP BY expr1, ROLLUP(expr2, expr3)로 명시했다면, 
레벨은 ‘2+1=3’레벨이 되지만 결과는 
       (expr1, expr2, expr3), : (3레벨) 내역
       (expr1, expr2),    (2레벨)  소계
       (expr1)            (1레벨)  레벨업 소계
       중요>전체 합계는 집계되지 않는다. 

       
2)GROUP BY ROLLUP(expr1, expr2)  : 컬럼개수 2 + 1 = 3레벨
   - (expr1, expr2) : (3레벨) 내역
   - (expr1)  : (2레벨)  소계
   - 전체합계 표시 (1레벨)  전체
*/

 -- 부분(PARTIAL) ROLLUP유형 : 전체표시는 안함.
 --1)
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, ROLLUP( gubun );  -- 컬럼 1개 + 1 = 2레벨
 
 /*
 (period, gubun)  : (2레벨) 내역
 (period) : (1레벨) 소계
 */
 
 --2) 전체표시 안됨.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(period), gubun ;  -- 순서 변경됨
 /*
 컬럼 1개 + 1 = 2레벨
 (period, gubun) : (2레벨)
 (gubun) : (1레벨) 소계
 */
 
 
 /*
 CUBE(expr1, expr2, …)
CUBE는 ROLLUP과 비슷하나 개념이 약간 다르다. 
ROLLUP이 레벨별로 순차적 집계를 했다면, 
CUBE는 명시한 표현식 개수에 따라 가능한 모든 조합별로 집계한 결과를 반환한다. 
CUBE는 2의(expr 수)제곱 만큼 종류별로 집계 된다. 

CUBE(expr1, expr2, expr3)
예를 들어, expr 수가 3이면, 집계 결과의 유형은 총 2^3(컬럼의 수) = 8개가 된다.
가능한 조합의 레벨이 총 8개가 표시된다.

- (expr1, expr2, expr3) - (레벨3)
- (expr1, expr2) - (레벨2)
- (expr1, expr3) - (레벨2)
- (expr2, expr3) - (레벨2)
- (expr1)  - (레벨1)
- (expr2) - (레벨1)
- (expr3) - (레벨1)
- 전체표시 : 테이블의 전체데이타 또는 조건이 적용되었을 때 단순 결과  - (레벨4)
*/
 
 
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY CUBE(period, gubun) ;  --  2의 2(컬럼 개수)승 = 4
 /*
 레벨 4개 표시
 
 - (period, gubun)  : (3레벨)
 - (period) : (2-1레벨)
 - (gubun) : (2-2레벨)
 - 전체표시 : (1레벨)
 */
 /*
                    2182852.1
        기타대출	    1357199.3
        주택담보대출	825652.8
201310		        1087493.9
201310	기타대출	    676078
201310	주택담보대출	411415.9
201311		        1095358.2
201311	기타대출	    681121.3
201311	주택담보대출	414236.9
*/

-- 전체 데이터 확인
 SELECT SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%';  -- 2182852.1
 
 
 /*
 분할 CUBE 유형도 사용할 수 있다.  전체 표시안됨.
 예를 들어 GROUP BY expr1, CUBE(expr2, expr3)로 명시했을 때, 
    (expr1, expr2, expr3), - (레벨3)
    (expr1, expr2), - (레벨2)
    (expr1, expr3), - (레벨2)
    (expr1) - (레벨1)
    
    총 4가지(2^2^) 유형으로 집계된다.
 */
  
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, CUBE( gubun );
 /*
 유형 종류 : 2개. 2의 1승(컬럼 개수)
 - (period, gubun) - (레벨2)
 - (period) - (레벨1)
 
 */
-- https://thebook.io/006696/0132/ 주소에 rollup, cube 유형 설명참조. 
 
-- 집합 연산자
/*
UNION, UNION ALL, INTERSECT, MINUS가 있다.

데이터 집합이 대상이므로 집합 연산자를 사용할 때 데이터 집합의 수는 한 개 이상을 사용할 수 있다. 
즉 여러 개의 SELECT문을 연결해 또 다른 하나의 쿼리를 만드는 역할을 하는 것이 집합 연산자다. 
집합 연산자는 학창 시절 배웠던 집합, 즉 합집합, 교집합, 차집합, 여집합과 개념이 같다. 
*/

/*
UNION
UNON은 합집합을 의미한다. 예를 들어, 두 개의 데이터 집합이 있으면 각 집합 원소(SELECT 결과)를 모두 포함한 결과가 반환된다
수직적인 결합으로 하나의 결과로 출력형태.
*/


-- exp_goods_asia 테이블을 생성해 한국과 일본의 주요 10대 수출품
CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));
       
INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6,  '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7,  '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8,  '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9,  '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10,  '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

COMMIT;

-- 1)
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
 ORDER BY seq;

-- 2)
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'
 ORDER BY seq;
 
-- 1)과 2)번 SELECT문을 수직적인 결합으로 하나의 결과형태를 조회
-- ORDER BY SEQ 구문이 제외된 것 체크
-- UNION : 20개의 데이타중 중복된 부분을 제거, 하나로 처리해서 15개 출력
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION -- 중복된 데이타 제거해서 하나로 출력
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';
 
 -- 참고로, 여러개의 SELECT 문 사용가능
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'  
UNION -- 1
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';  
 UNION -- 2
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION -- 3
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';
 
 

-- UNION ALL : 중복된 데이타를 제거하지 않고, 포함하여 출력.  20개
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION ALL
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';
 
 
 /*
 정리 : 중복된 데이타가 존재하지 않은 상태에서 UNION , UNION ALL 둘 중 속도는 누가 빠릅니까? UNION ALL(권장)
 */
 
 /*
 INTERSECT
INTERSECT는 합집합이 아닌 교집합을 의미한다. 즉 데이터 집합에서 공통된 항목만 추출해 낸다.
*/
 -- 한국과 일본이 공통으로 겹치는 수출품목을 조회하라.
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
INTERSECT
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'; 

/*
MINUS
MINUS는 차집합을 의미한다. 즉 한 데이터 집합을 기준으로 다른 데이터 집합과 공통된 항목을 제외한 결과만 추출해 낸다.
*/
 
-- 한국만 수출하는 품목 
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
MINUS
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';  
 
 -- 일본만 수출하는 품목
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'
MINUS
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국';   
 
 
 --  집합 연산자의 제한사항
/*
① 집합 연산자로 연결되는 각 SELECT문의 SELECT 리스트의 개수와 데이터
타입은 일치해야 한다
*/
-- 에러발생.
SELECT goods        -- 컬럼 1개
  FROM exp_goods_asia
 WHERE country = '한국'
UNION 
SELECT seq, goods   -- 컬럼 2개
  FROM exp_goods_asia
 WHERE country = '일본'; 
 
 -- 위의 에러구문을 수정시 다음과 같이 작성해야 한다.
SELECT seq, goods       -- 컬럼 2개
  FROM exp_goods_asia
 WHERE country = '한국'
INTERSECT
SELECT seq, goods       -- 컬럼 2개
  FROM exp_goods_asia
 WHERE country = '일본';  
 
 -- SELECT 항목의 데이터 타입도 일치시켜야 한다.
 -- 에러발생 : 컬럼의 개수는 같지만, 타입이 다르다.
SELECT seq  -- 컬럼 1개. 데이타타입 NUMBER
  FROM exp_goods_asia
 WHERE country = '한국'
UNION
SELECT goods    -- 컬럼 1개. 데이타타입 VARCHAR2(80)
  FROM exp_goods_asia
 WHERE country = '일본';   
 
 /*
 ② 집합 연산자로 SELECT 문을 연결할 때 ORDER BY절은 맨 마지막 문장에서만
사용할 수 있다
*/
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
 ORDER BY goods -- 첫번째 SELECT문에 ORDER BY구문은 사용할수가 없다.
UNION
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'; 
 
 -- 위의 문장을 수정하면 다음과 같다.
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'
  ORDER BY goods;  -- 마지막 SELECT문에 ORDER BY구문은 사용이 가능하다.
  
/*
③ BLOB, CLOB, BFILE 타입의 컬럼에 대해서는 집합 연산자를 사용할 수 없다
④ UNION, INTERSECT, MINUS 연산자는 LONG형 컬럼에는 사용할 수 없다
*/

/*
GROUPING SETS 절
GROUPING SETS은 ROLLUP이나 CUBE처럼 GROUP BY 절에 명시해서 그룹 쿼리에 사용되는 절이다. 
이 장 맨 마지막에 소개하는 이유는 GROUPING SETS 절이 그룹 쿼리이긴 하나 UNION ALL 개념이 섞여 있기 때문이다. 
예를 들어, 
GROUPING SETS (expr1, expr2, expr3)를 GROUP BY 절에 명시했을 때, 괄호 안에 있는 세 표현식별로 각각 집계가 이루어진다. 
즉 쿼리 결과는 ((GROUP BY expr1) UNION ALL (GROUP BY expr2) UNION ALL (GROUP BY expr3)) 형태가 된다.
*/


 
-- GROUPING SETS
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY GROUPING SETS(period, gubun);
 
 -- 위의 문장이 GROUP BY period UNION ALL GROUP BY gubun 형태가 된다.

/*
위 쿼리는 GROPUPING SETS 절에 period, gubun을 명시해서 월별 합계, 대출 종류별 합계만 집계되어 조회되었다
*/

SELECT period, gubun, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
   AND region IN ('서울', '경기')
 GROUP BY GROUPING SETS(period, (gubun, region)); 
 /*
 위 쿼리는 GROUPING SETS(period, (gubun, region))이라고 명시했는데 좀더 쉽게 풀어 쓰면, 
 GROUP BY period UNION ALL GROUP BY (gubun, region)별로 집계가 되었다. 
 즉 월별 집계와(대출종류, 지역) 집계가 UNION ALL로 연결되어 결과가 조회된 것이다.
 */
 