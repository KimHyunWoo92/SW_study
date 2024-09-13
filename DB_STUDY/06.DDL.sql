/*
-- CHAPTER 06. DDL(DATA Definition Language --
- DDL이란?
- 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

- [DDL 명령어 종류]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블 안에 있는 데이터를 삭제하는 명령어
-- DROP     : 테이블 같은 객체를 삭제하는 명령어

-- 테이블 생성시 자주 사용하는 자료형
-- VARCHAR2(N)  : 가변형 문자형, N크기만큼 입력 받음
-- NUMBER(P, S) : 숫자형 값을 P자리만큼 입력받고, S자리만큼 소수를 입력 받음
-- 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능한다.
- 소활호를 생략하게 되면 최대값인 38 크기가 들어감.
- DATE : 현재 날짜 값을 입력받음

- 수강생 정보 테이블을 확인해서 TEST_수강생정보 테이블 을 만들어보자
-- 테이블명 드래그 후 선택후 SHIFT+F4를 누르면

*/테이블


CREATE TABLE TEST_수강생정보 (
    학생ID VARCHAR2(9),
    학생이름 VARCHAR2(50),
    소속반 VARCHAR2(5)
) ;

SELECT * FROM TEST_수강생정보 ;


-- 실습) 성적표 테이블을 확인해서 TEST_성적표 테이블을 생성

CREATE TABLE TEST_성적표 (
    학생ID VARCHAR2(9) ,
    과목   VARCHAR2(30) ,
    성적   NUMBER
) ;


-- 실습) 테이블 이름은 테이블명_LOGIN 으로 생성
-- 로그인 기능을 하기위해서 아이디, 비밀번호, 이메일, 이름 정보를 받을 예정입니다.

CREATE TABLE 테이블명_LOGIN (
    ID      VARCHAR2(20),
    PW      VARCHAR2(20),
    EMAIL   VARCHAR2(20),
    NAME    VARCHAR2(20)
) ;


-- 제약조건 : 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
-- > 데이터의 정확성을 유지하기 위한 목적으로 사용됨
-- > 제약 조건 지정방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받음.

-- [ 제약조건 종류 ]
-- PRIMARY KEY (PK) : 기본키, NOT NULL + UNIQUE -> NULL불가 + 중복 불가
-- UNIQUE KEY (UK)  : 고유키, NULL값 입력 가능 단, 중복은 불가!
-- NOT NULL         : NULL값 불가능, 꼭 입력되어야 하는 데이터에만 설정
-- CHECK            : T OR F로 평가 할 수 있는 논리식을 지정, 지정한 데이터만 입력 가능
-- FOREGIN KEY (FK) : 외래키, 테이블을 연결하는 키

-- 데이터 무결성이란?
-- > 데이터에 결함이 없는 상태를 의미, 즉 데이터가 정확하고 유효하게 유지된 상태

-- 무결성 제약조건의 종류
-- 개체 무결성(PK) : 기본키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성(FK) : 행을 입력, 수정, 삭제 할때 연관되는 다른 테이블과의 데이터가 정확하게 유지 되도록 규정
-- > 참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 하는것

-- [ 이미 생성된 테이블에 제약조건을 지정하기 ]
-- 사용방법
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건명 제약조건(컬럼) ;

SELECT * FROM 테이블명_LOGIN ;

-- 테이블에 PK 제약조건 지정하기

ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT ID_PK PRIMARY KEY(ID);

-- 테이블에 UK 제약조건을 지정하기
-- EMAIL 칼럼을 UK로 지정 > 제약조건 이름

ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL) ;

-- 테이블에 CHECK 제약 조건 지정
-- PW(비밀번호)가 3글자 이상만 저장할 수 있도록 제약

ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW)>=3) ;

-- 테이블에 FK 제약조건을 지정
-- 사용방법
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건 이름 FOREIGN KEY(컬럼)
-- REFERENCES 참조테이블(참조컬럼명)

