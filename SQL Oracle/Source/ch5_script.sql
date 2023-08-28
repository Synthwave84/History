-- �����Լ�
/*
�����Լ��� ��� �����͸� Ư�� �׷����� ���� ���� �� �׷쿡 ���� ����, ���, �ִ�, �ּڰ� ���� ���ϴ� �Լ��� ���Ѵ�
*/

/*
�� COUNT (expr)
COUNT�� ���� ��� �Ǽ�, 
�� ��ü �ο� ���� ��ȯ�ϴ� ���� �Լ���. 
���̺� ��ü �ο�� ���� WHERE �������� �ɷ��� �ο� ���� ��ȯ�Ѵ�.
*/

-- ������̺��� ������ ���� ��ȸ
-- * (�ֽ��׸���ũ, ASTERISK)
SELECT COUNT(*)
  FROM employees;    -- 107��

SELECT COUNT(*) FROM employees;

-- �Ű������� �÷����� ��밡���ϴ�. �÷����� PRIMARY KEY(UNIQUE + NOT NULL) �ش��ϴ� ���� ����
SELECT COUNT(employee_id)   -- 107��
  FROM employees;
 
 -- department_id�÷��� NULL ���, ���� NULL �� ���������� �����Ѵ�. 
SELECT COUNT(department_id)
  FROM employees;     --  106��(NULL ����Ÿ 1���� ����)
  
-- NULL�� �����͸� ���
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

--  DISTINCT department_id : �÷��� �ߺ��� ����Ÿ�� �ߺ�����Ÿ�� �����ؼ� �� 1���� ����Ÿ�� ����. 
SELECT COUNT(DISTINCT department_id)
  FROM employees;    -- 11�� = �μ��� ����
  
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES
ORDER BY 1 ASC;

-- 11���� �μ��ڵ带 ��ȸ
SELECT DISTINCT department_id
  FROM employees
  ORDER BY 1;  -- 1 �� �ǹ̴� SELECT���� ù��° �÷����� ���ڷ� ��Ű���� �ǹ�.
  
-- DISTINCT ����
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

-- COL1, COL2 �÷�2���� ���ÿ� �����ϴ� ����Ÿ�� �ߺ��� ����Ÿ�� �����ؼ� �ϳ��� ó��.
SELECT DISTINCT COL1, COL2 FROM TEST_06;

SELECT DISTINCT COL1, COL2, COL3 FROM TEST_06;

/*
�� SUM(expr)
SUM�� expr�� ��ü �հ踦 ��ȯ�ϴ� �Լ��� �Ű����� expr���� �������� �� �� �ִ�. 
��� ���̺��� �޿��� �������̹Ƿ� �� ����� �޿� �Ѿ��� ���� ����.
*/

-- ����� ��ü �޿��Ѿ��� ��ȸ����.  
SELECT SUM(salary)
  FROM employees;  
  
SELECT SUM(salary), SUM(DISTINCT salary)
  FROM employees;    
  
/*
�� AVG(expr)
AVG�� �Ű����� ���³� ���ӻ��� COUNT, SUM�� �����ϸ� ��հ��� ��ȯ�Ѵ�.
*/

SELECT AVG(salary), AVG(DISTINCT salary)
  FROM employees;     

/*
�� MIN(expr), MAX(expr)
MIN�� MAX�� ���� �ּڰ��� �ִ��� ��ȯ�Ѵ�. (�÷���) ����
*/
-- �޿��� ���� �����ݾװ� �����ݾ��� ��ȸ�϶�.
SELECT MIN(salary), MAX( salary)
  FROM employees;       
  
SELECT MIN(DISTINCT salary), MAX(DISTINCT salary)
  FROM employees;       
 /*
 �� VARIANCE(expr), STDDEV(expr)
VARIANCE�� �л���, STDDEV�� ǥ�������� ���� ��ȯ�Ѵ�
*/
SELECT VARIANCE(salary), STDDEV(salary)
  FROM employees; 
  
-- GROUP BY �� HAVING ��
/*
 ��� ��� ��ü�� �������� �����͸� �����ߴµ�, ��ü�� �ƴ� Ư�� �׷����� ���� �����͸� ������ ���� �ִ�. 
 �̶� ���Ǵ� ������ �ٷ� GROUP BY ���̴�. 
 �׷����� ���� �÷����̳� ǥ������ GROUP BY ���� ����ؼ� ����ϸ� GROUP BY ������ WHERE�� ORDER BY�� ���̿� ��ġ�Ѵ�.
 */
 
