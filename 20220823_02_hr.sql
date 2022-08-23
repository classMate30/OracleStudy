SELECT USER
FROM DUAL;
--==>>HR

--나누고 분리하고 쪼개고 ......
--

--■■■ 정규화(Normalization) ■■■--


--○ 정규화란?
--   한 마디로 데이터베이스 서버의 메모리 낭비를 막기 위해(리소스 소모를 줄이기 위해) → 나누고 분리하고 쪼개고
--   어떤 하나의 테이블을... 식별자를 가지는 여러 개의 테이블로 나누는 과정을 말한다. 

--  식별자(다시 합쳐서 조회할 수 있는 상황을 고려해서......)

SELECT *
FROM EMPLOYEES;


-- ex) 현성이가...옥장판을 판매한다.
--     고객리스트 → 거래처 직원 명단이 적혀있는 수첩의 정보를
--                   데이터베이스화 하려고 한다.

-- 테이블명 : 거래처직원

/*
    10Byte      10Byte      10Byte        10Byte     10Byte   10Byte      10Byte
--------------------------------------------------------------------------------
거래처회사명   회사주소    회사전화     거래처직원명    직급   이메일      휴대폰
--------------------------------------------------------------------------------
    LG         서울여의도  02-345-6789    정미경        부장   jmk@na...   010-1...
    LG         서울여의도  02-345-6789    정영준        과장   jyj@na...   010-7...
    LG         서울여의도  02-345-6789    조영관        대리   cyk@na...   010-3...
    LG         서울여의도  02-345-6789    고연수        부장   kys@na...   010-1...
    SK         서울소공동  02-987-6543    최나윤        부장   cny@na...   010-9...
    LG         부산동래구  051-221-2211   민찬우        대리   mcw@na...   010-1...    
    SK         서울소공동  02-987-6543    유동현        과장   ydh@na...   010-8...
    
                                        :
 ---------------------------------------------------------------------------------                                       
                                        
 가정) 서울 여의도 LG (본사) 라는 회사에 근무하는 거래처 직원 명단이
       총 100만 명이라고 가정한다.
       (한 행(레코드)은 70Byte)
       
       어느 날... 『서울여의도』에 위치한 LG 본사가 『경기분당』으로
       사옥을 이전하게 되었다.
       회사주소는 『경기분당』으로 바뀌고, 회사전화는 『031-111-2222』로 바뀌게 됐다.
       
       그러면... 100만 명의 회사주소와 회사전화를 변경해야 한다.
       
       --이 때 수행되어야 할 쿼리문 → UPDATE
       
       UPDATE 거래처직원
       SET 회사주소 ='경기분당' , 회사전화 = '031-111-2222'
       WHERE 거래처회사명 = 'LG' 
        AND 회사주소 = '서울여의도';
    
       -- 100만 개 행을 하드디스크상에서 읽어다가
          메모리에 로드시켜 주어야 한다
          즉, 100만 * 70Byte를 모두
          하드디스크 상에서 읽어다가 메모리에 로드시켜 주어야 한다는 말이다
          
          → 이는 테이블의 설계가 잘못되었으므로
             DB 서버는 조만간 메모리 고갈로 인해 DOWN 될 것이다.
             
             → 그러므로 정규화 과정을 수행해야 한다.
*/

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   
제 1 정규화 │  제 2 정규화  │  제 3 정규화  │ 제 4 정규화  │역정규화(비정규화)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   
*/


-- 제 1 정규화
--> 어떤 하나의 테이블에 반복되는 컬럼 값들이 존재한다면
--  값들이 반복되어 나오는 컬럼을 분리하여
--  새로운 테이블을 만들어준다.

/*
-- 테이블명 : 회사    → 부모 테이블

    10Byte      10Byte           10Byte      10Byte     
------------------------------------------------------
  회사ID       거래처회사명     회사주소    회사전화 
---------
참조받는 컬럼
------------------------------------------------------
    10              LG         서울여의도  02-345-6789    
    20              SK         서울소공동  02-987-6543   
    30              LG         부산동래구  051-221-2211                
 ------------------------------------------------------                                       
 
 
-- 테이블명 : 직원    → 자식 테이블

    10Byte     10Byte   10Byte      10Byte      10Byte
--------------------------------------------------------------------------------
 거래처직원명    직급   이메일      휴대폰       회사ID
                                                --------
                                                참조하는 컬럼
--------------------------------------------------------------------------------
    정미경        부장   jmk@na...   010-1...      10
    정영준        과장   jyj@na...   010-7...      10
    조영관        대리   cyk@na...   010-3...      10
    고연수        부장   kys@na...   010-1...      10
    최나윤        부장   cny@na...   010-9...      20
    민찬우        대리   mcw@na...   010-1...      30
    유동현        과장   ydh@na...   010-8...      20   
      :
 ---------------------------------------------------------------------------------                                       

*/

