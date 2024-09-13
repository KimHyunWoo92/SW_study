-- CHAPTER 03.ORACLE 함수 --

/*
- 함수란?
특정한 입력값(INPUT)을 넣어 특정한 기능을 통해 결과 값(OUTPUT)을 출력

- 사용자 정의함수 : 사용자가 필요에 의해서 직접 정의한 함수
- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할때마다 호출해서 사용.
--> 문자형, 숫자형, 날짜형, 변환형, NULL관련함수, 조건함수가 있다.

- 함수() > 함수를 실행할때 사용하는 입력값을 "매개변수", "인자값"이라고 표현.

- [문자형 함수]
- UPPER(DATA) : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력.
- LOWER(DATA) : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력.

*/

SELECT UPPER('abcde1234@@')
  FROM DUAL ;
  
-- DUAL 테이블이란?
--> 오라클 최고관리자 SYS소유의 테이블
--> 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블


-- 실습) 직원테이블에서 직원의 FIRST_NAME과 EMAIL을 출력
-- FIRST_NAME을 대문자, EMAIL을 소문자로 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES ;
  
-- LENGTH(DATA) : 괄호 안 문자 데이터의 길이를 구하는 함수

SELECT 'HELLO WORLD'
  FROM DUAL ;
  
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;
  
-- 실습) 직원테이블에서 직원의 FIRST_NAME과 FIRST_NAME의 길이를 출력

SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES ;
  
-- 실습) 직원의 FIRST_NAME의 길이가 5이상의 직원들의 직원 ID와 이름을 출력

SELECT * FROM EMPLOYEES ;

SELECT LENGTH(FIRST_NAME),EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 5 ;
  
-- SUBSTR : 문자열을 추출하는 함수
-- 1. SUBSTR(INPUT, START_POINT, LENGTH): 문자열 데이터의 시작위치부터 추출길이만큼 출력.
-- 2. SUBSTR(INPUT, START_POINT) : 문자열의 시작위치부터 문자열마지막까지 출력

SELECT SUBSTR('스마트인재개발원',1,3) AS 스마트,
       SUBSTR('스마트인재개발원',4) AS 인재개발원
  FROM DUAL ;
  

-- 실습) 직원테이블에서 입사날짜, 연도, 월, 일 별로 출력
-- 각 컬럼에는 연도, 월, 일별로 별칭을 사용해서 출력

SELECT * FROM EMPLOYEES ;

SELECT SUBSTR(HIRE_DATE,1,2) AS 연도
     , SUBSTR(HIRE_DATE,4,2) AS 월
     , SUBSTR(HIRE_DATE,7) AS 일월
  FROM EMPLOYEES ;
  

-- 실습) DUAL 테이블을 이용해서 'https://smhrd.or.kr'의 문자열을 입력받아
--      smhrd 문자열만 잘라서 출력

SELECT SUBSTR('https://smhrd.or.kr',9,5)
  FROM DUAL ;

-- REPLACE : 특정 문자를 다른 문자로 바꾸어주는 함수
-- 1. REPLACE(DATA,바꾸고싶은 문자,바꿔야할 문자)
-- 2. RAPLACE(DATA,바꾸고싶은 문자)

-- > 바꿔야할 문자 생략시, 바꾸고 싶은 문자를 문자열 데이터에서 삭제가 된다.

SELECT ('스마트##인재개발원')
     , REPLACE('스마트##인재개발원','#','-')
     , REPLACE('스마트##인재개발원','#') AS 삭제
  FROM DUAL ;
  
-- 실습) 직원테이블에서 입사날짜를 출력하되,
-- /(슬러시)를 하이픈으로 바꿔서 출력하고, /(슬러시)삭제도 출력.

SELECT HIRE_DATE
     , REPLACE(HIRE_DATE,'/','-') AS 하이픈
     , REPLACE(HIRE_DATE,'/') AS 삭제
  FROM EMPLOYEES ;
  
  
-- CONCAT : 두 문자열 데이터를 합치는 함수
-- 매개변수로 1개만 들어갈 수 있고, 2개의 문자열만 합치는 함수이다.
-- 합성연선자 "||"를 이용하면 무한대로 문자열 연결이 가능하다.

SELECT CONCAT('스마트','인재개발원') || ' 최고에요'
  FROM DUAL ;
  

-- 실습) 직원테이블에서 직원의 FIRST_NAME을 출력하고 FIRST_NAME 뒤에 '이름은'이라는 문자열을 합쳐보세요!

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, CONCAT('이름은',FIRST_NAME) || ' 입니다.' AS 소개
  FROM EMPLOYEES ;


-- TRIM : 입력 받은 문자형 데이터의 양 끝의 공백을 제거한다.

SELECT '      여러분은 최고 입니다.     '
  FROM DUAL ;

SELECT TRIM('      여러분은 최고 입니다.     ')
     , REPLACE(TRIM('      여      러분  은 최   고 입      니다.     '),' ')
     , REPLACE('      여      러분  은 최   고 입      니다.     ',' ')
     , REPLACE('      여러분은 최고 입니다.     ',' ')
  FROM DUAL ;

