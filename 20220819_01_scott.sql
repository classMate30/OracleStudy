SELECT USER
FROM DUAL;
--==>>SCOTT

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

/*
10	        8750
20	        10875
30	        9400
���μ�	29025

*/

SELECT NVL(TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
���μ�	8700
���μ�	37725
*/


SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
���μ�	8700
���μ�	37725
*/


SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
GROUPING        �μ���ȣ        �޿���
---------   -------------   --------------
0	            10	             8750
0	            20	            10875
0	            30	             9400
0		       (null)            8700
1		       (null)           37725
*/



SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>

/*
10	        8750
20	        10875
30	        9400
(null)  	8700
(null)  	37725
*/


--�� ������ ��ȸ�� �ش� ������
/*
/*
10	        8750
20	        10875
30	        9400
����    	8700
���μ�  	37725
*/
-- �̿� ���� ��ȸ�ǵ��� �������� �����Ѵ�

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


--�� ��Ʈ

SELECT CASE GROUPING(DEPTNO)    WHEN 0  THEN DEPTNO 
            ELSE '���μ�'
        END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> ���� �߻�
--         (ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)


SELECT CASE GROUPING(DEPTNO)    WHEN 0  THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '���μ�'
        END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	         8750
20	        10875
30	         9400
����	     8700
���μ�	37725
*/


--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�
/*
----------------   ------------------
    ����                  �޿���
----------------   ------------------
    ��                   XXXXX
    ��                   XXXXX
��� ���               XXXXXX
----------------   ------------------
*/

SELECT *
FROM TBL_SAWON;

SELECT 
FROM TBL_SAWON
GROUP BY �����϶��� �����϶� �׸��� ��θ� ���;



SELECT "����" , SUM(SAL)
FROM TBL_SAWON
GROUP  BY CASE 
            WHEN SUBSTR(JUBUN,7,1)IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1)IN ('2','4') THEN '����'
            ELSE '�����Ǻ��Ұ�'
            END "����";

--������ ������
SELECT CASE WHEN SUBSTR(JUBUN,7,1)IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1)IN ('2','4') THEN '����'
            ELSE '�����Ǻ��Ұ�'
            END "����"
FROM TBL_SAWON;


--

SELECT T.����,T.�޿�
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1)IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1)IN ('2','4') THEN '����'
                ELSE '�����Ǻ��Ұ�'
                END "����"
         ,       SAL "�޿�"
    FROM TBL_SAWON
)T;


SELECT T.����,SUM(T.�޿�)"�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1)IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1)IN ('2','4') THEN '����'
                ELSE '�����Ǻ��Ұ�'
                END "����"
         ,       SAL "�޿�"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);


--GROUPING�õ�

SELECT CASE GROUPING(T.����)
        WHEN 0 THEN T.����
        ELSE '�����'
        END "����"   
    ,SUM(T.�޿�)"�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1)IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1)IN ('2','4') THEN '����'
                ELSE '�����Ǻ��Ұ�'
                END "����"
         ,       SAL "�޿�"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);


SELECT CASE GROUPING(DEPTNO)    WHEN 0  THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '���μ�'
        END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);



--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�
/*
----------------   ------------------
    ����                  �޿���
----------------   ------------------
    ��                   XXXXX
    ��                   XXXXX
��� ���               XXXXXX
----------------   ------------------
*/

SELECT CASE WHEN    SUBSTR(JUBUN, 7, 1) IN('1','3') THEN '��'
            WHEN    SUBSTR(JUBUN, 7, 1) IN('2','4') THEN '��'
            ELSE    '����Ȯ�κҰ�'
            END "����"
    ,   SAL "�޿�" 
FROM TBL_SAWON;
--==>>
/*
��	3000
��	2000
��	4000
��	2000
��	1000
��	3000
��	4000
��	1500
��	1300
��	2600
��	1300
��	2400
��	2800
��	5200
��	5200
��	1500
*/

SELECT T.���� "����"
    ,   SUM(T.�޿�)"�޿���"
FROM 
(
    SELECT CASE WHEN    SUBSTR(JUBUN, 7, 1) IN('1','3') THEN '��'
                WHEN    SUBSTR(JUBUN, 7, 1) IN('2','4') THEN '��'
                ELSE    '����Ȯ�κҰ�'
                END "����"
        ,   SAL "�޿�" 
    FROM TBL_SAWON
)T
GROUP BY T.����;
--==>>
/*
��	31800
��	11000
*/


