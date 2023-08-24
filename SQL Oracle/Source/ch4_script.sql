-- �����Լ�
/*
���� �Լ��� ���� ������ �ϴ� �Լ��� ���� ��� ��, �Ű������� ��ȯ ���� ��κ� ���� ���´�.
*/
/*
�� ABS(n)
ABS �Լ��� �Ű������� ���ڸ� �޾� �� ���밪�� ��ȯ�ϴ� �Լ���.
���� = -�� +�� �׳� ��¥ ����
*/

SELECT ABS(10), ABS(-10), ABS(-10.123)
  FROM DUAL;

/*
�� CEIL(n)�� FLOOR(n)
CEIL �Լ��� �Ű����� n�� ���ų� ���� ū ������ ��ȯ�Ѵ�.
*/

-- �ø��Լ� : �Ҽ��κ��� ������ �ø��Ͽ�, ���������� ��ȯ
SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001), CEIL(11.000)
  FROM DUAL;
  
-- 
-- �����Լ�  : �Ҽ��κ��� �����Ͽ�, ���������� ��ȯ
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
  FROM DUAL;
  
/*
�� ROUND(n, i)�� TRUNC(n1, n2)
ROUND �Լ��� �Ű����� n�� �Ҽ��� ���� (i+1)�� °���� �ݿø��� ����� ��ȯ�Ѵ�. i�� ������ �� �ְ� ����Ʈ ���� 0, �� �Ҽ��� ù ��° �ڸ����� �ݿø��� �Ͼ ���� �κ��� ���� �ڸ��� ����� �ݿ��ȴ�.
*/

-- 1) �Ű����� 1�� ���  
-- �⺻�� �Ҽ��κ� ù°�ڸ��� �ݿø� ���(����)���� ����.
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
  FROM DUAL;

  
-- 2) 2���� �Ű������� ���. ù��°�� ���, 
-- �ι�° �Ű������� ���� ����� ��� ������ �Ҽ� �ڸ��� �ݿø��Ͽ� ����� ������ش�.
-- �Ҽ� �ڸ������� ����� �����ش�.
SELECT ROUND(10.154, 1), ROUND(10.154, 2), ROUND(10.154, 3)
  FROM DUAL;
  
 -- �ι�° �Ű������� ���� ������ ���, �����ڸ����� �ݿø� ���(����)���� ����. 
SELECT ROUND(0, 3), ROUND(115.155, -1), ROUND(115.155, -2)
  FROM DUAL;   
 
/*
TRUNC �Լ��� �ݿø��� ���� �ʰ� n1�� �Ҽ��� ���� n2�ڸ����� ������ �߶� ����� ��ȯ�Ѵ�. 
n2 ���� ������ �� ������ ����Ʈ ���� 0�̰�, ����� ���� �Ҽ��� �������� ������, ������ ���� �Ҽ��� ���� ���� �ڸ����� �߶󳽴�.
*/

-- 2��° �Ű������� ����̸�, ������ �Ҽ��ڸ����� ��ȣ�ϰ�, �������� �����Ѵ�.
--                �����̸�, ������ �����ڸ��������� �����Ѵ�.
SELECT TRUNC(115.155), TRUNC(115.155, 1), TRUNC(115.155, 2), TRUNC(115.155, -2)
  FROM DUAL;   
  
 /*
 �� POWER(n2, n1)�� SQRT(n)
POWER �Լ��� n2�� n1 ������ ����� ��ȯ�Ѵ�. n1�� ������ �Ǽ� ��� �� �� �ִµ�, n2�� ������ �� n1�� ������ �� �� �ִ�.
*/
SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001)
  FROM DUAL;  
  
  
SELECT POWER(-3, 3.0001)
  FROM DUAL;  -- SQL. ����: ORA-01428: '-3' �μ��� ������ ������ϴ�.


-- SQRT�� ��Ʈ�� ����� �Լ���  
SELECT SQRT(2), SQRT(5)
  FROM DUAL;   
  
/*
�� MOD(n2, n1)�� REMAINDER(n2, n1)
MOD �Լ��� n2�� n1���� ���� ������ ���� ��ȯ�Ѵ�.
*/
SELECT MOD(19,4), MOD(19.123, 4.2)
  FROM DUAL;   