--> 제 1 정규화를 수행하는 과정에서 분리된 테이블은
--  반드시 부모 테이블과 자식 테이블의 관계를 갖게 된다

--> 부모 테이블 → 참조받는 컬럼 → PRIMARY KEY
--  자식 테이블 → 참조하는 컬럼 → FOREIGN KEY

--※ 참조받는 컬럼이 갖는 특징
--   반드시 고유한 값(데이터)만 들어와야 한다.
--   중복된 값(데이터)이 있어서는 안된다.
--   비어있으면(NULL이 있어서는) 안된다.
--   즉, NOT NULL이어야한다


--> 제 1정규화를 수행하는 과정에서
-- 부모 테이블의 PRIMARY KEY는 항상 자식 테이블의 FOREIGN KEY로 전이된다.

--테이블이 분리(분할)되기 이전 상태로 조회

/*

SELECT A.거래처회사명,  A.회사주소, A.회사전화
    ,   B.거래처직원명
FROM 회사 A, 직원 B
JOIN A.회사ID = B.회사ID)



가정) 서울 여의도 LG (본사) 라는 회사에 근무하는 거래처 직원 명단이
       총 100만 명이라고 가정한다.
       (한 행(레코드)은 70Byte)
       
       어느 날... 『서울여의도』에 위치한 LG 본사가 『경기분당』으로
       사옥을 이전하게 되었다.
       회사주소는 『경기분당』으로 바뀌고, 회사전화는 『031-111-2222』로 바뀌게 됐다.
       
       그러면... 회사 테이블에서 1건의 회사주소와 회사전화를 변경해야 한다
       
       --이 때 수행되어야 할 쿼리문 → UPDATE
       
       UPDATE 거래처직원
       SET 회사주소 ='경기분당' , 회사전화 = '031-111-2222'
       WHERE 거래처회사명 = 'LG' 
        AND 회사주소 = '서울여의도';
        ↓
       UPDATE 회사
       SET 회사주소 ='경기분당' , 회사전화 = '031-111-2222'
       WHERE 회사 ID
  
  
  
       -- 1개 행을 하드디스크상에서 읽어다가
          메모리에 로드시켜 주어야 한다
          즉, 1 * 40Byte를 모두
          하드디스크 상에서 읽어다가 메모리에 로드시켜 주어야 한다는 말이다
          
          → 정규화 이전에는 100만 건을 처리해야 할 업무에서
             1건만 처리하면 되는 업무로 바뀐 상황이기 때문에
             DB 서버는 메모리 고갈이 일어나지 않고 아주 빠르게 처리될 것이다
             
             → 그러므로 정규화 과정을 수행해야 한다.


--거래처회사명, 회사전화
SELECT 거래처회사명, 회사전화           | SELECT 거래처회사명, 회사전화
FROM 회사;                              | FROM 거래처직원;
--> 3 * 40 Byte                         | -->200만 * 70 Byte 


--거래처직원명, 직급                    | 
SELECT 거래처직원명, 직급               | SELECT 거래처직원명, 직급
FROM 직원;                              | FROM 거래처직원;
--> 200만 * 50Byte                      | -->200만 * 70Byte


--거래처회사명, 거래처직원명            
SELECT A.거래처회사명 , B.거래처직원명      | SELECT 거래처회사명,거래처직원명
FROM 회사 A JOIN 직원 B                     | FROM 거래처직원;
ON A.회사ID = B.회사ID                      |
-->(3*40Byte) + (200만*50Byte)              | --> 200만 * 70Byte
                                        



SELECT A.거래처회사명,  A.회사주소, A.회사전화
    ,   B.거래처직원명
FROM 회사 A, 직원 B
JOIN A.회사ID = B.회사ID)

WHERE 절이 없으면, 조회할때 메모리는 풀스캔 한다고 보면됨

SELECT *
FROM EMP;

SELECT EMPNO
FROM EMP;

WHERE 절이 없기에 둘의 메모리 사용은 똑같음
*/



