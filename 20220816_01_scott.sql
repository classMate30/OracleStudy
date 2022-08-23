--��TBL_EMP ���̺��� �Ի����� 1981 4�� 2�Ϻ��� 
--1981�� 9�� 28�� ���̿� �Ի��� �������� �����,������,�Ի��� ��ȸ(�ش��� ����)

SELECT *
FROM TBL_EMP;

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE TO_DATE('1981-04-02','YYYY-MM-DD') <= HIREDATE 
      AND HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

--��Between A AND B

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD') 
      AND TO_DATE('1981-09-28','YYYY-MM-DD');

/*
JONES	MANAGER	1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	1981-05-01
CLARK	MANAGER	1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--��TBL_EMP ���̺��� �޿��� 2450���� 3000������ �������� ��� ��ȸ

SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;

--��TBL_EMP ���̺��� 'C'�� �����ϴ� �̸����� 'S'�� �����ϴ� �̸��ΰ��
SELECT*
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';

--SMITH �� SCOTT�� �ȳ����� ������ �Ѵ� ���������� S���� �ڿ� �ֱ⶧���̰�
--CLARK�� ���������� C���� �ڿ��ֱ⿡ ���°�

--��BETWEEN A AND B �� ��¥�� ������, ������ ������ ��ο� ����ȴ�.
--�� �������� ��� �ƽ�Ű�ڵ� ������ ������ ������(������ �迭)
-- �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
-- ���� BETWEEN A AND B�� �ش� ������ ����Ǵ� ��������
-- ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ���� ó���ȴ�.

--�ƽ�Ű �ڵ忡 ������ �ҹ��ڴ� �빮�ں��� ���Ŀ� �����Ƿ�
--�̸��� �빮�ڷ� ������������� S�� �����ϴ� ��� �̸��� ������ �ϰ�ʹٸ�
--�ƽ�Ű �ڵ忡 ���� �ҹ��� s �� BETWEEN 'C' AND 's' �� �θ�
--S�� �����ϴ� �̸����� ������ �ȴ�.

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
    OR JOB = 'CLERK';

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN','CLERK');

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN','CLERK');
/*
SMITH	CLERK	800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	1100
JAMES	CLERK	950
MILLER	CLERK	1300
�迵��	SALESMAN	
�ֳ���	SALESMAN	

������ ����� ����.
�� ������ OR �������� ���� ������ ó���ȴ�.
���� �޸𸮿� ���� ������ �ƴ� CPU�� ���� �����ϻ�
�� �κб��� ������ �������� �����ϴ°��� ���Ǿ���
INT = ANY ��� OR�� ����Ǿ� ����ó����
*/

DROP TABLE TBL_SAWON;

PURGE RECYCLEBIN;

--���߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
(SANO NUMBER(4)
,SANAME VARCHAR2(30)
,JUBUN CHAR(13)
,HIREDATE DATE DEFAULT SYSDATE
,SAL NUMBER(10)
);

--������ ���̺� �������Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '����', '9409252234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '�躸��', '9809022234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '���̰�', '9810092234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '���α�', '9307131234567', TO_DATE('1998-05-13', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '������', '7008161234567', TO_DATE('1998-05-13', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '9309302234567', TO_DATE('1999-10-10', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0302064234567', TO_DATE('2010-10-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '�μ���', '6807102234567', TO_DATE('1998-03-20', 'YYYY-MM-DD'), 1500);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '6710261234567', TO_DATE('1998-03-20', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '������', '6511022234567', TO_DATE('1998-12-20', 'YYYY-MM-DD'), 2600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '���켱', '0506174234567', TO_DATE('2011-10-10', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '���ù�', '0102033234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 2400);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '����', '0210303234567', TO_DATE('2011-10-10', 'YYYY-MM-DD'), 2800);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '�ݺ���', '9903142234567', TO_DATE('2012-11-11', 'YYYY-MM-DD'), 5200);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '������', '9907292234567', TO_DATE('2012-11-11', 'YYYY-MM-DD'), 5200);
COMMIT;


