/*
-- CHAPTER 10. DCL(Data Control Language)

-- DCL이란
-- 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어


-- DCL 명령어
-- GRANT  : 권한을 부여하는 명령어
-- REVOKE : 권한을 회수하는 명령어
-- ROLE   : 권한을 묶어서 부여할때 사용하는 명령어

-- 사용자란?
- 데이터베이스에 접속을 하여 데이터를 관리하는 계정을 '사용자'(USER)라고 한다.

-- 사용자 생성방법
-- CREATE USER   사용자 이름(필수)
-- IDENTIFIED BY 비밀번호

-- 권한부여
-- GRANT 시스템권한
-- TO    USER ;
-- WITH ADMIN OPTION(선택사항) 
-- 현재 GRANT 문을 통해 부여받은 권한을 다른 사용자에게 동일하게 부여할 수 있는 재부여 할 수 있는 권한도 함께 부여받는것


*/

CREATE TABLE TEST(
    TEST NUMBER
) ;
-- ORA-01031: insufficient privileges : 권한이 충분하지 않다.

-- 이러한 권한들을 다 주기 힘들어서 묶어 놓은것을 ROLE이라고 부른다.
-- GRANT CONNECT, RESOURCE TO DCLTEST ;

-- CONNECT : 데이터베이스에 접속에 필요한 권한.
-- RESOURCE : 테이블, 시퀀스 등 객체 생성 권한.
-- DBA : 데이터베이스를 관리하는 대부분의 시스템 권한 > 최상위 계정 (함부로 건들면 안된다.)

-- 스키마 란?
-- 데이터베이스에 저장되는 데이터 구조와 제약조건 등을 정의한 구조
-- 테이블, 뷰, 인덱스, 시퀸스 등의 HR계정의 모든 객체는 HR의 스키마
-- 스키마는 각 계정마다 존재, 이름마다 계정이 ㅏㅌ다.
-- 오라클에서는 스키마와 사용자를 구분하지 않고 사용한다.

-- 스키나.테이블.컬럼명

SELECT * FROM HR.EMPLOYEES ;

-- 객체 권한이란?
-- 특정 사용자의 객체(테이블, 시퀀스, 뷰)에 권한을 주는 것.
-- 즉 HR 소유 테이블에 DCLTEST 사용자가 SELECT, UPDATE 등의 작업이 가능하도록 허용할 수 있게 하는 것.

-- 객체 권한 사용방법
-- GRANT 시스템 권한
-- ON 스키마, 객체 이름
-- TO 사용자

-- GRANT SELECT, UPDATE ON HR.EMPLOYEES TO DCLTEST ;

UPDATE HR.EMPLOYEES
   SET FIRST_NAME = '김' , LAST_NAME ='현우'
 WHERE EMPLOYEE_ID = 100 ;
 
SELECT * FROM HR.EMPLOYEES ;
 




