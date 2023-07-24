/*
PL/SQL : Procedure, Function, Trigger �� �����Ҽ� �� �ִ�.
  - SQL�� �����κ��� �����ϱ����� ���.
*/

-- PL/SQL �⺻���
DECLARE
    -- ����, �������
BEGIN
    -- ����, ������
    -- ���� ���
END;


-- IF ��

DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2 ;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'�� ū ��');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'�� ū ��');	 
	 END IF;
	
END;

SET SERVEROUTPUT ON; -- ���Ǵ���
-- DBMS_OUTPUT.PUT_LINE() ����� �������Ͽ�, ���� ����� �����ؾ� �Ѵ�.

DECLARE
    vn_num1 NUMBER := 1;
    vn_num2 NUMBER := 2;
BEGIN   -- {
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '�� ū ��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '�� ū ��');
    END IF;
END;   --  }

-- ��ɾ� ����
SELECT DBMS_RANDOM.VALUE(10, 120) FROM DUAL;    --41.6872300116375742668415741351466848082
SELECT ROUND(41.6872300116375742668415741351466848082, -1) FROM DUAL;  -- 40

-- SALARY�÷��� ���� ������ ����
SELECT SALARY INTO ������ FROM employees WHERE department_id = 60 AND ROWNUM = 1;




-- ����1)
DECLARE
   -- ��������� �ʱ�ȭ����
   vn_salary NUMBER := 0;       -- �޿�
   vn_department_id NUMBER := 0;        -- �μ��ڵ�
BEGIN
	-- ������ ���� �Ҵ�. �μ��ڵ� �������� 10, 20, .... 120
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  -- ���� IF��
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('�߰�');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END IF;  
   
	
END;



-- ����2)
DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
   vn_commission NUMBER := 0;   -- Ŀ�̼� ����
BEGIN
	-- �μ��ڵ带 10~120�������� �������� �޾ƿ��� ����.
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary, commission_pct
     INTO vn_salary, vn_commission
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);  -- �޿����
  
  -- ��øIF��
  IF vn_commission > 0 THEN
     IF vn_commission > 0.15 THEN
        DBMS_OUTPUT.PUT_LINE(vn_salary * vn_commission );
     END IF;  
  ELSE
     DBMS_OUTPUT.PUT_LINE(vn_salary);
  END IF;  
END;

-- CASE ��
/*
 <���� 1>
    CASE ǥ����
        WHEN ���1 THEN
             ó����1;
        WHEN ���2 THEN
             ó����2;
        ...
        ELSE
             ��Ÿ ó����;
    END CASE;
     
    <���� 2>
    CASE WHEN ǥ����1 THEN
             ó����1;
        WHEN ǥ����2 THEN
             ó����2;
        ...
        ELSE
             ��Ÿ ó����;
    END CASE;
*/

-- ����3)  ����1)�� ���� IF���� CASE������ ��ȯ��Ŵ
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
  
  -- ���� IF��
  /*
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('�߰�');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END IF; 
  */
  CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('�߰�');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END CASE;

END;

-- �ݺ���

-- ����1> LOOP ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt�� 9���� ũ�� ���� ����
   
   END LOOP;
    
END;


-- ����2> WHILE ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
   END LOOP;
    
END;

-- ����3>
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
   END LOOP;    
END;

-- ����3>���� ����.
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 5 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
   END LOOP;    
END;



-- FOR ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9  -- i���� 1���� 9����
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;


DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN REVERSE 1..9 -- i������ ���� 9���� 1�� ����
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;

-- CONTINUE ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5; -- ���ǽ� true�̸�, �Ʒ������� ������ �ȵǰ�, for������ i���� �����Ǿ� ����ȴ�.
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
    
END;

-- GOTO��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   <<third>>    -- <<���̺��>>
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





-- PL/SQL������ NULL���� ����� �� �ִ�. NULL���� �ƹ��͵� ó������ �ʴ� �����̴�
-- NULL ��
IF vn_variable = 'A' THEN
   ó������1;