SELECT *
FROM TBL_SAWON;
/*
1001	����	    940925 2234567	2005-01-03	3000
1002	�躸��	    980902 2234567	1999-11-23	2000
1003	���̰�	    981009 2234567	2006-08-10	4000
1004	���α�	    930713 1234567	1998-05-13	2000
1005	������	    700816 1234567	1998-05-13	1000
1006	������	    930930 2234567	1999-10-10	3000
1007	������	    030206 4234567	2010-10-23	4000
1008	�μ���	    680710 2234567	1998-03-20	1500
1009	������	    671026 1234567	1998-03-20	1300
1010	������	    651102 2234567	1998-12-20	2600
1011	���켱	    050617 4234567	2011-10-10	1300
1012	���ù�	    010203 3234567	2010-10-10	2400
1013	����	        021030 3234567	2011-10-10	2800
1014	�ݺ���	    990314 2234567	2012-11-11	5200
1015	������	    990729 2234567	2012-11-11	5200
*/

--�۰��� ������ ��ȸ
SELECT *
FROM TBL_SAWON
WHERE SANAME = '����';

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '����';
--1001	����	9409252234567	2005-01-03	3000

--LIKE : �λ� -> ~�Ͱ��� ,~ó��

--WILD CARD(CHARACTER) -> %
-- LIKE�� �Բ� ���Ǵ� % �� ��� ���ڸ� �ǹ��Ѵ�.
-- LIKE�� �Բ� ���Ǵ� _ �� �ƹ����� �Ѱ��� �ǹ��Ѵ�.

--��TBL_SAWON���� ������ �� ���� ����� 
-- ����� �ֹι�ȣ �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--���ڰ� �ڿ� ��� ����ڰ� �ǵ� ������ٴ� %

--��TBL_SAWON ���� ������ �� ���� ����� 
--�����,�ֹι�ȣ,�޿� �׸� ��ȸ

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
/*
������	7008161234567	1000
������	0302064234567	4000
*/

--��TBL_SAWON ���̺��� ����� �̸��� ������ ������ �����
-- �����,�ֹι�ȣ,�޿� �׸� ��ȸ
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--%�� �ص� ������� ����
/*
�ݺ���	9903142234567	5200
������	9907292234567	5200
*/


--��TBL_SAWON�� �߰�������
DESC TBL_SAWON;
INSERT INTO TBL_SAWON(SANO,SANAME,JUBUN,HIREDATE,SAL)
VALUES(1016,'���̰�','0605063234567',TO_DATE('2015-01-20','YYYY-MM-DD'),1500);

SELECT *
FROM TBL_SAWON;

COMMIT;


--��TBL_SAWON ���̺��� ����� �̸��� �̶�� ���ڰ�
-- �ϳ��� ���ԵǾ� �ִٸ� �� ����� 
-- �����ȣ,�����,�޿��׸� ��ȸ

SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
/*
1005	������	1000
1006	������	3000
1007	������	4000
1008	�μ���	1500
1016	���̰�	1500
*/

--��TBL_SAWON ���̺��� ����� �̸��� �� ��� ���ڰ� �ι� ����ִ� �����
-- �����ȣ,�����,�޿� �׸� ��ȸ
SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
/*
1007	������	4000
1016	���̰�	1500
*/

--��TBL_SAWON ���̺��� ����� �̸��� �� ��� ���ڰ�
--�������� �ι� ����ִ� �����
--�����ȣ,�����,�޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';

--��� �߰��̸��� �� �� ����� ������ �˻�
SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '_��_';

SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '_��%'; --���� ������ ���� ����
/*
1002	�躸��	2000
1014	�ݺ���	5200
*/

--��TBL_SAWON���� ������ �� ���� ����� ������ 

SELECT SANO,SANAME,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--���� �� ���찡 ���̹Ƿ� �̷���츦 �����
--���̺��� ���÷��� �̸��÷��� �и��ؼ� �����ϴ°� ����


--��TBL_SAWON ���̺��� ���������� 
--�����, �ֹι�ȣ,�޿� �׸��� ��ȸ�Ѵ�.

SELECT *
FROM TBL_SAWON;

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' 
     OR JUBUN LIKE '______4%';

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE JUBUN NOT LIKE '______1______' 
AND NOT JUBUN LIKE '______3______';
/*
����	9409252234567	3000
�躸��	9809022234567	2000
���̰�	9810092234567	4000
������	9309302234567	3000
������	0302064234567	4000
�μ���	6807102234567	1500
������	6511022234567	2600
���켱	0506174234567	1300
�ݺ���	9903142234567	5200
������	9907292234567	5200
*/