-- ����? �� �μ��� ������� �޿� �Ѿ��� ��ȸ�϶�.
SELECT DEPARTMENT_ID, SALARY 
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC;

-- GROUP BY ��ɾ ����ϸ�, SELECT ���� ����÷��� ������ �ִ�.(�߿�)
-- �� ���������� �ϴܿ� EMP_NAME �� ������ GROUP BY �� ��ɾ� ����� �ؾ��ϴµ�,
-- EMP_NAME�� 107���� �Ǿ� �������� �ǺΤ̤������ϴ�.
-- GROUP_BY�� ������ �÷���, �����Լ��� ����� �÷��� SELECT ���� ����� �����ϴ�.

SELECT DEPARTMENT_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC;







SELECT department_id, SUM(salary)
  FROM employees    -- 107��
 GROUP BY department_id -- �μ��ڵ尡 ���� ����Ÿ���� �׷�ȭ �۾��� �ϰ�, �������
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


-- ����? 2013�� ����Ÿ�� ������, ������ ������� �� �ܾ��� ���� ����.
-- 2013�� ����(WHERE),  ������(GROUP BY), SUM(LOAN_JAN_AMT)

-- 1) 2013�⵵ ������ ����
SELECT *
FROM kor_loan_status
WHERE period LIKE '2013%';

-- 2) ������ �׷�ȭ�۾�
SELECT REGION,SUM(LOAN_JAN_AMT)
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY REGION -- SELECT ���� ������ �Ǿ� �ִ�.( �׷�ȭ�� �÷�, �����Լ� ���� ��밡��)
ORDER BY REGION;
/* 17��
����	36543.3
���	564291.9
�泲	112370.5
���	63313.9
����	51193.3
�뱸	85097.8
����	61804.1
�λ�	137658.8
����	667047.6
����	8406.3
���	42748.5
��õ	139925
����	40398.9
����	51823.3
����	14366.8
�泲	65006.8
���	40855.3
*/

-- ����? 2013�� ����Ÿ�� ������,  [����, ������] ������� �� �ܾ��� ���� ����.
SELECT period, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, region    -- 2���� �÷��� ���ÿ� ��ġ�Ǵ� ����Ÿ�� ��� �׷�ȭ�ϴ� �ǹ�.
 ORDER BY period, region; 
 /* 34��
 201310	����	18190.5
201310	���	281475.5
201310	�泲	55814.4
201310	���	31391
201310	����	25421.5
201310	�뱸	42284.6
201310	����	30685
201310	�λ�	68401.4
201310	����	332984.9
201310	����	4141.5
201310	���	21259.7
201310	��õ	69796
201310	����	20086.2
201310	����	25761.6
201310	����	7136.5
201310	�泲	32337.1
201310	���	20326.5
201311	����	18352.8
201311	���	282816.4
201311	�泲	56556.1
201311	���	31922.9
201311	����	25771.8
201311	�뱸	42813.2
201311	����	31119.1
201311	�λ�	69257.4
201311	����	334062.7
201311	����	4264.8
201311	���	21488.8
201311	��õ	70129
201311	����	20312.7
201311	����	26061.7
201311	����	7230.3
201311	�泲	32669.7
201311	���	20528.8
*/
-- ������̺��� JOB_ID���� ��ձ޿����� ��ȸ�϶�.
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID;




-- 2013�� 11�� ����Ÿ�� ������,  �� ��������  �� �ܾ��� ��ȸ����.
SELECT region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period = '201311'  -- 2013�� 11�� ����Ÿ
 GROUP BY region
 ORDER BY region;  
 
-- ���� ����Ÿ �� ����ݾ��� 100000 ���� ū ���� ��ȸ�϶�.
SELECT period, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period = '201311' 
 GROUP BY period, region
 HAVING SUM(loan_jan_amt) > 100000 -- GROUP BY�� ����Ÿ��  ���ǽ�
 ORDER BY region;
 
 -- �� �μ��� �ο����� ��ȸ�϶�. �μ��ڵ�, COUNT(*)
 -- �ο����� 10������ ������ ��ȸ.
 SELECT DEPARTMENT_ID, COUNT(*)
 FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 HAVING COUNT(*) <= 10      -- GROUP BY�� �׷�ȭ�� ����Ÿ�� ������� ���ǽ� ���� HAVING �����.
 ORDER BY DEPARTMENT_ID;
 
 -- DEPARTMENT_ID, JOB_ID ���� ��ձ޿����� ��ȸ�϶�. �Ҽ��κ� 2�ڸ�����
 SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) "�����", ROUND(AVG(SALARY), 2) "��ձ޾�"
 FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID, JOB_ID
 ORDER BY DEPARTMENT_ID, JOB_ID;
 
 
 
 
