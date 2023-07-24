/*
Ŀ���� Ư�� SQL ������ ó���� ����� ��� �ִ� ����(PRIVATE SQL�̶�� �޸� ����)�� ����Ű�� ������ �����ͷ�, 
Ŀ���� ����ϸ� ó���� SQL ������ ��� ���տ� ������ �� �ִ�
*/

SELECT * FROM EMPLOYEES;


-- ������ Ŀ���� Ŀ���Ӽ�
-- ������Ŀ��? SQL ����(INSERT, UPDATE, MERGE, DELETE, SELECT INTO)�� ����� ������ �ڵ����� ������� ����.

-- ����? ��� ���̺��� 80�� �μ��� ���� ����� �� 34���ε�, �̸� UPDATE �ϴ� �Ʒ��� �͸� ����� ������ ����.


SET SERVEROUTPUT ON;
-- �͸���
DECLARE 
  vn_department_id employees.department_id%TYPE := 80;
BEGIN
	-- 80�� �μ��� ����̸��� �ڽ��� �̸����� ����
	 UPDATE employees
	     SET emp_name = emp_name
	   WHERE department_id = vn_department_id;	 -- ������ Ŀ�� ����.  
	   
	-- �� ���� �����Ͱ� ���ŵƴ��� ���   
	DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT); -- 34��
	COMMIT;

END;


-- ����� Ŀ��

SELECT emp_name
     FROM employees
    WHERE department_id = 90;

-- �͸��� ����
DECLARE
   -- ����, ���, Ŀ�� ������ġ
   -- ������� �޾ƿ��� ���� ���� ����
   vs_emp_name employees.emp_name%TYPE;
   vn_count number := 0;

   -- 1�ܰ�) Ŀ�� ����, �Ű������� �μ��ڵ带 �޴´�.
   CURSOR cur_emp_dep ( cp_department_id employees.department_id%TYPE )
   IS
   SELECT emp_name
     FROM employees
    WHERE department_id = cp_department_id;
BEGIN
	
	-- 2�ܰ�) Ŀ�� ���� (�Ű������� 90�� �μ��� ����)
	OPEN cur_emp_dep (90); -- Ŀ��ȣ��(����.)
	
	-- �ݺ����� ���� Ŀ�� ��ġ�۾�
	LOOP
	  -- Ŀ�� ����� ���� �ο츦 ��ġ�� (������� ������ �Ҵ�)
	  FETCH cur_emp_dep INTO vs_emp_name;
	  
      vn_count := vn_count + 1;
      DBMS_OUTPUT.PUT_LINE(vn_count);
      
	  -- �� �̻� ��ġ�� �����ο찡 ���� ��� LOOP Ż��
	  EXIT WHEN cur_emp_dep%NOTFOUND; -- �о�� ����Ÿ�� �����ϸ� true, �о�� ����Ÿ�� ������ false
	  
      
	  -- ������� ���
	  DBMS_OUTPUT.PUT_LINE(vn_count || '�� ' || vs_emp_name); 
      
	
    END LOOP;
  
  -- Ŀ�� �ݱ�
  CLOSE cur_emp_dep;    -- �޸� �Ҹ�. Ŀ���� ����Ű�� ����Ÿ������ �ݱ�.
END;


--1)�Ϲݺ����� ���� ��ġ�۾� �ޱ�	
DECLARE
    --1)��������
    vs_emp_name EMPLOYEES.EMP_NAME%TYPE;
    
    --2)Ŀ������
    CURSOR cur_emp_dep (cp_department_id EMPLOYEES.DEPARTMENT_ID%TYPE)
    IS
    SELECT EMP_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = cp_department_id;
BEGIN
    OPEN cur_emp_dep(90); -- SELECT���� �������� �޸𸮻� �����ϰ�, �� ������ �����ϴ� �̸� cur_emp_dep Ŀ��.
    
    LOOP    -- Ŀ���� ����Ű�� ������ ����Ÿ�� 3����, 4��° ���۽� �о�� ����Ÿ(FETCH)�� ��� ������ �����Ѵ�.
        FETCH cur_emp_dep INTO vs_emp_name;
        
        -- FETCH �۾��� ���¸� Ŀ���Ӽ� ��ɾ�� üũ.
        EXIT WHEN cur_emp_dep.NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vs_emp_name);
    END LOOP;
    
    CLOSE cur_emp_dep;
END;


	
-- Ŀ���� FOR��

DECLARE
   
   -- Ŀ�� ����, �Ű������� �μ��ڵ带 �޴´�.
   CURSOR cur_emp_dep ( cp_department_id employees.department_id%TYPE )
   IS
   SELECT employee_id, emp_name
     FROM employees
    WHERE department_id = 90;
    