--�۽ǽ� ���̺� ����(TBL_WATCH)

CREATE TABLE TBL_WATCH
( WATCH_NAME VARCHAR2(20) 
, BIGO       VARCHAR2(100)
);

INSERT INTO TBL_WATCH(WATCH_NAME,BIGO)
VALUES('�ݽð�','���� 99.99% ������ �ְ�� �ð�');

INSERT INTO TBL_WATCH(WATCH_NAME,BIGO)
VALUES('���ð�','�� ������ 99.99���� ȹ���� �ְ��� �ð�');

COMMIT;

SELECT *
FROM TBL_WATCH;

--��TBL_WATCH ���̺��� BIGO �÷�����
-- 99.99% ��� ���ڰ� ���Ե� ���� �����͸� ��ȸ

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--\������ ���¹��ڸ� wild card���� Ż����Ѷ� ��� �ǹ�
--$,@ �� ��κ��� Ư������ ���ε� �����ϴ�. �ٸ� ����������
--������� �ʴ� Ư�����ڸ� ���°� ����.

--��ESCAPE�� ���� ������ ���� �ѱ��ڸ� ���ϵ� ī�忡�� Ż����Ѷ�..
--�Ϲ������� ��� �󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.


---------------------------------------------------------

---���� COMMIT / ROLLBACK ����---
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�۵����� �Է�
INSERT INTO TBL_DEPT VALUES(50,'���ߺ�','����');
--�̷��� ����ҽ� �ϳ��� ���� �ְų� �׷��� �� �� ����.
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

--50�� ���ߺ� ����..
--�� �����ʹ� TBL_dEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
--�޸�(RAM)�� �Էµ� ���̴�.

--�۷ѹ�
ROLLBACK;

SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/
-->50�� ���ߺ� ���� ������ �����Ͱ� �ҽ�

--�۴ٽ� �������Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�','����');

SELECT *
FROM TBL_DEPT;

--50�� ���ߺ� ����..
--�� �����ʹ� TBL_dEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
--�޸�(RAM)�� �Էµ� ���̴�. �̰� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
--COMMIT�� �����ؾ� �Ѵ�.

--Ŀ��
COMMIT;

ROLLBACK;

SELECT *
FROM TBL_DEPT;
--ROLLBACK�� ������������
--50�� ���ߺ� ���� �� �����ʹ� �������� �ʾҴ�.

--��COMMIT�� ������ ���ķ� DML ����(INSERT, UPDATE,DELETE)�� ����
--����� �����͸� ����� �� �ִ� ���ϻ�..
--DML ����� ������� COMMIT�� �����ϰ� ���� ROLLBACK�� �����ص�
--�ƹ��͵� ������ �ʴ´�.

--�۵����� ����(UPDATE -> TBL_DEPT)

UPDATE TBL_DEPT  --1
SET DNAME = '������', LOC = '���' --3
WHERE DEPTNO = 50; --50�� ���� ã�Ƽ� �޸𸮿� �ۿø���. --2
--1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
--WHERE�� ������� ��� DNAME�� �����η� �ٲ�� ��� LOC�� ���� �ٲ��.

ROLLBACK;
--�ѹ�

UPDATE TBL_DEPT  --1
SET DNAME = '������', LOC = '��õ' --3
WHERE DEPTNO = 50; --50�� ���� ã�Ƽ� �޸𸮿� �ۿø���. --2

SELECT *
FROM TBL_DEPT;

COMMIT;

--�۵����� ����(DELETE -> TBL_DEPT)

SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;

DELETE 
FROM TBL_DEPT
WHERE DEPTNO = 50;

ROLLBACK;

SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;

COMMIT;
--�ϵ��ũ���� ����

--���� ORDER BY �� ����----

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP;
/*
SMITH	20	CLERK	800	9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	2850	34200
CLARK	10	MANAGER	2450	29400
SCOTT	20	ANALYST	3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	950	11400
FORD	20	ANALYST	3000	36000
MILLER	10	CLERK	1300	15600
*/
SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO ASC; --ASC(��������)
--DEPTNO = ���ı��� : �μ���ȣ
--ASC = �������� : ��������
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/
SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO; --ASC(��������) ��������

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO DESC; --(��������)
/*
BLAKE	30	MANAGER	2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	950	11400
SCOTT	20	ANALYST	3000	36000
JONES	20	MANAGER	2975	35700
SMITH	20	CLERK	800	9600
ADAMS	20	CLERK	1100	13200
FORD	20	ANALYST	3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
CLARK	10	MANAGER	2450	29400
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY ���� DESC; --(��������)
--SELECT ���� ORDER BY �� ����Ǿ� ��Ī�� �ν��Ҽ� �����Ƿ�
--��Ī�� �������� ������ �� �ִ�.

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
      ,SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY 2; --SELECT���� ó���� 2��° �÷��� �ǹ��Ѵ�.
         --�� �μ���ȣ�� �������� �������� ������ �ض�� �ǹ̰� �ȴ�.
-->EMP���̺��� ������ �ִ� ���̺��� ������ �÷��� ������ �ƴϴ�
-->SELECT���� ó���� �ι�° �÷��� DEPTNO�� �ǹ��ϴ� ��
-->EMP���̺��� 2��° �÷��� ENAME�� ����̸��̴�. 
--ORDER BY DEPTNO ASC�� ����.

SELECT ENAME, DEPTNO, JOB , SAL
FROM EMP
ORDER BY 2, 4;
--�μ���ȣ�� �������� 1������ �޿��� �������� 2�������� �����Ѵ�.

SELECT ENAME, DEPTNO, JOB , SAL
FROM EMP
ORDER BY 2,3,4 DESC;
--�μ���ȣ�� �������� 1�� �������� ���� 
--������ �������� 2�� �������� ������ 
--�޿��� �������� �������� ����
--DESC�� �޿����� �ش�ȴ�.

--��CONCAT()

SELECT ENAME || JOB "ù��° �÷�"
      , CONCAT(ENAME, JOB) "�ι�° �÷�"
FROM EMP;
--���ڿ� ������� ������ ������ �����ϴ� �Լ� CONCAT()
--������ 2���� ���ڿ��� ���ս�ų �� �ִ�.

SELECT ENAME||JOB||DEPTNO "ù�����÷�"
,     CONCAT(CONCAT(ENAME,JOB), DEPTNO) "�ι�°Į��"
FROM EMP;
--������ ��ø���� �غ�!
/*
SMITHCLERK20	SMITHCLERK20
ALLENSALESMAN30	ALLENSALESMAN30
WARDSALESMAN30	WARDSALESMAN30
JONESMANAGER20	JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	BLAKEMANAGER30
CLARKMANAGER10	CLARKMANAGER10
SCOTTANALYST20	SCOTTANALYST20
KINGPRESIDENT10	KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	ADAMSCLERK20
JAMESCLERK30	JAMESCLERK30
FORDANALYST20	FORDANALYST20
MILLERCLERK10	MILLERCLERK10
*/

-->�������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--CONCAT()�� ���ڿ��� ���ڿ��� ���ս����ִ� �Լ�������
--���������� ���ڳ� ��¥�� ���ڷ� �ٲپ��ִ� ������ ���ԵǾ� �ִ�.

--��SUBSTR()= ������� / SUBSTRB() = ����Ʈ ���(�̶� ���ڵ��� ����)
--�ڹ��� obj.substring()
----
--���ڿ�.subString(n,m);
--  ���ڿ��� n���� m-1����..(�ε����� 0����)

SELECT ENAME "COL1"
      ,SUBSTR(ENAME,1,2)"COL2" --ENAME�� 1�� �ε������� 2����¶�
FROM EMP;
-->���ڿ��� �����ϴ� ����� ���� �Լ�
-- ù��° �Ķ���� ���� ��� ���ڿ�(������ ���, TARGET)
-- �ι�° �Ķ���� ���� ������ �����ϴ� ��ġ(�ε���,START) �ε����� 1���ͽ���
-- ����° �Ķ���� ���� ������ ���ڿ��� ����(����,COUNT) -> ������ ���ڿ��� ���� ������

SELECT ENAME "COL1"
      ,SUBSTR(ENAME,3,2)"COL2"
      ,SUBSTR(ENAME,3,5)"COL3"
      ,SUBSTR(ENAME,3)"COL4"
      ,SUBSTR(ENAME,6,1)"COL5"
FROM EMP;

