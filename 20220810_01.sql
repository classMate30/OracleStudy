
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