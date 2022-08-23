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



--------------------------------------------------------------------------------


--�� TBL_EMP ���̺��� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�

SELECT MAX(SAL)
FROM TBL_EMP;

SELECT *
FROM 
(
    SELECT *
    FROM TBL_EMP
)T 
WHERE T.SAL;
--------------------------------------------------------------------------------

--���� Ǭ Ǯ��
SELECT T2.EMPNO"�����ȣ", T2.ENAME"�����", T2.JOB"������", T1.�޿� 
FROM 
(
    SELECT MAX(SAL)"�޿�"
    FROM TBL_EMP
    INTERSECT
    SELECT SAL
    FROM TBL_EMP
)T1
JOIN
(
    SELECT *
    FROM TBL_EMP
)T2
ON T1.�޿� = T2.SAL;


--������ Ǯ��

--�� TBL_EMP���̺��� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.

-- �޿��� ���� ���� �޴� ����� �޿�
SELECT MAX(SAL)
FROM TBL_EMP;
--==>> 5000


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE �޿��� ���� ���� ���;


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (�޿��� ���� ���� ���);


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP);
--==>>7839	KING	PRESIDENT	5000

--  ��=ANY��
-- �ϳ��� �����ϸ�

--  ��=ALL��
-- ��� �����ϸ�


SELECT SAL
FROM TBL_EMP;
--==>>
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
1500
2000
1700
2500
1000
*/

SELECT EMPNO, ENAME, JOB,SAL
FROM TBL_EMP
WHERE SAL =ANY(800,1600,1250,2975,1250,2850,2450,3000,5000,1500,1100,950,3000,1300,1500,2000,1700,2500,1000);
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7566	JONES	MANAGER	    2975
7654	MARTIN	SALESMAN	1250
7698	BLAKE	MANAGER	    2850
7782	CLARK	MANAGER	    2450
7788	SCOTT	ANALYST	    3000
7839	KING	PRESIDENT	5000
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7902	FORD	ANALYST	    3000
7934	MILLER	CLERK	    1300
8001	���¹�	CLERK	    1500
8002	������	CLERK	    2000
8003	�躸��	SALESMAN	1700
8004	������	SALESMAN	2500
8005	������	SALESMAN	1000
*/


SELECT EMPNO, ENAME, JOB,SAL
FROM TBL_EMP
WHERE SAL >= ANY(800,1600,1250,2975,1250,2850,2450,3000,5000,1500,1100,950,3000,1300,1500,2000,1700,2500,1000);
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7566	JONES	MANAGER	    2975
7654	MARTIN	SALESMAN	1250
7698	BLAKE	MANAGER	    2850
7782	CLARK	MANAGER	    2450
7788	SCOTT	ANALYST	    3000
7839	KING	PRESIDENT	5000
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7902	FORD	ANALYST	    3000
7934	MILLER	CLERK	    1300
8001	���¹�	CLERK	    1500
8002	������	CLERK	    2000
8003	�躸��	SALESMAN	1700
8004	������	SALESMAN	2500
8005	������	SALESMAN	1000
*/


SELECT EMPNO, ENAME, JOB,SAL
FROM TBL_EMP
WHERE SAL >= ALL(800,1600,1250,2975,1250,2850,2450,3000,5000,1500,1100,950,3000,1300,1500,2000,1700,2500,1000);
--==>>7839	KING	PRESIDENT	5000


SELECT EMPNO, ENAME, JOB,SAL
FROM TBL_EMP
WHERE SAL >= ALL(   SELECT SAL
                    FROM TBL_EMP);
--==>>7839	KING	PRESIDENT	5000


--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ��ϴ� ����� ��
--   �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�

SELECT *
FROM TBL_EMP
WHERE DEPTNO=20;

SELECT EMPNO,ENAME,JOB,SAL
FROM TBL_EMP
WHERE DEPTNO=20
    AND SAL >= ALL(SELECT SAL
                   FROM TBL_EMP
                   WHERE DEPTNO=20);
                   
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP)
    AND DEPTNO =20;
--==>>��ȸ ��� ����

                   
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP
             WHERE DEPTNO =20)
    AND DEPTNO =20;    --�ΰ��� ��� �ٸ� ������


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >= ALL (  SELECT SAL
                    FROM TBL_EMP
                    WHERE DEPTNO =20)
    AND DEPTNO =20;
    
    
--�� TBL_EMP ���̺��� ����(Ŀ�̼�, COMM)�� ���� ���� �����
--   �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� ��ȸ�Ѵ�.


SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (  SELECT MAX(COMM)
                FROM TBL_EMP);
                