BEGIN
	

	-- FOR���� ���� Ŀ�� ��ġ�۾�.  emp_rec : ���ڵ�Ÿ���� ����. �� ���������� ����Ű�� �ǹ�.
	FOR emp_rec IN cur_emp_dep(90) -- OPEN cur_emp_dep(90) ���������� ���۵ȴ�. FETCH �۾��� �����
	LOOP
	  
	  -- ������� ���, ���ڵ� Ÿ���� ���ڵ��.�÷��� ���·� ���
	  DBMS_OUTPUT.PUT_LINE(emp_rec.employee_id || ' ' || emp_rec.emp_name);
	
    END LOOP;  -- CLOSE Ŀ���� �����Ǿ� ����.
  
END;

-- �ó����� : �μ����̺� �����Ͽ�, �μ���ȣ�� �μ��̸��� Ŀ���� �����ϰ� ����Ÿ�� ����϶�.
-- Ŀ���� : CUR_DEPT_ALL_INFO
DECLARE
   
   -- Ŀ�� ����, �Ű������� �μ��ڵ带 �޴´�. Ŀ���� �Ű������� ���� ��� () ���δ� �ڵ忡�� �����Ѵ�.
   CURSOR CUR_DEPT_ALL_INFO
   IS
   SELECT DEPARTMENT_ID, DEPARTMENT_NAME
     FROM DEPARTMENTS;

    
BEGIN
	-- FOR���� ���� Ŀ�� ��ġ�۾�. 
	FOR DEPT_REC IN CUR_DEPT_ALL_INFO 
	LOOP
	  -- �μ���ȣ, �μ��̸��� ���, ���ڵ� Ÿ���� ���ڵ��.�÷��� ���·� ���
	  DBMS_OUTPUT.PUT_LINE(DEPT_REC.DEPARTMENT_ID || ' ' || DEPT_REC.DEPARTMENT_NAME);
	
    END LOOP;  -- CLOSE Ŀ���� �����Ǿ� ����.
  
END;

-- Ŀ�����Ǹ� �����ʰ�, select���� ���� ����� ����.
DECLARE

BEGIN

	-- FOR���� ���� Ŀ�� ��ġ�۾� ( Ŀ�� ����� ���� �κ��� FOR���� ���� ���)
	FOR emp_rec IN ( SELECT emp_name
                     FROM employees
                    WHERE department_id = 90	
	               ) 
	LOOP
	  
	  -- ������� ���, ���ڵ� Ÿ���� ���ڵ��.�÷��� ���·� ���
	  DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name);
	
  END LOOP;
  
END;


-- Ŀ������  https://thebook.io/006696/0275/
/*
�� Ŀ�� ���� �����ϱ�
Ŀ�� ������ �����ϴ� ������� �� ������ �ִµ�, ù ��°�� ������ Ŀ�� Ÿ���� �����ϰ� ���� �� Ÿ�Կ� ���� Ŀ�� ������ �����ϴ� ����̴�.

    �� TYPE Ŀ��_Ÿ�Ը� IS REF CURSOR [ RETURN ��ȯ Ÿ�� ] ;  -- Ŀ��Ÿ�� ����
    �� Ŀ��_������ Ŀ��_Ÿ�Ը�;
*/ 

-- Ŀ�������� �̿��� �۾�.   ����� Ŀ�������۾����� ���� ������ ����� �����ϴ�.
DECLARE
   -- ������� �޾ƿ��� ���� ���� ����
   vs_emp_name employees.emp_name%TYPE;
   
   -- ���� Ŀ��Ÿ�� ����(��������� ����ŸŸ��)
   TYPE emp_dep_curtype IS REF CURSOR; -- RETURN ���� �����Ƿ� ���� Ŀ��Ÿ�� �̶�� �Ѵ�.  
   -- Ŀ������ ����. SELECT���� ������ ����.
   emp_dep_curvar emp_dep_curtype;  -- emp_dep_curvar SYS_REFCURSOR; �����ϴ�.(�⺻ ���� ����ŸŸ��)
   
BEGIN

  -- Ŀ�������� ����� Ŀ������ �� ����
  OPEN emp_dep_curvar FOR SELECT emp_name
                     FROM employees
                    WHERE department_id = 90;

  -- LOOP��
  LOOP
     -- Ŀ�������� ����� ���������  vs_emp_name ������ �Ҵ� 
     FETCH emp_dep_curvar INTO vs_emp_name;

	  -- �� �̻� ��ġ�� �����ο찡 ���� ��� LOOP Ż��(Ŀ�������� �̿��� Ŀ���Ӽ� ����)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  
	  -- ������� ���
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  
  
  END LOOP;
 
END;

-- SYS_REFCURSOR : ����Ŭ�� ��Ʈ������ �����ϴ� ���� Ŀ��Ÿ��
DECLARE
   -- ������� �޾ƿ��� ���� ���� ����
   vs_emp_name employees.emp_name%TYPE;
   
   -- SYS_REFCURSOR Ÿ���� Ŀ������ ����
   emp_dep_curvar SYS_REFCURSOR;
BEGIN

  -- Ŀ�������� ����� Ŀ������ �� ����
  OPEN emp_dep_curvar FOR SELECT emp_name
                     FROM employees
                    WHERE department_id = 90;

  -- LOOP��
  LOOP
     -- Ŀ�������� ����� ���������  vs_emp_name ������ �Ҵ� 
     FETCH emp_dep_curvar INTO vs_emp_name;

	  -- �� �̻� ��ġ�� �����ο찡 ���� ��� LOOP Ż��(Ŀ�������� �̿��� Ŀ���Ӽ� ����)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  
	  -- ������� ���
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  
  
  END LOOP;
 
