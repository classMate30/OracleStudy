SELECT USER
FROM DUAL;
--==>>SCOTT


--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2=�����' END
FROM DUAL;
--==>>5+2=�����

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=�����' END
FROM DUAL;
--==>>5+2=7 


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                 WHEN 3 THEN '1+1=3'
                 WHEN 4 THEN '1+1=4'
                 ELSE '����'
        END
FROM DUAL;



SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                 WHEN 3 THEN '1+1=3'
                 WHEN 2 THEN '1+1=4'
                 ELSE '����'
        END
FROM DUAL;



SELECT CASE WHEN 5+2=4 THEN '5+2=4'
             WHEN 6-3=2 THEN '6-3=2'
             WHEN 2*1=2 THEN '2*1=2'
             WHEN 6/3=3 THEN '6/3=3'
             ELSE '����'
        END
FROM DUAL;
--==>>2*1=2



SELECT CASE WHEN 5+2=7 THEN '5+2=7'
             WHEN 6-3=3 THEN '6-3=3'
             WHEN 2*1=2 THEN '2*1=2'
             WHEN 6/3=2 THEN '6/3=2'
             ELSE '����'
        END
FROM DUAL;
--==>>5+2=7

--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����') "���Ȯ��"
FROM DUAL;
--==>>5-2=3


--�� CASE WHEN THEN ELSE END (���ǹ�, �б⹮) Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
             WHEN 5>2 THEN '5>2'
             ELSE '5�� 2�� �� �Ұ�'
        END "���Ȯ��"
FROM DUAL;

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '�ҿ�����'
             WHEN 5>2 OR 2=3 THEN '�ÿ�����'
             ELSE '��������'
        END "���Ȯ��"
FROM DUAL;
--==>>�ҿ�����


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '���游��'
             WHEN 5<2 AND 2=3 THEN '��������'
             ELSE '���ϸ���'
        END "���Ȯ��"
FROM DUAL;
--==>>���游��


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '���游��'
             WHEN 5<2 AND 2=3 THEN '��������'
             ELSE '���ϸ���'
        END "���Ȯ��"
FROM DUAL;
--==>>���ϸ���

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	����	    9409252234567	2005-01-03	3000
1002	�躸��	    9809022234567	1999-11-23	2000
1003	���̰�	    9810092234567	2006-08-10	4000
1004	���α�	    9307131234567	1998-05-13	2000
1005	������	    7008161234567	1998-05-13	1000
1006	������	    9309302234567	1999-10-10	3000
1007	������	    0302064234567	2010-10-23	4000
1008	�μ���	    6807102234567	1998-03-20	1500
1009	������	    6710261234567	1998-03-20	1300
1010	������	6511022234567	1998-12-20	2600
1011	���켱	    0506174234567	2011-10-10	1300
1012	���ù�	    0102033234567	2010-10-10	2400
1013	����	    0210303234567	2011-10-10	2800
1014	�ݺ���	    9903142234567	2012-11-11	5200
1015	������	    9907292234567	2012-11-11	5200
1016	���̰�	    0605063234567	2015-01-20	1500
*/

--�� TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸��� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
--   �������ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--     ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ���
--   ��, ���糪�̴� �⺻ �ѱ����� ������ ���� ������ �����Ѵ�
--   ����, ������������ �ش� ������ ���̰� �ѱ� ���̷� 60���� �Ǵ� ���� 
--   �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�
--   �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
--   �� ����� ���� �޿� ���� 30% ����, 2000�� �̻� �ٹ��� �����
--   �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�

--EX 1001	����	9409252234567 ���� 29 2005-01-03 2053-01-03 XXXXX  XXXXXX 3000

