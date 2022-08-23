SELECT USER
FROM DUAL;


--��CASE ����(���ǹ�,�б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2�� �����' END
FROM DUAL;
--==>>5+2�� �����

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END
FROM DUAL;

--CASE���� ������ ������ WHEN ���� ������� THEN��  �ƴϸ� ELSE������ �����Ѵ�.

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '����'
                END
FROM DUAL;
--==>>1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 2 THEN '1+1=4'
                ELSE '����'
                END
FROM DUAL;
--==>>1+1=2
--�ڹ��� if-else�� ���� �ϳ��� ���� ã���� ������.

SELECT CASE WHEN 5+2 = 4 THEN '5+2=4'
            WHEN 6-3 = 2 THEN '6-3=2'
            WHEN 2*1 = 2 THEN '2*1=2'
            WHEN 6/3 = 3 THEN '6/6=3'
            ELSE '��?��'
    END
    --CASE WHEN�� ���ļ� ��� ������ �ٷ� �ɷ����� �ִ�.
FROM DUAL;

SELECT CASE WHEN 5+2 = 7 THEN '5+2=7'
            WHEN 6-3 = 3 THEN '6-3=3'
            WHEN 2*1 = 2 THEN '2*1=2'
            WHEN 6/3 = 2 THEN '6/6=1'
            ELSE '��?��'
        END
    --CASE WHEN�� ���ļ� ��� ������ �ٷ� �ɷ����� �ִ�.
FROM DUAL;


--��DECODE()
SELECT DECODE(5-2,1,'5-2=1',2,'5-2=2',3,'5-2=3', '5-2�� �����') "���Ȯ��"
FROM DUAL;


--CASE WHEN THEN ELSE END (���ǹ�,�б⹮) Ȱ��

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �񱳺Ұ�'
        END "���Ȯ��"
FROM DUAL;
--==>>5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '�ҿ�����'
            WHEN 5>2  OR 2=3 THEN '�ÿ�'
            ELSE '5�� 2�� �񱳺Ұ�'
        END "���Ȯ��"
FROM DUAL;


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '���游��'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���'
        END "���Ȯ��"
FROM DUAL;
                 --F        --T       --F
SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '���游��'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���'
        END "���Ȯ��"
FROM DUAL;

SELECT *
FROM TBL_SAWON;

/*
1001	����	9409252234567	05/01/03	3000
1002	�躸��	9809022234567	99/11/23	2000
1003	���̰�	9810092234567	06/08/10	4000
1004	���α�	9307131234567	98/05/13	2000
1005	������	7008161234567	98/05/13	1000
1006	������	9309302234567	99/10/10	3000
1007	������	0302064234567	10/10/23	4000
1008	�μ���	6807102234567	98/03/20	1500
1009	������	6710261234567	98/03/20	1300
1010	������	6511022234567	98/12/20	2600
1011	���켱	0506174234567	11/10/10	1300
1012	���ù�	0102033234567	10/10/10	2400
1013	����	0210303234567	11/10/10	2800
1014	�ݺ���	9903142234567	12/11/11	5200
1015	������	9907292234567	12/11/11	5200
1016	���̰�	0605063234567	15/01/20	1500
*/

--��TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸��� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
--�����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�
-- �� ���糪�̴� �⺻ �ѱ����� ������ ���� ������ �����Ѵ�.
-- ����, ���� �������� �ش� ������ ���̰� �ѱ� ���̷� 60���� �Ǵ� ���� 
-- �� ������ �Ի��, �Ի��Ϸ� ������ �����Ѵ�.
--�׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ����� ���� �޿� ���� 30% ����, 2000�� �̻� �ٹ��� �����
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó��

SELECT TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,2))-10
FROM DUAL;

SELECT TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,2))
,TO_NUMBER(EXTRACT(YEAR FROM SYSDATE))
FROM DUAL;

SELECT  CASE WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('1','2') THEN 19||TO_NUMBER(SUBSTR(JUBUN,1,2))
            ELSE '10'
            END
FROM TBL_SAWON;