/*
REMAINDER �Լ� ���� n2�� n1���� ���� ������ ���� ��ȯ�ϴµ�, �������� ���ϴ� ������ ���� ����� MOD �Լ��ʹ� �ణ �ٸ���.

? MOD �� n2 - n1 * FLOOR (n2/n1)

? REMAINDER �� n2 - n1 * ROUND (n2/n1)
*/
-- 20 - 4*4 = -1
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
  FROM DUAL;     
/*
�� EXP(n), LN(n) �׸��� LOG(n2, n1)
EXP�� ���� �Լ��� e(e=2.71828183��)�� n���� ���� ��ȯ�ϰ�, LN �Լ��� �ڿ� �α� �Լ��� �ؼ��� e�� �α� �Լ���. �ݸ� LOG�� n2�� �ؼ��� �ϴ� n1�� �α� ���� ��ȯ�Ѵ�
*/
SELECT EXP(2), LN(2.713), LOG(10, 100)
  FROM DUAL;
  
  
-- �����Լ�
/*
�� INITCAP(char), LOWER(char), UPPER(char)
INITCAP �Լ��� �Ű������� ������ char�� ù ���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ�ϴ� �Լ���. 
�̶� ù ���ڸ� �ν��ϴ� ������ ����� ���ĺ�(���� ����)�� ������ ���ڴ�. 
�� �����̳� ���ĺ��� �ƴ� ���ڸ� ���� �� ���� ù ���ĺ� ���ڸ� �빮�ڷ� ��ȯ�Ѵ�.
*/
-- �ܾ��� ù���ڸ� �빮�ڷ� ��ȯ
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye')
  FROM DUAL;  

-- �빮�ڸ� �ҹ��ڷ� ��ȯ,            �ҹ��ڸ� �빮�ڷ� ��ȯ  
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye')
  FROM DUAL;  
  
 /*
 �� CONCAT(char1, char2), SUBSTR(char, pos, len), SUBSTRB(char, pos, len)
CONCAT �Լ��� ��||�� ������ó�� �Ű������� ������ �� ���ڸ� �ٿ� ��ȯ�Ѵ�.
*/

-- �� ���� �����ϴ�
SELECT CONCAT('I Have', ' A Dream'), 'I Have' || ' A Dream'
  FROM DUAL;
  
SELECT CONCAT (EMP_NAME, EMAIL) AS EMPINFO, 
EMPLOYEE_ID || EMP_NAME || EMAIL  AS EMPINFO2 
FROM EMPLOYEES;
/*
SUBSTR�� ���� �Լ� �� ���� ���� ���Ǵ� �Լ���, 
�߶�� ��� ���ڿ��� char�� pos��° ���ں��� len���̸�ŭ �߶� ����� ��ȯ�ϴ� �Լ���. 
pos ������ 0�� ���� ����Ʈ ���� 1, �� ù ��° ���ڸ� ����Ű��, ������ ���� 
char ���ڿ� �� ������ ������ ����� ��ġ�� �ǹ��Ѵ�. ���� len ���� �����Ǹ� 
pos��° ���ں��� ������ ��� ���ڸ� ��ȯ�Ѵ�.
*/
SELECT SUBSTR('ABCD EFG', 1, 4)
  FROM DUAL;

--   3��° �Ű������� ����� ���ڰ����̴�.
SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4)
  FROM DUAL;  
  
SELECT EMP_NAME, SUBSTR(EMP_NAME,1 ,2) || '...' AS EMP_NAME_INFO FROM EMPLOYEES;

-- 3��° �Ű������� ����� ����Ʈ �ǹ��̴�. �ѱ��� 3����Ʈ�� ����. 
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 6)
  FROM DUAL;    

/*
�� LTRIM(char, set), RTRIM(char, set)
LTRIM �Լ��� �Ű������� ���� char ���ڿ����� set���� ������ ���ڿ��� ���� ������ ������ �� ������ ���ڿ��� ��ȯ�Ѵ�. 
�� ��° �Ű������� set�� ������ �� ������, ����Ʈ�� ���� ���� �� ���ڰ� ���ȴ�.
RTRIM �Լ��� LTRIM �Լ��� �ݴ�� ������ ������ ������ �� ������ ���ڿ��� ��ȯ�Ѵ�.
*/
-- SELECT LTRIM(���ڿ�Ÿ���� �÷���, '���ʿ��� ������ ���ڿ�') FROM ���̺��;

