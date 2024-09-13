/*
-- CHAPTER 08. SUB QUERY
메인 쿼리 안에, 서브 쿼리가 존재
메인 쿼리 : 서브 쿼리의 결과값을 사용하여 기능을 수행하는 영역
서브 쿼리 : 메인 쿼리의 조건식에 들어가는 값을 의미


*/

-- 실습) 직원테이블에서 FIRST_NAME이 Jack라는 직원의 급여보다 낮은 직원의 first_name과 급여 출력

SELECT * FROM EMPLOYEES ;

-- 1. 테이블의 정보를 확ㅇ니
-- 2. 조건의 기준이 되는 jack의 급여정보를 확인
-- 3. 2번 결과값을 가지고 조건절을 통해서 결과값을 출력

SELECT SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Jack' ; -- 8400
 
SELECT FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400 ;
 
 -- 서브쿼리를 이용
 
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY <(SELECT SALARY
                  FROM EMPLOYEES
                 WHERE FIRST_NAME = 'Jack') ;
                 
-- 직원테이블에서 James의 급여보다 낮은 직원의 이름과 급여정보를 조회

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES 
                  WHERE FIRST_NAME = 'James') ;
 
 
-- ORA-01427: single-row subquery returns more than one row
-- 단일 행 서브쿼리는 하나의 행만 출력할 수 있다.

-- James의 급여 정보

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'James';
 
-- 서브 쿼리의 특징
-- 1. 서브 쿼리는 연산자와 같은 비교 또는 조회 대상의 오른꼬에 놓이며 ()로 묶어서 사용한다.
-- 2. 서브 쿼리의 SELECT 절에 명시한 컬럼은 메인 쿼리의 비교대상과 같은 자료형과 개수를 지정해야 한다.
-- 3. 서브 쿼리에 있는 SELECT 문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능해야한다.
-- > 즉, 단 하나의 데이터로만 연산이 가능한 연산자라면 서브 쿼리의 결과 행 수도 하나여야 한다.
-- > 연산자와 함께 상호 작용하는 방식에 따라 단일행 서브쿼리와 다중행 서브쿼리로 나뉜다.


-- 단일행 서브쿼리란?
-- 실행 결과가 단 하나의 행으로 나오는 서브쿼리
-- = , >, >= , <, <= ,!= , <> , ^=

-- 실습) 직원테이블에서 FIRST_NAME이 Nancy 보다 빨리 입사한 직원의 FIRST_NAME과 입사일을 조회

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Nancy' ; -- HIRE_DATE : 2002-08-17


SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                     FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Nancy');

-- 실습) 직원테이블에서 평균급여 보다 높은 급여를 받는 직원의 이름과 급여정보를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                  FROM EMPLOYEES)  ;
                  
-- 다중행 서브쿼리란?
-- 실행결과 행이 여러개로 나오는 서브쿼리를 말한다.

-- 다중행 연산자의 종류
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 TRUE값 반환
--> IN (서브쿼리)
-- ANY, SOME : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE값을 반환
--> 비교연선자 ANY (서브쿼리)
-- ALL : 메인 쿼리의 조선식을 서브쿼리의 결과가 모두 만족하면 TRUE 반환
--> 비교연산자 ALL (서브쿼리)
-- EXISTS : 서브 쿼리의 결과 값이 존재하는지 여부를 확인한다.(즉, 행이 1나 이상이면 TRUE값 반환)
--> EXISTS (서브쿼리)

-- 실습) 각 부서별 최고급여와 동일한 급여를 받는 직원의 정보를 출력
-- (부서ID,FIRST_NAME,급여의 정보를 출력)

SELECT * FROM EMPLOYEES ;

-- 각 부서별(GROUP BY)최고 급여 정보 
SELECT DEPARTMENT_ID , MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;


-- 서브쿼리 이용(IN)
SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID) ;

-- ANY 연산자 사용
SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- 조건에 만족하는 결과가 하나라도 참이면 참을 반환 - ANY
-- =(같다)라고 했기때문에, IN 연산자와 같은 결과값 출력

SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- ALL : 서브 쿼리 결과에 존재하는 모든 값들에 대해 조건을 만족해야한다.

SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- 결과적으로는 최대값 보다 큰 건만 출력이 되서, 최대값을 구하는 것과 같다.
-- 서브쿼리의 결과 값중에 가장 큰값인 24,000과 비교를 해서 크거나 같은 값을 가진 데이터만 출력

-- 실습) 직원테이블에서 직원의 이름과 부서아이디를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS ( SELECT FIRST_NAME
                  FROM EMPLOYEES
                 WHERE DEPARTMENT_ID = 110 ) ;
 
-- EXISTS 연산자는 '존재여부'만 확인을 한다.

-- 다중 컬럼 서브쿼리
--> 서브 쿼리의 결과로 여러 컬럼이 반환 되어 메인쿼리의 조건과 동시에 비교되는 것을 의미

-- 각 부서별 최고 급여와 동일한 급여를 받는 직원의
-- 부서ID, FIRST_NAME, 급여정보 출력

SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (SALARY,DEPARTMENT_ID) IN (SELECT MAX(SALARY), DEPARTMENT_ID
                                    FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID) ;

-- 실습) 직원 테이블에서 Jack의 급여보다 낮은 직원의 이름과 급여를 조회해보자

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Jack') ;
                  

-- 인라인 뷰(Inline View)
-- FROM절에서 가상 테이블 처럼 사용하는 서브쿼리이다.
-- 인라인뷰를 사용하면 서브 쿼리의 결과를 마치 테이블처럼 사용할 수 있따.
-- 인라인 뷰는 쿼리 내에서 즉시 처리된다.

-- 부서별 최고 급여를 받는 직원의 FIRST_NAME, 부서ID, 부서별 최고급여를 출력

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 인라인뷰와 JOIN 조건을 적절히 사용하면 의미있는 결과를 도출할 수 있음.

SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
  FROM EMPLOYEES A, (SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
                      FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID ) B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.SALARY = B.MAX_SALARY ;

-- 인라인뷰는 별칭을 설정하지 않으면, 내부 컬럼을 지정할 수 없다.
-- 별칭을 설정해야만 원하는 컬럼을 지정해서 쓸 수 가 있다.
-- 현업에서 생각보다 많이 사용하지않지만, 시험에서는 자주 출제가 된다.

-- 스칼라 서브 쿼리 사용법( SCALAR SUB QUERY)
-- SELECT 에서 사용되는 서브쿼리
-- 하나의 컬럼에 대한 하나의 행만 반환되는 특징을 가지고 있음.
-- JOIN 없이 JOIN처럼 기능하고자 할때 사용

-- 직원이름, 급여, 부서아이디, 부서이름을 출력

SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT E.FIRST_NAME, E.SALARY, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) ;
    
    
-- 스칼라 서브 쿼리 사용
-- 스칼라 서브쿼리를 사용하면 JOIN을 사용하지 않고 조인의 형태로 간단히 구할 수 있다.

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID = E.DEPARTMENT_ID)
  FROM EMPLOYEES E ;

-- 스칼라 서브쿼리를 이용하면 NULL값 데이터도 출력되는 특징을 가지고 있다.

