ELSIF vn_variable = 'B' THEN
   ó������2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          ó������1;
     WHEN vn_variable = 'B' THEN
          ó������2;      
     ...
     ELSE NULL;
END CASE;     

/*
�ó����� : ������ ����

newcomsa@nate.com sql�ڵ� ���� �����ּ���.

dbms_output.put();  -- �ٹٲ� ���� ���
dbms_output.put_line('');  -- �ٹٲ�
lpad(i*j, 2) -- 2�ڸ� ���
*/


-- �Լ� : ���ϰ��� �ִ� Ư¡.
/*
 CREATE OR REPLACE FUNCTION �Լ� �̸� (�Ű�����1, �Ű�����2, ...)
    RETURN ������Ÿ��;
    IS[AS]
      ����, ��� �� ����
    BEGIN
      �����
    ��
      RETURN ��ȯ��;
    [EXCEPTION
      ���� ó����]
    END [�Լ� �̸�];
*/

/*
�Լ� ȣ��
���� ������ �Լ��� ȣ���� ����. 
�Լ� ȣ�� ����� �Ű������� ���� ������ ���� �Լ���� �Ű������� ����ϱ⵵ �ϰ�, �Լ��� ����ϱ⵵ �Ѵ�. 
�׸��� �Լ��� ��ȯ ���� �����Ƿ� SELECT ���忡�� ����� ���� �ְ� PL/SQL ��� �������� ����� �� �ִ�.

    <�Ű������� ���� �Լ� ȣ��>
    �Լ��� Ȥ�� �Լ���()
     
    <�Ű������� �ִ� �Լ� ȣ��>
    �Լ���(�Ű�����1, �Ű�����2,...)
*/    


-- ������ ���ϴ� �Լ�.
SELECT MOD(10, 3) FROM DUAL;    -- 1
SELECT 10 / 3 FROM DUAL; -- 3.33333333333333333333333333333333333333
SELECT FLOOR(10 / 3) FROM DUAL;     -- 3


CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )      -- 10     3
   RETURN NUMBER  -- ��ȯ ������Ÿ���� NUMBER
IS  -- ���� �Ǵ� �������
   vn_remainder NUMBER := 0; -- ��ȯ�� ������
   vn_quotient  NUMBER := 0; -- �� 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- ������/���� ������� ���� �κ��� �ɷ�����
	 vn_remainder := num1 - ( num2 * vn_quotient); --������ = ������ - ( ���� * ��)
	 
	 RETURN vn_remainder;  -- �������� ��ȯ
	
END;	
  
SELECT MOD(10, 3) FROM DUAL;    -- 1  
SELECT my_mod(10, 3) reminder FROM DUAL;   -- 1 

-- ����(countries) ���̺��� �о� ������ȣ�� �޾� �������� ��ȯ�ϴ� �Լ��� ������.  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   -- COUNTRIES���̺��� COUNTRY_NAME�÷����� ������Ÿ���� ����
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE; -- ������ ���̺��.�÷���%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	

-- ����
SELECT country_name  FROM countries WHERE country_id = 52778;  -- Spain

-- �Լ� ȣ��(����)
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;

-- ����. �����ڵ尡 �����ϸ�, 1 �̵ǰ�, �������� ������ 0
SELECT COUNT(*) FROM countries WHERE country_id = 10000;

-- �����ڵ尡 10000   ���� �������� ���� ��� NULL�� ��µȴ�. '�ش籹�� ����' ���� ���
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
		
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  -- �����ڵ尡 �������� ���� ���
  IF vn_count = 0 THEN
     vs_country_name := '�ش籹�� ����';
  ELSE
	
	  -- country_name �÷��� NULL�̸� INTO ������ ������ ���� �ʴ´�.
      SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	  
  
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;

-- ����
-- USER �Լ� : �α����� ���������
SELECT USER FROM DUAL; -- ORA_USER
  