--�ʱ� ����
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE �ֹε�Ϲ�ȣ 7��°�ڸ��� 1 OR 3�̸� ���� / �ֹε�Ϲ�ȣ 7��°�ڸ��� 2 OR 4�̸� ����
    ,   ����⵵(SYSDATE) - �ֹε�Ϲ�ȣ ����⵵  -> ������
    ,   �Ի���
    ,    "����������"
    ,    "�ٹ��ϼ�"
    ,    "�����ϼ�"
    ,   SAL "�޿�"
    ,   CASE WHEN 1000<=�ٹ��ϼ� AND �ٹ��ϼ�<2000 THEN SAL*0.3 
            WHEN 2000<�ٹ��ϼ� THEN SAL*0.5 "���ʽ�"
            END 
FROM TBL_SAWON;

--�� ���� Ȯ���ؼ� ���
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
FROM TBL_SAWON;


--�� ���� Ȯ���ؼ� ���
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
    ,   ����⵵ - �¾�⵵+1
        SIGN() 1�̸� +1 SIGN() 0�̸� 1 / SIGN ()-1�̸� 
        CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,4)) - SUBSTR(JUBUN,1,2)) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,4)) - SUBSTR(JUBUN,1,2)) = 1 THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,4)) - SUBSTR(JUBUN,1,2)+1
                ELSE '�˼�����'
                END
FROM TBL_SAWON;

--�� ���̿Ϸ�
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
            
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                ELSE 0
                END "����"
FROM TBL_SAWON;

 
--�� ���������� �ʹ� ��ƴ�...
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
            
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"
     
FROM TBL_SAWON;


--�� �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
            
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"
    ,   TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
FROM TBL_SAWON;

--�� �����ϼ� ���� �˾Ƴ������� ó���Ұ�, �޿�, ���ʽ�
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����"
            
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"
    ,   TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
    ,   SAL "�޿�"
    ,   CASE WHEN TRUNC(SYSDATE - HIREDATE) >=1000 AND TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
             WHEN TRUNC(SYSDATE - HIREDATE) >2000 THEN SAL*0.5
             ELSE 0
             END "���ʽ�"
FROM TBL_SAWON;


--�� ����������, �����ϼ�
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����" 
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"
    ,   TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
    ,   SAL "�޿�"
    ,   CASE WHEN TRUNC(SYSDATE - HIREDATE) >=1000 AND TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
             WHEN TRUNC(SYSDATE - HIREDATE) >2000 THEN SAL*0.5
             ELSE 0
             END "���ʽ�"
FROM TBL_SAWON;

--����
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����" 
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"

--�� �����ٸ���?
/*    ,TO_CHAR(ADD_MONTHS(SYSDATE,(60-((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))+1)
       - CASE WHEN SUBSTR(JUBUN,0,2)<22 THEN SUBSTR(JUBUN,0,2)+2000
          ELSE SUBSTR(JUBUN,0,2)+1900
          END))*12)), 'YYYY') ||'-'||TO_CHAR(HIREDATE,'MM-DD')"����������"
*/         
--����
    ,TO_CHAR(ADD_MONTHS(SYSDATE,((60-((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))+1)
       - CASE WHEN SUBSTR(JUBUN,0,2)<22 THEN SUBSTR(JUBUN,0,2)+2000
          ELSE SUBSTR(JUBUN,0,2)+1900
          END))*12)), 'YYYY') ||'-'||TO_CHAR(HIREDATE,'MM-DD')"����������"
          
    ,   TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
    , CASE WHEN SUBSTR(JUBUN, 1, 1) = '0'
       THEN TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 2000 + 1) || '-00') - SYSDATE)
       ELSE TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 1900 + 1) || '-00') - SYSDATE)     
          END  "�����ϼ�"
    ,   SAL "�޿�"
    ,   CASE WHEN TRUNC(SYSDATE - HIREDATE) >=1000 AND TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
             WHEN TRUNC(SYSDATE - HIREDATE) >2000 THEN SAL*0.5
             ELSE 0
             END "���ʽ�"

FROM TBL_SAWON;