-- TEST_성적표 테이블에서 수강생정보 테이블에 있는 학생ID라는 컬럼을 참조해서 FK를 지정

ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생ID_FK FOREIGN KEY(학생ID)
REFERENCES 수강생정보(학생ID) ;

-- 제약조건 변경하기
-- 사용방법
-- ALTER TABLE 테이블 명 MODIFY 컬럼명 바꿀 제약조건 ;

SELECT * FROM 테이블명_LOGIN ;

ALTER TABLE 테이블명_LOGIN MODIFY NAME NOT NULL ;

-- 제약조건 삭제하기
-- 사용방법
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건 이름 ;

ALTER TABLE 테이블명_LOGIN DROP CONSTRAINT PW_CHECK ;


CREATE TABLE TB_TEST1 (
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트)>5 )

) ;

CREATE TABLE TB_TEST2 (
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    
    CONSTRAINT PK테스트_PK PRIMARY KEY(PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_CK CHECK(CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TEST1(PK테스트)
) ;


-- 테이블에 컬럼 추가하기 -- ADD
-- ALTER TABLE 테이블명 ADD 컬럼명 자료형(크기) ;

ALTER TABLE 테이블명_LOGIN ADD ADDRESS VARCHAR2(10) ;

SELECT * FROM 테이블명_LOGIN ;

-- 컬럼의 자료형변경하기 - MODIFY
-- ALTER TABLE 테이블명 MODIFY 컬럼명 바꿀 제약조건(길이) ;

ALTER TABLE 테이블명_LOGIN MODIFY ADDRESS VARCHAR2(30) ;

-- 컬럼 이름 변경하기 -RENAME

ALTER TABLE 테이블명_LOGIN RENAME COLUMN ADDRESS TO ADDR ;

-- 특정 컬럼 삭제하기 - DROP
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명 ;

ALTER TABLE 테이블명_LOGIN DROP COLUMN ADDR ;

SELECT * FROM 테이블명_LOGIN ;

-- 테이블의 이름 변경하기 - RENAME
-- RENAME 기존테이블 명 TO 바꿀 테이블 명
RENAME 테이블명_LOGIN TO LOGIN_TABLE ;

-- 테이블 삭제
-- DROP TABLE 테이블 이름 ;

-- TEST_수강생정보 테이블 삭제
DROP TABLE TEST_수강생정보 ;

-- TRUNCATE : 테이블의 데이터를 영구 삭제
-- TRUNCATE TABLE 테이블 명 ;

-- 테이블 복사
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표 ;
-- 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문
-- 제약조건까지는 복사가 되지 않는다.

SELECT * FROM DROP_성적표 ;

TRUNCATE TABLE DROP_성적표 ;

CREATE TABLE MEMBER_JOIN (
    MEMBER_ID VARCHAR2(20) PRIMARY KEY,
    MEMBER_PW VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10) NOT NULL,
    MEMBER_DATE DATE,
    MEMBER_AGE NUMBER(3),
    MEMBER_TEL VARCHAR2(20),
    MEMBER_EMAIL VARCHAR2(50) UNIQUE
) ;


CREATE TABLE MEMBER_JOIN (
    MEMBER_ID VARCHAR2(20),
    MEMBER_PW VARCHAR2(20),
    MEMBER_NAME VARCHAR2(10),
    MEMBER_DATE DATE,
    MEMBER_AGE NUMBER(3),
    MEMBER_TEL VARCHAR2(20),
    MEMBER_EMAIL VARCHAR2(50),
    
    CONSTRAINT MEMBER_PK PRIMARY KEY(MEMBER_ID),
    CONSTRAINT NOT_NULL_PW CHECK(MEMBER_PW IS NOT NULL),
    CONSTRAINT NOT_NULL_NAME CHECK(MEMBER_NAME IS NOT NULL),
    CONSTRAINT MEMBER_UK UNIQUE(MEMBER_EMAIL)

);

DROP TABLE MEMBER_JOIN ;
