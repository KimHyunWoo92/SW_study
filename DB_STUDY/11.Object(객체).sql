/*
-- 객체?
- 데이터베이스 내에 존재하는 논리적인 저장 구조

-- View 란?
-- 하나 이상의 테이블에서 여러 정보를 토대로 만들어지는 가상의 테이블

-- 사용목적
- 편리성 : 자주 사용하는 SELECT 문장을 저장하기 위해서 사용.
- 보안성 : 테이블의 특정 데이터를 노출 시키지 않기 위해서 사용.

-- 뷰 생성 방법
-- CREATE VIEW 뷰 이름(필수)
-- AS 저장할 SELECT문 (필수)

-- 뷰 삭제 방법
-- DROP VIEW 뷰 이름

*/

SELECT * FROM EMPLOYEES ;

-- 김현우의 정보 (직원ID, 이름, 이메일, 직업아이디, 급여)

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100 ;
 
-- 뷰 생성 방법
-- CREATE VIEW 뷰 이름(필수)
-- AS 저장할 SELECT문 (필수)

CREATE VIEW VIEW_EMP100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100 ;

SELECT * FROM VIEW_EMP100 ;

/*
-- 시퀀스란?
- 특정 규칙에 따른 연속 숫자를 생성하는 '객체'
- 대기 순번표 처럼 계속 다음 번호를 만들어주는 역할
- 주로 PK 컬럼등의 유일한 값을 만들때 사용

-- 시퀀스 사용 방법
-- 시퀀스 이름.CURRVAL 마지막 생성 번호 반환
-- 시퀀스 이름.NEXTVAL 다음 번호 반환

*/

CREATE TABLE DB_SEQUENCE (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(10),
    CLASS   VARCHAR2(50)
) ;

SELECT * FROM DB_SEQUENCE ;

-- 시퀀스 생성

CREATE SEQUENCE SEQ_DB_SEQUENCE_HYUN
    INCREMENT BY 1 -- 1씩 증가하겠다.
    START WITH 10 -- 시작번호는 10부터 시작하겠다.
    MAXVALUE 20 -- 20까지만 번호를 받겠다.
    -- 회원을 10명만 받겠다.
    MINVALUE 0
    NOCYCLE ; -- 20까지 도달하면 중단하겠다.

-- 시퀀스 조회
SELECT * FROM USER_SEQUENCES ;

-- 시퀀스 활용해 보기
SELECT * FROM DB_SEQUENCE ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '김현우','AI분석서비스모델') ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '신진아','AI분석서비스모델') ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '김형욱','AI분석서비스모델') ;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_DB_SEQUENCE_HYUN ;