END;


-- Ŀ�������� �Ű������� ����

DECLARE
    -- (��) SYS_REFCURSOR Ÿ���� Ŀ������ ����
   emp_dep_curvar SYS_REFCURSOR;  --1)Ŀ����������
   
    -- ������� �޾ƿ��� ���� ���� ����
   vs_emp_name employees.emp_name%TYPE;     --2)�Ϲݺ�������
   
   -- (��) Ŀ�������� �Ű������� �޴� ���ν���, �Ű������� SYS_REFCURSOR Ÿ���� IN OUT��
   -- 3)���ν��� ����(����). ����
   PROCEDURE test_cursor_argu ( p_curvar IN OUT SYS_REFCURSOR) -- �Ű������� Ŀ�������� ���
   IS
       c_temp_curvar SYS_REFCURSOR;
   BEGIN
       -- Ŀ���� �����Ѵ�
       OPEN c_temp_curvar FOR 
             SELECT emp_name
               FROM employees
             WHERE department_id = 90;
             
        -- (��) ������ Ŀ���� IN OUT �Ű������� �ٽ� �Ҵ��Ѵ�. 
        p_curvar := c_temp_curvar;
   END;
BEGIN
   -- ���ν����� ȣ���Ѵ�. 
   test_cursor_argu (emp_dep_curvar); -- Ŀ������
   
   -- (��) �����ؼ� ���� �Ű������� LOOP���� ����� ����� ����Ѵ�. 
   LOOP
     -- Ŀ�������� ����� ���������  vs_emp_name ������ �Ҵ� 
     FETCH emp_dep_curvar INTO vs_emp_name;

	  -- �� �̻� ��ġ�� �����ο찡 ���� ��� LOOP Ż��(Ŀ�������� �̿��� Ŀ���Ӽ� ����)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  
	  -- ������� ���
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  
  
  END LOOP;

END;