SELECT T.���� "����"
    ,   SUM(T.�޿�)"�޿���"
FROM 
(
    SELECT CASE WHEN    SUBSTR(JUBUN, 7, 1) IN('1','3') THEN '��'
                WHEN    SUBSTR(JUBUN, 7, 1) IN('2','4') THEN '��'
                ELSE    '����Ȯ�κҰ�'
                END "����"
        ,   SAL "�޿�" 
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	    11000
��	    31800
(null)	42800
*/

SELECT  NVL(T.����, '�����') "����"
    ,   SUM(T.�޿�)"�޿���"
FROM 
(
    SELECT CASE WHEN    SUBSTR(JUBUN, 7, 1) IN('1','3') THEN '��'
                WHEN    SUBSTR(JUBUN, 7, 1) IN('2','4') THEN '��'
                ELSE    '����Ȯ�κҰ�'
                END "����"
        ,   SAL "�޿�" 
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	        11000
��	        31800
�����	42800
*/




SELECT  CASE GROUPING(T.����) WHEN 0 THEN T.���� ELSE '�����'
         END"����"
    ,   SUM(T.�޿�)"�޿���"
FROM 
(
    SELECT CASE WHEN    SUBSTR(JUBUN, 7, 1) IN('1','3') THEN '��'
                WHEN    SUBSTR(JUBUN, 7, 1) IN('2','4') THEN '��'
                ELSE    '����Ȯ�κҰ�'
                END "����"
        ,   SAL "�޿�" 
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	        11000
��	        31800
�����	42800
*/


--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
------------------ ----------------
���ɴ�                 �ο���
------------------ ----------------
10                        X
20                        X
30                        X
50                        X
��ü                     16
------------------ ----------------
*/

SELECT *
FROM TBL_SAWON;

SELECT T.���� "���ɴ�"
        ,    COUNT(*)
FROM 
(
SELECT 
    CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899),-1)
         WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1999),-1)
         ELSE -1
         END "����"
FROM TBL_SAWON

) T
GROUP BY ROLLUP(T.����);


SELECT T.���� "���ɴ�"
    ,COUNT(*)
FROM 
(
SELECT 
    CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899),-1)
         WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1999),-1)
         ELSE -1
         END "����"
FROM TBL_SAWON

) T
GROUP BY ROLLUP(T.����);

--�� NVL() �Լ�Ȱ��
SELECT NVL(TO_CHAR(T.����),'��ü') "���ɴ�"
        ,    COUNT(*)
FROM 
(
SELECT 
    CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899),-1)
         WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1999),-1)
         ELSE -1
         END "����"
FROM TBL_SAWON

) T
GROUP BY ROLLUP(T.����);

--�� CASE WHEN THEN ELSE END ����
SELECT CASE GROUPING(T.����) WHEN 0 THEN TO_CHAR(T.����) ELSE '��ü' END "���ɴ�"
        ,    COUNT(*)
FROM 
(
SELECT 
    CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899),-1)
         WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1999),-1)
         ELSE -1
         END "����"
FROM TBL_SAWON

) T
GROUP BY ROLLUP(T.����);



--���1. �� INLINE VIEW�� �� �� ��ø

SELECT NVL(TO_CHAR(T2.���ɴ�),'��ü')"���ɴ�"
    ,   COUNT(*)�ο���
FROM 
(
    --���ɴ�
    SELECT CASE WHEN T1.���� >=50 THEN 50
                WHEN T1.���� >=40 THEN 40
                WHEN T1.���� >=30 THEN 30
                WHEN T1.���� >=20 THEN 20
                WHEN T1.���� >=10 THEN 10
                ELSE 0
            END "���ɴ�"
    FROM
    (
        --����
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
                    ELSE    -1
                    END "����"
        
        FROM TBL_SAWON
    )T1
)T2
GROUP BY ROLLUP(T2.���ɴ�);
--==>>
/*
10	     2
20	     8
30	     2
50	     4
��ü	16
*/
SELECT CASE GROUPING(T2.���ɴ�) WHEN 0 THEN TO_CHAR(T2.���ɴ�) ELSE'��ü' END "���ɴ�"
    ,   COUNT(*)�ο���
FROM 
(
    --���ɴ�
    SELECT CASE WHEN T1.���� >=50 THEN 50
                WHEN T1.���� >=40 THEN 40
                WHEN T1.���� >=30 THEN 30
                WHEN T1.���� >=20 THEN 20
                WHEN T1.���� >=10 THEN 10
                ELSE 0
            END "���ɴ�"
    FROM
    (
        --����
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
                    ELSE    -1
                    END "����"
        
        FROM TBL_SAWON
    )T1
)T2
GROUP BY ROLLUP(T2.���ɴ�);


--���2. �� INLINE VIEW�� �� �� ���



        --����

SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN TO_CHAR(T.���ɴ�)
        ELSE '��ü'
        END "���ɴ�"
    ,   COUNT(*) "�ο���"
FROM
(
        SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
                    ELSE    -1
                    END,-1) "���ɴ�"
        
        FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);
--==>>
/*
10	     2
20	     8
30	     2
50	     4
��ü	16
*/

SELECT DEPTNO, JOB,SUM(SAL)
FROM EMP 
GROUP BY DEPTNO, JOB
ORDER BY 1,2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
30	CLERK	     950
30	MANAGER	    2850
30	SALESMAN	5600
*/



SELECT DEPTNO, JOB,SUM(SAL)
FROM EMP 
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	CLERK	     1300       -- 10�� �μ� CLERK ������ �޿���
10	MANAGER	     2450       -- 10�� �μ� MANAGER ������ �޿���
10	PRESIDENT	 5000       -- 10�� �μ� PRESIDENT ������ �޿���
10	(null)       8750       -- 10�� �μ� ��� ������ �޿���
20	ANALYST	     6000       
20	CLERK	     1900
20	MANAGER	     2975
20	(null)      10875       -- 20�� �μ� ��� ������ �޿���
30	CLERK	      950
30	MANAGER	     2850
30	SALESMAN	 5600
30	(null)       9400       -- 30�� �μ� ��� ������ �޿���
  	(null)      29025       -- ��� �μ� ��� ������ �޿���
*/


--�� CUBE() �� ROLLUP() ���� �� �ڼ��� ����� ��ȯ�޴´�.

SELECT DEPTNO , JOB, SUM(SAL)
FROM EMP 
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10  	CLERK	    1300
10  	MANAGER	    2450
10  	PRESIDENT	5000
10  	(null)    	8750
20  	ANALYST	    6000
20  	CLERK	    1900
20  	MANAGER	    2975
20  	(null)     10875
30  	CLERK	     950
30  	MANAGER	    2850
30  	SALESMAN	5600
30	    (null)    	9400
(null)	ANALYST	    6000            -- ��� �μ� ANALYST ������ �޿���              --�߰�
(null)	CLERK	    4150            -- ��� �μ� CLERK ������ �޿���                --�߰�
(null)	MANAGER	    8275            -- ��� �μ� MANAGER ������ �޿���              --�߰�
(null)	PRESIDENT	5000            -- ��� �μ� PRESIDENT ������ �޿���            --�߰�
(null)	SALESMAN	5600            -- ��� �μ� SALESMAN ������ �޿���             --�߰�
(null)  (null)     29025            -- ��� �μ� ��� ������ �޿���                 --�߰�
*/


--�� ROLLUP() �� CUBE()��
--   �׷��� �����ִ� ����� �ٸ���.(����)

-- ex.

-- ROLLUP(A, B, C)
-- �� (A,B,C,) / (A,B) / (A) / ()


-- CUBE(A, B, C)
-- �� (A, B, C)/(A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> ���� ������ (ROLLUP())���� ����� �ټ� ���ڶ� ���� �ְ�
--     �Ʒ� ������(CUBE()) ���� ����� �ټ� ����ĥ ���� �ֱ� ������
--     ������ ���� ����� ������ �� ���� ����ϰ� �ȴ�
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸
--     ��GROUPING SETS���� �̿��Ͽ� �����ִ� ����̴�.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
        ELSE '��ü�μ�'
        END "�μ���ȣ"
    ,   CASE GROUPING(JOB) WHEN 0 THEN JOB
         ELSE '��ü����'
        END "����"
    ,   SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	        CLERK	    1300
10  	    MANAGER	    2450
10  	    PRESIDENT	5000
10	        ��ü����	8750

20	        ANALYST	     6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875

30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400

����	    CLERK	    3500
����	    SALESMAN	5200
����	    ��ü����	8700

��ü�μ�	��ü����	37725
*/




SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
        ELSE '��ü�μ�'
        END "�μ���ȣ"
    ,   CASE GROUPING(JOB) WHEN 0 THEN JOB
         ELSE '��ü����'
        END "����"
    ,   SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750

20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875

30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400

����	    CLERK	    3500
����	    SALESMAN	5200
����	    ��ü����	8700

��ü�μ�	ANALYST	    6000
��ü�μ�	CLERK	    7650
��ü�μ�	MANAGER	    8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	10800

��ü�μ�	��ü����	37725
*/



SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
        ELSE '��ü�μ�'
        END "�μ���ȣ"
    ,   CASE GROUPING(JOB) WHEN 0 THEN JOB
         ELSE '��ü����'
        END "����"
    ,   SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB),(DEPTNO),(JOB),())