SELECT LTRIM('ABCDEFGABC', 'ABC'), 
       LTRIM('�����ٶ�', '��'),
       RTRIM('ABCDEFGABC', 'ABC'), 
       RTRIM('�����ٶ�', '��')
  FROM DUAL;    

-- 2��° �Ű������� ���ڿ��� ��ġ���� ������, ���ŵǴ� �� ���, ù��° �Ű������� ���� �״�� ��ȯ�ȴ�.  
SELECT LTRIM('�����ٶ�', '��'), RTRIM('�����ٶ�', '��')
  FROM DUAL;    

/*
�� LPAD(expr1, n, expr2), RPAD(expr1, n, expr2)
LPAD �Լ��� �Ű������� ���� expr2 ���ڿ�(������ �� ����Ʈ�� ���� �� ����)�� n�ڸ���ŭ ���ʺ��� ä�� expr1�� ��ȯ�ϴ� �Լ���.
�Ű����� n�� expr2�� expr1�� ������ ��ȯ�Ǵ� �� �ڸ����� �ǹ��Ѵ�. 
���� ���, ������ ���� ��ȭ��ȣ�� ��02���ε� ��ȭ��ȣ �÷��� ������ȣ�� ������ LPAD �Լ��� ��ȣ 02�� �ڵ����� ä�� ���� �� �ִ�.
*/
  
CREATE TABLE ex4_1 (
       phone_num VARCHAR2(30));


INSERT INTO ex4_1 VALUES ('111-1111');

INSERT INTO ex4_1 VALUES ('111-2222');

INSERT INTO ex4_1 VALUES ('111-3333');

SELECT *
FROM ex4_1;

-- 3��° �Ű������� ���� ���ʿ� ä���.
SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

-- 3��° �Ű������� ���� �����ʿ� ä���.
SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;
          
 /*
 �� REPLACE(char, search_str, replace_str), TRANSLATE(expr, FROM_str, to_str)
REPLACE �Լ��� char ���ڿ����� search_str ���ڿ��� ã�� �̸� replace_str ���ڿ��� ��ü�� ����� ��ȯ�ϴ� �Լ���.
*/
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '��', '��')
  FROM DUAL;   

-- LTRIM, RTRIM �Լ�.
-- �Ű������� 1����, ���� �Ǵ� ������ �������� ����̴�.
-- �Ű������� 2����, 2��° �Ű������� ����� ���� �Ǵ� �����ʿ� ��ġ�Ǵ� ���ڿ� ���� ����̴�.
SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ', ' ', '')  -- ��������
  FROM DUAL;            
 
--   REPLACE �� TRANSLATE ������.
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS rep,  -- '����' -> '�ʸ�'
       TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS trn  -- '��' -> '��',   '��' -> '��'
  FROM DUAL; 
    
/*
�� INSTR(str, substr, pos, occur), LENGTH(chr), LENGTHB(chr)
INSTR �Լ��� str ���ڿ����� substr�� ��ġ�ϴ� ��ġ�� ��ȯ�ϴµ�, pos�� ���� ��ġ�� ����Ʈ ���� 1, 
occur�� �� ��° ��ġ�ϴ����� ����ϸ� ����Ʈ ���� 1�̴�.
*/
    
SELECT INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����') AS INSTR1, 
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5) AS INSTR2, 
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5, 2) AS INSTR3 
  FROM DUAL;   
-- LENGTH �Լ��� �Ű������� ���� ���ڿ��� ������ ��ȯ�ϸ�, LENGTHB �Լ��� �ش� ���ڿ��� ����Ʈ ���� ��ȯ�Ѵ�.  
SELECT LENGTH('���ѹα�'),
       LENGTHB('���ѹα�')
  FROM DUAL;     
  
  
SELECT employee_id, TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou') AS TRANS_NAME
  FROM employees;
  
    
--��¥ �Լ�
-- ��¥ ������Ÿ�� : DATE, TIMESTAP