/*
SMITH	IT	ITH	    ITH	
ALLEN	LE	LEN	    LEN	
WARD	RD	RD	    RD	
JONES	NE	NES	    NES	
MARTIN	RT	RTIN	RTIN	N
BLAKE	AK	AKE	    AKE	
CLARK	AR	ARK	    ARK	
SCOTT	OT	OTT	    OTT	
KING	NG	NG	    NG	
TURNER	RN	RNER	RNER	R
ADAMS	AM	AMS	    AMS	
JAMES	ME	MES	    MES	
FORD	RD	RD	    RD	
MILLER	LL	LLER	LLER	R
*/

--��TBL_SAWON ���̺��� ������ ������ �����
 -- �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
 -- SUBSTR()�Լ� �̿��Ұ�
 SELECT SANO,SANAME,JUBUN,SAL
 FROM TBL_SAWON
 WHERE SUBSTR(JUBUN,7,1) IN ('1','3'); 
 
  SELECT SANO,SANAME,JUBUN,SAL
 FROM TBL_SAWON
 WHERE SUBSTR(JUBUN,7,1) =ANY ('1','3');
 
 --��LENGTH() ���ڼ� ��ȯ / LENGTHB() ����Ʈ ���� ��ȯ
 
 SELECT ENAME "COL1"
       ,LENGTH(ENAME) "COL2"
       ,LENGTHB(ENAME) "COL3"
 FROM EMP;
 
 
 --��INSTR()
 
 SELECT 'ORACLE ORAHOME BIORA' "COL1"
        , INSTR('ORACLE ORAHOME BIORA','ORA',1,1)"COL2"
        , INSTR('ORACLE ORAHOME BIORA','ORA',1,2)"COL3"
        , INSTR('ORACLE ORAHOME BIORA','ORA',2,1)"COL4"
        , INSTR('ORACLE ORAHOME BIORA','ORA',2)"COL5"
        , INSTR('ORACLE ORAHOME BIORA','ORA',2,3)"COL6" --3��°�� �����ϱ� 0�� ��ȯ�Ѵ�.
FROM DUAL;
-->ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����..(��� ���ڿ�, TARGET)
--�� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--����° �Ķ���� ���� ã�� �����ϴ� ��ġ
--�� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã���������� ���� ����(->1�� ���� ����)
--���� ã�� �ε��� ���� ��ȯ�Ѵ�.

SELECT '���ǿ���Ŭ �����ο��� �մϴ�.' "COL1"
       ,INSTR('���ǿ���Ŭ �����ο��� �մϴ�.','����',1)"COL2"
       ,INSTR('���ǿ���Ŭ �����ο��� �մϴ�.','����',2)"COL3"
       ,INSTR('���ǿ���Ŭ �����ο��� �մϴ�.','����',10)"COL4"
       ,INSTR('���ǿ���Ŭ �����ο��� �մϴ�.','����',11)"COL5"
FROM DUAL;

--��REVERSE()

SELECT 'ORACLE' "COL1"
       ,REVERSE('ORACLE') "COL2"
FROM DUAL;
--�� �ѱ��� ������ �� ����. �ѱ��� �ѹ��ڰ� 1����Ʈ�� �ƴϱ⿡
--ORACLE	ELCARO

--��TBL_FILES �ǽ��� ���̺� ����
CREATE TABLE TBL_FILES
(FILENO NUMBER(3)
,FILENAME VARCHAR2(100)
);

--�۵����� �Է�(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1,'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2,'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3,'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4,'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5,'C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6,'C:\SHARE\F\TEST\FLOWER.PNG');
INSERT INTO TBL_FILES VALUES(7,'E:\STUDY\ORACLE\20220816_01_SCOTT.SQL');

COMMIT;

SELECT FILENO "���Ϲ�ȣ"
      ,FILENAME "���ϸ�"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT
6	C:\SHARE\F\TEST\FLOWER.PNG
7	E:\STUDY\ORACLE\20220816_01_SCOTT.SQL
*/

--��TBL_FILES ���̺��� ��ȸ�Ͽ�
-- ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.


SELECT FILENO "���Ϲ�ȣ"
      ,REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1)-1)) "���ϸ�"
FROM TBL_FILES;


SELECT FILENO "���Ϲ�ȣ"
      ,INSTR(REVERSE(FILENAME),'\',1) "���ϸ�"
FROM TBL_FILES;