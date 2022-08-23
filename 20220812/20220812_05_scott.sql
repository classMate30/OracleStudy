SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명",SAL"급여",DEPTNO"부서번호"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO =30;

--※ 위의 구문은 IN연산자를 활용하여
--   다음과 같이 처리할수 있으며
--   위 구문의 처리 결과와 같은 결과를 반환한다
SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명",SAL"급여",DEPTNO"부서번호"
FROM EMP
WHERE DEPTNO IN (20 ,30);


--○ EMP테이블에서 직종이 CLERK인 사원들의 데이터를 모두 조회한다
SELECT *
FROM EMP
WHERE 직종이 CLERK;

select *
from emp
where job = 'clerk';
--==>> 조회 결과 없음
--찾고자 하는 데이터의 대소문자 구분 확실히


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

--※ 오라클에서... 입력된 데이터의 값 만큼은...
--   반드시 대소문자 구분을 한다

--○ EMP테이블에서 직종이 CLERK인 사원들 중
--   20번 부서에 근무하는 사원들의
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명", SAL"급여", DEPTNO"부서번호"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>
/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/



--○ EMP 테이블의 구조와 데이터를 확인해서
--   이와 똑같은 데이터가 들어있는 테이블의 구조를 생성한다
--   (팀별로 ... EMP3)

DESCRIBE EMP;
DESC EMP;

--1. 복사할 대상 테이블의 구조확인
DESCRIBE EMP;
DESC EMP;
--==>>
/*
이름       널?       유형           
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

-- 2. 대상 테이블의 구조에 따라 새로운 테이블 생성
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
--==>>Table EMP1이(가) 생성되었습니다.

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



-- 5. 확인
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
--==>>Table EMP3이(가) 생성되었습니다.


INSERT INTO DEPT3 VALUES   (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT3 VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT3 VALUES   (30,'SALES','CHICAGO');
INSERT INTO DEPT3 VALUES   (40,'OPERATIONS','BOSTON');
--==>>1 행 이(가) 삽입되었습니다. *4



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


--○ 대상 테이블의 내용에 따라 테이블 생성
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>Table TBL_EMP이(가) 생성되었습니다.

SELECT *
FROM TBL_EMP;


DESCRIBE TBL_EMP;



--○ 복사한 테이블 조회
SELECT *
FROM TBL_EMP;


--○ DEPT 테이블을 복사하여 위와 같이 TBL_DEPT 테이블을 생성한다
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;


DESCRIBE TBL_DEPT;


SELECT *
FROM DEPT;


--○ 복사한 테이블 확인
SELECT *
FROM TBL_DEPT;


--○ 테이블의 커멘트 정보 확인
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

--○ 테이블 레벨의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원 정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT    	TABLE	(null)
TBL_EMP	        TABLE	사원 정보
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


--○ TBL_DEPT 테이블을 대상으로 테이블 레벨의 커멘트 데이터 입력
--   → 부서 정보
COMMENT ON TABLE TBL_DEPT IS '부서 정보';


--○ 커멘트 데이터 입력 후 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	부서 정보
TBL_EMP	        TABLE	사원 정보
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


--○ 컬럼(COLUMN) 레벨의 커멘트 데이터 확인
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


--○ 컬럼(COLUMN) 레벨의 커멘트 데이터 확인(TBL_DEPT 테이블 소속의 컬럼들만 조회)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';            --조건 추가
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--COMMENT ON COLUMN
--COMMENT ON TABLE 테이블명 IS '커멘트';


--○ 테이블에 소속된(포함된) 컬럼에 대한 커멘트 데이터 입력(설정)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서 번호';
--==>>Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서 이름';
--==>>Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.LOC IS '부서 위치';
--==>>Comment이(가) 생성되었습니다.


--○ 커멘트 데이터가 입력된 테이블의
--   컬럼 레벨 커멘트 데이터 확인(TBL_DEPT 테이블 소속의 컬럼들만 조회_)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	부서 번호
TBL_DEPT	DNAME	부서 이름
TBL_DEPT	LOC	부서 위치
*/


--○ TBL_EMP 테이블을 대상으로
--   테이블에 소속된(포함된) 컬럼에 대한 커멘트 데이터 입력(설정)
DESC TBL_EMP;
COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원 번호';
COMMENT ON COLUMN TBL_EMP.ENAME IS '사원명';
COMMENT ON COLUMN TBL_EMP.JOB IS '직종';
COMMENT ON COLUMN TBL_EMP.MGR IS '관리자 사원 번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN TBL_EMP.SAL IS '급여';
COMMENT ON COLUMN TBL_EMP.COMM IS '수당';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서 번호';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	사원 번호
TBL_EMP	ENAME	사원명
TBL_EMP	JOB	직종
TBL_EMP	MGR	관리자 사원 번호
TBL_EMP	HIREDATE	입사일
TBL_EMP	SAL	급여
TBL_EMP	COMM	수당
TBL_EMP	DEPTNO	부서 번호
*/