-- ROLLUP�� CUBE
/*
ROLLUP�� CUBE�� GROUP BY������ ���Ǿ� �׷캰 ����Ÿ, �Ұ�� ��ü�հ赵 �߰��� ���� �ִ� ������ �Ѵ�.
*/

-- GROUP BY������ ���Ǿ� �׷캰 ����Ÿ. [�Ⱓ+��������] �� �����Ѿ��� ��ȸ�Ѵ�.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, gubun
 ORDER BY period; 
 /*
201310	��Ÿ����	676078
201310	���ô㺸����	411415.9
                    �Ұ� (676078 + 411415.9) -> �߰�1
201311	��Ÿ����	681121.3
201311	���ô㺸����	414236.9
                    �Ұ� (681121.3 + 414236.9) -> �߰�2
                    ��ü�հ� (�߰�1 + �߰�2)
*/
 /*
 ROLLUP(expr1, expr2, ��)
ROLLUP�� expr�� ����� ǥ������ �������� ������ ���, �� �߰����� ���� ������ ���� �ش�. 
ROLLUP ���� ����� �� �ִ� ǥ���Ŀ��� �׷��� ���, 
�� SELECT ����Ʈ���� ���� �Լ��� ������ �÷� ���� ǥ������ �� �� ������, ����� ǥ���� ���� ����(�����ʿ��� ���� ������)�� ���� �������� ������ ����� ��ȯ�ȴ�. 
ǥ���� ������ n���̸� n+1 ��������, ���� �������� ���� ���� ������ �����Ͱ� ����ȴ�. 
������������ ���������� ���� �����ȴ�.(n+1)
*/

-- ROLLUP(�÷�1, �÷�2) : �÷��� ���� 2 + 1 = 3
-- �������� -> �������� : �� 3���� ��������Ÿ ���

 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(period, gubun); 
 /*
 201310	��Ÿ����	676078
201310	���ô㺸����	411415.9
201310		1087493.9 (�Ⱓ���Ұ�)
201311	��Ÿ����	681121.3
201311	���ô㺸����	414236.9
201311		1095358.2(�Ⱓ���Ұ�)
		2182852.1
 */
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(gubun, period ); -- �÷� ������ �����(�߰����� �Ұ� Ʋ��)
 /*
 201310	��Ÿ����	676078
201311	��Ÿ����	681121.3
	��Ÿ����	1357199.3   (���������� �Ұ�)
201310	���ô㺸����	411415.9
201311	���ô㺸����	414236.9
	���ô㺸����	825652.8 (���������� �Ұ�)
		2182852.1
*/        

/*
����(partial) ROLLUP ����
���� ���, 
1)GROUP BY expr1, ROLLUP(expr2, expr3)�� ����ߴٸ�, 
������ ��2+1=3�������� ������ ����� 
       (expr1, expr2, expr3), : (3����) ����
       (expr1, expr2),    (2����)  �Ұ�
       (expr1)            (1����)  ������ �Ұ�
       �߿�>��ü �հ�� ������� �ʴ´�. 

       
2)GROUP BY ROLLUP(expr1, expr2)  : �÷����� 2 + 1 = 3����
   - (expr1, expr2) : (3����) ����
   - (expr1)  : (2����)  �Ұ�
   - ��ü�հ� ǥ�� (1����)  ��ü
*/

 -- �κ�(PARTIAL) ROLLUP���� : ��üǥ�ô� ����.
 --1)
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, ROLLUP( gubun );  -- �÷� 1�� + 1 = 2����
 
 /*
 (period, gubun)  : (2����) ����
 (period) : (1����) �Ұ�
 */
 
 --2) ��üǥ�� �ȵ�.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(period), gubun ;  -- ���� �����
 /*
 �÷� 1�� + 1 = 2����
 (period, gubun) : (2����)
 (gubun) : (1����) �Ұ�
 */
 
 
 /*
 CUBE(expr1, expr2, ��)
CUBE�� ROLLUP�� ����ϳ� ������ �ణ �ٸ���. 
ROLLUP�� �������� ������ ���踦 �ߴٸ�, 
CUBE�� ����� ǥ���� ������ ���� ������ ��� ���պ��� ������ ����� ��ȯ�Ѵ�. 
CUBE�� 2��(expr ��)���� ��ŭ �������� ���� �ȴ�. 

CUBE(expr1, expr2, expr3)
���� ���, expr ���� 3�̸�, ���� ����� ������ �� 2^3(�÷��� ��) = 8���� �ȴ�.
������ ������ ������ �� 8���� ǥ�õȴ�.

- (expr1, expr2, expr3) - (����3)
- (expr1, expr2) - (����2)
- (expr1, expr3) - (����2)
- (expr2, expr3) - (����2)
- (expr1)  - (����1)
- (expr2) - (����1)
- (expr3) - (����1)
- ��üǥ�� : ���̺��� ��ü����Ÿ �Ǵ� ������ ����Ǿ��� �� �ܼ� ���  - (����4)
*/
 
 
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY CUBE(period, gubun) ;  --  2�� 2(�÷� ����)�� = 4
 /*
 ���� 4�� ǥ��
 
 - (period, gubun)  : (3����)
 - (period) : (2-1����)
 - (gubun) : (2-2����)
 - ��üǥ�� : (1����)
 */
 /*
                    2182852.1
        ��Ÿ����	    1357199.3
        ���ô㺸����	825652.8
201310		        1087493.9
201310	��Ÿ����	    676078
201310	���ô㺸����	411415.9
201311		        1095358.2
201311	��Ÿ����	    681121.3
201311	���ô㺸����	414236.9
*/

