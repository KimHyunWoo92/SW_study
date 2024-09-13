-- CHAPTER 02. WHERE절 --

/*
-- WHERE 절 기본사용법
- 3.SELECT 조회할 컬럼명,...
- 1.  FROM 조회할 테이블명,
- 2. WHERE 조회할 행을 선별하기 위한 조건식

*/


-- 실습)직원테이블에서 직원 ID가 105인 직원의 FIRST_NAME과 LAST_NAME 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- 실습) 부서 테이블에서 매니저 아이디가 100인 부서 이름과 부서아이디를 ㅜㄹ력

SELECT * FROM DEPARTMENTS ;

SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 -- 실습) 직원테이블에서 급여가 9000인 직원의 직원ID와 FIRST_NAME,급여 출력
 
SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY = 9000 ;
 
-- 산술연산자 (+, -, *, /)

SELECT SALARY, SALARY-2
  FROM EMPLOYEES ;
  
-- 비교연산자 ( >, >=, <, <=)


-- 실습) 직원테이블에서 급여가 5000이하인 직원의 FIRST_NAME 과 급여정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000 ;


-- 실습) 직원테이블에서 연봉이 50000이하인 직원들의 이름(FIRST_NAME)과 연봉을 출력
-- 연봉은 'AnnSal' 이라고 별칭을 지어서 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000;
 

/*
-- 등가 비교 연산자
- = : 같다
- !=, <> , ^= : 같지 않다.
- NOT A=B : 같지 않다.
*/

-- 실습) 직원테이블에서 직업아이디가 IT_PROG가 아닌 직워늬 FIRST_NAME과 직업ID 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES 
 WHERE JOB_ID != 'IT_PROG' ;
 
 
-- 실습) 직원테이블에서 EMAIL 정보가 SKING인 직원의 모든 정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;
 
-- 실습) 직원테이블에서 EMAIL 정보가 SKING이 아닌 직원의 모든 정보 출력

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL != 'SKING' ;
 
/*
-- 논리 연산자 > 두개이상의 조건을 연결
- AND : 조건을 모두 만족하는 경우 TRUE값 반환
- OR : 하나의 조건이라도 만족하는 경우 TRUE값 반환
*/

-- 실습) 직원테이블에서 부서아이디가 90이고, 급여가 5000이상인 직원의ID와 직원 이름을 출력

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 AND SALARY >= 5000 ;
 
-- 실습) 직원테이블에서 부서아이디가 100이거나 입사일 06년 02월 02일 이후에 입사한 직원의 정보출력

SELECT * FROM EMPLOYEES ;

DESC EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02' ;
 
-- 실습) 직원테이블에서 부서ID가 100이거나 90인 직원중에서
-- 직원ID가 101인 직원의 직원ID, 이름, 연봉을 출력, 연봉은 "연봉" 별칭 지정

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "연봉"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ; 
 
-- 연산자 순위에 따라서 결과값이 달라진다.(AND 연산자가 OR 보다 우선순위가 높다)

/*
-- [NULL관련 연산자]
- IS NULL : 데이터 값이 NULL인 값을 조회
- NOT NULL : 데이터 값이 NULL이 아닌값을 조회
*/

-- 실습) 직원테이블에서 보너스가 있는 직원의 FIRST_NAME, 보너스 정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;
 
-- 실습) 직원테이블에서 매니저 아이디가 없는직원의 이름은?

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL ;
 
 /*
 -- [SQL 연산자] : SQL에서 사용할 수 있는 연산자
 - IN : 특정 컬럼에 포함된 데이터를 여러개 조회할 때 활용
    =(같다)+OR(논리연산자)가 함께 사용된 결과를 얻는다.
    NULL값을 제외하는 특성을 가지고 있다.
    
 - BETWEEN :
 - LIKE :
 
 */

-- 실습) 직원테이블에서 부서아이디가 30이거나 50이거나 90인 직원의 모든 정보를 출력
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 ;
    
-- IN 연산자 활용
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90) ;
 
-- NOT IN 연산자 활용
-- IN 뒤에 조건에 해당하지 않는 데이터를 출력
-- !=(등가비교연산자) + AND(논리연산자)
-- NULL값을 출력하게 되면, 데이터가 출력이 안되는 현상이 발생

-- 실습) 직원테이블에서 매니저아이디가 100,120,121이 아닌 직원들의 이름과 매니저 아이디를 출력

SELECT FIRST_NAME,MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 ;


SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100,120,121) ;
 
-- 실습) 직원테이블에서 직업아이디가 AD_VP이거나 ST_MAN인 직원의 이름과 직업아이디를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID = 'AD_VP'
    OR JOB_ID = 'ST_MAN' ;
    
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP','ST_MAN') ;
 
 
-- 실습) 직원테이블에서 매니저아이디가 145, 147, 148, 149가 아닌 직원의 이름과 매니저아이디를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 145
   AND MANAGER_ID != 146
   AND MANAGER_ID != 147
   AND MANAGER_ID != 148
   AND MANAGER_ID != 149 ;


SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145,146,147,148,149) ;
 
/*
-- [BETWEEN 연산자]
- 일정 범위 내의 데이터를 조회할 때 사용
EX)
SELECT
  FROM
 WHERE 컬럼명 BETWEEN 최소값(A) AND 최대값(B) ;
*/

-- 실습) 직원테이블에서 급여가 10000이상 20000이하인 직원의 이름과 급여를 출력

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ;
 
-- 실습) 직원테이블에서 2005년에 입사한 직원들의 이름과 입사일 정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;

/*
-- 와일드카드 % 사용법
컬럼 LIKE '%문자' > 해당 문자로 끝나는 모든 데이터 검색
EX
COMPANY LIKE '%개발원' > 개발원으로 끝나는 모든 데이터 출력

*/

-- 실습) 직원테이블에서 650으로 시작하는 핸드폰 번호를 찾기

SELECT * FROM EMPLOYEES ;

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%' ;
 
-- 실습) 직원테이블에서 FIRST_NAME이 S로 시작하고 N으로 끝나는 직원의 이름 찾기

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
-- 실습) 직원테이블에서 이름이 it으로 끝나고 총 4글자인 직원의 이름을 찾기

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it' ;
 
-- 실습) 직원테이블에서 두번째 글자가 e인 직원의 이름 찾기

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%' ;
 
-- 실습) 직원테이블에서 01월에 입사한 직원의 모든 정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%' ;

/*

내장형 함수
- 문자형함수 : 문자 데이터를 가공하는 함수
- 숫자형 함수 : 숫자 데이터를 연산하고 수치를 조정하는 함수
- 날짜형 함수 : 날짜 데이터를 다루는 함수
- 변환형 함수 : 자료형을 변환하는 함수
- NULL 함수 : NULL처리 함수
- 조건 함수 : 상황에 따라 다른 데이터는 반환하는 함수

*/



 
 
 
 







