/*
�ý��� ���ܷδ� 
1)������ ������ �� �� 0���� �����ٰų� 
2)SELECT INTO ���� ����� �����͸� ������ �� ���ǿ� �����ϴ� �����Ͱ� ������ �߻��ϴ� ���� ���� �ִ�. 
�� �ý��� ���ܴ� ����Ŭ ���ο� �̸� ���ǵ� ���ܶ�� �� �� �ִ�.
*/

-- ����ó������
-- �͸���
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 vi_num := 10 / 0; -- ���ܹ߻�.   ���� 0���� �������� ��.
	 
	 DBMS_OUTPUT.PUT_LINE('Success!');
	 
END;


-- ����ó�� ����.
SET SERVEROUTPUT ON;
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 vi_num := 10 / 0;
	 
	 DBMS_OUTPUT.PUT_LINE('Success!');
	 
EXCEPTION WHEN OTHERS THEN
	 DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');	

END;

-- ���ν��� ���·� �����ؼ� �۾�.
-- ����ó���� ���� ���ν�������
CREATE OR REPLACE PROCEDURE ch10_no_exception_proc
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;   -- ���ܹ߻�.
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
END;

-- ���ν��� ȣ��
EXEC ch10_no_exception_proc; -- ����� ���ܿ��� Ȯ��. ����Ŭ �ý��ۿ��� �����޼��� ��� �Ͽ� ����.

-- ����ó���� �ִ� ���ν��� ����
CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!'); -- ����ó���� ���Ͽ�, ����ȵ�.
	
EXCEPTION WHEN OTHERS THEN
	 
	 DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');		
	
END;	

-- 1)���ν��� ȣ��
EXEC ch10_exception_proc;


-- 2)����ó���� ���� ���ν��� ȣ��
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 ch10_no_exception_proc;
	 	 
	 DBMS_OUTPUT.PUT_LINE('Success!'); -- ��������� �ȵ�

END;


-- 3)����ó���� �ִ� ���ν��� ȣ��
DECLARE 
   vi_num NUMBER := 0;
BEGIN
	
	 ch10_exception_proc;
	 	 
	 DBMS_OUTPUT.PUT_LINE('Success!');

END;

-- ���ܰ� �߻��Ǿ�����, �����ڵ�, ���ܸ޼����� �����ִ� ��ɾ�
-- SQLCODE, SQLERRM�� �̿��� �������� ����

CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN OTHERS THEN

-- ���α׷��� ��ɾ�� ���ܰ��� �޽����� ����	 
 DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');		
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR CODE: ' || SQLCODE);
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR MESSAGE: ' || SQLERRM); -- �Ű����� ���� SQLERRM
 DBMS_OUTPUT.PUT_LINE( SQLERRM(SQLCODE)); -- �Ű����� �ִ� SQLERRM

	
END;	

EXEC ch10_exception_proc;

-----------------------------------------------------------------------------------
--�н� �������.
/*
CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN OTHERS THEN
	 
 DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');		
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR CODE: ' || SQLCODE);
 DBMS_OUTPUT.PUT_LINE( 'SQL ERROR MESSAGE: ' || SQLERRM); 
 
 DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
	
END;	
*/

-- �ý��� ���� 
-- https://thebook.io/006696/0252/ ���� ����.

CREATE OR REPLACE PROCEDURE ch10_exception_proc 
IS
  vi_num NUMBER := 0;
BEGIN
	vi_num := 10 / 0;
	 
	DBMS_OUTPUT.PUT_LINE('Success!');
	
EXCEPTION WHEN ZERO_DIVIDE THEN -- ����ó������ �𸣴� ��� OTHERS ���.
	 
	 DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');		
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

-- ���߿���ó��.	
EXCEPTION WHEN ZERO_DIVIDE THEN
	          	 DBMS_OUTPUT.PUT_LINE('����1');		
	             DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE1: ' || SQLERRM);
	        WHEN OTHERS THEN
	          	 DBMS_OUTPUT.PUT_LINE('����2');		
	             DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE2: ' || SQLERRM);	