/*
-- Ŀ�� ǥ����

SELECT ( SELECT department_name
             FROM departments d
            WHERE e.department_id = d.department_id) AS dep_name,  
       e.emp_name         
  FROM employees e
 WHERE e.department_id = 90;
 
 
  SELECT d.department_name,      
        ( SELECT e.emp_name
             FROM employees e
            WHERE e.department_id = d.department_id) AS emp_name        
  FROM departments d
 WHERE d.department_id = 90;
 
 
 SELECT d.department_name,      
         CURSOR ( SELECT e.emp_name
                        FROM employees e
                       WHERE e.department_id = d.department_id) AS emp_name        
  FROM departments d
 WHERE d.department_id = 90;


DECLARE
    -- Ŀ��ǥ������ ����� ����� Ŀ�� ����
    CURSOR mytest_cursor IS
         SELECT d.department_name,      
                  CURSOR ( SELECT e.emp_name
                                 FROM employees e
                                WHERE e.department_id = d.department_id) AS emp_name        
          FROM departments d
        WHERE d.department_id = 90;
        
    -- �μ����� �޾ƿ��� ���� ����
    vs_department_name departments.department_name%TYPE;
    
    --Ŀ��ǥ���� ����� �ޱ� ���� Ŀ��Ÿ�Ժ���
    c_emp_name SYS_REFCURSOR;
    
    -- ������� �޴� ����
    vs_emp_name employees.emp_name%TYPE;
        
BEGIN

    -- Ŀ������
    OPEN mytest_cursor;
    
    -- ����� Ŀ���� �޾ƿ��� ù ��° LOOP
    LOOP
       -- �μ����� ����, ����� ��������� Ŀ�������� ��ġ
       FETCH mytest_cursor INTO vs_department_name, c_emp_name;
       EXIT WHEN mytest_cursor%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE ('�μ��� : ' || vs_department_name);
       
       -- ������� ����ϱ� ���� �� ��° LOOP 
       LOOP
          -- ����� ��ġ
          FETCH c_emp_name INTO vs_emp_name;
          EXIT WHEN c_emp_name%NOTFOUND;
          
          DBMS_OUTPUT.PUT_LINE('   ����� : ' || vs_emp_name);
       
       END LOOP; -- �� ��° LOOP ����    
    
    END LOOP; -- ù ��° LOOP ����

END;



--- ���ڵ�

DECLARE
  -- �μ����ڵ� Ÿ�Լ���
   TYPE depart_rect IS RECORD (
         department_id     NUMBER(6),
         department_name VARCHAR2(80),
         parent_id           NUMBER(6),
         manager_id        NUMBER(6)   
   );
   
  -- ������ ����� Ÿ������ ���ڵ� ���� ����  
   vr_dep depart_rect;

BEGIN
 ...
END;


DECLARE
  -- �μ����ڵ� Ÿ�Լ���
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- ������ ����� Ÿ������ ���ڵ� ���� ����  
   vr_dep depart_rect;

BEGIN
 ��
END;


DECLARE
  -- �μ����ڵ� Ÿ�Լ���
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- ������ ����� Ÿ������ ���ڵ� ���� ����  
   vr_dep depart_rect;
   
  -- �� ��° ���� ���� 
   vr_dep2 depart_rect;
BEGIN

   vr_dep.department_id := 999;
   vr_dep.department_name := '�׽�Ʈ�μ�';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   
   -- �� ��° ������ ù ��° ���ڵ庯�� ����
   vr_dep2 := vr_dep;
   
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_id :' || vr_dep2.department_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_name :' ||  vr_dep2.department_name);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.parent_id :' ||  vr_dep2.parent_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.manager_id :' ||  vr_dep2.manager_id);
END;


DECLARE
  -- �μ����ڵ� Ÿ�Լ���
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- ������ ����� Ÿ������ ���ڵ� ���� ����  
   vr_dep depart_rect;
   
  -- �� ��° ���� ���� 
   vr_dep2 depart_rect;
BEGIN

   vr_dep.department_id := 999;
   vr_dep.department_name := '�׽�Ʈ�μ�';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   
   -- �� ��° ������ department_name���� �Ҵ� 
   vr_dep2.department_name := vr_dep.department_name;
   
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_id :' || vr_dep2.department_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_name :' ||  vr_dep2.department_name);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.parent_id :' ||  vr_dep2.parent_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.manager_id :' ||  vr_dep2.manager_id);
END;


CREATE TABLE ch11_dep AS
SELECT department_id, department_name, parent_id, manager_id
  FROM DEPARTMENTS ;
  
TRUNCATE TABLE   ch11_dep;
  
 DECLARE
  -- �μ����ڵ� Ÿ�Լ���
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- ������ ����� Ÿ������ ���ڵ� ���� ����  
   vr_dep depart_rect;

BEGIN

   vr_dep.department_id := 999;
   vr_dep.department_name := '�׽�Ʈ�μ�';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   
   -- ���ڵ� �ʵ带 ����ؼ� INSERT
   INSERT INTO ch11_dep VALUES ( vr_dep.department_id, vr_dep.department_name, vr_dep.parent_id, vr_dep.manager_id);
   
   -- ���ڵ� �ʵ� ������ ����, Ÿ���� ���ٸ� ���ڵ庯�������θ� INSERT ����
   INSERT INTO ch11_dep VALUES vr_dep;
   
   COMMIT;
END;

CREATE TABLE ch11_dep2 AS
SELECT *
  FROM DEPARTMENTS;

TRUNCATE TABLE   ch11_dep2;



-- ���̺��� ���ڵ� 
DECLARE
  -- ���̺��� ���ڵ� ���� ���� 
   vr_dep departments%ROWTYPE;

BEGIN

   -- �μ� ���̺��� ��� ������ ���ڵ� ������ �ִ´�. 
   SELECT *
     INTO vr_dep
     FROM departments
    WHERE department_id = 20;
   
   -- ���ڵ� ������ �̿��� ch11_dep2 ���̺� �����͸� �ִ´�. 
   INSERT INTO ch11_dep2 VALUES vr_dep;
   
   COMMIT;
END;


-- Ŀ���� ���ڵ� 
DECLARE
  -- Ŀ�� ����
   CURSOR c1 IS
       SELECT department_id, department_name, parent_id, manager_id
         FROM departments;       
        
   -- Ŀ���� ���ڵ庯�� ����  
   vr_dep c1%ROWTYPE;

BEGIN
   -- ������ ���� 
   DELETE ch11_dep;
 
   -- Ŀ�� ���� 
   OPEN c1;
   
   -- ������ ���� vr_dep ���ڵ� ������ ���� �ְ�, �ٽ� ch11_dep�� INSERT
   LOOP
     FETCH c1 INTO vr_dep;
     
     EXIT WHEN c1%NOTFOUND;
     -- ���ڵ� ������ �̿��� ch11_dep2 ���̺� �����͸� �ִ´�. 
     INSERT INTO ch11_dep VALUES vr_dep;
   
   END LOOP;
   
   COMMIT;
END;


DECLARE
   -- ���ڵ� ���� ���� 
   vr_dep ch11_dep%ROWTYPE;

BEGIN
 
   vr_dep.department_id := 20;
   vr_dep.department_name := '�׽�Ʈ';
   vr_dep.parent_id := 10;
   vr_dep.manager_id := 200;
     
   -- ROW�� ����ϸ� �ش� �ο� ��ü�� ���ŵ�
     UPDATE ch11_dep
          SET ROW = vr_dep
      WHERE department_id = vr_dep.department_id; 
   
   COMMIT;
END;


-- ��ø ���ڵ�

DECLARE
  -- �μ���ȣ, �μ����� �ʵ�� ���� dep_rec ���ڵ� Ÿ�� ���� 
  TYPE dep_rec IS RECORD (
        dep_id      departments.department_id%TYPE,
        dep_name departments.department_name%TYPE );
        
  --���, ����� �׸��� dep_rec(�μ���ȣ, �μ���) Ÿ���� ���ڵ� ���� 
  TYPE emp_rec IS RECORD (
        emp_id      employees.employee_id%TYPE,
        emp_name employees.emp_name%TYPE,
        dep          dep_rec                          );
        
   --  emp_rec Ÿ���� ���ڵ� ���� ���� 
   vr_emp_rec emp_rec;

BEGIN
   -- 100�� ����� ���, �����, �μ���ȣ, �μ����� �����´�. 
   SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
     INTO vr_emp_rec.emp_id, vr_emp_rec.emp_name, vr_emp_rec.dep.dep_id, vr_emp_rec.dep.dep_name
     FROM employees a, 
             departments b
    WHERE a.employee_id = 100
       AND a.department_id = b.department_id;
       
    -- ���ڵ� ���� �� ���    
    DBMS_OUTPUT.PUT_LINE('emp_id : ' ||  vr_emp_rec.emp_id);
    DBMS_OUTPUT.PUT_LINE('emp_name : ' ||  vr_emp_rec.emp_name);
    DBMS_OUTPUT.PUT_LINE('dep_id : ' ||  vr_emp_rec.dep.dep_id);
    DBMS_OUTPUT.PUT_LINE('dep_name : ' ||  vr_emp_rec.dep.dep_name);
END;


-- �����迭

DECLARE
   -- ����-���� ���� �����迭 ����
   TYPE av_type IS TABLE OF VARCHAR2(40)
        INDEX BY PLS_INTEGER;
        
   -- �����迭 ���� ����
   vav_test av_type;
BEGIN
  -- �����迭�� �� �Ҵ�
  vav_test(10) := '10�� ���� ��';
  vav_test(20) := '20�� ���� ��';
  
  --�����迭 �� ���
  DBMS_OUTPUT.PUT_LINE(vav_test(10));
  DBMS_OUTPUT.PUT_LINE(vav_test(20));

END;

-- VARRAY

DECLARE
   -- 5���� ������ ������ �̷���� VARRAY ����
   TYPE va_type IS VARRAY(5) OF VARCHAR2(20);
   
   -- VARRY ���� ����
   vva_test va_type;
   
   vn_cnt NUMBER := 0;
BEGIN
  -- �����ڸ� ����� �� �Ҵ� (�� 5������ ���� 3���� �� �Ҵ�)
  vva_test := va_type('FIRST', 'SECOND', 'THIRD', '', '');
  
  LOOP
     vn_cnt := vn_cnt + 1;     
     -- ũ�Ⱑ 5�̹Ƿ� 5ȸ ������ ���鼭 �� ��� �� ��� 
     IF vn_cnt > 5 THEN 
        EXIT;
     END IF;
  
     -- VARRY ��� �� ��� 
     DBMS_OUTPUT.PUT_LINE(vva_test(vn_cnt));
  
  END LOOP;
  
  -- �� ����
  vva_test(2) := 'TEST';
  vva_test(4) := 'FOURTH';
  
  -- �ٽ� ������ ���� �� ���
  vn_cnt := 0;
  LOOP
     vn_cnt := vn_cnt + 1;     
     -- ũ�Ⱑ 5�̹Ƿ� 5ȸ ������ ���鼭 �� ��� �� ��� 
     IF vn_cnt > 5 THEN 
        EXIT;
     END IF;
  
     -- VARRY ��� �� ��� 
     DBMS_OUTPUT.PUT_LINE(vva_test(vn_cnt));
  
  END LOOP;
END;

-- ��ø ���̺�
DECLARE
  -- ��ø ���̺� ����
  TYPE nt_typ IS TABLE OF VARCHAR2(10);
  
  -- ���� ����
  vnt_test nt_typ;
BEGIN

  -- �����ڸ� ����� �� �Ҵ�
  vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', '');
  
  vnt_test(4) := 'FOURTH';
  
  -- �� ���
  DBMS_OUTPUT.PUT_LINE (vnt_test(1));
  DBMS_OUTPUT.PUT_LINE (vnt_test(2));
  DBMS_OUTPUT.PUT_LINE (vnt_test(3));
  DBMS_OUTPUT.PUT_LINE (vnt_test(4));
  
END;

-- DELETE �޼ҵ�
DECLARE
   -- ����-���� ���� �����迭 ����
   TYPE av_type IS TABLE OF VARCHAR2(40)
        INDEX BY VARCHAR2(10);
        
   -- �����迭 ���� ����
   vav_test av_type;
   
   vn_cnt number := 0;
BEGIN
  -- �����迭�� �� �Ҵ�
  vav_test('A') := '10�� ���� ��';
  vav_test('B') := '20�� ���� ��';
  vav_test('C') := '20�� ���� ��';
  
  vn_cnt := vav_test.COUNT;
  DBMS_OUTPUT.PUT_LINE('���� �� ��� ����: ' || vn_cnt);  
  
  vav_test.DELETE('A', 'B');
  
  vn_cnt := vav_test.COUNT;
  DBMS_OUTPUT.PUT_LINE('���� �� ��� ����: ' || vn_cnt);
END;


-- TRIM �޼ҵ�
DECLARE
  -- ��ø ���̺� ����
  TYPE nt_typ IS TABLE OF VARCHAR2(10);
  
  -- ���� ����
  vnt_test nt_typ;
BEGIN
  -- �����ڸ� ����� �� �Ҵ�
  vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

  -- �� ���������� 2�� ��� ���� 
  vnt_test.TRIM(2);
  
  DBMS_OUTPUT.PUT_LINE(vnt_test(1));
  DBMS_OUTPUT.PUT_LINE(vnt_test(2));
  DBMS_OUTPUT.PUT_LINE(vnt_test(3));
  DBMS_OUTPUT.PUT_LINE(vnt_test(4));
  
  EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END;

-- EXTEND �޼ҵ�
DECLARE
  -- ��ø ���̺� ����
  TYPE nt_typ IS TABLE OF VARCHAR2(10);
  
  -- ���� ����
  vnt_test nt_typ;
BEGIN
  -- �����ڸ� ����� �� �Ҵ�
  vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD');

  -- �� ���� NULL ��� �߰��� �� �� �Ҵ� �� ���
  vnt_test.EXTEND;
  vnt_test(4) := 'fourth';
  DBMS_OUTPUT.PUT_LINE(vnt_test(4));
  
  -- �� ���� ù ��° ��Ҹ� 2�� ������ �߰� �� ���
  vnt_test.EXTEND(2, 1);
  DBMS_OUTPUT.PUT_LINE('ù��° : ' || vnt_test(1));
  -- ù ��° ��Ҹ� ������ 2�� �߰������Ƿ� �߰��� ��Ҵ� 5, 6
  DBMS_OUTPUT.PUT_LINE('�߰��� ���1 : ' || vnt_test(5));
  DBMS_OUTPUT.PUT_LINE('�߰��� ���2 : ' || vnt_test(6));

END;

-- FIRST�� LAST �޼ҵ� 
DECLARE
  -- ��ø ���̺� ����
  TYPE nt_typ IS TABLE OF VARCHAR2(10);
  
  -- ���� ����
  vnt_test nt_typ;
BEGIN
  -- �����ڸ� ����� �� �Ҵ�
  vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

  -- FIRST�� LAST �޼ҵ带 FOR������ ����� �÷��� ���� ���
  FOR i IN vnt_test.FIRST..vnt_test.LAST
  LOOP
  
     DBMS_OUTPUT.PUT_LINE(i || '��° ��� ��: ' || vnt_test(i));
  END LOOP;

END;


-- COUNT�� LIMIT

DECLARE
  
  TYPE nt_typ IS TABLE OF VARCHAR2(10);      -- ��ø���̺� ����
  TYPE va_type IS VARRAY(5) OF VARCHAR2(10); -- VARRAY ����
 
  -- ���� ����
  vnt_test nt_typ;
  vva_test va_type;
BEGIN
  -- �����ڸ� ����� �� �Ҵ�
  vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH'); -- ��ø���̺�
  vva_test := va_type('ù��°', '�ι�°', '����°', '�׹�°'); -- VARRAY
  
  DBMS_OUTPUT.PUT_LINE('VARRAY COUNT: ' || vva_test.COUNT);
  DBMS_OUTPUT.PUT_LINE('��ø���̺� COUNT: ' || vnt_test.COUNT);

  DBMS_OUTPUT.PUT_LINE('VARRAY LIMIT: ' || vva_test.LIMIT); 
  DBMS_OUTPUT.PUT_LINE('��ø���̺� LIMIT: ' || vnt_test.LIMIT);  

END;


-- PRIOR�� NEXT
DECLARE
  TYPE va_type IS VARRAY(5) OF VARCHAR2(10); -- VARRAY ����
  -- ���� ����
  vva_test va_type;
BEGIN
  -- �����ڸ� ����� �� �Ҵ�
  vva_test := va_type('ù��°', '�ι�°', '����°', '�׹�°'); -- VARRAY
  
  DBMS_OUTPUT.PUT_LINE('FIRST�� PRIOR : ' || vva_test.PRIOR(vva_test.FIRST));
  DBMS_OUTPUT.PUT_LINE('LAST�� NEXT : ' || vva_test.NEXT(vva_test.LAST));

  DBMS_OUTPUT.PUT_LINE('�ε���3�� PRIOR :' || vva_test.PRIOR(3));
  DBMS_OUTPUT.PUT_LINE('�ε���3�� NEXT :' || vva_test.NEXT(3));

END;


-- ����� ���� ������ Ÿ��

-- 5���� ������ ������ �̷���� VARRAY ���������Ÿ�� ����
CREATE OR REPLACE TYPE ch11_va_type IS VARRAY(5) OF VARCHAR2(20);

-- ������ ���� ��ø���̺� ���������Ÿ�� ����
CREATE OR REPLACE TYPE ch11_nt_type IS TABLE OF VARCHAR2(20);

-- ���������Ÿ���� va_type�� nt_type ���
DECLARE
   vva_test ch11_va_type;  -- VARRAY�� va_type ��������   
   vnt_test ch11_nt_type;  -- ��ø���̺���  nt_type ��������   

BEGIN
    -- �����ڸ� ����� �� �Ҵ� (�� 5������ ���� 3���� �� �Ҵ�)
    vva_test := ch11_va_type('FIRST', 'SECOND', 'THIRD', '', '');
    vnt_test := ch11_nt_type('FIRST', 'SECOND', 'THIRD', '');
    
    DBMS_OUTPUT.PUT_LINE('VARRAY�� 1��° ��Ұ�: ' || vva_test(1));
    DBMS_OUTPUT.PUT_LINE('��ø���̺��� 1��° ��Ұ�: ' || vnt_test(1));

END;


-- �÷��� Ÿ�Ժ� �������� Ȱ��
-- ������ �÷���

DECLARE
    -- ù ��° VARRAY Ÿ�Լ��� (�������� ���� X5���� ����  ��Ҹ� ���� VARRAY )
    TYPE va_type1 IS VARRAY(5) OF NUMBER;
    
    -- ������ ������ va_type1�� ���Ÿ������ �ϴ� VARRAY Ÿ�� ���� (�������� 1~3�ܱ��� ��Ҹ� ���� VARRAY)
    TYPE va_type11 IS VARRAY(3) OF va_type1;
    -- �ι�° va_type11 Ÿ���� ���� ���� 
    va_test va_type11;
BEGIN
    -- �����ڸ� �̿��� �� �ʱ�ȭ, 
    va_test := va_type11( va_type1(1, 2, 3, 4, 5), 
                                 va_type1(2, 4, 6, 8, 10),
                                 va_type1(3, 6, 9, 12, 15));
                        
   -- ������ ���                               
   DBMS_OUTPUT.PUT_LINE('2���ϱ� 3�� ' || va_test(2)(3));             
   DBMS_OUTPUT.PUT_LINE('3���ϱ� 5�� ' || va_test(3)(5));               

END;



DECLARE
    -- ���Ÿ���� employees%ROWTYPE �� ����, �� ���̺��� ���ڵ带 ��� Ÿ������ �� ��ø���̺� 
    TYPE nt_type IS TABLE OF employees%ROWTYPE;

   -- ��ø���̺� ��������
   vnt_test nt_type;
BEGIN
  -- �� �����ڷ� �ʱ�ȭ
  vnt_test := nt_type();
  
  -- ��ø���̺� ��� 1�� �߰� 
  vnt_test.EXTEND;
  
  -- ������̺��� 100�� ����� ������ �����´�. 
  SELECT *
     INTO vnt_test(1) -- ������ ���1���� �߰������Ƿ� �ε����� 1
    FROM employees
   WHERE employee_id = 100;
   
  -- 100�� ����� ����� ���� ���
  DBMS_OUTPUT.PUT_LINE(vnt_test(1).employee_id);
  DBMS_OUTPUT.PUT_LINE(vnt_test(1).emp_name);

END;

DECLARE
    -- ���Ÿ���� employees%ROWTYPE �� ����, �� ���̺��� ���ڵ带 ��� Ÿ������ �� ��ø���̺� 
    TYPE nt_type IS TABLE OF employees%ROWTYPE;

   -- ��ø���̺� ��������
   vnt_test nt_type;
BEGIN
  -- �� �����ڷ� �ʱ�ȭ
  vnt_test := nt_type();
  
  -- ������̺� ��ü�� ��ø���̺� ��´�. 
  FOR rec IN ( SELECT * FROM employees) 
  LOOP
     -- ��� 1�� �߰� 
     vnt_test.EXTEND;
     
     -- LAST �޼ҵ带 ����ϸ� �׻� ������ �߰��� ����� �ε����� �����´�. 
     vnt_test ( vnt_test.LAST) := rec;
     
  END LOOP;
   
  -- ���
  FOR i IN vnt_test.FIRST..vnt_test.LAST
  LOOP
       DBMS_OUTPUT.PUT_LINE(vnt_test(i).employee_id || ' - ' ||   vnt_test(i).emp_name);
  END LOOP;

END;


-- ���̺� �÷� Ÿ������ VARRAY ����ϱ� 

-- ���� �̸��� ������ �ִ� VARRAY Ÿ�� ����.
CREATE OR REPLACE TYPE country_var IS VARRAY(7) OF VARCHAR2(30);

-- ����� ���� ����Ʈ�� ���� ���̺� ����
CREATE TABLE ch11_continent ( 
            continent   VARCHAR2(50), -- �����
            country_nm  country_var -- �������� ���� VARRAY Ÿ��
            );
            
DECLARE

BEGIN
   -- �����ڸ� ����� �������� �Է��Ѵ�. 
   INSERT INTO ch11_continent
         VALUES('�ƽþ�', country_var('�ѱ�','�߱�','�Ϻ�'));
         
   INSERT INTO ch11_continent 
         VALUES('�ϾƸ޸�ī', country_var('�̱�','ĳ����','�߽���'));
         
   INSERT INTO ch11_continent 
         VALUES('����', country_var('����','������','����', '������'));         

   COMMIT;

END;            


DECLARE
  -- ���ο� ���� ����
  new_country country_var := country_var('���¸�', '������', '�׵�����', 'ü��', '������Į');
  country_list country_var;
BEGIN
   -- ���ο� ������ update
   UPDATE ch11_continent 
      SET country_nm = new_country 
    WHERE continent = '����';
   
   COMMIT;
   
   -- UPDATE �ƴ��� Ȯ���� ���� ������ �÷��� VARRAY ������ �޾ƿ´�. 
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('���������� = ' || country_list(i));
  END LOOP;
END;


-- ���̺� �÷� Ÿ������ ��ø���̺� ����ϱ�

-- ���� �̸��� ������ �ִ� ��ø���̺� Ÿ�� ����.
CREATE OR REPLACE TYPE country_nt IS TABLE OF VARCHAR2(30);

-- ����� ���� ����Ʈ�� ���� ���̺� ����
CREATE TABLE ch11_continent_nt ( 
            continent   VARCHAR2(50), -- �����
            country_nm  country_nt    -- �������� ���� ��ø���̺� Ÿ��
            )
  NESTED TABLE country_nm STORE AS country_nm_nt;        
  

DECLARE 
  -- ���ο� ���� ����
  new_country country_nt := country_nt('���¸�', '������', '�׵�����', 'ü��', '������Į');
  country_list country_nt;  
  
BEGIN
   -- �����ڸ� ����� �������� �Է��Ѵ�. 
   INSERT INTO ch11_continent_nt
         VALUES('�ƽþ�', country_nt('�ѱ�','�߱�','�Ϻ�'));
         
   INSERT INTO ch11_continent_nt 
         VALUES('�ϾƸ޸�ī', country_nt('�̱�','ĳ����','�߽���'));
         
   INSERT INTO ch11_continent_nt 
         VALUES('����', country_nt('����','������','����', '������'));         

   -- ���ο� ������ update
   UPDATE ch11_continent_nt 
      SET country_nm = new_country 
    WHERE continent = '����';
   
   COMMIT;
   
   -- UPDATE �ƴ��� Ȯ���� ���� ������ �÷��� ��ø���̺� ������ �޾ƿ´�. 
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent_nt 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('���������� = ' || country_list(i));
  END LOOP;
END;    


SELECT *
  FROM ch11_continent;
  
  
SELECT continent, b.*
 FROM ch11_continent a, TABLE(a.country_nm) b
WHERE continent = '����';


SELECT *
FROM TABLE(SELECT d.country_nm
            FROM ch11_continent_nt d
            WHERE d.continent = '����');
            
            
-- DML�� �̿��� ���ó��       


DECLARE 
    -- ��¿� ��ø���̺� ���� ����
  country_list country_nt;  
  
BEGIN
      
   -- ���� �������� �޾ƿ� ����Ѵ�.  
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent_nt 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('����������(OLD) = ' || country_list(i));
  END LOOP;
  
  -- ������ ���⿡�� �߰��Ѵ�. TABLE �Լ��� �Ἥ INSERT�� ������.
  INSERT INTO TABLE ( SELECT d.country_nm
                        FROM ch11_continent_nt d
                       WHERE d.continent = '����')
  VALUES ('���⿡');
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
                         
   -- �߰��ƴ��� Ȯ�� 
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent_nt 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('����������(NEW) = ' || country_list(i));
  END LOOP;
  
END;  


-- UPDATE

DECLARE 
    -- ��¿� ��ø���̺� ���� ����
  country_list country_nt;  
  
BEGIN
  
  -- ���¸��� �������� �����Ѵ�. 
  
  UPDATE TABLE( SELECT d.country_nm
                  FROM ch11_continent_nt d
                 WHERE d.continent = '����' ) a
     SET VALUE(a) = '����'
   WHERE a.column_value = '���¸�';
  
  COMMIT;
  
                        
   -- ����ƴ��� Ȯ�� 
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent_nt 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('����������(NEW) = ' || country_list(i));
  END LOOP;
  
END;  


-- DELETE

DECLARE 
    -- ��¿� ��ø���̺� ���� ����
  country_list country_nt;  
  
BEGIN
  
  -- ����� ������ �����.   
  DELETE FROM  TABLE( SELECT d.country_nm
                        FROM ch11_continent_nt d
                       WHERE d.continent = '����' ) t
   WHERE t.column_value = '����';
  
  COMMIT;
  
                        
   -- ����ƴ��� Ȯ�� 
   SELECT country_nm 
     INTO country_list 
     FROM ch11_continent_nt 
    WHERE continent = '����';
   
  -- ������ ���� ������ ����Ѵ�.  
  FOR i IN country_list.FIRST .. country_list.LAST
  LOOP
     DBMS_OUTPUT.PUT_LINE('����������(NEW) = ' || country_list(i));
  END LOOP;
  
END;  

*/