SELECT 60+(19||TO_NUMBER(SUBSTR(JUBUN,1,2)))||SUBSTR(TO_CHAR(HIREDATE),3)
FROM TBL_SAWON;

SELECT (TO_DATE(60+TO_NUMBER(CASE WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('1','2') THEN 19||(SUBSTR(TO_CHAR(JUBUN),1,2))
             WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('3','4') THEN 20||(SUBSTR(TO_CHAR(JUBUN),1,2))
          ELSE '0'
          END) || SUBSTR(HIREDATE,3),'YYYY-MM-DD'))
FROM TBL_SAWON;







SELECT SANO "�����ȣ" ,SANAME "�����", JUBUN "�ֹι�ȣ"
       , CASE WHEN SUBSTR(JUBUN,7,1) IN('1','3') THEN  '��' ELSE '��' END "����"
       , 1+TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) 
       - TO_NUMBER(CASE WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('1','2') THEN '19'||(SUBSTR(JUBUN,1,2))
          WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('3','4') THEN '20'||(SUBSTR(JUBUN,1,2))
          ELSE '-1'
          END) "���糪��"
      , HIREDATE "�Ի���"
      , TO_CHAR(ADD_MONTHS(SYSDATE,((60-((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))+1)
       - CASE WHEN SUBSTR(JUBUN,0,2)<22 THEN SUBSTR(JUBUN,0,2)+2000
          ELSE SUBSTR(JUBUN,0,2)+1900
          END))*12)), 'YYYY') ||'-'||TO_CHAR(HIREDATE,'MM-DD')"����������"
      , ROUND(SYSDATE - HIREDATE) "�ٹ��ϼ�"
      ,ROUND(TO_DATE(59+TO_NUMBER(CASE WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('1','2') THEN '19'||(SUBSTR(TO_CHAR(JUBUN),1,2))
          ELSE 20||(SUBSTR(TO_CHAR(JUBUN),1,2))
          END)||SUBSTR(HIREDATE,3),'YYYY-MM-DD')-SYSDATE) "�����ϼ�"
      ,SAL "�޿�"
      ,CASE WHEN TO_NUMBER(TO_CHAR(SYSDATE-HIREDATE))>=2000 THEN SAL*0.5 
            WHEN TO_NUMBER(TO_CHAR(SYSDATE-HIREDATE))>=1000 THEN SAL*0.3
             
            ELSE 0
            END "���ʽ�"
            
FROM TBL_SAWON;

/*
SELECT ROUND(TO_DATE(59+TO_NUMBER(CASE WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('1','2') THEN 19||(SUBSTR(TO_CHAR(JUBUN),1,2))
             WHEN SUBSTR(TO_CHAR(JUBUN),7,1) IN ('3','4') THEN 20||(SUBSTR(TO_CHAR(JUBUN),1,2))
          ELSE '0'
          END) || SUBSTR(HIREDATE,3),'YYYY-MM-DD')-SYSDATE) "�����ϼ�"
FROM TBL_SAWON;
  */    
--�޿�, ���ʽ�

--�׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ����� ���� �޿� ���� 30% ����, 2000�� �̻� �ٹ��� �����
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó��
--���� CASE WHEN THEN ������� �����ε�
--ELSE �� ���ڸ� ������
--����� �ۼ��߾ ��ü���� ���� ������ ����.
--��� ELSE�� -1�� �־��ش�.

CREATE VIEW VIEW_EMP
AS
SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����"
FROM EMP;
--==>>�����߻�
--   (ORA-01031: insufficient privileges)

--�� SYS�������� SCOTT������ CREATE VIEW ���� �ο� �� �ٽ� ����
CREATE VIEW VIEW_EMP
AS
SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����"
FROM EMP;
--==>>View VIEW_EMP��(��) �����Ǿ����ϴ�.


SELECT *
FROM VIEW_EMP;
--���������δ� SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����"
--FROM EMP;
--EMP ��ü�� �������� ����Ǵ� ���� , �����͸� ������ �ִ� ���� �ƴ�

--��������(�ζ��� ��)
SELECT T.����� , T.�����ȣ, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���, T.�޿�
    --����������
    --���������⵵    �� �ش������� ���̰� �ѱ����̷� 60���� �Ǵ� ��
    --���糪�̰� ...57�� ...3�� ��   2022�� 2025
    --���糪�̰� ...28�� ...32�� ��  2022�� 2054
    --ADD_MONTHS(SYSDATE, �������*12)
    --                    -------- 
    --                     60 - ���糪��
    --ADD_MONTHS(SYSDATE, (60-���糪��)*12) �� Ư����¥
    --TO_CHAR('Ư����¥','YYYY')            �� �������� �⵵�� ����
    --TO_CHAR('�Ի���','MM-DD')             �� �Ի� ���ϸ� ����
    --TO_CHAR('Ư����¥','YYYY')|| '-' || TO_CHAR('�Ի���','MM-DD') -> ����������
    --TO_CHAR(ADD_MONTHS(SYSDATE,(60-���糪��)*12),'YYYY') || '-' || TO_CHAR('�Ի���','MM-DD')
      , TO_CHAR(ADD_MONTHS(SYSDATE,(60-T.���糪��)*12),'YYYY')
      || '-' || TO_CHAR(T.�Ի���,'MM-DD') "���� ������"
      
      --�ٹ��ϼ�
      --�ٹ��ϼ� = ������ - �Ի���
      ,TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
      
      --�����ϼ�
      --�����ϼ� = ���������� - ������
      ,TRUNC(TO_DATE( TO_CHAR(ADD_MONTHS(SYSDATE,(60-T.���糪��)*12),'YYYY')
      || '-' || TO_CHAR(T.�Ի���,'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
      
      --�޿�
      ,T.�޿�
      
      --���ʽ�
      --�ٹ��ϼ��� 1000�� �̻� 2000�� �̸� -> �޿��� 30% ����
      --�ٹ��ϼ��� 2000�� �̻� -> �޿��� 50%����
      ---------------------------------------------------
      --�ٹ��ϼ��� 2000�� �̻�            -> �޿� * 0.5
      --�ٹ��ϼ��� 1000�� �̻�            -> �޿� * 0.3
      ,CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3
            ELSE 0
        END "���ʽ�"
FROM
(   
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
        ,  CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '����'
                ELSE '����Ȯ�κҰ�'
                END "����"
          -- ���糪�� = ����⵵ - �¾�⵵ + 1(1900��� /2000���)
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899)
                WHEN SUBSTR(JUBUN,7,1) IN('3','4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1999)
                ELSE -1
            END "���糪��"
          -- �Ի���
         , HIREDATE "�Ի���"
          -- �޿�
         , SAL "�޿�"
    FROM TBL_SAWON
)T;

--������ ó���� ������ �������
--Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�...
--Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 �߻��� �� �ִ�.
--(��, �߰����� ��ȸ ������ �߻��ϰų�, ������ �Ļ��Ǵ� ���)
--�̿Ͱ������..�ش� �������� �ٽ� �����ؾ� �ϴ� ���ŷο��� ���� �� �ֵ���
--��(VIEW)�� ����������صѼ��ִ�.



CREATE OR REPLACE VIEW VIEW_SAWON --�̹� ���� �̸��� �䰡 �����ϸ� REPLACE�ϰ� ������ �����Ѵ�. 
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
    
  
      , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12),'YYYY')
        || '-' || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
        
   
    , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
    
    
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12),'YYYY')
        || '-' || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
        
   
    , T.�޿� 
    
                             
    , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
           WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3
           ELSE 0
           END "���ʽ�"
    
    
    
    
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
    , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1' , '3') THEN '����' 
           WHEN SUBSTR(JUBUN,7,1) IN ('2' , '4') THEN '����'
           ELSE '����Ȯ�κҰ�'
           END "����"
           , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1' , '2') 
                  THEN EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                  WHEN SUBSTR(JUBUN,7,1) IN ('3' , '4') 
                  THEN EXTRACT(YEAR FROM SYSDATE) -(TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                  ELSE -1
             END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
            
    FROM TBL_SAWON
) T;


