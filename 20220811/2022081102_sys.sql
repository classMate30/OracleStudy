
--1줄 주석문 처리(단일행 주석문 처리)

/*
여러줄
(다중행)
주석문
처리
*/

--○ 현재 오라클 서버에 접속한 자신의 계정 조회
show user;
--==>>USER이(가) "SYS"입니다.
-- sqlplus 상태일 때 사용하는 명령어

select user
from dual;
--==>>SYS

SELECT USER
FROM DUAL;
--==>>SYS

Select 1+2
FROM DUAL; -- 일종의 더미테이블이라고 생각하면 됨


SELECT                              1+2
FROM                    DUAL;

S ELECT   1+2
F ROM DUAL;
--==>> 에러 발생

SELECT USER
FROM DUAL;
--==>> SYS


SELECT 1+5
FROM DUAL;
--==>>6

SELECT          1+5
FROMDUAL
--==>>에러발생

SELECT "아직은 지루하기만 한 오라클 수업"
FROM DUAL;
--==>> 에러발생


SELECT '아직은 지루하기만 한 오라클 수업'
FROM DUAL;
--==>>아직은 지루하기만 한 오라클 수업

SELECT 3.14 + 3.14
FROM DUAL;
--==>>6.28

SELECT 10*5
FROM DUAL;
--==>>50

SELECT 10*5.0
FROM DUAL;
--==>>50

SELECT 4/2
FROM DUAL;
--==>>2

SELECT 4.0/2
FROM DUAL;
--==>>

SELECT 4/2.0
FROM DUAL;
--==>>2

SELECT 5/2
FROM DUAL;
--==>>2.5


SELECT 100 - 23
FROM DUAL;
--==>>77

SELECT 100 - 3.14
FROM DUAL;
--==>>96.86


SELECT '김태민' + '조현하' 
FROM DUAL;
--==>>에러 발생
--(ORA-01722: invalid number)


SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
SYS	                    OPEN
SYSTEM	                OPEN
ANONYMOUS	            OPEN
HR	                    OPEN
APEX_PUBLIC_USER	    LOCKED
FLOWS_FILES         	LOCKED
APEX_040000	            LOCKED
OUTLN	                EXPIRED & LOCKED
DIP                 	EXPIRED & LOCKED
ORACLE_OCM	            EXPIRED & LOCKED
XS$NULL	                EXPIRED & LOCKED
MDSYS	                EXPIRED & LOCKED
CTXSYS              	EXPIRED & LOCKED
DBSNMP              	EXPIRED & LOCKED
XDB                 	EXPIRED & LOCKED
APPQOSSYS	            EXPIRED & LOCKED
*/


SELECT *
FROM DBA_USERS;
--==>>
/*
SYS	            0		OPEN		23/02/06	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
SYSTEM	         5		OPEN		23/02/06	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
ANONYMOUS	        35		OPEN		14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP			N	PASSWORD
HR	                43		OPEN		23/02/06	USERS	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APEX_PUBLIC_USER	45		LOCKED	14/05/29	14/11/25	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
FLOWS_FILES	44		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APEX_040000	47		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
OUTLN	9		EXPIRED & LOCKED	22/08/10	22/08/10	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DIP	14		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
ORACLE_OCM	21		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XS$NULL	2147483638		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
MDSYS	42		EXPIRED & LOCKED	14/05/29	22/08/10	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
CTXSYS	32		EXPIRED & LOCKED	22/08/10	22/08/10	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DBSNMP	29		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XDB	34		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APPQOSSYS	30		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
*/


SELECT DEFAULT_TABLESPACE, USERNAME
FROM DBA_USERS;
//--==>>
/*
SYSTEM	SYS
SYSTEM	SYSTEM
SYSAUX	ANONYMOUS
USERS	HR
SYSTEM	APEX_PUBLIC_USER
SYSAUX	FLOWS_FILES
SYSAUX	APEX_040000
SYSTEM	OUTLN
SYSTEM	DIP
SYSTEM	ORACLE_OCM
SYSTEM	XS$NULL
SYSAUX	MDSYS
SYSAUX	CTXSYS
SYSAUX	DBSNMP
SYSAUX	XDB
SYSAUX	APPQOSSYS
*/

--> 『DBA_』로 시작하는 Oracle Data Dictionray View는
--  오로지 관리자 권한으로 접속했을 경우에만 조회가 가능하다
--  아직 데이터 딕셔너리 개념을 잡지 못해도 상관없다

-- ○ 『HR』사용자 계정을 잠금 상태로 설정
ALTER USER HR ACCOUNT LOCK;
--==>>User HR이(가) 변경되었습니다.


--○ 다시 사용자 계정 상태 조회
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
HR	LOCKED

*/