--����
SELECT SANO "�����ȣ"
    ,   SANAME "�����"
    ,   JUBUN "�ֹι�ȣ"
    ,   CASE WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(1) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(3) THEN '����'
             WHEN TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(2) OR TO_NUMBER(SUBSTR(JUBUN,7,1))=ANY(4) THEN '����'                
            ELSE '�˼� ����'
            END "����" 
    ,   CASE WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 0
                OR SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = 1 
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))+1
                
                WHEN SIGN(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),3,2)) - TO_NUMBER(SUBSTR(JUBUN,1,2))) = -1
                THEN TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE),1,4)) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1900) +1
                
                ELSE 0
                END "����"
    ,   HIREDATE "�Ի���"
    ,TO_CHAR(ADD_MONTHS(SYSDATE,((60-((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))+1)
       - CASE WHEN SUBSTR(JUBUN,0,2)<22 THEN SUBSTR(JUBUN,0,2)+2000
          ELSE SUBSTR(JUBUN,0,2)+1900
          END))*12)), 'YYYY') ||'-'||TO_CHAR(HIREDATE,'MM-DD')"����������"    
    ,   TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
    , CASE WHEN SUBSTR(JUBUN, 1, 1) = '0'
       THEN TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 2000 + 1) || '-00') - SYSDATE)
       ELSE TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 1900 + 1) || '-00') - SYSDATE)     
          END  "�����ϼ�"

    ,   SAL "�޿�"
    ,   CASE WHEN TRUNC(SYSDATE - HIREDATE) >=1000 AND TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
             WHEN TRUNC(SYSDATE - HIREDATE) >2000 THEN SAL*0.5
             ELSE 0
             END "���ʽ�"

FROM TBL_SAWON;



--������ Ǯ��
SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
    ,  CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�'
            END "����"
      -- ���糪�� = ����⵵ - �¾�⵵ + 1(1900��� /2000���)
      , CASE WHEN �ֹι�ȣ 7��° �ڸ� 1���� '1'�Ǵ� '2' THEN ����⵵ - (�ֹε�Ϲ�ȣ +1899)
            WHEN �ֹι�ȣ 7��° �ڸ� 1���� '3' �Ǵ� '4'  THEN ����⵵ - (�ֹε�Ϲ�ȣ +1999)
            ELSE -1
        END "���糪��"
        
FROM TBL_SAWON;



SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
    ,  CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�'
            END "����"
      -- ���糪�� = ����⵵ - �¾�⵵ + 1(1900��� /2000���)
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN('1', '2') THEN ����⵵ - (�ֹε�Ϲ�ȣ +1899)
            WHEN SUBSTR(JUBUN,7,1) IN('3','4')  THEN ����⵵ - (�ֹε�Ϲ�ȣ +1999)
            ELSE -1
        END "���糪��"
        
FROM TBL_SAWON;


SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
    ,  CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�'
            END "����"
      -- ���糪�� = ����⵵ - �¾�⵵ + 1(1900��� /2000���)
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (�ֹε�Ϲ�ȣ +1899)
            WHEN SUBSTR(JUBUN,7,1) IN('3','4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (�ֹε�Ϲ�ȣ +1999)
            ELSE -1
        END "���糪��"
FROM TBL_SAWON;


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
FROM TBL_SAWON;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����", ����*2 "�ι迬��"
FROM EMP;
--==>>���� �߻�
--      (ORA-00904: "����": invalid identifier)

SELECT EMPNO, ENAME, SAL, COMM, ����
FROM 
(
    SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����"
    FROM EMP
);


SELECT EMPNO, ENAME, SAL, COMM, ����, ����*2 "�ι迬��"
FROM 
(
    SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0)"����"
    FROM EMP
);


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
--�� �������� ����Ǵ� ���� , �����͸� ������ �ִ� ���� �ƴ�

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
    --TO_CHAR('Ư����¥','YYYY')|| '-' || TO_CHAR('�Ի���','MM-DD') �� ����������
    --TO_CHAR('ADD_MONTHS(SYSDATE, (60-���糪��)*12)','YYYY')|| '-' || TO_CHAR('�Ի���','MM-DD')
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')
    || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
    
    --�ٹ� �ϼ�
    --�ٹ��ϼ� = ������ - �Ի���
    ,TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
    
    --�����ϼ�
    --�����ϼ� = ���������� - ������
    ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')
    || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
    
    --�޿�
    ,T.�޿�
    
    --���ʽ�
    --�ٹ��ϼ��� 1000�� �̻� 2000�� �̸� �� �޿��� 30% ����
    --�ٹ��ϼ��� 2000�� �̻�             �� �޿��� 50% ����
    --������                             �� 0
    ----------------------------------------------------------------------------
    --�ٹ��ϼ�  2000�� �̻�              �� �޿�*0.5
    --�ٹ��ϼ�  1000�� �̻�              �� �޿�*0.3
    --������                             �� 0
    ,CASE  WHEN TRUNC(SYSDATE - T.�Ի���)>=2000  THEN T.�޿�*0.5
           WHEN TRUNC(SYSDATE - T.�Ի���)>=1000  THEN T.�޿�*0.3      
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
--Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 �߻��� �� �ִ�
--(��, �߰����� ��ȸ������ �߻��ϰų�, ������ �Ļ��Ǵ� ���)
--�̿� ���� ���... �ش��������� �ٽ� �����ؾ��ϴ� ���ŷο��� ���� �� �ֵ���
--��(VIEW)�� ����� ������ �� �� �ִ�


CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.����� , T.�����ȣ, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���

    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')
    || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
    ,TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
    ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')
    || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
    ,T.�޿�
    ,CASE  WHEN TRUNC(SYSDATE - T.�Ի���)>=2000  THEN T.�޿�*0.5
           WHEN TRUNC(SYSDATE - T.�Ի���)>=1000  THEN T.�޿�*0.3      
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
         , HIREDATE "�Ի���"
         , SAL "�޿�"
    FROM TBL_SAWON
)T;

CREATE OR REPLACE VIEW VIEW_SAWON
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

--�� ���������� Ȱ���Ͽ�
--   TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�
/*
--------------------------------------------------------------
    �����     ����      ���糪��        �޿�       ���̺��ʽ�
----------------------------------------------------------------

*/

--  ��, ���̺��ʽ��� ���糪�̰� 40���̻��̸� �޿��� 70%
--  30���̻� 40�� �̸��̸� �޿��� 50%
--  20���̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�

--  ����, �̷��� �ϼ��� ��ȸ ������ ����
--  VIEW_SAWON2��� �̸��� ��(VIEW)�� ������ �� �ֵ��� �Ѵ�


SELECT *
FROM TBL_SAWON;

SELECT SANAME"�����"
    ,   CASE WHEN �ֹε�Ϲ�ȣ7��°�ڸ��� '1','3' THEN '����'
             WHEN  �ֹε�Ϲ�ȣ7��°�ڸ��� '2','4' THEN '����' 
             ELSE '�Ǻ��Ұ�'
             END "����"
    ,  CASE WHEN �ֹε�Ϲ�ȣ7��°�ڸ��� '1','2' THEN ����⵵ - �ֹε�Ϲ�ȣ ���ڸ����ڸ� +1899
            WHEN �ֹε�Ϲ�ȣ7��°�ڸ��� '3','4' THEN ����⵵ - �ֹε�Ϲ�ȣ ���ڸ����ڸ� + 1999
            ELSE -1
            END "���糪��"
    , SAL "�޿�"             
FROM TBL_SAWON;

--  ��, ���̺��ʽ��� ���糪�̰� 40���̻��̸� �޿��� 70%
--  30���̻� 40�� �̸��̸� �޿��� 50%
--  20���̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�

SELECT CASE WHEN 40���̻��̸� THEN �޿�*0.7 A.���糪��>=
             WHEN 30���̻��̸� THEN �޿�*0.5
             WHEN 20���̻��̸� THEN �޿�*0.3
             ELSE 0
             END "���̺��ʽ�"
             