--■■■ 컬럼 구조의 추가 및 제거 ■■■--
SELECT *
FROM TBL_EMP;

--(ADD : ① 제약 조건 ② 컬럼)--
--○ TBL_EMP 테이블에 주민등록번호 데이터를 담을 수 있는 컬럼 추가 (구조적인 변경)
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT '01048484114'
FROM DUAL;
--==>>01048484114

SELECT 01048484114
FROM DUAL;
--==>>1048484114


--○ 확인
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
이름       널? 유형           
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

--> SSN(주민등록번호) 컬럼이 정상적으로 포함(추가)된 사항을 확인
--※ 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음
SELECT *
FROM TBL_EMP;

SELECT SSN, ENAME
FROM TBL_EMP;


--구조적으로 제거 : DROP 뭘 제거하는지 명시
--○ TBL_EMP 테이블에 추가한 SSN(주민등록번호) 컬럼 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>>Table TBL_EMP이(가) 변경되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 삭제되었음을 확인

SELECT *
FROM TBL_EMP;

DELETE TBL_EMP;
--==>>14개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--> 테이블의 구조(뼈대, 틀)는 그래도 남아있는 상태에서
--  데이터만 모두 소실(삭제)된 상황임을 확인

DROP TABLE TBL_EMP;
--==>>Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--==>> 에러 발생
-- (ORA-00942: table or view does not exist)

--> 테이블 자체가 구조적으로 제거된 상황

--○ 테이블 다시 복사(생성)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

--○ NULL의 처리
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;


SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>>(null)    (null)  (null)  (null)  (null)

--※ 관찰의 결과
--   NULL은 상태의 값을 의미하며... 실제 존재하지 않는 값이기 때문에
--   이 NULL이 연산에 포함될 경우...
--   그 결과는 무조건 NULL 이다


--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다
SELECT *
FROM TBL_EMP;


SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> 조회 결과 없음

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> 에러 발생

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> 조회 결과 없음


--※ NULL은 실제 존재하는 값이 아니기 때문에
--   일반적인 연산자를 활용하여 비교할 수 없다
--   NULL을 대상으로 사용할 수 없는 연산자들... 
--   >=, <= , = , > , < , != , <>←같지 않다 , ^=

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



--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의 
--   사원명, 직종명, 부서번호 항목을 조회한다

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

--○ TBL_EMP 테이블에서 커미션이 NULL이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

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
SELECT ENAME"사원명",JOB"직종명",SAL"급여",COMM"커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며, 연봉내역에 포함된다

ALTER TABLE TBL_EMP 
ADD  INCOME NUMBER;

ALTER TABLE TBL_EMP
DROP COLUMN INCOME;

SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션" ,SAL * 12 "연봉"-- +, INCOME
FROM TBL_EMP;

SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션" ,(SAL * 12) + COMM "연봉"-- +, INCOME
FROM TBL_EMP;


--○ NVL()  오라클에서 배우는 두번째 함수
SELECT NULL "COL1", NVL(NULL,10) "COL2"
FROM DUAL;
--==>>	10

SELECT NULL "COL1", NVL(NULL,10) "COL2", NVL(5,10) "COL3"
FROM DUAL;
--==>> (null)	10	5
-- 첫 번째 파라미터 값이 NULL이면, 두 번째 파라미터 값을 반환한다
-- 첫 번째 파라미터 값이 NULL이 아니면, 그 값을 그대로 반환한다

SELECT ENAME "사원명", COMM "수당"
FROM TBL_EMP;

SELECT ENAME "사원명", NVL(COMM,2345) "수당"
FROM TBL_EMP;

SELECT ENAME "사원명", NVL(COMM,0) "수당"
FROM TBL_EMP;



-- A
SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션" ,(SAL * 12) + NVL(COMM,0) "연봉"
FROM TBL_EMP;

-- B
SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션"
        ,NVL((SAL * 12)+COMM, (SAL *12)) "연봉"
FROM TBL_EMP;



--○ NVL2()
--> 첫 번째 파라미터 값이 NULL이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL인 경우, 세번째 파라미터 값을 반환한다

SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려')"수당확인"
FROM TBL_EMP;


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며, 연봉내역에 포함된다
--○ NVL2() 활용


SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여",COMM"커미션",NVL2(COMM, (SAL*12)+COMM , (SAL*12))"연봉"
FROM TBL_EMP;

-- A
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , NVL2(COMM,SAL*12+COMM,SAL*12) "연봉"
FROM TBL_EMP;


-- B
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        ,SAL * 12 + NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;


