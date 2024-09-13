/*
-- CHAPTER 05. JOIN --
- JOIN : 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술

- 비등가 조인 (NON EQUI JOIN)
> 두 개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 JOIN
> 등가연산자(=) 아닌 연산자들을 사용한 조인을 의미 (> , >=, <, <=, BETWEEN)

- 등가 조인 (EQUI JOIN) 
> 두 개의 테이블간에 서로 정확하게 일치하는 경우 활용하는 JOIN
> 등가선산자(=)를 사용해서 조인을 의미
> 가장 많이 사용되는 조인의 형태

-- [ 조인의 사용 방법 ]
SELECT 테이블1.컬럼
  FROM 테이블1, 테이블2 > 테이블1과 2를 조인하겠다.
 WHERE 테이블1.컬럼 = 테이블2. 컬럼 > 조인 조건(서로 같은 가진 컬럼)
 
*/

-- 실습) 수강생 정보 테이블과 성적표 테이블에서 학생ID, 학생이름, 과목, 성적 순으로 출력

SELECT * FROM 수강생정보 ;
SELECT * FROM 성적표 ;

SELECT 수강생정보.학생ID, 수강생정보.학생이름
     , 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표
 WHERE 수강생정보.학생ID = 성적표.학생ID ;

-- 실습) 직원테이블의 직원ID,FIRST_NAME, 부서테이블의 부서 이름 순으로 출력

SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS 
 WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID ;
 
-- 별칭 사용

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMNETS D
 WHERE E.DEPARTMENT_ID, D.DEPARTMENT_ID ;
 
-- 직원ID가 100인 직원의 FIRST_NAME과 부서이름을 출력
-- 
SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID =100 ;

-- 단독적으로 존재하는 컬럼은 .(경로)를 안적어줘도 상관은 없다.
-- 현업에서는 테이블 경오를 적어주는 것을 선호한다.
-- 조인 조건이 되는 컬럼은 대부분 PK와 FK관계로 이루어진다. 하지만 다 그런것은 아니다.

/*
-- ANSI(미국국립표준협뢰) 조인은 모든 DBMS에서 사용가능한 문법으로 어디서든
-- 사용가능해서 이 방식을 권장 합니다.

--[ANSI 조인 문법사용 방법 ]
SELECT 테이블1.컬럼명, 테이블2. 컬럼명...
  FROM 테이블1 INNER JOIN 테이블2
    ON (테이블1.컬럼명 = 테이블2.컬럼명) ; > 조인 조건
 WHERE 일반 조건절
 
*/

-- 실습) 직원테이블에서 직업테이블에서 직원ID, 직업ID, 직원TITLE 정보를 출력
SELECT * FROM EMPLOYEES ;
SELECT * FROM JOBS ;

SELECT E.EMPLOYEE_ID,E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID) ;
    

-- CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
-- > 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합이 조회
-- 카티션 곱이라 부른다 > 모든 경우의 수가 조회는 것을 말함.

-- SELECT 조회할 컬럼명,...
--   FROM 테이블1 CROSS JOIN 테이블2 ;

-- > ON 조인 조건절이 없으면 CROSS JOIN이다.

-- 실습) 직원ID, 부서ID, 부서이름을 출력

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;
 
/*
-- OUTER JOIN : 외부조인이라고 하며, 두개의 테이블간의 교집합을 조회하고,
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을때 사용하는 조인 문법.
-- > 한쪽 데이터의 NULL값도 출력하고 싶을때 사용

- LEFT OUTER JOIN : 왼쪽 외부 조인
- FULL OUTER JOIN : 전체 외부 조인
- RIGHT OUTER JOIN : 오른쪽 외부 조인

ANSI 표준문법
SELECT 테이블1.컬럼, 테이블2.컬럼,...
  FROM 테이블1 LEFT OUTER JOIN 테이블2
    ON 테이블1.컬럼명 = 테이블2.컬럼명
- OUTER 생략가능

오라클 문법<LEFT OUTER JOIN> 예시//FULL OUTER JOIN은 오라클에세서 지원하지않음.
SELECT  
  FROM 테이블1, 테이블2
 WHERE 테이블1.컬럼명 = 테이블2.컬럼명+
- LEFT 조인이면, WHERE절에서 LEFT반대쪽(RIGHT)에 (+)표시
- RIGHT 조인이면, RIGHT반대쪽(LEFT)쪽에 (+) 표시

*/

SELECT * FROM DEPARTMENTS ;
SELECT * FROM EMPLOYEES ;
-- 실습) 각 부서의 매니저 직원의 부서이름, 매니저 아이디, FIRST_NAME출력
-- 각 부서의 관리자를 찾는 문제, EMPLOYEES에서 MANAGER_ID는 소속을 나타냄과 동시에, 부서의 BOSS를 표시하고있음.
-- 따라서, DEPARTMENTS의 MANAGER_ID와 EMPLOYEE_ID 를 매칭했을때, 각 부서의 장을 나타낼 수 있다.

    
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    
-- LEFT OUTER JOIN 활용
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    
-- LEFT OUTER JOIN을 ORACLE 문법으로 변경
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+) ;
 

-- RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

-- RIGHT OUTER JOIN을 ORACLE 문법으로 변경
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID ;

-- FULL OUTER JOIN

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    

-- [ 3개의 테이블 조인 ]
-- 부서테이블, 위치테이블, 나라테이블을 INNER JOIN 하여,
-- 부서이름, 도시, 나라이름을 출력
SELECT * FROM DEPARTMENTS ;
SELECT * FROM LOCATIONS ;
SELECT * FROM COUNTRIES ;

SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D INNER JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
       INNER JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID) ;


SELECT D.DEPARTMENT_NAME, L.CITY ,C.COUNTRY_NAME
  FROM DEPARTMENTS D, LOCATIONS L , COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID ;
   