SELECT *
FROM VIEW_SAWON
WHERE �ٹ��ϼ� >= 5000;


SELECT *
FROM VIEW_SAWON
WHERE ���ʽ�>= 2000;

--�ۼ��� ������ ����Ͽ�
-- TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
�����  ����  ���糪��  �޿�  ���̺��ʽ�
*/
-- ��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
--   30�� �̻� 40�� �̸��̸� �޿��� 50%
--   20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.

-- ����, �̷��� �ϼ��� ��ȸ ������ ����
-- VIEW_SAWON2 ��� �̸��� ������ �����Ѵ�
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
       ,CASE WHEN T.���糪�� >=40 THEN T.�޿�*0.7
             WHEN T.���糪�� >=30 THEN T.�޿�*0.5
             WHEN T.���糪�� >=20 THEN T.�޿�*0.3
             ELSE 0
        END "���̺��ʽ�"
FROM(
SELECT SANAME "�����"
       ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
       WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
       ELSE '����Ȯ�ξȵ�'
       END "����"
       , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN 
       EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
       WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
       THEN EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
       ELSE -1
       END "���糪��"
       ,SAL "�޿�"
       
FROM TBL_SAWON
)T;

----------------------------------------------------------------

--��RANK() : ���(����)�� ��ȯ�ϴ� �Լ�

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO"�μ���ȣ", SAL "�޿�" 
       ,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
       ,RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
FROM EMP
ORDER BY 3, 4 DESC;
/*
7839	KING	10	5000	    1	1
7902    	FORD	20	3000    	1	2
7788	SCOTT	20	3000	    1	2
7566	JONES	20	2975	    3	4
7698	BLAKE	30	2850	    1	5
7782    	CLARK	10	2450	    2	6
7499	ALLEN	30	1600	    2	7
7844	TURNER	30	1500	    3	8
7934	MILLER	10	1300	    3	9
7521    	WARD	30	1250	    4	10
7654	MARTIN	30	1250	    4	10
7876	ADAMS	20	1100	    4	12
7900	    JAMES	30	950     6	13
7369	SMITH	20	800	    5	14
*/

--DENSE_RANK() -> ������ ��ȯ�ϴ� �Լ� ���� RANK�� 
--���� ����� ������ �׸�ŭ �ڷ� �з��� �������� �̰� �ƴ�
--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ�
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"     
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"     
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839   KING   10   5000   1    1
7782   CLARK   10   2450   2    5
7934   MILLER   10   1300   3    8
7902   FORD   20   3000   1     2
7788   SCOTT   20   3000   1     2
7566   JONES   20   2975   2    3
7876   ADAMS   20   1100   3   10
7369   SMITH   20    800   4   12
7698   BLAKE   30   2850   1    4
7499   ALLEN   30   1600   2    6
7844   TURNER   30   1500   3    7
7654   MARTIN   30   1250   4    9
7521   WARD   30   1250   4    9
7900   JAMES   30    950   5   11
*/


SELECT *
FROM EMP;
--��EMP ���̺��� ��� �����͸�
--   �����, �μ���ȣ, ����, �μ�����������, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT ENAME, DEPTNO, SAL*12+NVL(COMM,0) "����"
       ,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü�޿�����"
       ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ�����������"
FROM EMP;
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
BLAKE	30	34200	1	5
CLARK	10	29400	2	6
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
MILLER	10	15600	3	10
WARD	30	15500	5	11
ADAMS	20	13200	4	12
JAMES	30	11400	6	13
SMITH	20	9600    	5	14
*/
SELECT T.*
       ,RANK() OVER(PARTITION BY DEPTNO ORDER BY T.���� DESC) "��ü�޿�����"
       ,RANK() OVER(ORDER BY T.���� DESC) "�μ�����������"

FROM(
SELECT ENAME, DEPTNO, SAL*12+NVL(COMM,0) "����"
FROM EMP
) T;


