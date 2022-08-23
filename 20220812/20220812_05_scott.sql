SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������",SAL"�޿�",DEPTNO"�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO =30;

--�� ���� ������ IN�����ڸ� Ȱ���Ͽ�
--   ������ ���� ó���Ҽ� ������
--   �� ������ ó�� ����� ���� ����� ��ȯ�Ѵ�
SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������",SAL"�޿�",DEPTNO"�μ���ȣ"
FROM EMP
WHERE DEPTNO IN (20 ,30);


--�� EMP���̺����� ������ CLERK�� ������� �����͸� ��� ��ȸ�Ѵ�
SELECT *
FROM EMP
WHERE ������ CLERK;

select *
from emp
where job = 'clerk';
--==>> ��ȸ ��� ����
--ã���� �ϴ� �������� ��ҹ��� ���� Ȯ����


select *
from emp
where job = 'CLERK';
--==>
/*
7369	SMITH	CLERK	7902	80/12/17	800	    	20
7876	ADAMS	CLERK	7788	87/07/13	1100		20
7900	JAMES	CLERK	7698	81/12/03	950		    30
7934	MILLER	CLERK	7782	82/01/23	1300		10
*/

--�� ����Ŭ����... �Էµ� �������� �� ��ŭ��...
--   �ݵ�� ��ҹ��� ������ �Ѵ�

--�� EMP���̺����� ������ CLERK�� ����� ��
--   20�� �μ��� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�

SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������", SAL"�޿�", DEPTNO"�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>
/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/



--�� EMP ���̺��� ������ �����͸� Ȯ���ؼ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� ���̺��� ������ �����Ѵ�
--   (������ ... EMP3)

DESCRIBE EMP;
DESC EMP;

--1. ������ ��� ���̺��� ����Ȯ��
DESCRIBE EMP;
DESC EMP;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

-- 2. ��� ���̺��� ������ ���� ���ο� ���̺� ����
CREATE TABLE EMP1
(EMPNO      NUMBER(4)
,ENAME      VARCHAR2(10)
,JOB        VARCHAR2(9)
,MGR        NUMBER(4)
,HIREDATE   DATE
,SAL        NUMBER(7,2)
,COMM       NUMBER(7,2)
,DEPTNO     NUMBER(2)
)
--==>>Table EMP1��(��) �����Ǿ����ϴ�.

-- 3.

-- 4.
INSERT INTO EMP1 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP1 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP1 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP1 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP1 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP1 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP1 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP1 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP1 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP1 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP1 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP1 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP1 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP1 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);



-- 5. Ȯ��
SELECT *
FROM EMP1;


CREATE TABLE DEPT3
( DEPTNO3 NUMBER(2) CONSTRAINT PK_DEPT3 PRIMARY KEY
, DNAME3 VARCHAR2(14)
, LOC3 VARCHAR2(13) 
) ;

CREATE TABLE EMP3
( EMPNO3 NUMBER(4) CONSTRAINT PK_EMP3 PRIMARY KEY
, ENAME3 VARCHAR2(10)
, JOB3 VARCHAR2(9)
, MGR3 NUMBER(4)
, HIREDATE3 DATE
, SAL3 NUMBER(7,2)
, COMM3 NUMBER(7,2)
, DEPTNO3 NUMBER(2) CONSTRAINT FK_DEPTNO3 REFERENCES DEPT3
);
--==>>Table EMP3��(��) �����Ǿ����ϴ�.