-- ○ COALESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다
--  맨 앞에 있는 매개변수부터 차례로 NULL인지 아닌지 확인하여 
--  NULL이 아닐 경우 반환하고, 
--  NULL인 경우에는 그 다음 매개변수의 값을 반환한다
--  NVL() 이나 NVL2()와 비교하여
--  모~~~~~~~~~든 경우의 수를 고려할 수 있다는 특징을 갖는다


SELECT NULL "COL1"
    ,   COALESCE(NULL, NULL, NULL, 40) "COL2"
    ,   COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100)"COL3"
    ,   COALESCE(NULL, NULL, 30, NULL, NULL, 60) "COL4"
    ,   COALESCE(10, NULL, NULL, NULL, NULL, 60) "COL5"
FROM DUAL;



--○ 실습을 위한 데이터 추가 입력

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '영주니', 'SALESMAN', 7369, SYSDATE, 10);
--==>>1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '나유니', 'SALESMAN', 7369, SYSDATE, 10, 10);
--==>>1 행 이(가) 삽입되었습니다.

COMMIT;
--==>>커밋 완료.


--○ 확인
--내가 한 풀이 왜 됐을까?
SELECT *
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        ,COALESCE(NULL, COALESCE(SAL*12,0) + COALESCE(COMM,0)) "연봉"--SAL * 12 + NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;


--선생님 풀이
SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"수당"
        , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "연봉"
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
8000	영주니		            	0
8001	나유니           10	      10
*/


--※ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>>Session이(가) 변경되었습니다.


--○ 컬럼과 컬럼의 연결(결합)
SELECT 1,2
FROM DUAL;

SELECT 1 +2 
FROM DUAL;

SELECT '영과니', '보영이'
FROM DUAL;

SELECT '영과니' + '보영이'
FROM DUAL;
--==>>ORA-01722: invalid number

SELECT '영과니' || '보영이'
FROM DUAL;
--==>>영과니보영이


SELECT ENAME, JOB
FROM TBL_EMP;

SELECT ENAME || JOB
FROM TBL_EMP;


SELECT '동현이는', SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;
--==>>동현이는	2022-08-12 04:02:51	에 연봉	    500 	억을 원한다.
--    --------  ------------------- -------     ---     -----------
--    문자타입   날짜타입           문자타입   숫자타입  문자타입

--○ 현재 날짜 및 시간을 반환하는 함수
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>>2022-08-12 04:05:27	2022-08-12 04:05:27	22/08/12 16:05:27.000000000

SELECT '동현이는' || SYSDATE || '에 연봉' || 500 || '억을 원한다.'
FROM DUAL;
--==>>동현이는2022-08-12 04:06:33에 연봉500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형 변환하는 별도의 과정 없이
--   『||』만 삽입해 주면 간단히 컬럼과 컬럼(서로 다른 종류의 데이터)을
--   결합하는 것이 가능하다
--   cf) MSSQL에서는 모든 데이터를 문자열로 CONVERT 해야 한다

--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   『SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다
--     ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
--                          :
--                          :
--
--     나유니의 현재 연봉은 10인데 희망 연봉은 20이다.』
--  단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다

SELECT ENAME || '의 현재 연봉은' 
             || COALESCE((SAL*12+COMM), (SAL*12), COMM, 0)
             || '인데 희망 연봉은' 
             || (COALESCE(SAL*12+COMM, SAL*12, COMM, 0))*2 
             || '이다'
FROM TBL_EMP;
--==>>
/*
SMITH의 현재 연봉은9600인데 희망 연봉은19200이다
ALLEN의 현재 연봉은19500인데 희망 연봉은39000이다
WARD의 현재 연봉은15500인데 희망 연봉은31000이다
JONES의 현재 연봉은35700인데 희망 연봉은71400이다
MARTIN의 현재 연봉은16400인데 희망 연봉은32800이다
BLAKE의 현재 연봉은34200인데 희망 연봉은68400이다
CLARK의 현재 연봉은29400인데 희망 연봉은58800이다
SCOTT의 현재 연봉은36000인데 희망 연봉은72000이다
KING의 현재 연봉은60000인데 희망 연봉은120000이다
TURNER의 현재 연봉은18000인데 희망 연봉은36000이다
ADAMS의 현재 연봉은13200인데 희망 연봉은26400이다
JAMES의 현재 연봉은11400인데 희망 연봉은22800이다
FORD의 현재 연봉은36000인데 희망 연봉은72000이다
MILLER의 현재 연봉은15600인데 희망 연봉은31200이다
영주니의 현재 연봉은0인데 희망 연봉은0이다
나유니의 현재 연봉은10인데 희망 연봉은20이다
*/

SELECT *
FROM TBL_EMP;
--※ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.