END;	

EXEC ch10_exception_proc;

--  p_job_id �Ű������� ������ ���� �����ϸ�, ������Ʈ �ϴ� ���ν����� �ۼ�.
--1) ����ó�� ������ ���� ���ν���
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
	   DBMS_OUTPUT.PUT_LINE('job_id�� �����ϴ�');
	   RETURN; -- ���ν��� ����
	ELSE
	   UPDATE employees
	      SET job_id = p_job_id
	    WHERE employee_id = p_employee_id;
	
  END IF;
  
  COMMIT;
	
END;

EXEC ch10_upd_jobid_proc (200, 'SM_JOB2');


--2) ����ó�� ������ �ִ� ���ν���
CREATE OR REPLACE PROCEDURE ch10_upd_jobid_proc 
                  ( p_employee_id employees.employee_id%TYPE,
                    p_job_id      jobs.job_id%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	SELECT 1        -- EXISTS() �Լ�
	  INTO vn_cnt
	  FROM JOBS
	 WHERE JOB_ID = p_job_id; -- ��ġ�ϴ� ����Ÿ�� �����ϸ� 1 ���� vn_cnt������ ����. �������� ������ ���ܹ߻�.
	 
   UPDATE employees
      SET job_id = p_job_id
    WHERE employee_id = p_employee_id;
	
  COMMIT;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 DBMS_OUTPUT.PUT_LINE(p_job_id ||'�� �ش��ϴ� job_id�� �����ϴ�');
            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('��Ÿ ����: ' || SQLERRM);
END;
                   
-- 'SM_JOB2' �� �������� �ʾ�, ���ν��� ���࿡�� ���ܹ߻��ȴ�.
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
                 DBMS_OUTPUT.PUT_LINE(p_job_id ||'�� �ش��ϴ� job_id�� �����ϴ�');
            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('��Ÿ ����: ' || SQLERRM);
END;

-- ����� ���� ����
/*
CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- �߸��� �μ���ȣ�� ��� ���� ����
BEGIN
	
	 -- �μ����̺��� �ش� �μ���ȣ �������� üũ
	 SELECT COUNT(*)
	   INTO vn_cnt
	   FROM departments
	  WHERE department_id = p_department_id;
	  
	 IF vn_cnt = 0 THEN
	    RAISE ex_invalid_depid; -- ����� ���� ���� �߻�
	 END IF;
	 
	 -- employee_id�� max ���� +1
	 SELECT MAX(employee_id) + 1
	   INTO vn_employee_id
	   FROM employees;
	 
	 -- ����ڿ���ó�� �����̹Ƿ� ��� ���̺� �ּ��� �����͸� �Է���
	 INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
              VALUES ( vn_employee_id, p_emp_name, vd_curr_date, p_department_id );
              
   COMMIT;              
              
EXCEPTION WHEN ex_invalid_depid THEN -- ����� ���� ���� ó��
               DBMS_OUTPUT.PUT_LINE('�ش� �μ���ȣ�� �����ϴ�');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);              
	
END;                	


EXEC ch10_ins_emp_proc ('ȫ�浿', 999);


CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month  VARCHAR2  )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- �߸��� �μ���ȣ�� ��� ���� ����
   
   ex_invalid_month EXCEPTION; -- �߸��� �Ի���� ��� ���� ����
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- ���ܸ�� �����ڵ� ����
BEGIN
	
	 -- �μ����̺��� �ش� �μ���ȣ �������� üũ
	 SELECT COUNT(*)
	   INTO vn_cnt
	   FROM departments
	  WHERE department_id = p_department_id;
	  
	 IF vn_cnt = 0 THEN
	    RAISE ex_invalid_depid; -- ����� ���� ���� �߻�
	 END IF;
	 
	 -- �Ի�� üũ (1~12�� ������ ������� üũ)
	 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
	    RAISE ex_invalid_month; -- ����� ���� ���� �߻�
	 
	 END IF;
	 
	 
	 -- employee_id�� max ���� +1
	 SELECT MAX(employee_id) + 1
	   INTO vn_employee_id
	   FROM employees;
	 
	 -- ����ڿ���ó�� �����̹Ƿ� ��� ���̺� �ּ��� �����͸� �Է���
	 INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
              VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );
              
   COMMIT;              
              
EXCEPTION WHEN ex_invalid_depid THEN -- ����� ���� ���� ó��
               DBMS_OUTPUT.PUT_LINE('�ش� �μ���ȣ�� �����ϴ�');
          WHEN ex_invalid_month THEN -- �Ի�� ����� ���� ���� ó��
               DBMS_OUTPUT.PUT_LINE(SQLCODE);
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               DBMS_OUTPUT.PUT_LINE('1~12�� ������ ��� ���Դϴ�');               
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);              
	
END;    

EXEC ch10_ins_emp_proc ('ȫ�浿', 110, '201314');


-- RAISE�� RAISE_APPLICATOIN_ERROR

CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS

BEGIN
	IF p_num <= 0 THEN
	   RAISE INVALID_NUMBER;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(p_num);
  
EXCEPTION WHEN INVALID_NUMBER THEN
               DBMS_OUTPUT.PUT_LINE('����� �Է¹��� �� �ֽ��ϴ�');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END;

EXEC ch10_raise_test_proc (-10);               



CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS

BEGIN
	IF p_num <= 0 THEN
	   --RAISE INVALID_NUMBER;
	   RAISE_APPLICATION_ERROR (-20000, '����� �Է¹��� �� �ִ� ���Դϴ�!');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(p_num);
  
EXCEPTION WHEN INVALID_NUMBER THEN
               DBMS_OUTPUT.PUT_LINE('����� �Է¹��� �� �ֽ��ϴ�');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLCODE);
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END;

EXEC ch10_raise_test_proc (-10);               



-- ���� ���Ͽ�

CREATE TABLE error_log (
             error_seq     NUMBER,        -- ���� ������
             prog_name     VARCHAR2(80),  -- ���α׷���
             error_code    NUMBER,        -- �����ڵ�
             error_message VARCHAR2(300), -- ���� �޽���
             error_line    VARCHAR2(100), -- ���� ����
             error_date    DATE DEFAULT SYSDATE -- �����߻�����
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
   
   ex_invalid_depid EXCEPTION; -- �߸��� �μ���ȣ�� ��� ���� ����
   PRAGMA EXCEPTION_INIT ( ex_invalid_depid, -20000); -- ���ܸ�� �����ڵ� ����

   ex_invalid_month EXCEPTION; -- �߸��� �Ի���� ��� ���� ����
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- ���ܸ�� �����ڵ� ����
   
   v_err_code error_log.error_code%TYPE;
   v_err_msg  error_log.error_message%TYPE;
   v_err_line error_log.error_line%TYPE;
BEGIN
 -- �μ����̺��� �ش� �μ���ȣ �������� üũ
 SELECT COUNT(*)
   INTO vn_cnt
   FROM departments
  WHERE department_id = p_department_id;
	  
 IF vn_cnt = 0 THEN
    RAISE ex_invalid_depid; -- ����� ���� ���� �߻�
 END IF;

-- �Ի�� üũ (1~12�� ������ ������� üũ)
 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
    RAISE ex_invalid_month; -- ����� ���� ���� �߻�
 END IF;

 -- employee_id�� max ���� +1
 SELECT MAX(employee_id) + 1
   INTO vn_employee_id
   FROM employees;
 
-- ����ڿ���ó�� �����̹Ƿ� ��� ���̺� �ּ��� �����͸� �Է���
INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );              
 COMMIT;

EXCEPTION WHEN ex_invalid_depid THEN -- ����� ���� ���� ó��
               v_err_code := SQLCODE;
               v_err_msg  := '�ش� �μ��� �����ϴ�';
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN ex_invalid_month THEN -- �Ի�� ����� ���� ���� ó��
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


EXEC ch10_ins_emp2_proc ('HONG', 1000, '201401'); -- �߸��� �μ�

EXEC ch10_ins_emp2_proc ('HONG', 100, '201413'); -- �߸��� ��


SELECT *
  FROM  error_log ;
  
  

CREATE TABLE app_user_define_error (
             error_code    NUMBER,         -- �����ڵ�
             error_message VARCHAR2(300),  -- ���� �޽���
             create_date   DATE DEFAULT SYSDATE, -- ������� 
             PRIMARY KEY (error_code)
             );
             
             
INSERT INTO app_user_define_error ( error_code, error_message ) VALUES (-1843, '������ ���� �������մϴ�');
INSERT INTO app_user_define_error ( error_code, error_message ) VALUES (-20000, '�ش� �μ��� �����ϴ�');

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
	
	-- ����� ���� ���� ���̺��� ���� �޽����� �޾ƿ��� �κ��� BLOCK���� ���Ѵ�.
	-- �ش� �޽����� ���� ��� ó���� ���ؼ�....
	BEGIN
	  -- 
	  SELECT error_message 
	    INTO vn_error_message
	    FROM app_user_define_error 
	   WHERE error_code = vn_error_code;
	 
   	-- �ش� ������ ���̺� ���ٸ� �Ű������� �޾ƿ� �޽����� �״�� �Ҵ��Ѵ�. 
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
   
   ex_invalid_depid EXCEPTION; -- �߸��� �μ���ȣ�� ��� ���� ����
   PRAGMA EXCEPTION_INIT ( ex_invalid_depid, -20000); -- ���ܸ�� �����ڵ� ����

   ex_invalid_month EXCEPTION; -- �߸��� �Ի���� ��� ���� ����
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- ���ܸ�� �����ڵ� ����
   
  -- ���� ���� ���� ����
   v_err_code error_log.error_code%TYPE;
   v_err_msg  error_log.error_message%TYPE;
   v_err_line error_log.error_line%TYPE;
BEGIN
 -- �μ����̺��� �ش� �μ���ȣ �������� üũ
 SELECT COUNT(*)
   INTO vn_cnt
   FROM departments
  WHERE department_id = p_department_id;
	  
 IF vn_cnt = 0 THEN
    RAISE ex_invalid_depid; -- ����� ���� ���� �߻�
 END IF;

-- �Ի�� üũ (1~12�� ������ ������� üũ)
 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
    RAISE ex_invalid_month; -- ����� ���� ���� �߻�
 END IF;

 -- employee_id�� max ���� +1
 SELECT MAX(employee_id) + 1
   INTO vn_employee_id
   FROM employees;
 
-- ����ڿ���ó�� �����̹Ƿ� ��� ���̺� �ּ��� �����͸� �Է���
INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );              
 COMMIT;

EXCEPTION WHEN ex_invalid_depid THEN -- ����� ���� ���� ó��
               v_err_code := SQLCODE;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN ex_invalid_month THEN -- �Ի�� ����� ���� ���� ó��
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

-- �߸��� �μ�
EXEC ch10_ins_emp2_proc ('HONG', 1000, '201401');
 
-- �߸��� ��
EXEC ch10_ins_emp2_proc ('HONG', 100, '201413'); 


SELECT *
  FROM  error_log ;

*/
-- Ʈ�����(TRANSACTION) : 1���̻��� ��ɾ �ϳ��� ���������� ������� ����
-- Ʈ����� ȯ�濡�� �����Ǵ� ��ɾ� : DML(INSERT, UPDATE, DELETE, MERGE ) ������ ���۸�ɾ�.

-- COMMIT �� ROLLBACK, SAVEPOINT

-- PRIMARY KEY ������ �ȵ� ����.
CREATE TABLE ch10_sales (
       sales_month   VARCHAR2(8),
       country_name  VARCHAR2(40),
       prod_category VARCHAR2(50),
       channel_desc  VARCHAR2(20),
       sales_amt     NUMBER );
       
-- commit Ű���� ���� ���ν���      
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
���Ե� ����Ÿ Ȯ�� ����

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
--���ν��� ����(commit Ű���� ����)
EXEC iud_ch10_sales_proc ( '199801');

-- ���ν��� ���� �� ����Ÿ Ȯ��
SELECT COUNT(*)
FROM ch10_sales ;   -- 2��


/*
���� ������ SQLPLUS �Ǵ� ���������� �ʿ��� �����ϸ�, ����Ÿ �Ǽ��� 0���� ���´�.
��, Ÿ ���ǿ��� ���ٽ� Ŀ������ ���� ������ ���� �о���� �ȴ�.(�߿�)
�� ����, Ŀ���� �� �����͸� �о�´�.
*/

-- COMMIT; �� �ִ� ���ν��� ����
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

-- ����Ÿ ����. Ʈ������� �����ȵ�.
TRUNCATE TABLE ch10_sales;

-- commit �� �ִ� ���ν��� ����
EXEC iud_ch10_sales_proc ( '199801');

SELECT COUNT(*)
FROM ch10_sales ;

-- ����Ÿ ����.
TRUNCATE TABLE ch10_sales;

-- PRIMARY KEY �������� �߰�
ALTER TABLE ch10_sales 
ADD CONSTRAINTS pk_ch10_sales 
PRIMARY KEY (sales_month, country_name, prod_category, channel_desc);


-- ����ó�� �۾��� �ִ� ���ν��� ����(����)
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

-- ����ó������
EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);  -- ORA-00001: unique constraint (ORA_USER.PK_CH10_SALES) violated
               ROLLBACK;
	