INSERT INTO DEPT3 VALUES   (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT3 VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT3 VALUES   (30,'SALES','CHICAGO');
INSERT INTO DEPT3 VALUES   (40,'OPERATIONS','BOSTON');
--==>>1 �� ��(��) ���ԵǾ����ϴ�. *4



INSERT INTO EMP3 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP3 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP3 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP3 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP3 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP3 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP3 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP3 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP3 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP3 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP3 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP3 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP3 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP3 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

SELECT *
FROM EMP3;
--==>>
/*
7369	SMITH	CLERK	    7902	80/12/17	800		20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	30
7566	JONES	MANAGER	    7839	81/04/02	2975		20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30
7782	CLARK	MANAGER	    7839	81/06/09	2450		10
7788	SCOTT	ANALYST	    7566	87/07/13	3000		20
7839	KING	PRESIDENT		    81/11/17	5000		10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	30
7876	ADAMS	CLERK	    7788	87/07/13	1100		20
7900	JAMES	CLERK	    7698	81/12/03	950		30
7902	FORD	ANALYST	    7566	81/12/03	3000		20
7934	MILLER	CLERK	    7782	82/01/23	1300		10
*/

SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	80/12/17	800		20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	30
7566	JONES	MANAGER	    7839	81/04/02	2975		20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30
7782	CLARK	MANAGER	    7839	81/06/09	2450		10
7788	SCOTT	ANALYST	    7566	87/07/13	3000		20
7839	KING	PRESIDENT	    	81/11/17	5000		10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	30
7876	ADAMS	CLERK	    7788	87/07/13	1100		20
7900	JAMES	CLERK	    7698	81/12/03	950		30
7902	FORD	ANALYST	    7566	81/12/03	3000		20
7934	MILLER	CLERK	    7782	82/01/23	1300		10
*/


--�� ��� ���̺��� ���뿡 ���� ���̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;


DESCRIBE TBL_EMP;



--�� ������ ���̺� ��ȸ
SELECT *
FROM TBL_EMP;


--�� DEPT ���̺��� �����Ͽ� ���� ���� TBL_DEPT ���̺��� �����Ѵ�
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;


DESCRIBE TBL_DEPT;


SELECT *
FROM DEPT;


--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_DEPT;


--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
BONUS	        TABLE	
EMP1	        TABLE	
TBL_EMP	        TABLE	
DEPT3	        TABLE	
SALGRADE	    TABLE	
EMP3	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_DEPT	    TABLE	
TBL_EXAMPLE1	TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '��� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� �� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT    	TABLE	(null)
TBL_EMP	        TABLE	��� ����
EMP1	        TABLE	(null)
EMP3	        TABLE	(null)
DEPT3	        TABLE	(null)
TBL_EXAMPLE2	TABLE	(null)
TBL_EXAMPLE1	TABLE	(null)
SALGRADE	    TABLE	(null)
BONUS	        TABLE	(null)
EMP	            TABLE	(null)
DEPT        	TABLE	(null)
*/


--�� TBL_DEPT ���̺��� ������� ���̺� ������ Ŀ��Ʈ ������ �Է�
--   �� �μ� ����
COMMENT ON TABLE TBL_DEPT IS '�μ� ����';


--�� Ŀ��Ʈ ������ �Է� �� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	�μ� ����
TBL_EMP	        TABLE	��� ����
EMP1	        TABLE	(null)
EMP3	        TABLE	(null)
DEPT3	        TABLE	(null)
TBL_EXAMPLE2	TABLE	(null)
TBL_EXAMPLE1	TABLE	(null)
SALGRADE    	TABLE	(null)
BONUS	        TABLE	(null)
EMP         	TABLE	(null)
DEPT	        TABLE	(null)
*/


--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
DEPT	        LOC	
BONUS	        COMM	
DEPT3	        DEPTNO3	
SALGRADE	    LOSAL	
EMP3	        JOB3	
TBL_DEPT	    DEPTNO	
TBL_DEPT	    DNAME	
EMP3	        HIREDATE3	
TBL_EMP	        HIREDATE	
EMP	            DEPTNO	
SALGRADE	    HISAL	
EMP	            EMPNO	
EMP1	        JOB	
DEPT	        DEPTNO	
DEPT	        DNAME	
DEPT3	        LOC3	
TBL_DEPT	    LOC	
EMP3	        EMPNO3	
TBL_EMP	        EMPNO	
TBL_EMP	        DEPTNO	
TBL_EMP	        COMM	
EMP3	        DEPTNO3	
EMP1	        EMPNO	
TBL_EXAMPLE2	NO	
EMP1	ENAME	
BONUS	JOB	
TBL_EXAMPLE1	NO	
EMP	ENAME	
EMP1	MGR	
EMP1	COMM	
EMP3	MGR3	
EMP	JOB	
TBL_EXAMPLE2	NAME	
BONUS	SAL	
EMP	SAL	
TBL_EMP	JOB	
EMP3	ENAME3	
EMP3	COMM3	
TBL_EXAMPLE1	NAME	
TBL_EMP	ENAME	
TBL_EMP	MGR	
EMP	COMM	
SALGRADE	GRADE	
TBL_EXAMPLE1	ADDR	
TBL_EXAMPLE2	ADDR	
EMP3	SAL3	
EMP	HIREDATE	
EMP1	DEPTNO	
EMP1	HIREDATE	
DEPT3	DNAME3	
EMP	MGR	
TBL_EMP	SAL	
EMP1	SAL	
BONUS	ENAME	
*/

DROP TABLE EMP3;
DROP TABLE DEPT3;

PURGE RECYCLEBIN;


--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽ��� �÷��鸸 ��ȸ)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';            --���� �߰�
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--COMMENT ON COLUMN
--COMMENT ON TABLE ���̺��� IS 'Ŀ��Ʈ';