/*
-- [숫자형 함수]
-- ROUND : 특정 위치에서 반올림 하는 함수
1. ROUND(DATA,반올림 위치)
2. ROUND(DATA) : 반올림 위치 생략시, 소수점 첫째 자리에서 반올림 수행 DEFAULT

-- TRUNC : 특정 위치에서 버리는 함수
1. TRUNC(DATA,버리는위치)
2. TRUNC(DATA) : 버리는 위치 생략시, 소수점 첫번째 자리에서 버림 수행 DEFAULT

*/


SELECT ROUND(1234.5678,1)
     , ROUND(1234.5678,3)
     , ROUND(1234.5678)
  FROM DUAL ;

SELECT TRUNC(1234.5678,1)
     , TRUNC(1234.5678,4)
     , TRUNC(1234.5678)
  FROM DUAL ;


-- MOD : 숫자를 나눈 나머지를 값을 구하는 함수
-- 홀수, 짝수를 구분할 때 유용하게 사용한다.
-- MOD(DATA, 나눌숫자)

SELECT MOD(10,2)
  FROM DUAL ;
  
SELECT MOD(10,3)
  FROM DUAL ;


-- [날짜형 함수]
-- 입력시 바로 출력되며, 현재시간을 초 단위까지 출력이 가능하다.
-- 날짜형 데이터는 연산이 가능하다.

SELECT SYSDATE
  FROM DUAL ;

-- 날짜 형식 세팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "오늘"
     , SYSDATE -1 "어제"
     , SYSDATE +1 "내일"
  FROM DUAL ;

  
-- 날짜 데이터 활용(실무)
SELECT SYSDATE AS 현재
     , SYSDATE +1 AS 하루더함
     , SYSDATE +1/24 AS 한시간더함
     , SYSDATE +1/24/60 AS 일분더함
     , SYSDATE +1/24/60/60 AS 일초더함
--     , SYSDATE + SYSDATE --> 날짜 데이터끼리는 연산 불가
  FROM DUAL ;
  
  
-- ADD_MONTHS : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)

SELECT SYSDATE AS 현재
     , ADD_MONTHS(SYSDATE, +1) AS "1개월 후"
     , ADD_MONTHS(SYSDATE, -1) AS "1개월 전"
  FROM DUAL ;
  
-- [변환형 함수]
-- 형변환 형태의 종류
-- 임시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것

-- TO_CHAR : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- TO_CHAR(변환데이터, 출력 형태)

SELECT SALARY AS 급여정보
  FROM EMPLOYEES ;
  
SELECT TO_CHAR(SALARY,'L999,999')
  FROM EMPLOYEES ;
  
-- 실습) DUAL 테이블을 이용해서 현재 날짜 형태를 'YY/MM/DD/DAY'형태로 변환

SELECT TO_CHAR(SYSDATE,'YY/MM/DD/DAY')
  FROM DUAL ;

-- TO_NUMBER : 문자 데이터를 숫자 데이터로 변환 하는 함수
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)

SELECT TO_NUMBER('1,000','9999')
  FROM DUAL ;

-- TO_DATE : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열데이터, 인식 될 날짜 형태)

SELECT TO_DATE('2024.0408','YYYY/MM/DD')
  FROM DUAL ;

-- NVL (NULL인지 여부를 검사할 데이터, 앞의 데이터가 NULL이 아닐 경우 반환할데이터, 앞 데이터가 NULL일 경우 반환 할 데이터)
-- 주소가 NULL이 아닌경우는 '작성완료'로 출력
-- 주소가 NULL인 경우는 '주소 미기재' 로 출력

-- [NULL 처리 함수 ]
-- NVL / NVL2 : NULL 값을 대체 할 수 있는 함수
-- 1. NVL(NULL인지 검사할 데이터, NULL일 경우 반환할 데이터)
-- 2. NVL2(NULL인지 여부를 검사할 데이터
--        ,<1>이 NULL이 아닐 경우 반환할 데이터 <2>
--        ,<2>이 NULL일 경우 반환할 데이터<3>

-- 실습) 직원테이블에서 보너스가 NULL인 경우 숫자 0으로 대체해서 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES ;

-- 실습) 직원테이블에서 직원_ID와 FIRST_NAME, MANAGER_ID 출력
-- MANAGER_ID가 있으면 직원으로 출력, 없으면 대표로 출력

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID,'직원','대표')
  FROM EMPLOYEES ;

-- [ 조건함수 ]
-- DECODE : 상황에 따라 다른 데이터를 반환하는 함수
-- 검사대상과 비교해서 저장한 값을 반환

-- DECODE(검사대상이될 컬럼 또는 데이터<1>,비교값<2>,일치 시 반환할 값<3>,일치하지 않을때 반환값<4>)

-- 실습) 직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력(DECODE 함수로)

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(MANAGER_ID,NULL,'대표','직원')
  FROM EMPLOYEES ;
  
  