END;   



-- ���ν��� ȣ��. ���� 2�� ����.
EXEC iud_ch10_sales_proc ( '199801');

SELECT COUNT(*)
FROM ch10_sales ; -- ���ν��� �ѹ� ���� �� ����Ÿ Ȯ��.

/*
���� ROLLBACK�� ����ϸ� INSERT, DELETE, UPDATE, MERGE �۾� ��ü�� ��ҵǴµ� 
��ü�� �ƴ� Ư�� �κп��� Ʈ������� ��ҽ�ų �� �ִ�. 
�̷��� �Ϸ��� ����Ϸ��� ������ ����� ��, �� �������� �۾��� ����ϴ� ������ ����ϴµ� �� ������ SAVEPOINT��� �Ѵ�. 
SAVEPOINT�� ����ϴ� ����� ������ ����.

    SAVEPOINT ���̺�����Ʈ��;
*/



CREATE TABLE ch10_country_month_sales (
               sales_month   VARCHAR2(8),
               country_name  VARCHAR2(40),
               sales_amt     NUMBER,
               PRIMARY KEY (sales_month, country_name) );
              


-- ����ó���� �̿��� Ʈ�������� ���ԵǾ� �ִ� ���ν���
-- 1)delete, 2)insert 3)update�� �۾��� ���ü��� �ִ� �۾��̴�.(ch10_sales���̺�)  
-- 4)insert���� ���ü��� ����(ch10_country_month_sales���̺�) ��� �ó�����. �̷� ��� SAVEPOINT �� �̿��Ѵ�.(�߿�)
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month IN  ch10_sales.sales_month%TYPE, 
              p_country_name IN  ch10_sales.country_name%TYPE )