--��EMP ���̺��� ��ü ���� ����(���)�� 1����� 5�� ������..
-- �����, �μ���ȣ,����,��ü�������� �׸����� ��ȸ

SELECT ENAME "�����" , DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
       ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) <=5;
--window  functions are not allowed here
--WHERE���� RANK() OVER�� ��������.


SELECT T.*
FROM
(
SELECT ENAME "�����" , DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
       ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
)T
WHERE T.��ü�������� <=5;

--��EMP ���̺��� �� �μ����� ���� ����� 1�� ���� 2�� ������ ��ȸ�Ѵ�.
--  �����,�μ���ȣ,����,�μ����������,��ü�������
--  �׸��� ��ȸ�� �� �ֵ��� �Ѵ�.

SELECT T.*
FROM(
SELECT ENAME "�����" ,DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
       , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ����������"
       , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü�������"
FROM EMP
) T
WHERE T.�μ����������<=2;

--�� ����
--TRIM() �Լ� ������~!!!
SELECT TRIM('     TEST     ') "���"
FROM DUAL;
--TEST

--LN() �ڿ� �α� �Լ� ������~!!!
SELECT LN(95) "RESULT"
FROM DUAL;

--���� �׷� �Լ� ����---

--SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�
-- , VARIENCE() �л�, STDDEV()ǥ������

--�ر׷� �Լ��� ���� ū Ư¡
-- ó���ؾ� �� �����͵� �� NULL�� �����Ѵٸ�(���ԵǾ� �ִٸ�)
-- �� NULL�� ������ ���·� ������ �����Ѵٴ� ���̴�.
-- ��,NULL�� ������ ��󿡼� ���ܵȴ�.

--��SUM() ��
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
SELECT SUM(SAL)
FROM EMP;
--29025 ����

SELECT SUM(COMM) --NULL+300+500.... (x)
FROM EMP;
--==>2200 NULL�� �����ϰ� �����Ѵ�.

--��COUNT() ��(���ڵ�)�� ���� ��ȸ -> �����Ͱ� �� ������ Ȯ��...
SELECT COUNT(ENAME)
FROM EMP;
--==>>14

SELECT COUNT(COMM)
FROM EMP;
--==>>4 NULL�� ���� ����

SELECT COUNT(*)
FROM EMP;
--Ư�� �÷��� ��������ʰ� ���� �̷��� ����.

--��AVG() ��� ��ȯ
SELECT AVG(SAL) "COL"
       ,SUM(SAL) / COUNT(SAL) "COL2"
FROM EMP;
--2073.214285714285714285714285714285714286	
--2073.214285714285714285714285714285714286

SELECT AVG(COMM) "COL1"
      ,SUM(COMM) / COUNT(COMM) "COL2"
      FROM EMP;
      
      --==>>550	550

SELECT 2200 /14 "result"
FROM DUAL;
--==>>157.142857142857142857142857142857142857
--550�� �ƴ϶� �̰� �´°��̴�.

--�ص����Ͱ� NULL�� �÷��� ���ڵ�� �����󿡼� ���ܵǱ� ������
--  �����Ͽ� ���� ó���ؾ� �Ѵ�.

--VARIANCE(), STDDEV()
--��ǥ�������� ������ �л�, �л��� �������� ǥ��������.

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>1398313.87362637362637362637362637362637
--==>>1182.503223516271699458653359613061928508
SELECT POWER(STDDEV(SAL),2) "COL1"   --ǥ�� ���� ����
       ,VARIANCE(SAL) "COL2"
FROM EMP;
--1398313.87362637362637362637362637362637
--1398313.87362637362637362637362637362637


SELECT SQRT(VARIANCE(SAL)) "COL1"
    ,   STDDEV(SAL) "COL2"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508
1182.503223516271699458653359613061928508
*/

--��MAX() / MIN()
--   �ִ밪 / �ּҰ� ��ȯ

SELECT MAX(SAL) "COL1"
       ,MIN(SAL) "COL2"
FROM EMP;
--5000	800


--������
SELECT ENAME, SUM(SAL)
FROM EMP;
--ORA-00937: not a single-group group function