-- ��ü ������ Ȯ��
 SELECT SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%';  -- 2182852.1
 
 
 /*
 ���� CUBE ������ ����� �� �ִ�.  ��ü ǥ�þȵ�.
 ���� ��� GROUP BY expr1, CUBE(expr2, expr3)�� ������� ��, 
    (expr1, expr2, expr3), - (����3)
    (expr1, expr2), - (����2)
    (expr1, expr3), - (����2)
    (expr1) - (����1)
    
    �� 4����(2^2^) �������� ����ȴ�.
 */
  
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period, CUBE( gubun );
 /*
 ���� ���� : 2��. 2�� 1��(�÷� ����)
 - (period, gubun) - (����2)
 - (period) - (����1)
 
 */
-- https://thebook.io/006696/0132/ �ּҿ� rollup, cube ���� ��������. 
 
-- ���� ������
/*
UNION, UNION ALL, INTERSECT, MINUS�� �ִ�.

������ ������ ����̹Ƿ� ���� �����ڸ� ����� �� ������ ������ ���� �� �� �̻��� ����� �� �ִ�. 
�� ���� ���� SELECT���� ������ �� �ٸ� �ϳ��� ������ ����� ������ �ϴ� ���� ���� �����ڴ�. 
���� �����ڴ� ��â ���� ����� ����, �� ������, ������, ������, �����հ� ������ ����. 
*/

/*
UNION
UNON�� �������� �ǹ��Ѵ�. ���� ���, �� ���� ������ ������ ������ �� ���� ����(SELECT ���)�� ��� ������ ����� ��ȯ�ȴ�
�������� �������� �ϳ��� ����� �������.
*/


-- exp_goods_asia ���̺��� ������ �ѱ��� �Ϻ��� �ֿ� 10�� ����ǰ
CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));
       
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6,  '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7,  '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8,  'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9,  '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10,  'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

COMMIT;

-- 1)
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
 ORDER BY seq;

-- 2)
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'
 ORDER BY seq;
 
-- 1)�� 2)�� SELECT���� �������� �������� �ϳ��� ������¸� ��ȸ
-- ORDER BY SEQ ������ ���ܵ� �� üũ
-- UNION : 20���� ����Ÿ�� �ߺ��� �κ��� ����, �ϳ��� ó���ؼ� 15�� ���
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION -- �ߺ��� ����Ÿ �����ؼ� �ϳ��� ���
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';
 
 -- �����, �������� SELECT �� ��밡��
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'  
UNION -- 1
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';  
 UNION -- 2
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION -- 3
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';
 
 

-- UNION ALL : �ߺ��� ����Ÿ�� �������� �ʰ�, �����Ͽ� ���.  20��
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION ALL
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';
 
 
 /*
 ���� : �ߺ��� ����Ÿ�� �������� ���� ���¿��� UNION , UNION ALL �� �� �ӵ��� ���� �����ϱ�? UNION ALL(����)
 */
 
 /*
 INTERSECT
INTERSECT�� �������� �ƴ� �������� �ǹ��Ѵ�. �� ������ ���տ��� ����� �׸� ������ ����.
*/
 -- �ѱ��� �Ϻ��� �������� ��ġ�� ����ǰ���� ��ȸ�϶�.
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
INTERSECT
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'; 