--�� ���̺��� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ �Է�(����)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ� ��ȣ';
--==>>Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ� �̸�';
--==>>Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ� ��ġ';
--==>>Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ �����Ͱ� �Էµ� ���̺���
--   �÷� ���� Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽ��� �÷��鸸 ��ȸ_)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ� ��ȣ
TBL_DEPT	DNAME	�μ� �̸�
TBL_DEPT	LOC	�μ� ��ġ
*/


--�� TBL_EMP ���̺��� �������
--   ���̺��� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ �Է�(����)
DESC TBL_EMP;
COMMENT ON COLUMN TBL_EMP.EMPNO IS '��� ��ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB IS '����';
COMMENT ON COLUMN TBL_EMP.MGR IS '������ ��� ��ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ� ��ȣ';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	��� ��ȣ
TBL_EMP	ENAME	�����
TBL_EMP	JOB	����
TBL_EMP	MGR	������ ��� ��ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	�޿�
TBL_EMP	COMM	����
TBL_EMP	DEPTNO	�μ� ��ȣ
*/



--���� �÷� ������ �߰� �� ���� ����--
SELECT *
FROM TBL_EMP;

--(ADD : �� ���� ���� �� �÷�)--
--�� TBL_EMP ���̺��� �ֹε�Ϲ�ȣ �����͸� ���� �� �ִ� �÷� �߰� (�������� ����)
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT '01048484114'
FROM DUAL;
--==>>01048484114

SELECT 01048484114
FROM DUAL;
--==>>1048484114


--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	80/12/17	800		20	
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30	
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30	
7566	JONES	MANAGER	    7839	81/04/02	2975		    20	
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30	
7698	BLAKE	MANAGER	    7839	81/05/01	2850	    	30	
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10	
7788	SCOTT	ANALYST	    7566	87/07/13	3000		    20	
7839	KING	PRESIDENT	    	81/11/17	5000	    	10	
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30	
7876	ADAMS	CLERK	    7788	87/07/13	1100		    20	
7900	JAMES	CLERK	    7698	81/12/03	950 	    	30	
7902	FORD	ANALYST	    7566	81/12/03	3000		    20	
7934	MILLER	CLERK	    7782	82/01/23	1300		    10	
*/


DESC TBL_EMP;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)     
*/

--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ����(�߰�)�� ������ Ȯ��
--�� ���̺� ������ �÷��� ������ ���������� �ǹ� ����
SELECT *
FROM TBL_EMP;