-- 테이블명 : 주문
/*
--------------------------------------------------------------------------------
  고객ID             제품코드                  주문일자                주문수량
 ++++++++

--------------------------------------------------------------------------------
  KIK1174(김인교)    P-KKBK(꿀꽈배기)        2022-04-30 13:50:23          10
  KYL8335(김유림)    P-KKBC(꼬북칩)          2022-04-30 14:23:11          20
  MCW3235(민찬우)    P-KKDC(쿠크다스)        2022-05-11 16:14:37          12
  CHH5834(조현하)    P-SWKK(새우깡)          2022-05-12 10:32:48          12
                        :
                        :
                        :
--------------------------------------------------------------------------------
*/


-- 테이블명 : 주문
/*
--------------------------------------------------------------------------------
  고객ID             제품코드                  주문일자                주문수량
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                       P.K(겹칠일이 없음.....)
--------------------------------------------------------------------------------
  KIK1174(김인교)    P-KKBK(꿀꽈배기)        2022-04-30 13:50:23          10
  KYL8335(김유림)    P-KKBC(꼬북칩)          2022-04-30 14:23:11          20
  MCW3235(민찬우)    P-KKDC(쿠크다스)        2022-05-11 16:14:37          12
  CHH5834(조현하)    P-SWKK(새우깡)          2022-05-12 10:32:48          12
                        :
                        :
                        :
--------------------------------------------------------------------------------
*/

--※ 하나의 테이블에 존재하는 PRIMARY KEY의 최대 갯수는 1개이다.
--   하지만, PRIMARY KEY를 이루는(구성하는) 컬럼의 갯수는 복수(여러개)인 것이 가능하다.
--   컬럼 1개로만 구성된 PRIMARY KEY를 SINGLE PRIMARY KEY라고 부른다.
--   (단일 프라이머리 키)
--   두개 이상의 컬럼으로 구성된 PRIMARY KEY를 COMPOSITE PRIMARY KEY라고 부른다.
--   (복합 프라이머리 키)



-- 제 2정규화
--> 제 1정규화를 마친 결과물에서 PRIMARY KEY가 SINGLE COLUMN이라면
--  제 2정규화는 수행하지 않는다.
--  하지만, PRIMARY KEY가 COMPOSITE COLUMN 이라면
--  반.드.시. 제2 정규화를 수행해야 한다.


--> 식별자가 아닌 컬럼은 식별자 전체 컬럼에 대해 의존적이어야 하는데
--  식별자 전체 컬럼이 아닌 일부 식별자 컬럼에 대해서만 의존적이라면
--  이를 분리하여 새로운 테이블을 생성해준다.
--  이 과정을 제 2정규화라고 한다

/*
--테이블명 : 과목     →  부모 테이블
---------------------------------------------------------------------------------------------
과목번호    과목명     교수번호        교수자명        강의실코드    강의실설명
++++++++               ++++++++++
    P.K                   P.K
    O           X           O               X               X             (식)X
---------------------------------------------------------------------------------------------
J0101       자바기초      21            슈바이처        A301         전산실습관 3층 40석 규모     
J0102       자바중급      22            테슬라          T502         전자공학관 5층 60석 규모
O3090       오라클중급    22            테슬라          T201         전산실습관 2층 30석 규모
O3010       오라클심화    10            장영실          T502         전자공학관 5층 60석 규모
J3342       JSP응용       20            맥스웰          K101         인문과학관 1층 90석 규모

---------------------------------------------------------------------------------------------

--테이블명 : 점수     →  자식 테이블

---------------------------------------------
과목번호   교수번호      학번            점수
=====================
        F.K
++++++++                ++++++++
  P             .           K
---------------------------------------------
O3090        22         2209130(김태민)   92
O3090        22         2209142(정영준)   80
O3090        22         2209151(최나윤)   96
                            :
                            :
---------------------------------------------

*/

-- 제 3정규화
--> 식별자가 아닌 컬럼이 식별자가 아닌 컬럼에 의존적인 상황이라면
--  이를 분리하여 새로운 테이블을 생성해 주어야 한다.
--  이 과정을 제 3 정규형이라 한다.


--※ 관계(Relation)의 종류

--> 1 : many(다) 관계 
--> 제 1 정규화를 적용하여 수행을 마친 결과물에서 나타나는 바람직한 관계
--  관계형 데이터베이스를 활용하는 과정에서 추구해야 하는 관계

-- 1 : 1 관계
--> 논리적, 물리적으로 존재할 수 있는 관계이긴 하지만
-- 관계형 데이터베이스 설계 과정에서 가급적이면 피해야 할 관계


