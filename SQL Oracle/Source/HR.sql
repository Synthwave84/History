


-- ����Ŭ ����.
-- JOBS ���̺��, JOBS_HISTORY ���̺��� �����Ͽ�, �����ȣ, JOB_ID, ������Ʈ ��������, ��������, ���μ� ��ȸ

SELECT JOB_HISTORY.EMPLOYEE_ID, JOBS.JOB_ID, JOB_HISTORY.START_DATE, JOB_HISTORY.END_DATE, JOB_HISTORY.DEPARTMENT_ID
FROM JOB_HISTORY , JOBS 
WHERE JOB_HISTORY.JOB_ID = JOBS.JOB_ID;

-- �μ��� ����� ������Ʈ ������ ��ȸ�϶�. �� �μ��ڵ�, �μ��̸�, �����ȣ, ���۳�¥, ���ᳯ¥.

SELECT d.department_id, d.department_name, h.employee_id, h.start_date, h.end_date
FROM JOB_HISTORY h, DEPARTMENTS d
WHERE d.department_id = h.department_id

-- ANSI����
-- ANSI�� ǥ���̴�.

SELECT d.department_id, d.department_name, h.employee_id, h.start_date, h.end_date
FROM JOB_HISTORY h INNER JOIN DEPARTMENTS d
ON d.department_id = h.department_id;