-- �Ű������� ���� ��������� �Լ�. �Ű������� ���� ���� �Լ��� () �����Ѵ�.
CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- ������̸� ��ȯ
	
END;	 	

--�Լ�ȣ��
SELECT fn_get_user(),fn_get_user
  FROM DUAL;

/*
�Լ��� Ư�� ������ ������ �� ��� ���� ��ȯ������ 
���ν����� Ư���� ������ ó���ϱ⸸ �ϰ� ��� ���� ��ȯ������ �ʴ� ���� ���α׷��̴�
*/
-- ���ν��� ����
/*
���ν��� ����
�Լ��� ���ν��� ��� DB�� ����� ��ü�̹Ƿ� ���ν����� ������(Stored, �����) ���ν������ �θ��⵵ �ϴµ� �� å������ �׳� ���ν������ �ϰڴ�(�Լ��� ������ �Լ���� �Ѵ�). ���ν����� ���� ������ ������ ����.

    CREATE OR REPLACE PROCEDURE ���ν��� �̸�
        (�Ű�������1[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         �Ű�������2[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         ...
        )
    IS[AS]
      ����, ��� �� ����
    BEGIN
      �����
    ��
    [EXCEPTION
      ���� ó����]
    END [���ν��� �̸�];
*/    
/*
 jobs ���̺� �ű� JOB�� �ִ� ���ν����� ����� ����. 
 jobs ���̺��� job ��ȣ, job��, �ּ�, �ִ� �ݾ�, ��������, �������� �÷��� �ִµ�,
 �����ϰ� �������� �ý��� �������ڷ� ����� ���̹Ƿ� �Ű������� �� 4���� �޵��� ����.
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
    -- ����, �������
BEGIN
   INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY,CREATE_DATE, UPDATE_DATE )
   VALUES(p_job_id, p_job_title, p_min_salary, p_max_salary, SYSDATE, SYSDATE);
   
   COMMIT;
END;

-- ���ν��� ����
/*
EXEC ���ν����̸�(��1, ��2, ��3, ��4);
*/

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000);

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 -- 2��° �������� ��, JOB_ID�÷��� PRIMARY KEY�������� ���谡 �Ǿ� �����߻�
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
-- ������ job_id�� ������ �ű� INSERT ��� �ٸ� ������ ���� UPDATE �ϵ��� ���ν����� ������ ����
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;  -- �ߺ�üũ.
BEGIN
	
	-- ������ job_id�� �ִ��� üũ 
	SELECT COUNT(*) INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
    END IF;
	          
	COMMIT;
	
	
END ;   

-- ���ν��� ����
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);


SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 /*
 ���ν����� �Ű������� ������ ������ �� �Ű����� ���� ������ ������ ȥ���� ������ �ſ� ����. 
 �̷� ��쿡�� ������ ���� ���·� �Ű������� �Է� ���� ������ �����ϸ� �ſ� ���ϴ�.

    <���ν��� ����2>
    ? EXEC Ȥ�� EXECUTE ���ν�����(�Ű�����1 => �Ű�����1 ��,
    ��������������������  �����������Ű�����2 => �Ű�����2 ��, ...);
��=>�� ��ȣ�� ����� �ش� �Ű�������� ���� �����ϴ� ���·� ������ �� �ִ�. my_new_job_proc ���ν����� �� ���·� ������ ����.

�Է�
*/
-- ���� ����
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);

-- �Ű������� �����Ͽ� ���� ����.
EXECUTE my_new_job_proc (p_job_id => 'SM_JOB1', p_job_title => 'Sample JOB1', p_min_sal => 2000, p_max_sal => 7000);
        
 
 
-- �Ű����� ����Ʈ �� ����. p_min_sal, p_max_sal �Ű����� ���� ����
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1');  -- �Ű����� 3, 4��°�� �⺻�� ����
-- EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 10, 100);  ���� �ǹ�

-- �Ű����� ����Ʈ ���� ���õ�.
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
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
 
-- OUT �Ű����� : ���ν����� �������� �� ���ν��� ������ ��(Ư�� ��)�� ȣ���� ������ �������� �Ű����� 
                 -- ���� ���� �������� ����.

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100,
            p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  )
IS
  vn_cnt NUMBER := 0;   -- �ߺ�üũ
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT �Ű������� ���� �Ҵ�.  �߿�.
	p_upd_date := vn_cur_date; 
	          
	COMMIT;
	
	
END ;   

-- ���ν��� ȣ��
-- ���ν����� �Ű������� out �̸�, ȣ���ϴ� ������ �ٸ���.
-- �͸��� �������
SET SERVEROUTPUT ON;

-- �͸��� �������� ���ν��� ȣ��.
DECLARE
   vd_cur_date JOBS.UPDATE_DATE%TYPE;   -- out�Ű������� ���� �޴� �뵵�� ����.
BEGIN
	 -- exec Ű���� ������.
     my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000, vd_cur_date);
	 
	 DBMS_OUTPUT.PUT_LINE(vd_cur_date);
END;


-- IN OUT �Ű�����  : �Ű������� ���ν������� ����� ���� �������� �ְ�, ȣ���� ������ ���� ���������� �ִ� 2���� ���.

CREATE OR REPLACE PROCEDURE my_parameter_test_proc (
               p_var1        VARCHAR2,  -- �⺻�� IN
               p_var2 OUT    VARCHAR2,  -- ���� �������� �뵵
               p_var3 IN OUT VARCHAR2 )  -- ���� �ް�, �������� 2���� �뵵
IS

BEGIN
	 DBMS_OUTPUT.PUT_LINE('p_var1 value = ' || p_var1);  -- IN ȣ��� ���� �����
	 DBMS_OUTPUT.PUT_LINE('p_var2 value = ' || p_var2);  -- OUT ȣ��� ���� �������� ��� NULL
	 DBMS_OUTPUT.PUT_LINE('p_var3 value = ' || p_var3);  -- IN OUT ȣ��� ���� ���� �������
	 
     -- OUT �Ű������� ���� �Ҵ�. ���ν��� ȣ���� ������ ���� �������� ����
	 p_var2 := 'B2';  -- OUT
	 p_var3 := 'C2';  -- IN OUT
	
END;               

-- ���ν��� ȣ��
DECLARE 
   v_var1 VARCHAR2(10) := 'A';
   v_var2 VARCHAR2(10) := 'B';
   v_var3 VARCHAR2(10) := 'C';
BEGIN
    --                     p_var1 IN, p_var2 OUT, p_var3 IN OUT
	 my_parameter_test_proc (v_var1,  v_var2,       v_var3);
	 
	 -- p_var2 OUT, p_var3 IN OUT ������ ���� �޾Ƽ�, ���
     DBMS_OUTPUT.PUT_LINE('v_var2 value = ' || v_var2);  -- 'B2'
	 DBMS_OUTPUT.PUT_LINE('v_var3 value = ' || v_var3);  -- 'C2'
END;


-- RETURN �� : ������� ��ȯ�ϴ� ������ �ƴϴ�.
/*
�Լ������� ������ ������ �����ϰ� ��� ���� ��ȯ�ϴ� ������ ������, 
���ν��������� RETURN���� ������ ���� ������ ó������ �ʰ� ������ ����, 
�� ���ν����� �������� ������. 
�ݺ������� ���� ���ǿ� ���� ������ ���������� ���� EXIT�� ����ϴ� �Ͱ� �����ϴ�.
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
	-- 1000 ���� ������ �޽��� ��� �� ����������
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('�ּ� �޿����� 1000 �̻��̾�� �մϴ�');
	   RETURN; -- ���ν��� ����.
    END IF;
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	
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


--- ���� ���Ͽ� 1
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