ORDER BY 1,2;
--==>> CUBE()�� ����� ����� ���� ��ȸ ��� ��ȯ

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
        ELSE '��ü�μ�'
        END "�μ���ȣ"
    ,   CASE GROUPING(JOB) WHEN 0 THEN JOB
         ELSE '��ü����'
        END "����"
    ,   SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB),(DEPTNO),())
ORDER BY 1,2;
--==>> ROLLUP()�� ����� ����� ���� ��ȸ ��� ��ȯ


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
        ELSE '��ü�μ�'
        END "�μ���ȣ"
    ,   CASE GROUPING(JOB) WHEN 0 THEN JOB
         ELSE '��ü����'
        END "����"
    ,   SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO,JOB),())
ORDER BY 1,2;

--------------------------------------------------------------------------------
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.


--�� TBL_EMP ���̺��� �������
--   �Ի�⵵�� �ο����� ��ȸ�Ѵ�.

SELECT HIREDATE
FROM TBL_EMP;


SELECT NVL(TO_CHAR(T.�Ի�⵵),'��ü') "�Ի�⵵"
,   COUNT(*) "�ο���"
FROM     
(  
    SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
    FROM TBL_EMP
)T
GROUP BY ROLLUP(T.�Ի�⵵)
ORDER BY 1;




SELECT ? "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY �Ի�⵵;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
*/
SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;

SELECT TO_CHAR(HIREDATE,'YYYY') "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>(ORA-00979: not a GROUP BY expression)

SELECT  EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY 1;
--==>>(ORA-00979: not a GROUP BY expression)


SELECT  TO_CHAR(HIREDATE,'YYYY') "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
        19
*/

SELECT  EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
        19
*/



SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0
        THEN EXTRACT(YEAR FROM HIREDATE)
        ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>(ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)

SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0
        THEN EXTRACT(YEAR FROM HIREDATE)
        ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>(ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)

SELECT CASE GROUPING(TO_CHAR(HIREDATE,'YYYY')) WHEN 0
        THEN TO_CHAR(HIREDATE,'YYYY')
        ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>> ���� �߻�
--    (ORA-00979: not a GROUP BY expression)





SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0
        THEN TO_CHAR(HIREDATE,'YYYY')
        ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>> ���� �߻�
--    (ORA-00979: not a GROUP BY expression)


SELECT CASE GROUPING(TO_CHAR(HIREDATE,'YYYY')) WHEN 0
        THEN TO_CHAR(HIREDATE,'YYYY')
        ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY 1;


SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0
        THEN EXTRACT(YEAR FROM HIREDATE)
        ELSE -1
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;

--------------------------------------------------------------------------------

--���� HAVING ����--

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�



SELECT T.�μ���ȣ
    ,   T.�ѱ޿�
FROM 
(
    SELECT DEPTNO "�μ���ȣ"
        ,   SUM(SAL) "�ѱ޿�"
    FROM EMP
    GROUP BY DEPTNO
)T
WHERE T.�ѱ޿� < 10000;


SELECT DEPTNO"�μ���ȣ"
,   SUM(SAL)"�ѱ޿�"
FROM EMP 
GROUP BY DEPTNO
HAVING SUM(SAL)<10000;

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30) 
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/

    SELECT DEPTNO, SUM(SAL)
    FROM EMP
    WHERE DEPTNO IN (20,30) 
        AND SUM(SAL)<10000
    GROUP BY DEPTNO;
    --==>>���� �߻�
    --(ORA-00934: group function is not allowed here)