FROM
(
    SELECT SANAME"�����"
        ,   CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                 WHEN  SUBSTR(JUBUN,7,1) IN('2','4') THEN '����' 
                 ELSE '�Ǻ��Ұ�'
                 END "����"
        ,  CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899)
                WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                ELSE -1
                END "���糪��"
        , SAL "�޿�"             
    FROM TBL_SAWON;
)A;





SELECT A.�����,A.����,A.���糪��,A.�޿�
        ,CASE WHEN A.���糪��>=40 THEN A.�޿�*0.7 
             WHEN A.���糪��>=30 THEN A.�޿�*0.5
             WHEN A.���糪��>=20 THEN A.�޿�*0.3
             ELSE 0
             END "���̺��ʽ�"
             
FROM
(
    SELECT SANAME"�����"
        ,   CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                 WHEN  SUBSTR(JUBUN,7,1) IN('2','4') THEN '����' 
                 ELSE '�Ǻ��Ұ�'
                 END "����"
        ,  CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899)
                WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                ELSE -1
                END "���糪��"
        , SAL "�޿�"             
    FROM TBL_SAWON
)A;
--==>>
/*
����	    ����	29	3000	900
�躸��	    ����	25	2000	600
���̰�	    ����	25	4000	1200
���α�	    ����	30	2000	1000
������	    ����	53	1000	700
������	    ����	30	3000	1500
������	    ����	20	4000	1200
�μ���	    ����	55	1500	1050
������	    ����	56	1300	910
������	����	58	2600	1820
���켱	    ����	18	1300	0
���ù�	    ����	22	2400	720
����	    ����	21	2800	840
�ݺ���	    ����	24	5200	1560
������	    ����	24	5200	1560
���̰�	    ����	17	1500	0

*/



CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT A.�����,A.����,A.���糪��,A.�޿�
        ,CASE WHEN A.���糪��>=40 THEN A.�޿�*0.7 
             WHEN A.���糪��>=30 THEN A.�޿�*0.5
             WHEN A.���糪��>=20 THEN A.�޿�*0.3
             ELSE 0
             END "���̺��ʽ�"
             
FROM
(
    SELECT SANAME"�����"
        ,   CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                 WHEN  SUBSTR(JUBUN,7,1) IN('2','4') THEN '����' 
                 ELSE '�Ǻ��Ұ�'
                 END "����"
        ,  CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) +1899)
                WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                ELSE -1
                END "���糪��"
        , SAL "�޿�"             
    FROM TBL_SAWON
)A;

SELECT *
FROM VIEW_SAWON2;

--------------------------------------------------------------------------------------------

--�� RANK() �� ���(����)�� ��ȯ�ϴ� �Լ�
--�Լ� ������ ��¦ Ư����
SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",SAL"�޿�"
    ,   RANK()OVER(ORDER BY SAL DESC) "��ü�޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	13
7369	SMITH	20	800	14
*/


SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",SAL"�޿�"
     ,   RANK()OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
    ,   RANK()OVER(ORDER BY SAL DESC) "��ü�޿�����"
FROM EMP
ORDER BY DEPTNO;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800 	5	14
7698	BLAKE	30	2850	1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250	4	10
7521	WARD	30	1250	4	10
7900	JAMES	30	950	    6	13
*/

--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ�
SELECT EMPNO"�����ȣ",ENAME"�����",DEPTNO"�μ���ȣ",SAL"�޿�"
    ,   DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
    ,   DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
7900	JAMES	30	950 	5	11
*/


--�� EMP���̺��� ��������͸�
--   �����, �μ���ȣ, ����, �μ�����������, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    ,   DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ�����������"
    ,   DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
ORDER BY 2,3;


--�� EMP���̺��� ��������͸�
--   �����, �μ���ȣ, ����, �μ�����������, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT  ENAME "�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    ,   RANK() OVER(PARTITION BY DEPTNO ORDER BY (����) DESC) "�μ�����������"
    ,   RANK() OVER(ORDER BY (����) DESC)"��ü��������"
FROM EMP;