--○ 『HR』사용자 계정의 패스워드를 lion으로 설정
ALTER USER HR IDENTIFIED BY lion;
--==>>User HR이(가) 변경되었습니다.


--○ 『HR』사용자 계정의 잠금을 해제
ALTER USER HR ACCOUNT UNLOCK; 

SELECT USER
FROM DUAL;
--==>>SYS


--○  『HR』사용자 계정을 다시 잠금
ALTER USER HR ACCOUNT LOCK;
--==>>User HR이(가) 변경되었습니다.


--○  『HR』사용자 계정의 잠금을 해제
ALTER USER HR ACCOUNT UNLOCK;
--==>>User HR이(가) 변경되었습니다.

-----------------------------------------------------------

--○ TABLESPACE 생성

--※ TABLESPACE란?
--> 세그먼트(테이블, 인덱스, ...)를 담아두는(저장해두는)
--  오라클의 논리적인 저장 구조를 의미한다

--물리적인 저장구조는 하드디스크.... 논리적인 저장구조는 TABLESPACE
--오라클에서 무언가 물리적으로 생성할때는 모두 『CREATE』

CREATE TABLESPACE TBS_EDUA                 --생성하겠다.테이블스페이스...TBS_EDUA라는 이름으로...
DATAFILE 'C:\TESTDATA\TBS_EDUA01.DBF'       --물리적 데이터 파일 경로 및 이름
SIZE 4M                                      --사이즈(용량)
EXTENT MANAGEMENT LOCAL                    --오라클 서버가 세그먼트를 알아서 관리
SEGMENT SPACE MANAGEMENT AUTO;             --세그먼트 공관 관리도 오라클 서버가 알아서 관리 

--※ 테이블 스페이스 생성 구문을 실행하기 전에
--   해당 경로의 물리적인 디렉토리 생성필요


--○ 생성된 테이블스페이스 조회
SELECT *
FROM DBA_TABLESPACES;
//--==>>
/*
SYSTEM	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
SYSAUX	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
UNDOTBS1	8192	65536		1	2147483645	2147483645		65536	ONLINE	UNDO	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOGUARANTEE	NO	HOST	NO	
TEMP	8192	1048576	1048576	1		2147483645	0	1048576	ONLINE	TEMPORARY	NOLOGGING	NO	LOCAL	UNIFORM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
USERS	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO
*/

--○ 파일 용량 정보 조회(물리적인 파일 이름 조회)
SELECT *
FROM DBA_DATA_FILES
WHERE FILE_NAME LIKE '%TBS_EDUA%'
--==>>C:\TESTDATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE


--○ 오라클 사용자 계정 생성
CREATE USER kimtaemin IDENTIFIED BY java002$
DEFAULT TABLESPACE TBS_EDUA;
--> taemin이라는 사용자 계정을 생성하겠다.(만들겠다)
--  이 사용자 계정의 패스워드는 java002$로 하겠다
--  이 계정을 통해 생성하는 오라클 객체는(세그먼트는)
--  기본적으로 TBS_EDUA라는 테이블스페이스에 생성할 수 있도록(만들어지도록)
--  설정하겠다

--※ 생성된 오라클 사용자 계정(각자 본인의 이름 계정)을 통해 접속 시도
--   → 접속 불가(실패)
--   『create session』권한이 없기 때문에 접속 불가

--○ 생성된 오라클 사용자 계정(각자 본인의 이름 계정)에
--   오라클 서버 접속이 가능할 수 있도록 create session 권한 부여
GRANT CREATE SESSION TO KIMTAEMIN;
--==>>Grant을(를) 성공했습니다.


--○ 생성된 오라클 사용자 계정(각자 본인의 이름 계정)에
--   테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여

GRANT CREATE TABLE TO KIMTAEMIN;
--==>>Grant을(를) 성공했습니다.

--○생성된 오라클 사용자 계정(각자 본인의 이름 계정)에
--  테이블스페이스(TBS_EDUA)에서 사용할 수 있는 공간(할당량) 지정
ALTER USER KIMTAEMIN
QUOTA UNLIMITED ON TBS_EDUA;
-----  ------------  ---------
--할당량 3M(가능)  테이블스페이스

-----------------------------------------------------------------------
--SCOTT 계정을 활용 할 수 있는 설정
create user scott
identified by tiger;
--==>>User SCOTT이(가) 생성되었습니다.


--○ 사용자 계정에 관한(롤) 부여
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
--==>>Grant을(를) 성공했습니다.


--○ SCOTT 사용자 계정의 기본 테이블스페이스를 USERS로 지정(설정)
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--==>>User SCOTT이(가) 변경되었습니다


--○ SCOTT 사용자 계정의 임시 테이블스페이스를 TEMP로 지정(설정)
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
--==>>User SCOTT이(가) 변경되었습니다.


--CONNECT SCOTT/TIGER