IS

BEGIN
	
	--1)���� ������ ����
	DELETE ch10_sales
	 WHERE sales_month  = p_sales_month
	   AND country_name = p_country_name;
	   
	   
	-- 2)�űԷ� ��, ������ �Ű������� �޾� INSERT 
	-- DELETE�� �����ϹǷ� PRIMARY KEY �ߺ��� �߻�ġ ����
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH  = p_sales_month       -- �Ű����� ���
   AND C.COUNTRY_NAME = p_country_name      -- �Ű����� ���
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
 /*
 � ����Ÿ�� ���ԵǴ� �� Ȯ��
 SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH  = '199801'       -- �Ű����� ���
   AND C.COUNTRY_NAME = 'Japan'      -- �Ű����� ���
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
 
       
 -- 3)SAVEPOINT Ȯ���� ���� UPDATE
  -- ����ð����� �ʸ� ������ ���ڷ� ��ȯ�� �� * 10 (�Ź� �ʴ� �޶����Ƿ� ���������� ���� �� �� ���� �Ź� �޶���)
 UPDATE ch10_sales
    SET sales_amt = 10 * to_number(to_char(sysdate, 'ss'))
  WHERE sales_month  = p_sales_month
	   AND country_name = p_country_name;

/*
SELECT sysdate, to_char(sysdate, 'ss'), 10 * to_number(to_char(sysdate, 'ss')) FROM DUAL;
*/

	   
 -- SAVEPOINT ����      
 SAVEPOINT mysavepoint;      
 
 
 -- 4)ch10_country_month_sales ���̺� INSERT. ���ν��� ó������ô� ����Ÿ�۾� ����, �ι�° ����� �������� �����߻�
 -- �ߺ� �Է� �� PRIMARY KEY �ߺ���
 INSERT INTO ch10_country_month_sales 
       SELECT sales_month, country_name, SUM(sales_amt)
         FROM ch10_sales
        WHERE sales_month  = p_sales_month
	        AND country_name = p_country_name
	      GROUP BY sales_month, country_name;         
       
 COMMIT;

EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               
               -- ���� 4)�� �۾��� ���ܹ߻��� 1) 2) 3) 4)�� 4�����۾��� ���ü��ִ� �۾��̶��, ROLLBACK ó���ؾ� �Ѵ�.(�߿�)
               
               /*
               1), 2), 3)�� 3�����۾��� ���ü��� �־ ���� �Ǵ� ���з� ó���ؾ� �Ѵ�.
               4)�� �۾��� ���� 3���� �۾��� ���ü��� ����. �̷� ��쿡
               4)�� �۾��� ���ܹ߻��Ǹ�, ���� 3���� �۾��� ������ �ȹް� COMMIT ����ó���� �Ѵ�.
               �׸���, 4���۾��� mysavepoint SAVEPOINT�� �̿��Ͽ�, ó���Ѵ�.
               */
               ROLLBACK TO mysavepoint; -- SAVEPOINT ������ ROLLBACK
               COMMIT; -- SAVEPOINT ���������� COMMIT. ��������� 1) 2) 3)���� �۾��� �Ϸ�

	
END;   


-- ����Ÿ ����.
TRUNCATE TABLE CH10_COUNTRY_MONTH_SALES;
TRUNCATE TABLE ch10_sales;

-- ù��° ���ν��� ����
EXEC iud_ch10_sales_proc ( '199801', 'Japan');

--EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales; -- 250


-- �ι�° ���ν��� ����. 4)���۾��� PRIMARY KEY�������ǰ˻� ���谡�Ǿ� ���ܹ߻�.
EXEC iud_ch10_sales_proc ( '199801', 'Japan');

--EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales;


-- Ʈ��������� ���� �۾��� ���ǻ��� �ó�����.
-- ���� ���ǿ��� �����ͺ����۾��� �ϰ�, commit or rollback�� ���������� Ʈ����� ��(lock) ������,
-- Ÿ ���ǿ��� �����ͺ��� �۾��� ������� �ʰ�, �����°� �ȴ�.(�߿�)
UPDATE CH10_SALES
    SET SALES_AMT = 100
WHERE  SALES_MONTH = '199801' AND COUNTRY_NAME = 'Japan';


rollback;


