---���� UNION / UNION ALL ����---

--�� �ǽ� ���̺� ����(TBL_JUMUN)

CREATE TABLE TBL_JUMUN
(JUNO NUMBER
,JECODE VARCHAR2(30)
,JUSU NUMBER
,JUDAY DATE DEFAULT SYSDATE
);
-->���� �ֹ��� ���� �Ǿ��� ���
-- �ֹ� ���뿡 ���� �����Ͱ� �Է� �� �� �ֵ��� ó���ϴ� ���̺�

--�۵����� �Է� -> ���� �ֹ��߻�(����)
INSERT INTO TBL_JUMUN
VALUES(1, 'ġ�佺', 20, TO_DATE('2001-11-01 09:10:12', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(2, '������', 10, TO_DATE('2001-11-01 10:10:12', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(3, '������', 30, TO_DATE('2001-11-01 13:10:20', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(4, '������', 10, TO_DATE('2001-11-02 11:11:11', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(5, '��īĨ', 20, TO_DATE('2001-11-02 17:50:11', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(6, '�Ҹ���', 10, TO_DATE('2001-11-03 10:00:10', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(7, '���ڱ�', 20, TO_DATE('2001-11-04 05:05:05', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(8, '��ǹ�', 20, TO_DATE('2001-11-04 06:07:08', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(9, '�����', 10, TO_DATE('2001-11-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(10, '����Ĩ', 20, TO_DATE('2001-11-05 14:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(11, 'Ȩ����', 10, TO_DATE('2001-11-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(12, 'Ȩ����', 10, TO_DATE('2001-11-05 15:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(13, '����Ĩ', 20, TO_DATE('2001-11-06 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(14, '������', 10, TO_DATE('2001-11-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(15, '������', 20, TO_DATE('2001-11-08 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(16, '����ƽ', 10, TO_DATE('2001-11-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(17, '������', 20, TO_DATE('2001-11-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(18, 'Ȩ����', 10, TO_DATE('2001-11-11 15:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(19, '����ƽ', 10, TO_DATE('2001-11-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(20, '����ƽ', 20, TO_DATE('2001-11-13 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT *
FROM TBL_JUMUN;
/*
1	ġ�佺	20	2001-11-01 09:10:12
2	������	10	2001-11-01 10:10:12
3	������	30	2001-11-01 13:10:20
4	������	10	2001-11-02 11:11:11
5	��īĨ	20	2001-11-02 17:50:11
6	�Ҹ���	10	2001-11-03 10:00:10
7	���ڱ�	20	2001-11-04 05:05:05
8	��ǹ�	20	2001-11-04 06:07:08
9	�����	10	2001-11-05 13:00:00
10	����Ĩ	20	2001-11-05 14:10:00
11	Ȩ����	10	2001-11-05 15:00:00
12	Ȩ����	10	2001-11-05 15:10:00
13	����Ĩ	20	2001-11-06 12:00:00
14	������	10	2001-11-07 12:00:00
15	������	20	2001-11-08 12:00:00
16	����ƽ	10	2001-11-09 12:00:00
17	������	20	2001-11-10 12:00:00
18	Ȩ����	10	2001-11-11 15:10:00
19	����ƽ	10	2001-11-12 12:00:00
20	����ƽ	20	2001-11-13 12:00:00
*/

COMMIT;

--���߰� ������ �Է� -> 2001�� ���� ���۵� �ֹ��� ����(2022��)���� ��� �߻��ϰ� �������̴�.
INSERT INTO TBL_JUMUN VALUES(98764,'����Ĩ',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98765,'������',30,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98766,'������',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98767,'���̽�',40,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98768,'Ȩ����',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98769,'���ڱ�',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98770,'������',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98771,'���Ͻ�',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98772,'������',30,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98773,'������',20,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98774,'������',50,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98775,'������',10,SYSDATE);


SELECT *
FROM TBL_JUMUN;

COMMIT;

--�ذ��� ���θ� � ��...
--TBL_JUMUN ���̺��� ���ſ��� ��Ȳ
-- ���ø����̼ǰ��� �������� ���� �ֹ� ������ �ٸ� ���̺�
--����� �� �ֵ��� ����� ���� ���� �Ұ����� ��Ȳ.
--������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ.
-- ->���������
--   ������� ������ �ֹ� ������ ��
--   ���� �߻��� �ֹ� ������ �����ϰ�
--   ������ �����͸� �ٸ� ���̺�(TBL_JUMUNBACKUP)�� �����͸� �̰��Ͽ� ����� ������ ��ȹ

CREATE TABLE TBL_JUMUNBACKUP
SELECT *
FROM TBL_JUMUN
WHERE ���� �߻��� �ֹ��� �ƴѰ�;


CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

SELECT *
FROM TBL_JUMUNBACKUP;

--TBL_JUMUN���� ����� �����͵��� �����ϱ�

DELETE FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- ���� 
-- 98763�� ���� �����Ѱ��� ����
SELECT *
FROM TBL_JUMUN;

COMMIT;

--�ؾ��� ��ǰ �߼��� �̷������ ���� ���� �ֹ� �����͸� �����ϰ�
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ

--�׷���, ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ����� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
--�׷��ٸ�, TBL_JUMUNBACKUP ���̺��� ���ڵ��
--TBL_JUMUN ���̺��� ���ڵ� �� ��� ����
-- �ϳ��� ���̺��� ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ���
-- ��ȸ�� �̷�������Ѵ�.

--���÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ���
-- JOIN�� ���������
-- ���ڵ�� ���ڵ带 �����ϰ��� �ϴ� ���
-- UNION / UNION ALL �� ����� ���ִ�.

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;
/*
1	ġ�佺	20	2001-11-01 09:10:12
2	������	10	2001-11-01 10:10:12
3	������	30	2001-11-01 13:10:20
4	������	10	2001-11-02 11:11:11
5	��īĨ	20	2001-11-02 17:50:11
6	�Ҹ���	10	2001-11-03 10:00:10
7	���ڱ�	20	2001-11-04 05:05:05
8	��ǹ�	20	2001-11-04 06:07:08
9	�����	10	2001-11-05 13:00:00
10	����Ĩ	20	2001-11-05 14:10:00
11	Ȩ����	10	2001-11-05 15:00:00
12	Ȩ����	10	2001-11-05 15:10:00
13	����Ĩ	20	2001-11-06 12:00:00
14	������	10	2001-11-07 12:00:00
15	������	20	2001-11-08 12:00:00
16	����ƽ	10	2001-11-09 12:00:00
17	������	20	2001-11-10 12:00:00
18	Ȩ����	10	2001-11-11 15:10:00
19	����ƽ	10	2001-11-12 12:00:00
20	����ƽ	20	2001-11-13 12:00:00
98764	����Ĩ	10	2022-08-22 17:02:04
98765	������	30	2022-08-22 17:02:05
98766	������	20	2022-08-22 17:02:06
98767	���̽�	40	2022-08-22 17:02:07
98768	Ȩ����	10	2022-08-22 17:02:08
98769	���ڱ�	20	2022-08-22 17:02:09
98770	������	10	2022-08-22 17:02:10
98771	���Ͻ�	20	2022-08-22 17:02:11
98772	������	30	2022-08-22 17:02:12
98773	������	20	2022-08-22 17:02:14
98774	������	50	2022-08-22 17:02:15
98775	������	10	2022-08-22 17:02:16
*/
SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;
--��� ����


SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

--�� UNION �� �׻� ������� ù ��° �÷��� �������� 
-- �������� ������ �����Ѵ�.

--�ݸ� UNION ALL �� ���յ� ����(�������� ���̺��� ����� �������)
--��ȸ�� ����� �ִ� �׷��� ��ȯ�Ѵ�.(���� ����)
--�̷����� UNION�� ���ϰ� �� ũ�� (���ҽ� �Ҹ� �� ũ��.)
--���� UNION�� ������� �ߺ��� ���ڵ�(��)�� ������ ���
-- �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�Ѵ�.

--�� ������ UNION ALL�� �� �پ��.

--�����ݱ��� �ֹ����� �����͸� ����
--��ǰ �� �� �ֹ����� ��ȸ�� �� �ִ� �������� �����Ѵ�.

SELECT JECODE, COUNT(*)
FROM 
(SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
)T
GROUP BY JECODE;


--������ Ǯ��

SELECT T.JECODE "��ǰ�ڵ�", SUM(T.JUSU) "�ֹ�����"
FROM 
(
    SELECT JECODE , JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T
GROUP BY T.JECODE; 
--==>>
/*
����Ĩ	30
������	20
ġ�佺	20
������	70
�����	10
���Ͻ�	20
���̽�	40
��īĨ	20
����Ĩ	20
������	30
��ǹ�	20
������	110
������	30
���ڱ�	40
Ȩ����	40
������	10
�Ҹ���	10
����ƽ	40
*/



/*
    SELECT JECODE , JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
*/



--�� INTERSECT / MINUS (�����հ� ������)

-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ������� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
���ڱ�	20
������	30
Ȩ����	10
*/

-- �����տ� �ش��ϴ� �κ� ���� ������
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;

--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� �������
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ���, �ֹ����� �׸����� ��ȸ�Ѵ�

SELECT T.JUNO
FROM 
(
    SELECT JECODE,JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;
--����
SELECT T1.JUNO
FROM
(
SELECT *
FROM
(
    SELECT JECODE , JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T1
UNION ALL
SELECT *
FROM
(
    SELECT JECODE , JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
)T3;
--����

--��� Ǯ��
SELECT T2.JUNO,T2.JECODE,T2.JUSU,T2.JUDAY
FROM
(
   SELECT JECODE , JUSU
    FROM TBLUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T1
JOIN
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
)T2 
ON T1.JECODE = T2.JECODE;

--------------------------------------------------------------------------------
--������ Ǯ��
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT*
FROM TBL_JUMUN;
--==>>
/*
1	    ġ�佺	20	2001-11-01 09:10:12
2	    ������	10	2001-11-01 10:10:12
3	    ������	30	2001-11-01 13:10:20
4   	������	10	2001-11-02 11:11:11
5	    ��īĨ	20	2001-11-02 17:50:11
6	    �Ҹ���	10	2001-11-03 10:00:10
7   	���ڱ�	20	2001-11-04 05:05:05
8	    ��ǹ�	20	2001-11-04 06:07:08
9	    �����	10	2001-11-05 13:00:00
10  	����Ĩ	20	2001-11-05 14:10:00
11	    Ȩ����	10	2001-11-05 15:00:00
12  	Ȩ����	10	2001-11-05 15:10:00
13  	����Ĩ	20	2001-11-06 12:00:00
14	    ������	10	2001-11-07 12:00:00
15  	������	20	2001-11-08 12:00:00
16  	����ƽ	10	2001-11-09 12:00:00
17  	������	20	2001-11-10 12:00:00
18  	Ȩ����	10	2001-11-11 15:10:00
19  	����ƽ	10	2001-11-12 12:00:00
20  	����ƽ	20	2001-11-13 12:00:00
98764	����Ĩ	10	2022-08-23 09:07:59
98765	������	30	2022-08-23 09:08:00
98766	������	20	2022-08-23 09:08:01
98767	���̽�	40	2022-08-23 09:08:02
98768	Ȩ����	10	2022-08-23 09:08:03
98769	���ڱ�	20	2022-08-23 09:08:04
98770	������	10	2022-08-23 09:08:05
98771	���Ͻ�	20	2022-08-23 09:08:08
98772	������	30	2022-08-23 09:08:11
98773	������	20	2022-08-23 09:08:12
98774	������	50	2022-08-23 09:08:13
98775	������	10	2022-08-23 09:08:14
*/



SELECT JECODE,JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE,JUSU
FROM TBL_JUMUN;
--==>>
/*
���ڱ�	20
������	30
Ȩ����	10
*/


SELECT JUNO,JECODE,JUSU,JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO,JECODE,JUSU,JUDAY
FROM TBL_JUMUN;
--==>> ��ȸ ��� ����


-- ��� 1.

SELECT T2.JUNO"�ֹ���ȣ",T1.JECODE"��ǰ�ڵ�",T1.JUSU"�ֹ�����",JUDAY"�ֹ�����"
FROM -- �ؿ� �ֵ��� ������� �ؼ�
(
    SELECT JECODE,JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE,JUSU
    FROM TBL_JUMUN
)T1
JOIN
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T2
ON T1.JECODE = T2.JECODE 
AND T1.JUSU = T2.JUSU;
--==>>
/*
3	    ������	30	2001-11-01 13:10:20
7	    ���ڱ�	20	2001-11-04 05:05:05
11	    Ȩ����	10	2001-11-05 15:00:00
12	    Ȩ����	10	2001-11-05 15:10:00
18	    Ȩ����	10	2001-11-11 15:10:00
98768	Ȩ����	10	2022-08-23 09:08:03
98769	���ڱ�	20	2022-08-23 09:08:04
98772	������	30	2022-08-23 09:08:11
*/


-- ��� 2.
/*
�߸��� ������, ������ ��ã�� ������
SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE IN('���ڱ�','������','Ȩ����')
    AND T.JUSU IN(20, 30, 10);

 */
 
 SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE�� T.JUSU�� ���� ����� '���ڱ�20' , '������30', 'Ȩ����10';

SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT(T.JECODE, T.JUSU) IN('���ڱ�20' , '������30', 'Ȩ����10');


--> ��ȸ�� ����� ã�°ű⿡...... ��

SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT(T.JECODE, T.JUSU) IN(SELECT CONCAT(JECODE,JUSU)
                                  FROM TBL_JUMUNBACKUP
                                  INTERSECT
                                  SELECT CONCAT(JECODE,JUSU)
                                  FROM TBL_JUMUN);
                                  
--------------------------------------------------------------------------------

SELECT D.DEPTNO,D.DNAME,E.ENAME,E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	 800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	 950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/


SELECT DEPTNO, DNAME, ENAME,SAL
FROM EMP E JOIN DEPT D;
--==>>���� �߻�


SELECT DEPTNO, DNAME, ENAME,SAL
FROM EMP E NATURAL JOIN DEPT D;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES   	WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/
SELECT DEPTNO, DNAME, ENAME,SAL
FROM EMP E JOIN DEPT D
USING(DEPTNO);
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/
