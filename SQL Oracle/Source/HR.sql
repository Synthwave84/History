


-- 오라클 조인.
-- JOBS 테이블과, JOBS_HISTORY 테이블을 조인하여, 사원번호, JOB_ID, 프로젝트 시작일자, 종료일자, 담당부서 조회

SELECT JOB_HISTORY.EMPLOYEE_ID, JOBS.JOB_ID, JOB_HISTORY.START_DATE, JOB_HISTORY.END_DATE, JOB_HISTORY.DEPARTMENT_ID
FROM JOB_HISTORY , JOBS 
WHERE JOB_HISTORY.JOB_ID = JOBS.JOB_ID;

-- 부서가 담당한 프로젝트 정보를 조회하라. 단 부서코드, 부서이름, 사원번호, 시작날짜, 종료날짜.

SELECT d.department_id, d.department_name, h.employee_id, h.start_date, h.end_date
FROM JOB_HISTORY h, DEPARTMENTS d
WHERE d.department_id = h.department_id

-- ANSI조인
-- ANSI가 표준이다.

SELECT d.department_id, d.department_name, h.employee_id, h.start_date, h.end_date
FROM JOB_HISTORY h INNER JOIN DEPARTMENTS d
ON d.department_id = h.department_id;