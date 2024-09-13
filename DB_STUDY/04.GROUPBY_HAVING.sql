/*
-- CHAPTER 04. GROUP BY / HAVING --

- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
- 다중행 함수 : 여러행의 입력을 받아 하나의 결과값으로 출력이 되는 함수
-> 다중행 함수를 '집계함수'라고 부른다.
1. 집계함수는 NULL값을 제외하는 특성을 가지고 있다.
2. 집계함수는 그룹화(GROUP BY)가 되어있는 상태에서만 사용이 가능하다. **매우중요

- 집계함수의 종류
- COUNT(데이터) : 지정한 데이터의 개수 반환
- SUM : 지정한 데이터의 합을 반환
- MAX : 지정한 데이터 중 가장 높은 값을 반환
- MIN : 지정한 데이터 중 가장 낮은 값을 반환
- AVG : 지정한 데이터의 평균값을 반환

*/

-- [COUNT 함수 활용]
-- 실습) 직원테이블에서 직원 ID의 행의 개수를 조회

SELECT * FROM EMPLOYEES ;

SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEE ;
-- GROUP BY () ; : 사실상 이 키워드가 숨겨져 있는 상태.(소괄호 안에 데이터가 없는 상태)
-- 직원테이블을 하나의 그룹으로 보겠다.

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID         -- 행이 107개
     , COUNT(EMPLOYEE_ID)  -- 행이 1개
  FROM EMPLOYEES
GROUP BY EMPLOYEE_ID ;

-- ORA-00937: not a single-group group function
-- 행의 개수가 맞지 않아서 에러가 발생. > GROUP BY를 해주면 해결된다.

-- 실습) 직원테이블에서 부서ID의 행의 개수를 출력

SELECT * FROM EMPLOYEES ;

SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES ;


-- 부서 ID가 NULL을 가지는 직원의 FIRST_NAME은?

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL ;


-- 실습) 직원테이블에서 급여의 총 합계를 출력
SELECT * FROM EMPLOYEES ;

SELECT SUM(SALARY)
  FROM EMPLOYEES ; 
-- 실습2) 직원테이블에서 직원들의 최대급여와 최소급여 출력
SELECT * FROM EMPLOYEES ;

SELECT MAX(SALARY),MIN(SALARY)
  FROM EMPLOYEES ;

-- 실습3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력, 결과값을 소수점 1의자리까지 반올림
SELECT * FROM EMPLOYEES ;

SELECT ROUND(AVG(SALARY),1)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 ;

-- 테스트 뭐리 테이블 조회
SELECT * FROM 수강생정보 ;
SELECT * FROM 성적표 ;

-- GROUP BY : 특정 컬럼을 기준으로 그룹화

-- GROUP BY 사용방법,
-- SELECT
--   FROM
--  WHERE
-- GROUP BY

-- 수강생 정보 테이블에서 소속반 별 학생의 인원수를 조회.

SELECT * FROM 수강생정보 ;

SELECT 소속반, COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반 ;

-- 집계함수 사용시 유의사항
-- < SQL 실행순서 >
-- FROM > WHERE > GRUOP BY > HAVING > SELECT > ORDER BY

-- 실습) 성적표 테이블에서 과목별로 최고 성적과 최저 성적을 출력
SELECT * FROM 성적표 ;

SELECT 과목, MAX(성적),MIN(성적)
  FROM 성적표
GROUP BY 과목 ;

-- 실습) 성적표 테이블에서 학생별로 평균 점수를 출력

SELECT * FROM 성적표 ;

SELECT ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID ;

-- 실습) 성적표 테이블에서 학생별로 JAVA와 DATABASE과목의 성적의 합을 출력

SELECT * FROM 성적표 ;

SELECT 학생ID, SUM(성적)
  FROM 성적표
 WHERE 과목 NOT IN ('PYTHON')
GROUP BY 학생ID ;

-- [HAVING절 ]
-- GRUOP BY절이 존재할 때만 사용 가능.
-- 집계가 완료된 대상을 조건을 통해 필터링 하는 문법이다.
-- 조건이 참인 결과만 출력이 된다는 점에서 WHERE절과 비슷하지만,
-- HAVING절은 그룹화된 대상에서 출력이 된다는 점에서 완전히 다르다.

-- 실습) 성적표 테이블에서 학생별 평균성적을 구하고,
-- 평균성적이 75 이하인 학생들만 출력 

SELECT * FROM 성적표 ;

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID 
HAVING AVG(성적) <= 75 ;

-- 실습) 수강생 정보 테이블에서 반별 인원수가 3명 이상인 반만 출력
SELECT * FROM 수강생정보 ;

SELECT 소속반, COUNT(소속반)
  FROM 수강생정보
GROUP BY 소속반 
HAVING COUNT(소속반) >= 3;

-- 실습) 직원테이블에서 부서별 최고 연봉이 100000이상인 부서만 출력
SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID, MAX(SALARY*12)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY*12) >= 100000 ;

-- 실습) 성적표 테이블에서 학생별 평균성적을 출력하되,
-- NULL이 아닌 값만 출력, 단 성적의 소수점 1의 자리까지만 출력

SELECT * FROM 성적표 ;

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID 
HAVING AVG(성적) IS NOT NULL ;