-- SYSDATE : �ʱ��� ��ȯ, SYSTIMESTAMP : �и���������� ��ȯ
SELECT SYSDATE, SYSTIMESTAMP
  FROM DUAL;    

-- �� ADD_MONTHS (date, integer)
-- ADD_MONTHS �Լ��� �Ű������� ���� ��¥�� interger ��ŭ�� ���� ���� ��¥�� ��ȯ�Ѵ�.  
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
  FROM DUAL;  

/*
�� MONTHS_BETWEEN(date1, date2)
MONTHS_BETWEEN �Լ��� �� ��¥ ������ ���� ���� ��ȯ�ϴµ�, date2�� date1���� ���� ��¥�� �´�.
*/
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1, 
       MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
  FROM DUAL;    
 
 -- �� LAST_DAY(date)
-- LAST_DAY�� date ��¥�� �������� �ش� ���� ������ ���ڸ� ��ȯ�Ѵ�. 
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;  
  
  SELECT HIRE_DATE, LAST_DAY(HIRE_DATE)
  FROM EMPLOYEES;
  
  -- ������̺��� �ټӳ���� ��ȸ�϶�.
  -- RETIRE_DATE�÷��� ���� NULL �� ���� ��ȯ���� NULL �̵ȴ�.
  -- �Լ��ȿ� �Ű������� �Լ��� ���� ���� �ִ�.
  SELECT HIRE_DATE, RETIRE_DATE, MONTHS_BETWEEN(RETIRE_DATE, HIRE_DATE), 
  TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
  FROM EMPLOYEES;

/*
�� ROUND(date, format), TRUNC(date, format)
ROUND�� TRUNC�� ���� �Լ��̸鼭 ��¥ �Լ��ε� ���̴µ�, 
ROUND�� format�� ���� �ݿø��� ��¥��, TRUNC�� �߶� ��¥�� ��ȯ�Ѵ�.
ROUND �Լ����� ���� ���簡 16���̹Ƿ� ��(MONTH) �������� �ݿø��ϸ� ���� �޷� �Ѿ 4�� 1���� �Ǿ���. 
�ݸ� TRUNC������ ������ ���� �������� �߶󳻹Ƿ� 3�� 1���� �� ���̴�. 
ROUND�� TRUNC�� ���� �Լ����� ����� ��ó�� �ݿø��� �߶󳻱� ����� �ϴµ� �Ű������� ��¥�̸�
�ش� ��¥�� �ݿø��ϰ� �߶� ����� ��ȯ�Ѵ�.
*/
-- 2��° �Ű������� ���� �ݿø��� ȿ���� ���� �뵵.
-- ROUND�Լ� : �ϴ����� 16�� �̻� �϶� �ݿø��� �ȴ�.
SELECT SYSDATE, ROUND(SYSDATE, 'month'), ROUND(TO_DATE('2023-03-15'), 'month'), 
ROUND(TO_DATE('2023-03-16'), 'month'), 
TRUNC(SYSDATE, 'month')
  FROM DUAL;   
  
/*
�� NEXT_DAY (date, char)
NEXT_DAY�� date�� char�� ����� ��¥�� ���� �� ���� ���ڸ� ��ȯ�Ѵ�.
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�ݿ���')
  FROM DUAL;
  
-- ��ȯ�Լ�
/*
�� TO_CHAR (���� Ȥ�� ��¥, format)
���ڳ� ��¥�� ���ڷ� ��ȯ�� �ִ� �Լ��� �ٷ� TO_CHAR��, 
�Ű������δ� ���ڳ� ��¥�� �� �� �ְ� ��ȯ ����� Ư�� ���Ŀ� �°� ����� �� �ִ�.
*/

SELECT 123456789, '123,456,789' FROM DUAL;


 -- https://thebook.io/006696/0110/ 2��° �Ű������� ���� Ű���� ����.
SELECT TO_CHAR(123456789, '999,999,999')
  FROM DUAL;   
  
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;


SELECT HIRE_DATE, TO_CHAR(HIRE_DATE, 'MONTH'), TO_CHAR(HIRE_DATE, 'DDD')
FROM EMPLOYEES; 