/*
MINUS
MINUS�� �������� �ǹ��Ѵ�. �� �� ������ ������ �������� �ٸ� ������ ���հ� ����� �׸��� ������ ����� ������ ����.
*/
 
-- �ѱ��� �����ϴ� ǰ�� 
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
MINUS
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';  
 
 -- �Ϻ��� �����ϴ� ǰ��
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'
MINUS
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�';   
 
 
 --  ���� �������� ���ѻ���
/*
�� ���� �����ڷ� ����Ǵ� �� SELECT���� SELECT ����Ʈ�� ������ ������
Ÿ���� ��ġ�ؾ� �Ѵ�
*/
-- �����߻�.
SELECT goods        -- �÷� 1��
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION 
SELECT seq, goods   -- �÷� 2��
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'; 
 
 -- ���� ���������� ������ ������ ���� �ۼ��ؾ� �Ѵ�.
SELECT seq, goods       -- �÷� 2��
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
INTERSECT
SELECT seq, goods       -- �÷� 2��
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';  
 
 -- SELECT �׸��� ������ Ÿ�Ե� ��ġ���Ѿ� �Ѵ�.
 -- �����߻� : �÷��� ������ ������, Ÿ���� �ٸ���.
SELECT seq  -- �÷� 1��. ����ŸŸ�� NUMBER
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION
SELECT goods    -- �÷� 1��. ����ŸŸ�� VARCHAR2(80)
  FROM exp_goods_asia
 WHERE country = '�Ϻ�';   
 
 /*
 �� ���� �����ڷ� SELECT ���� ������ �� ORDER BY���� �� ������ ���忡����
����� �� �ִ�
*/
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
 ORDER BY goods -- ù��° SELECT���� ORDER BY������ ����Ҽ��� ����.
UNION
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'; 
 
 -- ���� ������ �����ϸ� ������ ����.
 SELECT goods
  FROM exp_goods_asia
 WHERE country = '�ѱ�'
UNION
SELECT goods
  FROM exp_goods_asia
 WHERE country = '�Ϻ�'
  ORDER BY goods;  -- ������ SELECT���� ORDER BY������ ����� �����ϴ�.
  
/*
�� BLOB, CLOB, BFILE Ÿ���� �÷��� ���ؼ��� ���� �����ڸ� ����� �� ����
�� UNION, INTERSECT, MINUS �����ڴ� LONG�� �÷����� ����� �� ����
*/

/*
GROUPING SETS ��
GROUPING SETS�� ROLLUP�̳� CUBEó�� GROUP BY ���� ����ؼ� �׷� ������ ���Ǵ� ���̴�. 
�� �� �� �������� �Ұ��ϴ� ������ GROUPING SETS ���� �׷� �����̱� �ϳ� UNION ALL ������ ���� �ֱ� �����̴�. 
���� ���, 
GROUPING SETS (expr1, expr2, expr3)�� GROUP BY ���� ������� ��, ��ȣ �ȿ� �ִ� �� ǥ���ĺ��� ���� ���谡 �̷������. 
�� ���� ����� ((GROUP BY expr1) UNION ALL (GROUP BY expr2) UNION ALL (GROUP BY expr3)) ���°� �ȴ�.
*/


 
-- GROUPING SETS
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY GROUPING SETS(period, gubun);
 
 -- ���� ������ GROUP BY period UNION ALL GROUP BY gubun ���°� �ȴ�.

/*
�� ������ GROPUPING SETS ���� period, gubun�� ����ؼ� ���� �հ�, ���� ������ �հ踸 ����Ǿ� ��ȸ�Ǿ���
*/

SELECT period, gubun, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
   AND region IN ('����', '���')
 GROUP BY GROUPING SETS(period, (gubun, region)); 
 /*
 �� ������ GROUPING SETS(period, (gubun, region))�̶�� ����ߴµ� ���� ���� Ǯ�� ����, 
 GROUP BY period UNION ALL GROUP BY (gubun, region)���� ���谡 �Ǿ���. 
 �� ���� �����(��������, ����) ���谡 UNION ALL�� ����Ǿ� ����� ��ȸ�� ���̴�.
 */
 