SELECT  ENAME "�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    ,   RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0)) DESC) "�μ�����������"
    ,   RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0)) DESC)"��ü��������"
FROM EMP;
--==>>
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
SMITH	20	9600	5	14
*/


SELECT T.*
    ,   RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ�����������"
    ,   RANK() OVER(ORDER BY T.���� DESC)"��ü��������"
FROM 
(
    SELECT ENAME "�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    FROM EMP
)T;
--==>>
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
SMITH	20	9600	5	14
*/


--�� EMP���̺��� ��ü ���� ����(���)�� 1����� 5�������...
--      �����, �μ���ȣ,����, ��ü�������� �׸����� ��ȸ�Ѵ�
CREATE OR REPLACE VIEW VIEW_A
AS
SELECT T.*
    ,   RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ�����������"
    ,   RANK() OVER(ORDER BY T.���� DESC)"��ü��������"
FROM 
(
    SELECT ENAME "�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    FROM EMP
)T;

SELECT �����,�μ���ȣ,����,��ü��������
FROM VIEW_A
WHERE ��ü��������<=5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--�� EMP���̺��� ��ü ���� ����(���)�� 1����� 5�������...
--      �����, �μ���ȣ,����, ��ü�������� �׸����� ��ȸ�Ѵ�

SELECT �����, �μ���ȣ, ����, ��ü��������
FROM EMP
WHERE ��ü��������(���)�� 1����� 5��;


SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    , RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0))DESC) "��ü��������"
FROM EMP
WHERE RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0))DESC)<=5;
--==>>���� �߻�
--      (ORA-30483: window  functions are not allowed here)

--�� ���� ������ RANK() OVER() �Լ��� WHERE ���������� ����� ����̸�...
--   �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�
--   �� ���, �츮�� INNER VIEW�� Ȱ���ؼ� Ǯ���ؾ� �Ѵ�.


SELECT T.*
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
        , RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0))DESC) "��ü��������"
    FROM EMP
)T
WHERE T.��ü�������� <=5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--�� EMP���̺��� �� �μ����� ���� ����� 1����� 2������� ��ȸ�Ѵ�
--   �����, �μ���ȣ, ����, �μ����������, ��ü�������
--   �׸��� ��ȸ�� �� �ֵ��� �Ѵ�

SELECT T.�����,T.�μ���ȣ,T.����,T.�μ����������,T.��ü�������
FROM
(
SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    ,   RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0))DESC)"��ü�������"
    ,   RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0))DESC)"�μ����������"
FROM EMP
)T
WHERE T.�μ���������� <=2;

--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/


--�� ����
--TRIM() �Լ� ������~!!
SELECT TRIM('      TEST      ') "RESULT"
FROM DUAL;
--==>>TEST

-- LN() �ڿ� �α� �Լ� ������~!!
SELECT LN(95) RESULT
FROM DUAL;
--==>>4.55387689160054083460978676511404117675



------------------------------------------------------------------------------
--���� �׷� �Լ� ����--
--SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪 , MIN() �ּҰ�
--, VARIENCE() �л�, STDDEV() ǥ������

--�� �׷� �Լ��� ���� ū Ư¡
--   ó�� �ؾ��� �����͵� �� NULL�� �����Ѵٸ� (���ԵǾ� �ִٸ�)
--   �� NULL�� ������ ���·� ������ �����Ѵٴ� ���̴�.
--   ��, NULL�� ������ ��󿡼� ���ܵȴ�.

--�� SUM()��
-- EMP���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�
SELECT SAL
FROM EMP;
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
*/
SELECT SUM(SAL)
FROM EMP;
--==>>29025

SELECT SUM(COMM)--NULL+300+500+...+NULL (X)
FROM EMP;
--==>>2200


--�� COUNT() ��(���ڵ�)�� ���� ��ȸ �� �����Ͱ� ������� Ȯ��...
SELECT COUNT(ENAME)
FROM EMP;
--==>>14

SELECT COUNT(COMM)
FROM EMP;
--==>>4