/*
SELECT    T.DEPTNO
    ,   T.SUM(SAL)
FROM
(
    SELECT DEPTNO, SUM(SAL)
    FROM EMP
    WHERE DEPTNO IN (20,30) 
    GROUP BY DEPTNO
)T
WHERE SUM(SAL)<10000;
*/



SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO
HAVING SUM(SAL)<10000;
--==>>30	9400


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL)<10000
    AND DEPTNO IN(20,30);
--==>>30	9400


--�� �ٶ����� ������ �޸� ���ҽ� �����ؼ� ��ǻ�Ϳ��� ���� ����Ŵ
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO
HAVING SUM(SAL)<10000;
--==>>30	9400

-------------------------------------------------------------------------------


--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ��� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�
-- MSSQL�� �̸����� �Ұ����ϴ�

SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
9400
10875
8750
*/

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875


-- RANK()/ DENSE_RANK()
--> ORACLE 9i ���� ����.... MSSQL 2005 ���� ����......

--> ���� ���������� RANK()�� DENSE_RANK()�� ����� �� ���� ������
--  ���� ���... �޿� ������ ���ϰ��� �Ѵٸ�....
--  �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
--  Ȯ���� ���ڿ� +1�� �߰� �������ָ�...
--  �� ���� �� �ش� ����� ����� �ȴ�.

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;        -- SMITH�� �޿�
--==>> 14               -- SMITH�� �޿� ���


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;       -- ALLEN�� �޿�
--==>> 7                -- ALLEN�� �޿� ���

--�� ���� ��� ����(��� ���� ����)
--   ���� ������ �ִ� ���̺��� �÷��� 
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.

SELECT ENAME "�����", SAL "�޿�", 1"�޿����"
FROM EMP;



SELECT ENAME "�����", SAL "�޿�", (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 800)"�޿����"
FROM EMP;



--��ġ �ݺ��� ó�� ���δٰ� �����ϸ� ����
SELECT E.ENAME "�����", E.SAL "�޿�", (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > E.SAL)"�޿����"
FROM EMP E
ORDER BY 3;
--==>>
/*
KING	5000	1
FORD	3000	2
SCOTT	3000	2
JONES	2975	4
BLAKE	2850	5
CLARK	2450	6
ALLEN	1600	7
TURNER	1500	8
MILLER	1300	9
WARD	1250	10
MARTIN	1250	10
ADAMS	1100	12
JAMES	950	    13
SMITH	800	    14
*/


--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�
--   ��, RANK() �Լ��� ������� �ʰ� ������������ Ȱ���� �� �ֵ��� �Ѵ�


SELECT E.ENAME "�����" , E.SAL"�޿�", E.DEPTNO"�μ���ȣ"
    ,   (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO) "�μ��� �޿����"      
    ,   (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL)"��ü�޿����"
FROM EMP E  
ORDER BY 5;



SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800         --SMITH�� �޿�
    AND DEPTNO =20;     --SMITH�� �μ���ȣ
--==>5                  --SMITH�� �μ��� �޿� ���



SELECT E.ENAME "�����" , E.SAL"�޿�", E.DEPTNO"�μ���ȣ"
    ,   (1) "�μ��� �޿����"      
    ,   (1)"��ü�޿����"
FROM EMP E  
ORDER BY 5;


SELECT E.ENAME "�����" , E.SAL"�޿�", E.DEPTNO"�μ���ȣ"
    ,   (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > 800 AND DEPTNO = 20) "�μ��� �޿����"      
    ,   (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > 800)"��ü�޿����"
FROM EMP E  
ORDER BY 5;
--==> ���� SMITH�� ����




SELECT E.ENAME "�����" , E.SAL"�޿�", E.DEPTNO"�μ���ȣ"
    ,   (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO) "�μ��� �޿����"      
    ,   (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL)"��ü�޿����"
FROM EMP E  
ORDER BY 3,5;
--==>>
/*
KING	5000	10	1	1
CLARK	2450	10	2	6
MILLER	1300	10	3	9
SCOTT	3000	20	1	2
FORD	3000	20	1	2
JONES	2975	20	3	4
ADAMS	1100	20	4	12
SMITH	800	    20	5	14
BLAKE	2850	30	1	5
ALLEN	1600	30	2	7
TURNER	1500	30	3	8
MARTIN	1250	30	4	10
WARD	1250	30	4	10
JAMES	950	    30	6	13
*/