--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다
--   『SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
--     ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
--                            :
--                            :
--     나유니's 입사일은 2022-08-12이다. 그리고 급여는 0이다.』
--  단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다



SELECT ENAME || '''s'
             || ' 입사일은' 
             || HIREDATE
             || '이다. 그리고 급여는'
             || COALESCE(SAL,0)
             || '이다.'
FROM TBL_EMP;


--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--   홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다
--   홑따옴표 『'』하나는 문자열의 시작을 나타내고
--   홑따옴표 『''』두 개는 문자열 영역 안에서 어퍼스트로피를 나타내며
--   다시 등장하는 홑따옴표 『'』하나가
--   문자열 영역의 종료를 의미하게 되는 것이다.


--==>>
/*
SMITH's 입사일은1980-12-17이다. 그리고 급여는800이다.
ALLEN's 입사일은1981-02-20이다. 그리고 급여는1600이다.
WARD's 입사일은1981-02-22이다. 그리고 급여는1250이다.
JONES's 입사일은1981-04-02이다. 그리고 급여는2975이다.
MARTIN's 입사일은1981-09-28이다. 그리고 급여는1250이다.
BLAKE's 입사일은1981-05-01이다. 그리고 급여는2850이다.
CLARK's 입사일은1981-06-09이다. 그리고 급여는2450이다.
SCOTT's 입사일은1987-07-13이다. 그리고 급여는3000이다.
KING's 입사일은1981-11-17이다. 그리고 급여는5000이다.
TURNER's 입사일은1981-09-08이다. 그리고 급여는1500이다.
ADAMS's 입사일은1987-07-13이다. 그리고 급여는1100이다.
JAMES's 입사일은1981-12-03이다. 그리고 급여는950이다.
FORD's 입사일은1981-12-03이다. 그리고 급여는3000이다.
MILLER's 입사일은1982-01-23이다. 그리고 급여는1300이다.
영주니's 입사일은2022-08-12이다. 그리고 급여는0이다.
나유니's 입사일은2022-08-12이다. 그리고 급여는0이다.
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
8000	영주니	SALESMAN	7369	2022-08-12			10
8001	나유니	SALESMAN	7369	2022-08-12		10	10
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> 조회 결과 없음



--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
    ,   UPPER('oRaCLe') "COL2"
    ,   LOWER('oRaCLe') "COL3"
    ,   INITCAP('oRaCLe') "COL4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
-- UPPER()는 모두 대문자로 반환
-- LOWER()는 모두 소문자로 반환
-- INITCAP()은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환


--※ 실습을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '태미니', 'salesman', 7369, SYSDATE, 20, 100);
--==>>1 행 이(가) 삽입되었습니다.

-- ※ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_EMP 테이블을 대상으로 검색값이 'sALeSmAN'인 조건으로
--   영업사원(세일즈맨)의 사원번호, 사원명, 직종명을 조회한다.
-- 클라이언트가 대소문자 구분 안했을 시 쿼리문을 어떻게 작성하는지????


SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmaN') OR JOB =UPPER('SAlesman'); 

SELECT 사원번호, 사원명, 직종명
FROM TBL_EMP
WHERE 직종이 'sALeSmAN';

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	영주니	SALESMAN
8001	나유니	SALESMAN
*/

--==> 대소문자 구분 안하게 작성하는 쿼리문
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAN');


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다
SELECT 사원명, 직종명, 입사일
FROM TBL_EMP
WHERE 입사일이 1981년 9월 28일;

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = '1981-9-28';
--==>>MARTIN	SALESMAN	1981-09-28

DESC TBL_EMP;

--○ TO_DATE()
--문자열 → 날짜

SELECT  ENAME "사원명", JOB"직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');


-- ○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)
--   입사한 직원의 사원명, 직종명, 입사일 항목을 조회한다.



SELECT 사원명,직종명, 입사일
FROM TBL_EMP
WHERE 입사일이 1981년 9월 28일 이후;


SELECT ENAME,JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE이 1981년 9월 28일 이후;

SELECT ENAME,JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE이 TO_DATE('1981- 09-28', 'YYYY-MM-DD') 이후;

SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
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
영주니	SALESMAN	2022-08-12
나유니	SALESMAN	2022-08-12
태미니	salesman	2022-08-12
*/

--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다.
--   오라클에서는 날짜 데이터에 대한 크기 비교 시
--   과거보다 미래를 더 큰 값으로 간주한다


--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
--   1981년 9월 28일 사이에 입사한 직원들의
--   사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)
SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE  HIREDATE >=TO_DATE('1981-04-02','YYYY-MM-DD') AND HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');

SELECT ENAME, HIREDATE
FROM TBL_EMP;

--WHERE TO_DATE('1981-04-02','YYYY-MM-DD') <= HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');