-- �� TO_NUMBER(expr, format)
--���ڳ� �ٸ� ������ ���ڸ� NUMBER ������ ��ȯ�ϴ� �Լ���

SELECT TO_NUMBER('123456')
FROM DUAL;

/*
�� TO_DATE(char, format), TO_TIMESTAMP(char, format)
���ڸ� ��¥������ ��ȯ�ϴ� �Լ���. ���� �Ű������δ� [ǥ 4-1]�� �ִ� �׸��� �� �� ������, 
TO_DATE�� DATE ������ TO_TIMESTAMP�� TIMESTAMP ������ ��ȯ�� ���� ��ȯ�Ѵ�.
*/


-- ����
-- ����? �Ի����� 2000�� ���� ����� ��ȸ�϶�.
-- 1)
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < '2000-01-01'  -- �ڵ� ����ȯ
ORDER BY EMPLOYEE_ID;       -- 15��
-- 2)
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('2000-01-01')  -- ����� ����ȯ
ORDER BY EMPLOYEE_ID;   -- 15��

--3) �������� �ʴ´�.(���ɿ� ������.)
-- WHERE ���� ���ǽĿ��� �÷��� �Լ��� �����ϴ� ���� ����Ÿ����ŭ �۾��� �߻��ǹǷ�, ���¿� �����ʴ�.
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') < '2000-01-01'  -- 15��
ORDER BY EMPLOYEE_ID;

-- �� �������� ��ȯ
SELECT TO_DATE('20140101', 'YYYY-MM-DD')
  FROM DUAL;
  
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;  
  
-- NULL �����Լ�
-- WHERE �÷��� IS NULL
-- WHERE �÷��� IS NOT NULL

/*
�� NVL(expr1, expr2), NVL2((expr1, expr2, expr3)
NVL �Լ��� expr1�� NULL�� �� expr2�� ��ȯ�Ѵ�.
*/

-- manager_id�÷��� NULL�̸�, 2��° �Ű������� employee_id�÷��� ���� ��ȯ,
-- manager_id�÷��� NOT NULL�̸�, manager_id�÷� ���� ��ȯ�ȴ�.

-- 
SELECT NVL(manager_id, employee_id)
  FROM employees
 WHERE manager_id IS NULL;  
 
 SELECT manager_id, NVL(manager_id, employee_id) 
 FROM employees  WHERE manager_id IS NULL;
 
 
 -- NVL2�� NVL�� Ȯ���� �Լ��� expr1�� NULL�� �ƴϸ� expr2��, NULL�̸� expr3�� ��ȯ�ϴ� �Լ���.
 -- NVL2(expr1, expr2, expr2)
 -- Ŀ�̼��� not null�̸�, �޿��� Ŀ�̼� ����ǰ�, null�̸� �޿��� ���޵ǰ� ��ȸ.
SELECT employee_id, salary,
       NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
  FROM employees;
  
SELECT employee_id, salary,
        NVL2(commission_pct, salary + ( salary * commission_pct), salary) AS "Ŀ�̼��� ����� �޿�"
FROM   employees;      
  
/*
�� COALESCE (expr1, expr2, ��)
COALESCE �Լ��� �Ű������� ������ ǥ���Ŀ��� NULL�� �ƴ� ù ��° ǥ������ ��ȯ�ϴ� �Լ���.
�Ű������� NOT NULL �� ���ö� ���� ������� üũ ��, NOT NULL�� ������ �Ű������� ���� ��ȯ.
*/

-- NULL �� ���Ե� ������� ����� NULL�̵ȴ�.(�߿�)
SELECT NULL + 10 FROM DUAL;
SELECT NULL * 10 FROM DUAL;

SELECT 5 * NULL + 10 FROM DUAL;

SELECT COALESCE(NULL, NULL, NULL) FROM DUAL;
SELECT COALESCE(NULL, 1, NULL) FROM DUAL;
SELECT COALESCE(1, NULL, NULL) FROM DUAL;


