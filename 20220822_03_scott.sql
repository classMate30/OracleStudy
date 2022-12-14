---■■■ UNION / UNION ALL ■■■---

--○ 실습 테이블 생성(TBL_JUMUN)

CREATE TABLE TBL_JUMUN
(JUNO NUMBER
,JECODE VARCHAR2(30)
,JUSU NUMBER
,JUDAY DATE DEFAULT SYSDATE
);
-->고객의 주문이 접수 되었을 경우
-- 주문 내용에 대한 데이터가 입력 될 수 있도록 처리하는 테이블

--○데이터 입력 -> 고객의 주문발생(접수)
INSERT INTO TBL_JUMUN
VALUES(1, '치토스', 20, TO_DATE('2001-11-01 09:10:12', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(2, '빼빼로', 10, TO_DATE('2001-11-01 10:10:12', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(3, '맛동산', 30, TO_DATE('2001-11-01 13:10:20', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(4, '오레오', 10, TO_DATE('2001-11-02 11:11:11', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(5, '포카칩', 20, TO_DATE('2001-11-02 17:50:11', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(6, '죠리퐁', 10, TO_DATE('2001-11-03 10:00:10', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(7, '감자깡', 20, TO_DATE('2001-11-04 05:05:05', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(8, '사또밥', 20, TO_DATE('2001-11-04 06:07:08', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(9, '새우깡', 10, TO_DATE('2001-11-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(10, '스윙칩', 20, TO_DATE('2001-11-05 14:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(11, '홈런볼', 10, TO_DATE('2001-11-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(12, '홈런볼', 10, TO_DATE('2001-11-05 15:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(13, '꼬북칩', 20, TO_DATE('2001-11-06 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(14, '다이제', 10, TO_DATE('2001-11-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(15, '꼬깔콘', 20, TO_DATE('2001-11-08 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(16, '포스틱', 10, TO_DATE('2001-11-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(17, '오감자', 20, TO_DATE('2001-11-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(18, '홈런볼', 10, TO_DATE('2001-11-11 15:10:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(19, '포스틱', 10, TO_DATE('2001-11-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

INSERT INTO TBL_JUMUN
VALUES(20, '포스틱', 20, TO_DATE('2001-11-13 12:00:00', 'YYYY-MM-DD HH24:MI:SS') );

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT *
FROM TBL_JUMUN;
/*
1	치토스	20	2001-11-01 09:10:12
2	빼빼로	10	2001-11-01 10:10:12
3	맛동산	30	2001-11-01 13:10:20
4	오레오	10	2001-11-02 11:11:11
5	포카칩	20	2001-11-02 17:50:11
6	죠리퐁	10	2001-11-03 10:00:10
7	감자깡	20	2001-11-04 05:05:05
8	사또밥	20	2001-11-04 06:07:08
9	새우깡	10	2001-11-05 13:00:00
10	스윙칩	20	2001-11-05 14:10:00
11	홈런볼	10	2001-11-05 15:00:00
12	홈런볼	10	2001-11-05 15:10:00
13	꼬북칩	20	2001-11-06 12:00:00
14	다이제	10	2001-11-07 12:00:00
15	꼬깔콘	20	2001-11-08 12:00:00
16	포스틱	10	2001-11-09 12:00:00
17	오감자	20	2001-11-10 12:00:00
18	홈런볼	10	2001-11-11 15:10:00
19	포스틱	10	2001-11-12 12:00:00
20	포스틱	20	2001-11-13 12:00:00
*/

COMMIT;

--○추가 데이터 입력 -> 2001년 부터 시작된 주문이 현재(2022년)까지 계속 발생하고 진행중이다.
INSERT INTO TBL_JUMUN VALUES(98764,'꼬북칩',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98765,'빼빼로',30,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98766,'빼빼로',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98767,'에이스',40,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98768,'홈런볼',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98769,'감자깡',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98770,'맛동산',10,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98771,'웨하스',20,SYSDATE);

INSERT INTO TBL_JUMUN VALUES(98772,'맛동산',30,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98773,'오레오',20,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98774,'빼빼로',50,SYSDATE);
INSERT INTO TBL_JUMUN VALUES(98775,'오감자',10,SYSDATE);


SELECT *
FROM TBL_JUMUN;

COMMIT;

--※과자 쇼핑몰 운영 중...
--TBL_JUMUN 테이블이 무거워진 상황
-- 어플리케이션과의 연동으로 인해 주문 내역을 다른 테이블에
--저장될 수 있도록 만드는 것은 거의 불가능한 상황.
--기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황.
-- ->결과적으로
--   현재까지 누적된 주문 데이터 중
--   금일 발생한 주문 내역을 제외하고
--   나머지 데이터를 다른 테이블(TBL_JUMUNBACKUP)로 데이터를 이관하여 백업을 수행할 계획

CREATE TABLE TBL_JUMUNBACKUP
SELECT *
FROM TBL_JUMUN
WHERE 금일 발생한 주문이 아닌것;


CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

SELECT *
FROM TBL_JUMUNBACKUP;

--TBL_JUMUN에서 백업한 데이터들을 삭제하기

DELETE FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- 삭제 
-- 98763개 행을 삭제한것을 가정
SELECT *
FROM TBL_JUMUN;

COMMIT;

--※아직 제품 발송이 이루어지지 않은 금일 주문 데이터를 제외하고
-- 이전의 모든 주문 데이터들이 삭제된 상황이므로
-- 테이블을 행(레코드)의 갯수가 줄어들어 매우 가벼워진 상황

--그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내어야 할 상황이 발생하게 되었다.
--그렇다면, TBL_JUMUNBACKUP 테이블의 레코드와
--TBL_JUMUN 테이블의 레코드 를 모두 합쳐
-- 하나의 테이블을 조회하는 것과 같은 결과를 확인할 수 있도록
-- 조회가 이루어져야한다.

--※컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우
-- JOIN을 사용하지만
-- 레코드와 레코드를 결합하고자 하는 경우
-- UNION / UNION ALL 을 사용할 수있다.

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
1	치토스	20	2001-11-01 09:10:12
2	빼빼로	10	2001-11-01 10:10:12
3	맛동산	30	2001-11-01 13:10:20
4	오레오	10	2001-11-02 11:11:11
5	포카칩	20	2001-11-02 17:50:11
6	죠리퐁	10	2001-11-03 10:00:10
7	감자깡	20	2001-11-04 05:05:05
8	사또밥	20	2001-11-04 06:07:08
9	새우깡	10	2001-11-05 13:00:00
10	스윙칩	20	2001-11-05 14:10:00
11	홈런볼	10	2001-11-05 15:00:00
12	홈런볼	10	2001-11-05 15:10:00
13	꼬북칩	20	2001-11-06 12:00:00
14	다이제	10	2001-11-07 12:00:00
15	꼬깔콘	20	2001-11-08 12:00:00
16	포스틱	10	2001-11-09 12:00:00
17	오감자	20	2001-11-10 12:00:00
18	홈런볼	10	2001-11-11 15:10:00
19	포스틱	10	2001-11-12 12:00:00
20	포스틱	20	2001-11-13 12:00:00
98764	꼬북칩	10	2022-08-22 17:02:04
98765	빼빼로	30	2022-08-22 17:02:05
98766	빼빼로	20	2022-08-22 17:02:06
98767	에이스	40	2022-08-22 17:02:07
98768	홈런볼	10	2022-08-22 17:02:08
98769	감자깡	20	2022-08-22 17:02:09
98770	맛동산	10	2022-08-22 17:02:10
98771	웨하스	20	2022-08-22 17:02:11
98772	맛동산	30	2022-08-22 17:02:12
98773	오레오	20	2022-08-22 17:02:14
98774	빼빼로	50	2022-08-22 17:02:15
98775	오감자	10	2022-08-22 17:02:16
*/
SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;
--결과 같음


SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

--※ UNION 은 항상 결과물의 첫 번째 컬럼을 기준으로 
-- 오름차순 정렬을 수행한다.

--반면 UNION ALL 은 결합된 순서(구문에서 테이블을 명시한 순서대로)
--조회한 결과를 있는 그래도 반환한다.(정렬 없음)
--이로인해 UNION이 부하가 더 크다 (리소스 소모가 더 크다.)
--또한 UNION은 결과물에 중복된 레코드(행)가 존재할 경우
-- 중복을 제거하고 1개 행만 조회된 결과를 반환한다.

--즉 성능은 UNION ALL이 더 뛰어나다.

--○지금까지 주문받은 데이터를 통해
--제품 별 총 주문량을 조회할 수 있는 쿼리문을 구성한다.

SELECT JECODE, COUNT(*)
FROM 
(SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
)T
GROUP BY JECODE;


--선생님 풀이

SELECT T.JECODE "제품코드", SUM(T.JUSU) "주문수량"
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
꼬북칩	30
꼬깔콘	20
치토스	20
맛동산	70
새우깡	10
웨하스	20
에이스	40
포카칩	20
스윙칩	20
오감자	30
사또밥	20
빼빼로	110
오레오	30
감자깡	40
홈런볼	40
다이제	10
죠리퐁	10
포스틱	40
*/



/*
    SELECT JECODE , JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
*/



--○ INTERSECT / MINUS (교집합과 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문수량의 값이 똑같은 행만 추출하고자 한다.


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
감자깡	20
맛동산	30
홈런볼	10
*/

-- 교집합에 해당하는 부분 빼고 보여줌
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;

--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블을 대상으로
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문량, 주문일자 항목으로 조회한다

SELECT T.JUNO
FROM 
(
    SELECT JECODE,JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;
--에러
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
--에러

--톡방 풀이
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
--선생님 풀이
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT*
FROM TBL_JUMUN;
--==>>
/*
1	    치토스	20	2001-11-01 09:10:12
2	    빼빼로	10	2001-11-01 10:10:12
3	    맛동산	30	2001-11-01 13:10:20
4   	오레오	10	2001-11-02 11:11:11
5	    포카칩	20	2001-11-02 17:50:11
6	    죠리퐁	10	2001-11-03 10:00:10
7   	감자깡	20	2001-11-04 05:05:05
8	    사또밥	20	2001-11-04 06:07:08
9	    새우깡	10	2001-11-05 13:00:00
10  	스윙칩	20	2001-11-05 14:10:00
11	    홈런볼	10	2001-11-05 15:00:00
12  	홈런볼	10	2001-11-05 15:10:00
13  	꼬북칩	20	2001-11-06 12:00:00
14	    다이제	10	2001-11-07 12:00:00
15  	꼬깔콘	20	2001-11-08 12:00:00
16  	포스틱	10	2001-11-09 12:00:00
17  	오감자	20	2001-11-10 12:00:00
18  	홈런볼	10	2001-11-11 15:10:00
19  	포스틱	10	2001-11-12 12:00:00
20  	포스틱	20	2001-11-13 12:00:00
98764	꼬북칩	10	2022-08-23 09:07:59
98765	빼빼로	30	2022-08-23 09:08:00
98766	빼빼로	20	2022-08-23 09:08:01
98767	에이스	40	2022-08-23 09:08:02
98768	홈런볼	10	2022-08-23 09:08:03
98769	감자깡	20	2022-08-23 09:08:04
98770	맛동산	10	2022-08-23 09:08:05
98771	웨하스	20	2022-08-23 09:08:08
98772	맛동산	30	2022-08-23 09:08:11
98773	오레오	20	2022-08-23 09:08:12
98774	빼빼로	50	2022-08-23 09:08:13
98775	오감자	10	2022-08-23 09:08:14
*/



SELECT JECODE,JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE,JUSU
FROM TBL_JUMUN;
--==>>
/*
감자깡	20
맛동산	30
홈런볼	10
*/


SELECT JUNO,JECODE,JUSU,JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO,JECODE,JUSU,JUDAY
FROM TBL_JUMUN;
--==>> 조회 결과 없음


-- 방법 1.

SELECT T2.JUNO"주문번호",T1.JECODE"제품코드",T1.JUSU"주문수량",JUDAY"주문일자"
FROM -- 밑에 애들을 대상으로 해서
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
3	    맛동산	30	2001-11-01 13:10:20
7	    감자깡	20	2001-11-04 05:05:05
11	    홈런볼	10	2001-11-05 15:00:00
12	    홈런볼	10	2001-11-05 15:10:00
18	    홈런볼	10	2001-11-11 15:10:00
98768	홈런볼	10	2022-08-23 09:08:03
98769	감자깡	20	2022-08-23 09:08:04
98772	맛동산	30	2022-08-23 09:08:11
*/


-- 방법 2.
/*
잘못된 쿼리문, 있을시 다찾기 때문에
SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE IN('감자깡','맛동산','홈런볼')
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
WHERE T.JECODE와 T.JUSU의 결합 결과가 '감자깡20' , '맛동산30', '홈런볼10';

SELECT T.*
FROM 
(   
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT(T.JECODE, T.JUSU) IN('감자깡20' , '맛동산30', '홈런볼10');


--> 조회한 결과를 찾는거기에...... ↓

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
--==>>에러 발생


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


--○ TBL_EMP 테이블에서 급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회하는 쿼리문을 구성한다

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

--내가 푼 풀이
SELECT T2.EMPNO"사원번호", T2.ENAME"사원명", T2.JOB"직종명", T1.급여 
FROM 
(
    SELECT MAX(SAL)"급여"
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
ON T1.급여 = T2.SAL;


--선생님 풀이

--○ TBL_EMP테이블에서 급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회하는 쿼리문을 구성한다.

-- 급여를 가장 많이 받는 사원의 급여
SELECT MAX(SAL)
FROM TBL_EMP;
--==>> 5000


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE 급여가 가장 많은 사원;


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (급여가 가장 많은 사원);


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP);
--==>>7839	KING	PRESIDENT	5000

--  『=ANY』
-- 하나라도 만족하면

--  『=ALL』
-- 모두 만족하면


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
8001	김태민	CLERK	    1500
8002	조현하	CLERK	    2000
8003	김보경	SALESMAN	1700
8004	유동현	SALESMAN	2500
8005	장현성	SALESMAN	1000
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
8001	김태민	CLERK	    1500
8002	조현하	CLERK	    2000
8003	김보경	SALESMAN	1700
8004	유동현	SALESMAN	2500
8005	장현성	SALESMAN	1000
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


--○ TBL_EMP 테이블에서 20번 부서에 근무하는 사원들 중
--   급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회하는 쿼리문을 구성한다

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
--==>>조회 결과 없음

                   
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP
             WHERE DEPTNO =20)
    AND DEPTNO =20;    --두개가 사실 다른 조건임


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >= ALL (  SELECT SAL
                    FROM TBL_EMP
                    WHERE DEPTNO =20)
    AND DEPTNO =20;
    
    
--○ TBL_EMP 테이블에서 수당(커미션, COMM)이 가장 많은 사원의
--   사원번호, 사원명, 부서번호, 직종명, 커미션 항목을 조회한다.


SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (  SELECT MAX(COMM)
                FROM TBL_EMP);
                
SELECT EMPNO"사원번호",ENAME "사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"
FROM TBL_EMP
WHERE COMM >=ALL(SELECT NVL(COMM,0)
                FROM TBL_EMP);
                
SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
FROM TBL_EMP
WHERE 수당(커미션,COMM)이 가장 많은 사원;

SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
FROM TBL_EMP
WHERE COMM = (모든 직원들 중 최고 커미션);



SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
FROM TBL_EMP
WHERE COMM = (  SELECT MAX(COMM)
                FROM TBL_EMP);
--==>>7654	MARTIN	30	SALESMAN	1400



SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
FROM TBL_EMP
WHERE COMM >=ALL (  SELECT COMM
                    FROM TBL_EMP);
--==>>조회 결과 없음


SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
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

SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"                
FROM TBL_EMP
WHERE COMM >=ALL (NULL,300,500,NULL,1400,NULL,NULL,NULL,,NULL,0,NULL,NULL,NULL,NULL,10,10,NULL,NULL,NULL);


SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"
FROM TBL_EMP
WHERE COMM >=ALL (SELECT NVL(COMM,0)
                  FROM TBL_EMP);
 --==>>7654	MARTIN	30	SALESMAN	1400
 
SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"
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


SELECT EMPNO"사원번호",ENAME"사원명",DEPTNO"부서번호",JOB"직종명",COMM"커미션"
FROM TBL_EMP
WHERE COMM >=ALL (300,500,1400,0,10,10);     
--==>>7654	MARTIN	30	SALESMAN	1400


--○ DISTINCT() 중복 행(레코드)을 제거하는 함수

-- TBL_EMP 테이블에서 관리자로 등록된 사원의
-- 사원번호, 사원명, 직종명을 조회한다

SELECT T2.EMPNO"사원번호",T2.ENAME"사원명",T2.JOB"직종명"
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
WHERE 관리자로 등록된 사원;


SELECT EMPNO,ENAME,JOB
FROM TBL_EMP
WHERE 사원번호 = (관리자(MGR)로 등록된 사원);


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
결과는 똑같지만 리소스 소모가 훨씬 덜하다 (중복된거 제외)
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



--○ TBL_SAWON 테이블 백업(데이터 위주) → 각 테이블 간의 관계나 제약조건 등은 제외한 상태
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>>Table TBL_SAWONBACKUP이(가) 생성되었습니다.
-- TBL_SAWON 테이블의 데이터들만 백업을 수행
-- 즉, 다른 이름의 테이블 형태로 저장해 둔 상황

--○ 데이터 수정
UPDATE TBL_SAWON
SET SANAME ='똘똘이';
--WHERE SANO = 1005;
COMMIT;

SELECT *
FROM TBL_SAWON;

ROLLBACK;

UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME 
            FROM TBL_SAWONBACKUP)
WHERE SANAME = '똘똘이';




UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME 
            FROM TBL_SAWONBACKUP
            WHERE SANO = TBL_SAWON.SANO)
WHERE SANAME = '똘똘이';

SELECT *
FROM TBL_SAWON;

COMMIT;