SELECT EMPNO"�����ȣ",ENAME "�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL(SELECT NVL(COMM,0)
                FROM TBL_EMP);
                
SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE ����(Ŀ�̼�,COMM)�� ���� ���� ���;

SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE COMM = (��� ������ �� �ְ� Ŀ�̼�);



SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE COMM = (  SELECT MAX(COMM)
                FROM TBL_EMP);
--==>>7654	MARTIN	30	SALESMAN	1400



SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE COMM >=ALL (  SELECT COMM
                    FROM TBL_EMP);
--==>>��ȸ ��� ����


SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE COMM >=ALL (  SELECT COMM
                    FROM TBL_EMP);
--==>>
/*
(null)
300
500
(null)
1400
(null)
(null)
(null)
(null)
0
(null)
(null)
(null)
(null)
10
10
(null)
(null)
(null)
*/

SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"                
FROM TBL_EMP
WHERE COMM >=ALL (NULL,300,500,NULL,1400,NULL,NULL,NULL,,NULL,0,NULL,NULL,NULL,NULL,10,10,NULL,NULL,NULL);


SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL (SELECT NVL(COMM,0)
                  FROM TBL_EMP);
 --==>>7654	MARTIN	30	SALESMAN	1400
 
SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL (SELECT COMM
                  FROM TBL_EMP
                  WHERE COMM IS NOT NULL);     
--==>>
/*
300
500
1400
0
10
10
*/


SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",JOB"������",COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL (300,500,1400,0,10,10);     
--==>>7654	MARTIN	30	SALESMAN	1400


--�� DISTINCT() �ߺ� ��(���ڵ�)�� �����ϴ� �Լ�

-- TBL_EMP ���̺��� �����ڷ� ��ϵ� �����
-- �����ȣ, �����, �������� ��ȸ�Ѵ�

SELECT T2.EMPNO"�����ȣ",T2.ENAME"�����",T2.JOB"������"
FROM 
(
    SELECT MGR
    FROM TBL_EMP
    GROUP BY MGR
)T
JOIN
(
SELECT *
FROM TBL_EMP
)T2
ON T.MGR = T2.EMPNO;
--==>>
/*
7566	JONES	MANAGER
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7788	SCOTT	ANALYST
7839	KING	PRESIDENT
7902	FORD	ANALYST
*/

SELECT *
FROM TBL_EMP


SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE �����ڷ� ��ϵ� ���;


SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE �����ȣ = (������(MGR)�� ��ϵ� ���);


SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE EMPNO IN = (7902,7698,...);

SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE EMPNO IN  (  SELECT MGR
                    FROM TBL_EMP);

SELECT DISTINCT(MGR)
FROM TBL_EMP;




SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE EMPNO IN  (  SELECT DISTINCT(MGR)
                    FROM TBL_EMP);
--==>>     
/*
7902	FORD	ANALYST
7698	BLAKE	MANAGER
7839	KING	PRESIDENT
7566	JONES	MANAGER
7788	SCOTT	ANALYST
7782	CLARK	MANAGER
����� �Ȱ����� ���ҽ� �Ҹ� �ξ� ���ϴ� (�ߺ��Ȱ� ����)
*/
    
    
SELECT JOB    
FROM TBL_EMP;
--==>>
/*
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
ANALYST
PRESIDENT
SALESMAN
CLERK
CLERK
ANALYST
CLERK
CLERK
CLERK
SALESMAN
SALESMAN
SALESMAN
*/
SELECT DISTINCT(JOB)
FROM TBL_EMP;
--==>>
/*
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST
*/


SELECT DEPTNO
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10





*/

SELECT DISTINCT(DEPTNO)
FROM TBL_EMP;
--==>>
/*
30

20
10
*/

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;



--�� TBL_SAWON ���̺� ���(������ ����) �� �� ���̺� ���� ���質 �������� ���� ������ ����
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>>Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.
-- TBL_SAWON ���̺��� �����͵鸸 ����� ����
-- ��, �ٸ� �̸��� ���̺� ���·� ������ �� ��Ȳ

--�� ������ ����
UPDATE TBL_SAWON
SET SANAME ='�ʶ���';
--WHERE SANO = 1005;
COMMIT;

SELECT *
FROM TBL_SAWON;

ROLLBACK;

UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME 
            FROM TBL_SAWONBACKUP)
WHERE SANAME = '�ʶ���';




UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME 
            FROM TBL_SAWONBACKUP
            WHERE SANO = TBL_SAWON.SANO)
WHERE SANAME = '�ʶ���';

SELECT *
FROM TBL_SAWON;

COMMIT;