-- commission_pct �÷��� NULL ������� �����Ǿ� �ִ�.
--  Ŀ�̼��� not null�̸�, �޿��� Ŀ�̼� ����ǰ�, null�̸� �޿��� ���޵ǰ� ��ȸ.(NVL2�Լ��� ����Ҽ� �� �ִ�.)
SELECT employee_id, salary, commission_pct, 
       COALESCE (salary * commission_pct, salary) AS salary2
  FROM employees;  
  
    
 
  /*
 �� LNNVL(���ǽ�)
LNNVL�� �Ű������� ������ ���ǽ��� ����� FALSE �� UNKNOWN �̶�� TRUE ��ȯ. TRUE ��� FALSE �� ��ȯ
*/
    
-- commission_pct �÷��� NULL ����Ÿ�� ���Ե��� �ʴ´�.(�߿�)
SELECT employee_id, commission_pct
  FROM employees
 WHERE commission_pct < 0.2;    -- 11 ��
 
-- �Ʒ� 1)NVL�Լ��̿� 2)LNNVEL�Լ��̿� ����� �����ϴ�.(NULL ����Ÿ�� ������ �κ�) 
 -- commission_pct �÷��� NULL ����Ÿ�� 0 ���� ó���ϰ�, 0.2���ٴ� ���� ���ǿ� �����Ѵ�.
-- 1)
SELECT COUNT(*)
  FROM employees
 WHERE NVL(commission_pct, 0) < 0.2;    -- 83�� (72���� NULL�� ����Ÿ ����)

-- LNNVL(commission_pct >= 0.2)
-- commission_pct >= 0.2 ���ǽĿ� �����ϴ� ����Ÿ�� �ִٸ� TRUE �� ��ȯ�ǰ�, LNNVL�Լ��� FALSE ��ȯ
-- commission_pct >= 0.2 ���ǽĿ� �������� �ʴ� ����Ÿ�� �ִ�.  
    --�� ����Ÿ�� 0.2���� ���� �ǹ�. FALSE LNNVL�Լ��� TRUE��ȯ
    -- NULL ����Ÿ. UNKNOWN ��ȯ. LNNVL�Լ��� TRUE��ȯ
-- 2) WHERE ��������   LNNVL(commission_pct >= 0.2) �� ������ TRUE�� ����Ÿ�� ��ȸ�ȴ�. 
SELECT COUNT(*)
  FROM employees
 WHERE LNNVL(commission_pct >= 0.2) ;  -- 83��.   commission_pct < 0.2 + NULL����Ÿ ����.

/*
�� NULLIF (expr1, expr2)
NULLIF �Լ��� expr1�� expr2�� ���� ������ NULL��, ���� ������ expr1�� ��ȯ�Ѵ�.
*/
SELECT NULLIF(NULL, NULL) FROM DUAL; -- �����߻�. �Ѵ� NULL �� ���
SELECT NULLIF(1, 1) FROM DUAL; -- 2���� �Ű����� ���� ������ NULL
SELECT NULLIF(1, 2) FROM DUAL;  -- 2���� �Ű����� ���� ����������, ù��° �Ű����� ���� ��ȯ�ȴ�.  1

--job_history ���̺��� start_date�� end_date�� ������ ������ �� ������ ������(���س⵵) NULL��, ���� ������ ����⵵�� ����ϴ� ������. 
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
�� GREATEST(expr1, expr2, ��), LEAST(expr1, expr2, ��)
GREATEST�� �Ű������� ������ ǥ���Ŀ��� ���� ū ����, LEAST�� ���� ���� ���� ��ȯ�ϴ� �Լ���.
*/

SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;
  
SELECT GREATEST('�̼���', '������', '�������'),
       LEAST('�̼���', '������', '�������')
  FROM DUAL;  
 /*
 �� DECODE (expr, search1, result1, search2, result2, ��, default)
DECODE�� expr�� search1�� ���� �� ���� ������ result1��, 
���� ������ �ٽ� search2�� ���� ���� ������ result2�� ��ȯ�ϰ�, 
�̷� ������ ��� ���� �� ���������� ���� ���� ������ default ���� ��ȯ�Ѵ�
*/
  
  SELECT prod_id,
         DECODE(channel_id, 3, 'Direct', 
                            9, 'Direct',
                            5, 'Indirect',
                            4, 'Indirect',
                               'Others')  decodes
  FROM sales
  WHERE rownum < 10;