SELECT SUM(SAL)
FROM EMP;

SELECT DEPTNO, SUM(SAL)
FROM EMP;
-->����
--ORA-00937: not a single-group group function

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
10	8750
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO,SAL
FROM EMP
ORDER BY 1;

/*
10	2450��
10	5000 ��
10	1300��
20	2975��
20	3000��
20	1100��
20	800 ��
20	3000��
30	1250��
30	1500��
30	1600��
30	950 ��
30	2850��
30	1250��
*/

DROP TABLE TBL_EMP;

--�۽ǽ� ���̺� �ٽ� ����
CREATE TABLE TBL_EMP
AS 
SELECT *
FROM EMP;

--�۽ǽ� ������ �߰� �Է�
INSERT INTO TBL_EMP VALUES
(8001, '���¹�', 'CLERK',7566,SYSDATE,1500,10,NULL);

INSERT INTO TBL_EMP VALUES
(8002, '������', 'CLERK',7566,SYSDATE,2000,10,NULL);

INSERT INTO TBL_EMP VALUES
(8003, '�躸��', 'SALESMAN',7698,SYSDATE,1700,NULL,NULL);

INSERT INTO TBL_EMP VALUES
(8004, '������', 'SALESMAN',7698,SYSDATE,2500,NULL,NULL);

INSERT INTO TBL_EMP VALUES
(8005, '������', 'SALESMAN',7698,SYSDATE,1000,NULL,NULL);

SELECT*
FROM TBL_EMP;
/*
7369	SMITH	CLERK	7902    	80/12/17    	800		    20
7499	ALLEN	SALESMAN	7698	81/02/20	    1600    	300	30
7521    	WARD	SALESMAN	7698	81/02/22	    1250    	500	30
7566	JONES	MANAGER	7839	81/04/02	    2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	    1250	    1400	30
7698	BLAKE	MANAGER	7839	81/05/01    	2850		    30
7782	    CLARK	MANAGER	7839	81/06/09    	2450		    10
7788	SCOTT	ANALYST	7566	87/07/13    	3000	    	20
7839	KING	PRESIDENT		81/11/17	5000		    10
7844	TURNER	SALESMAN	7698	81/09/08    	1500	    0	30
7876	ADAMS	CLERK	7788	87/07/13	    1100	    	20
7900	    JAMES	CLERK	7698	81/12/03    	950		    30
7902    	FORD	ANALYST	7566	81/12/03	    3000		    20
7934	MILLER	CLERK	7782	    82/01/23	    1300	    	10
8001    	���¹�	CLERK	7566	22/08/18	    1500      	10	
8002	    ������	CLERK	7566	22/08/18	    2000	        10	
8003	    �躸��	SALESMAN	7698	22/08/18	    1700		
8004	    ������	SALESMAN	7698	22/08/18    	2500		
8005	    ������	SALESMAN	7698	22/08/18    	1000		
*/

COMMIT;

SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;
/*
20	800	
	1700	
	1000	
10	1300	
20	2975	
30	2850	
10	2450	
20	3000	
10	5000	
	2500	
20	1100	
30	950	
20	3000	
30	1250	    1400
30	1250	    500
30	1600    	300
	1500    	10
	2000	    10
30	1500    	0

*/

--�ؿ���Ŭ�� NULL�� ���� ū������ �����Ѵ�.
--(ORACLE 9i ������ NULL�� ���� �������̾���.)
--MSSQL �� NULL�� ���� ���� ������ �����Ѵ�.

--TBL_EMP ���̺��� ������� �μ��� �޿��� ��ȸ
-- �μ���ȣ, �޿��� �׸� ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
10	8750
20	10875
30	9400
	8700    --�μ���ȣ�� NULL�� ������� �޿���
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

/*
10	8750
20	10875
30	9400
	8700
	37725   --���μ� �������� �޿���
*/

SELECT NVL(TO_CHAR(DEPTNO),'���μ�' )"�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
���μ�	29025
*/
SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

/*
10	        8750
20	        10875
30	        9400
���μ�	29025

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