--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�
/*
                                                            -�� �μ� ������ �Ի����ں��� ������ �޿��� ��
--------------------------------------------------------------------------------
�����     �μ���ȣ        �Ի���         �޿�              �μ����Ի纰�޿�����
--------------------------------------------------------------------------------
SMITH       20          1980-12-17        800
JONES       20          1981-04-02       2975
FORD        20          1981-12-03       3000
ADAMS       20          1987-07-13       1100
SCOTT       20          1987-07-13       3000
*/

SELECT *
FROM EMP
ORDER BY HIREDATE;

--�� ���� ��� ����(��� ���� ����)
--   ���� ������ �ִ� ���̺��� �÷��� 
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.


SELECT ENAME "�����",DEPTNO"�μ���ȣ",HIREDATE"�Ի���",SAL"�޿�"
    ,   (
            SELECT SUM(SAL)
            FROM EMP
            WHERE DEPTNO =E.DEPTNO AND HIREDATE <=E.HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E
ORDER BY DEPTNO,HIREDATE;


SELECT COUNT(*)
    , SUM(SAL)
FROM EMP
WHERE DEPTNO =20;



SELECT SUM(SAL)
FROM EMP
WHERE DEPTNO =20;        --SMITH�� �μ���ȣ
--==>5                  --SMITH�� �μ��� �޿� ���


SELECT EMP.ENAME"�����", EMP.DEPTNO"�μ���ȣ", EMP.HIREDATE"�Ի���", EMP.SAL"�޿�"
, (1) "�μ����Ի纰�޿�����"
FROM SCOTT.EMP
ORDER BY 2, 3;


SELECT E1.ENAME"�����", E1.DEPTNO"�μ���ȣ", E1.HIREDATE"�Ի���", E1.SAL"�޿�"
, (1) "�μ����Ի纰�޿�����"
FROM SCOTT.EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME"�����", E1.DEPTNO"�μ���ȣ", E1.HIREDATE"�Ի���", E1.SAL"�޿�"
, (SELECT SUM(E2.SAL)
    FROM EMP E2
    WHERE E2.DEPTNO = E1.DEPTNO
        AND  E2.HIREDATE <= E1.HIREDATE) "�μ����Ի纰�޿�����"
FROM SCOTT.EMP E1
ORDER BY 2, 3;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800 	800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	950	    9400
*/



--�� EMP ���̺��� ������� 
--   �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ֵ��� �������� �����Ѵ�

/*
-----------     --------------
�Ի���        �ο���
-----------     --------------
 1981-02           2
 1981-09           2
 1987-07           2
-----------     --------------

*/SELECT (SELECT COUNT(*) "�ο���"
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY-MM') = '1981-02') "�Ի���"
FROM EMP;



SELECT (SELECT COUNT(*) "�ο���"
        FROM EMP
        WHERE TO_CHAR(HIREDATE,'YYYY-MM') = E.TO_CHAR(HIREDATE,'YYYY-MM')) "�Ի���"
FROM EMP E;


SELECT COUNT(*) "�ο���"
FROM EMP
WHERE HIREDATE = TO_DATE('1987-07-13','YYYY-MM-DD');

SELECT  TO_CHAR(HIREDATE,'YYYY-MM'),COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*)>=2;


SELECT TO_CHAR(HIREDATE,'YYYY-MM')"�Ի���"
    ,   (1) "�ο���"
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY-MM') = '1987-07'
    OR TO_CHAR(HIREDATE,'YYYY-MM') = '1981-02'
    OR TO_CHAR(HIREDATE,'YYYY-MM') = '1981-09';



---------------------------------------------------------------------
--������ Ǯ��

SELECT ENAME, HIREDATE
FROM EMP
ORDER BY 2;

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    ,   COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM');





SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    ,   COUNT(*) "�ο���"
FROM EMP
WHERE COUNT(*) =2
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM');
--==>> ���� �߻�
--  (ORA-00934: group function is not allowed here)

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    ,   COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*) =(�Ի��� ���� �ִ� �ο�);




SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    ,   COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*) =(SELECT MAX(COUNT(*))
                FROM EMP
                GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
                
----------------------------------------------------------
SELECT  TO_CHAR(HIREDATE,'YYYY-MM'),COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*)>=2;
                