SELECT SSN, ENAME
FROM TBL_EMP;


--���������� ���� : DROP �� �����ϴ��� ����
--�� TBL_EMP ���̺��� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ����
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>>Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� �����Ǿ����� Ȯ��

SELECT *
FROM TBL_EMP;

DELETE TBL_EMP;
--==>>14�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--> ���̺��� ����(����, Ʋ)�� �׷��� �����ִ� ���¿���
--  �����͸� ��� �ҽ�(����)�� ��Ȳ���� Ȯ��

DROP TABLE TBL_EMP;
--==>>Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> ���� �߻�
-- (ORA-00942: table or view does not exist)

--> ���̺� ��ü�� ���������� ���ŵ� ��Ȳ

--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� NULL�� ó��
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;


SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>>(null)    (null)  (null)  (null)  (null)

--�� ������ ���
--   NULL�� ������ ���� �ǹ��ϸ�... ���� �������� �ʴ� ���̱� ������
--   �� NULL�� ���꿡 ���Ե� ���...
--   �� ����� ������ NULL �̴�


--�� TBL_EMP ���̺����� Ŀ�̼�(COMM, ����)�� NULL�� ������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�
SELECT *
FROM TBL_EMP;


SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> ��ȸ ��� ����

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> ���� �߻�

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> ��ȸ ��� ����


--�� NULL�� ���� �����ϴ� ���� �ƴϱ� ������
--   �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����
--   NULL�� ������� ����� �� ���� �����ڵ�... 
--   >=, <= , = , > , < , != , <>�簰�� �ʴ� , ^=

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>
/*
SMITH	CLERK	    800	
JONES	MANAGER	    2975	
BLAKE	MANAGER	    2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	PRESIDENT	5000	
ADAMS	CLERK   	1100	
JAMES	CLERK	    950	
FORD	ANALYST	    3000	
MILLER	CLERK	    1300	
*/



--�� TBL_EMP ���̺����� 20�� �μ��� �ٹ����� �ʴ� �������� 
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�

SELECT ENAME, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO != 20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

SELECT ENAME, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO ^= 20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

--�� TBL_EMP ���̺����� Ŀ�̼��� NULL�� �ƴ� ��������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
SELECT ENAME"�����",JOB"������",SAL"�޿�",COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/


--�� TBL_EMP ���̺����� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--   ����, ����(COMM)�� �� 1ȸ �����ϸ�, ���������� ���Եȴ�

ALTER TABLE TBL_EMP 
ADD  INCOME NUMBER;

ALTER TABLE TBL_EMP
DROP COLUMN INCOME;

SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�", COMM"Ŀ�̼�" ,SAL * 12 "����"-- +, INCOME
FROM TBL_EMP;

SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�", COMM"Ŀ�̼�" ,(SAL * 12) + COMM "����"-- +, INCOME
FROM TBL_EMP;


--�� NVL()  ����Ŭ���� ���� �ι�° �Լ�
SELECT NULL "COL1", NVL(NULL,10) "COL2"
FROM DUAL;
--==>>	10

SELECT NULL "COL1", NVL(NULL,10) "COL2", NVL(5,10) "COL3"
FROM DUAL;
--==>> (null)	10	5
-- ù ��° �Ķ���� ���� NULL�̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�
-- ù ��° �Ķ���� ���� NULL�� �ƴϸ�, �� ���� �״�� ��ȯ�Ѵ�

SELECT ENAME "�����", COMM "����"
FROM TBL_EMP;

SELECT ENAME "�����", NVL(COMM,2345) "����"
FROM TBL_EMP;

SELECT ENAME "�����", NVL(COMM,0) "����"
FROM TBL_EMP;



-- A
SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�", COMM"Ŀ�̼�" ,(SAL * 12) + NVL(COMM,0) "����"
FROM TBL_EMP;

