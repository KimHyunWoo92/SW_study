-- CHAPTER 01. SELECT --

-- 주석기호

-- 글자크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석색상 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL 주석

-- 주석형태(2) : /**/ 여러줄을 한번에 주석처리 가능

/*
1. SQL 문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 반드시 세미클론(;)을 찍어줘야한다.
4. SQL 실행 단축기 : CTRL+ENTER, F9
*/

DESC EMPLOYEES ;
-- DESC는(DESCRIBE): SQL에서 사용되는 데이터베이스 테이블 구조를 확인하는 명령어

SELECT FIRST_NAME FROM EMPLOYEES ;
-- select first_name from employees ;
-- SQL에서는 대소문자 구분없이 인식이 가능하지만, 대문자를 쓰는것이 관례적이다.

SELECT FIRST_NAME
  FROM EMPLOYEES ;
 
/* 
- [SELECT 절 기본 사용법]

- 2.SELECT 조회할 컬럼명1,....
- 1.FROM   조회할 테이블명1,....


- 전체조회
- * (아스타리스크) -> 전체를 의미 / SELECT절에 사용
*/

-- 직원테이블의 전체 정보를 출력

SELECT *
  FROM EMPLOYEES ;

-- 부서별테이블의 전체 정보를 출력
SELECT *
  FROM DEPARTMENTS ;
  
-- 실습) 직원테이블에서 직원ID, 직원의 성과 이메일 정보만 출력

SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
  FROM EMPLOYEES ;
  
  
-- 실습) 부서테이블에서 부서ID, 부서명, 위치ID 출력

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS ;

-- 실습) 직원테이블에서 FIRST_NAME, 직원ID, 급여, 매니저ID 출력

SELECT FIRST_NAME, EMPLOYEE_ID, SALARY, MANAGER_ID
  FROM EMPLOYEES ;
  
SELECT JOB_ID
  FROM EMPLOYEES ;
  
/*
-- [데이터 중복 제거]
- DISTINCT : 데이터 중복 제거

- DISTINCT 사용방법
- SELECT   DISTINCT 조회할 컬럼명1,....
- FROM     조회할 테이블명

*/

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
-- 실습) 직원테이블에서 입사일 중복제거하여 출력

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
  
-- 실습) 직원테이블에서 JOB_ID와 부서ID를 중복 제거하여 출력

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

-- 한쪽 컬럼에 중복이 있어도 다른쪽 컬럼의 값이 다르면 완전 다르게 취급한다.

-- 실습) 직원테이블에서 직원이름과 급여의 정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES ;
  
-- TIP 1
-- 컬럼에 숫자 연산이 가능합니다. (+, -, *, /)

-- 직원테이블에서 직원의 이름과 급여와, 연봉을 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY, SALARY*12
  FROM EMPLOYEES ;

/*  
-- [컬럼의 별칭 사용 방법]
- Alias 라고 하며 한눈에 보기 좋게 설정하는 것
- As 키워드를 사용하여 별칭을 지정합니다.

- 1. SELECT 컬럼 별칭
- 2. SELECT 컬럼 "별칭"
- 3. SELECT 컬럼 As 별칭
- 4. SELECT 컬럼 As "별칭"

*/
SELECT FIRST_NAME, SALARY*12 연봉
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 "연봉"
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 AS 연봉
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY*12 AS "연봉"
  FROM EMPLOYEES ;
  
  
-- 실습) 직원테이블에서 입사일, 입사일 다음날을 출력
-- 단, 입사일은 별칭을 "입사일"로, 입사일다음날은 별칭을 "입사일다음날" 사용해서 출력

SELECT * FROM EMPLOYEES ;

SELECT HIRE_DATE AS "입사일",
       HIRE_DATE+1 AS "입사일다음날"
  FROM EMPLOYEES ;

/* ORDER BY
- 특정 컬럼을 기준으로 정렬된 상태로 출력하는데 사용.
- SQL에서는 기본적으로 오름차순으로 적용.
- SQL 실행순서에서 가장 마지막에 실행된다.
- ASC : 오름차순 정렬 (1,2,3,4...)
- DESC : 내림차순 정렬 (....,4,3,2,1)
*/

-- 실습) 직원테이블에서 모든 직원의 정보를 급여 기준으로 오름차순 정렬하여 출력

SELECT * FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY DESC ;

-- 실습) 직원테이블에서 최근에 입사한 날짜를 기준으로 직원의 FIRST_NAME과 직원의 HIRE_DATE를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- 실습) 직원테이블에서 직원ID,부서ID,FIRST_NAME,직원의 급여 순으로 출력
-- 단,부서ID는 오름차순, 급여는 내림차순으로 출력

SELECT * FROM EMPLOYEES ;


SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;

-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 순서대로 출력.

/* [NULL]
- NULL 값이란 데이터의 값이 완전히 비어 있는 상태를 말합니다.
- 값이 존재하지 않거나 정해지지 않은 것을 의미합니디.
- 숫자 0과 문자열 ''은 NULL값이 아닙니다.
- NULL과 연산을 하면 결과 값은 무조건 NULL값이 나온다.
- NULL과 비교를 하면 무조건 FALSE 값이 나온다.
*/

-- 실습) 직원테이블에서 직원ID, 보너스, 보너스 두배의 정보를 출력
-- 단, 보너스두배의 정보는 "UP_BONUS"로 별칭을 사용하여 출력

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES ;

-- 실습) 문제1에서 UP_BONUS의 결과 값을 확인하여 왜 그렇게 결과 값이 나왔는지 설명
-- COMMISSION_PCT 값이 NULL이면 UP_BONUS의 값은 무조건 NULL이다.