SELECT COUNT(*)
FROM EMP;

--�� AVG() ��� ��ȯ
SELECT AVG(SAL) "COL1"
    ,   SUM(SAL) / COUNT(SAL) "COL2"
FROM EMP;
--==>>
--2073.214285714285714285714285714285714286
--2073.214285714285714285714285714285714286


SELECT AVG(COMM) "COL1"
    ,   SUM(COMM)/COUNT(COMM) "COL2"
FROM EMP;
--==>>
--550
--550


SELECT 2200/14 "RESULT"
FROM DUAL;
--==>>157.142857142857142857142857142857142857

--�� �����Ͱ� NULL�� �÷��� ���ڵ��  ���� ��󿡼� ���ܵǱ� ������
--   �����Ͽ� ���� ó���ؾ� �Ѵ�


--VARIANCE() , STDDEV()
--�� ǥ�������� ������ �л�, �л��� �������� ǥ������

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL),2)"COL1"
    ,   VARIANCE(SAL) "COL2"
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)) "COL1"
    ,   STDDEV(SAL) "COL2"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508
1182.503223516271699458653359613061928508
*/


SELECT MAX(SAL) "COL1"
    ,   MIN(SAL) "COL2"
FROM EMP;
--==>>5000 800


--�� ����
SELECT NAME, SUM(SAL)
FROM EMP;
--==>>ORA-00904: "NAME": invalid identifier


SELECT DEPTNO,SUM(SAL)
FROM EMP;
--==>>ORA-00904: "NAME": invalid identifier


SELECT DEPTNO , SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--==>>
/*
30	9400
20	10875
10	8750
*/

SELECT DEPTNO , SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;

SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450��
10	5000��
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
--==>>Table TBL_EMP��(��) �����Ǿ����ϴ�.


CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� �ǽ� �߰� ������ �Է�
INSERT INTO TBL_EMP VALUES
(8001,'���¹�','CLERK',7566,SYSDATE,1500,10,NULL);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8002,'������','CLERK',7566,SYSDATE,2000,10,NULL);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8003,'�躸��','SALESMAN','7698',SYSDATE,1700,NULL,NULL);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_EMP VALUES
(8004,'������','SALESMAN','7698',SYSDATE,2500,NULL,NULL);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_EMP VALUES
(8005,'������','SALESMAN','7698',SYSDATE,1000,NULL,NULL);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	950		        30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
8001	���¹�	CLERK	    7566	2022-08-18	1500	        10	
8002	������	CLERK	    7566	2022-08-18	2000	        10	
8003	�躸��	SALESMAN	7698	2022-08-18	1700		
8004	������	SALESMAN	7698	2022-08-18	2500		
8005	������	SALESMAN	7698	2022-08-18	1000		
*/
--�� Ŀ��
COMMIT;

SELECT COMM
FROM TBL_EMP
ORDER BY COMM DESC;
--==>>
/*













1400
500
300
10
10
0
*/
--�� ����Ŭ������ NULL�� ���� ū ������ �����Ѵ�.
--   (ORACLE 9i������ NULL�� ���� ���� ������ �����߾���.)
--    MSSQL�� NULL�� ���� ���� ������ �����Ѵ�


--�� TBL_EMP���̺��� ������� �μ��� �޿��� ��ȸ
--   �μ���ȣ, �޿��� �׸���ȸ

SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10	    8750
20	    10875
30	    9400
(NULL)	8700
*/



SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	8700        --�μ� ��ȣ�� NULL�� �������� �޿���
	37725       --���μ� �������� �޿���
*/

SELECT DEPTNO"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025
*/
SELECT *
FROM EMP;

SELECT NVL(DEPTNO,'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>�����߻�
--  (ORA-01722: invalid number)



SELECT NVL(TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	         8750
20	        10875
30	         9400
���μ�	29025
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL(TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
���μ�	8700
���μ�	37725
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ",SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
���μ�	8700
���μ�	37725
*/