-- B
SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�", COMM"Ŀ�̼�"
        ,NVL((SAL * 12)+COMM, (SAL *12)) "����"
FROM TBL_EMP;



--�� NVL2()
--> ù ��° �Ķ���� ���� NULL�� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
--  ù ��° �Ķ���� ���� NULL�� ���, ����° �Ķ���� ���� ��ȯ�Ѵ�

SELECT ENAME "�����", NVL2(COMM, 'û��÷�', '���÷�')"����Ȯ��"
FROM TBL_EMP;


--�� TBL_EMP ���̺����� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--   ����, ����(COMM)�� �� 1ȸ �����ϸ�, ���������� ���Եȴ�
--�� NVL2() Ȱ��


SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�",COMM"Ŀ�̼�",NVL2(COMM, (SAL*12)+COMM , (SAL*12))"����"
FROM TBL_EMP;

-- A
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        , NVL2(COMM,SAL*12+COMM,SAL*12) "����"
FROM TBL_EMP;


-- B
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        ,SAL * 12 + NVL2(COMM, COMM, 0) "����"
FROM TBL_EMP;


-- �� COALESCE()
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�
--  �� �տ� �ִ� �Ű��������� ���ʷ� NULL���� �ƴ��� Ȯ���Ͽ� 
--  NULL�� �ƴ� ��� ��ȯ�ϰ�, 
--  NULL�� ��쿡�� �� ���� �Ű������� ���� ��ȯ�Ѵ�
--  NVL() �̳� NVL2()�� ���Ͽ�
--  ��~~~~~~~~~�� ����� ���� ������ �� �ִٴ� Ư¡�� ���´�


SELECT NULL "COL1"
    ,   COALESCE(NULL, NULL, NULL, 40) "COL2"
    ,   COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100)"COL3"
    ,   COALESCE(NULL, NULL, 30, NULL, NULL, 60) "COL4"
    ,   COALESCE(10, NULL, NULL, NULL, NULL, 60) "COL5"
FROM DUAL;



--�� �ǽ��� ���� ������ �߰� �Է�

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '���ִ�', 'SALESMAN', 7369, SYSDATE, 10);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '������', 'SALESMAN', 7369, SYSDATE, 10, 10);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>>Ŀ�� �Ϸ�.


--�� Ȯ��
--���� �� Ǯ�� �� ������?
SELECT *
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        ,COALESCE(NULL, COALESCE(SAL*12,0) + COALESCE(COMM,0)) "����"--SAL * 12 + NVL2(COMM, COMM, 0) "����"
FROM TBL_EMP;


--������ Ǯ��
SELECT EMPNO"�����ȣ", ENAME"�����", SAL"�޿�", COMM"����"
        , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800		        9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	    	34200
7782	CLARK	2450	    	29400
7788	SCOTT	3000	    	36000
7839	KING	5000	    	60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	    	13200
7900	JAMES	950	        	11400
7902	FORD	3000		    36000
7934	MILLER	1300	    	15600
8000	���ִ�		            	0
8001	������           10	      10
*/


--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.


--�� �÷��� �÷��� ����(����)
SELECT 1,2
FROM DUAL;

SELECT 1 +2 
FROM DUAL;

SELECT '������', '������'
FROM DUAL;

SELECT '������' + '������'
FROM DUAL;
--==>>ORA-01722: invalid number

SELECT '������' || '������'
FROM DUAL;
--==>>�����Ϻ�����


SELECT ENAME, JOB
FROM TBL_EMP;

SELECT ENAME || JOB
FROM TBL_EMP;


SELECT '�����̴�', SYSDATE, '�� ����', 500, '���� ���Ѵ�.'
FROM DUAL;
--==>>�����̴�	2022-08-12 04:02:51	�� ����	    500 	���� ���Ѵ�.
--    --------  ------------------- -------     ---     -----------
--    ����Ÿ��   ��¥Ÿ��           ����Ÿ��   ����Ÿ��  ����Ÿ��

--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>>2022-08-12 04:05:27	2022-08-12 04:05:27	22/08/12 16:05:27.000000000

SELECT '�����̴�' || SYSDATE || '�� ����' || 500 || '���� ���Ѵ�.'
FROM DUAL;
--==>>�����̴�2022-08-12 04:06:33�� ����500���� ���Ѵ�.

--�� ����Ŭ������ ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ��||���� ������ �ָ� ������ �÷��� �÷�(���� �ٸ� ������ ������)��
--   �����ϴ� ���� �����ϴ�
--   cf) MSSQL������ ��� �����͸� ���ڿ��� CONVERT �ؾ� �Ѵ�

--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--   ��SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�
--     ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
--                          :
--                          :
--
--     �������� ���� ������ 10�ε� ��� ������ 20�̴�.��
--  ��, ���ڵ帶�� ���� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�

SELECT ENAME || '�� ���� ������' 
             || COALESCE((SAL*12+COMM), (SAL*12), COMM, 0)
             || '�ε� ��� ������' 
             || (COALESCE(SAL*12+COMM, SAL*12, COMM, 0))*2 
             || '�̴�'
FROM TBL_EMP;
--==>>
/*
SMITH�� ���� ������9600�ε� ��� ������19200�̴�
ALLEN�� ���� ������19500�ε� ��� ������39000�̴�
WARD�� ���� ������15500�ε� ��� ������31000�̴�
JONES�� ���� ������35700�ε� ��� ������71400�̴�
MARTIN�� ���� ������16400�ε� ��� ������32800�̴�
BLAKE�� ���� ������34200�ε� ��� ������68400�̴�
CLARK�� ���� ������29400�ε� ��� ������58800�̴�
SCOTT�� ���� ������36000�ε� ��� ������72000�̴�
KING�� ���� ������60000�ε� ��� ������120000�̴�
TURNER�� ���� ������18000�ε� ��� ������36000�̴�
ADAMS�� ���� ������13200�ε� ��� ������26400�̴�
JAMES�� ���� ������11400�ε� ��� ������22800�̴�
FORD�� ���� ������36000�ε� ��� ������72000�̴�
MILLER�� ���� ������15600�ε� ��� ������31200�̴�
���ִ��� ���� ������0�ε� ��� ������0�̴�
�������� ���� ������10�ε� ��� ������20�̴�
*/

SELECT *
FROM TBL_EMP;
--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.


--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�
--   ��SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
--     ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
--                            :
--                            :
--     ������'s �Ի����� 2022-08-12�̴�. �׸��� �޿��� 0�̴�.��
--  ��, ���ڵ帶�� ���� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�



SELECT ENAME || '''s'
             || ' �Ի�����' 
             || HIREDATE
             || '�̴�. �׸��� �޿���'
             || COALESCE(SAL,0)
             || '�̴�.'
FROM TBL_EMP;


--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�
--   Ȭ����ǥ ��'���ϳ��� ���ڿ��� ������ ��Ÿ����
--   Ȭ����ǥ ��''���� ���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ǥ ��'���ϳ���
--   ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.


--==>>
/*
SMITH's �Ի�����1980-12-17�̴�. �׸��� �޿���800�̴�.
ALLEN's �Ի�����1981-02-20�̴�. �׸��� �޿���1600�̴�.
WARD's �Ի�����1981-02-22�̴�. �׸��� �޿���1250�̴�.
JONES's �Ի�����1981-04-02�̴�. �׸��� �޿���2975�̴�.
MARTIN's �Ի�����1981-09-28�̴�. �׸��� �޿���1250�̴�.
BLAKE's �Ի�����1981-05-01�̴�. �׸��� �޿���2850�̴�.
CLARK's �Ի�����1981-06-09�̴�. �׸��� �޿���2450�̴�.
SCOTT's �Ի�����1987-07-13�̴�. �׸��� �޿���3000�̴�.
KING's �Ի�����1981-11-17�̴�. �׸��� �޿���5000�̴�.
TURNER's �Ի�����1981-09-08�̴�. �׸��� �޿���1500�̴�.
ADAMS's �Ի�����1987-07-13�̴�. �׸��� �޿���1100�̴�.
JAMES's �Ի�����1981-12-03�̴�. �׸��� �޿���950�̴�.
FORD's �Ի�����1981-12-03�̴�. �׸��� �޿���3000�̴�.
MILLER's �Ի�����1982-01-23�̴�. �׸��� �޿���1300�̴�.
���ִ�'s �Ի�����2022-08-12�̴�. �׸��� �޿���0�̴�.
������'s �Ի�����2022-08-12�̴�. �׸��� �޿���0�̴�.
*/


SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';
--==>>
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
8000	���ִ�	SALESMAN	7369	2022-08-12			10
8001	������	SALESMAN	7369	2022-08-12		10	10
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> ��ȸ ��� ����



--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
    ,   UPPER('oRaCLe') "COL2"
    ,   LOWER('oRaCLe') "COL3"
    ,   INITCAP('oRaCLe') "COL4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
-- UPPER()�� ��� �빮�ڷ� ��ȯ
-- LOWER()�� ��� �ҹ��ڷ� ��ȯ
-- INITCAP()�� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ


--�� �ǽ��� ���� �߰� ������ �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '�¹̴�', 'salesman', 7369, SYSDATE, 20, 100);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

-- �� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_EMP ���̺��� ������� �˻����� 'sALeSmAN'�� ��������
--   �������(�������)�� �����ȣ, �����, �������� ��ȸ�Ѵ�.
-- Ŭ���̾�Ʈ�� ��ҹ��� ���� ������ �� �������� ��� �ۼ��ϴ���????


SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmaN') OR JOB =UPPER('SAlesman'); 

SELECT �����ȣ, �����, ������
FROM TBL_EMP
WHERE ������ 'sALeSmAN';

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	���ִ�	SALESMAN
8001	������	SALESMAN
*/

--==> ��ҹ��� ���� ���ϰ� �ۼ��ϴ� ������
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAN');


--�� TBL_EMP ���̺����� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�
SELECT �����, ������, �Ի���
FROM TBL_EMP
WHERE �Ի����� 1981�� 9�� 28��;

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = '1981-9-28';
--==>>MARTIN	SALESMAN	1981-09-28

DESC TBL_EMP;

--�� TO_DATE()
--���ڿ� �� ��¥

SELECT  ENAME "�����", JOB"������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');


-- �� TBL_EMP ���̺����� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)
--   �Ի��� ������ �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.



SELECT �����,������, �Ի���
FROM TBL_EMP
WHERE �Ի����� 1981�� 9�� 28�� ����;


SELECT ENAME,JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE�� 1981�� 9�� 28�� ����;

SELECT ENAME,JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE�� TO_DATE('1981- 09-28', 'YYYY-MM-DD') ����;

SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
���ִ�	SALESMAN	2022-08-12
������	SALESMAN	2022-08-12
�¹̴�	salesman	2022-08-12
*/

--�� ����Ŭ������ ��¥ �������� ũ�� �񱳰� �����ϴ�.
--   ����Ŭ������ ��¥ �����Ϳ� ���� ũ�� �� ��
--   ���ź��� �̷��� �� ū ������ �����Ѵ�


--�� TBL_EMP ���̺����� �Ի����� 1981�� 4�� 2�� ����
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)
SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE  HIREDATE >=TO_DATE('1981-04-02','YYYY-MM-DD') AND HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');

SELECT ENAME, HIREDATE
FROM TBL_EMP;

--WHERE TO_DATE('1981-04-02','YYYY-MM-DD') <= HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');