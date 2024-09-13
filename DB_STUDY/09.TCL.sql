/*
-- CHAPTER 09. TCL(Transaction Control Language)

트랜잭션이란?
-- 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행 단위.
Automicity(원자성) : ALL OR NOTING, 모두 실행되거나 전혀 실행되지 않거나.
Consistency(일관성) : 언제나 일관성있는 상태로 유지하는 것
Isolation(고립성) : 트랜잭션 실행 시 다른 트랜잭션의 영향을 받지 않는 것
Durability(지속성) : 성공적으로 수행된 트랜잭션은 영원히 반영되는 것.

-- TCL 명령어
-- COMMMIT   : DB에 영구적으로 저장, 마지막 COMMIT 시점 이후의 트랜적션 결과를 저장
-- ROLLBACK  : 트랜잭션을 취소, 마지막 COMMIT 시점까지만 복구
-- SAVEPOINT : 하나의 트랜잭션을 작게 분할하여 저장하는 기능을 수행하는 명령어

예시)
-- A계좌에서 B계좌로 100만원을 보내는 송금 과정.
-- A계좌에서 잔액이 100만원 이상인지 확인
SELECT 잔액 FROM 계좌정보 WHERE 계좌번호 = 'A계좌' AND 잔액 >= 1,000,000 ;

-- A계좌의 잔액에서 100만원 차감
UPDATE 계좌정보 SET 잔액 = 잔액 - 1,000,000 WHERE 계좌번호 = 'A계좌';

-- B계좌 잔액에서 100만원 더함.
UPDATE 계좌정보 SET 잔액 = 잔액 + 1,000,000 WHERE 계좌번호 = 'B계좌';

-- 변경사항 영구 반영
COMMIT ;

*/

CREATE TABLE TCL_수강생정보 AS SELECT * FROM 수강생정보 ;

SELECT * FROM TCL_수강생정보 ;

INSERT INTO TCL_수강생정보 (학생ID,학생이름,소속반)
VALUES ('SMHRD10','김현우','D');

ROLLBACK ;

SELECT * FROM TCL_수강생정보 ;

COMMIT ;

ROLLBACK ;

SELECT * FROM TCL_수강생정보 ;


-- 세션
-- 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후
-- 접속을 종료하기까지의 전체 기간을 의미
-- 즉 세션이 여러 개 있다는 것은 오라클 데이터베이스에 접속하여 사용중인 연결이
-- 여러개 있다는 뜻이다.

-- 1. 세션 > SQL DEVELOPER
-- 2. 세션 > SQL COMMAND LINE

-- 읽기 일관성이란?
-- 트랜잭션이 완료되기 전까지 데이터를 직접 조작하는 세션 외에
-- 다른 세션에서는 데이터 조작 전 상태의 데이터만 조회 가능
-- 즉 확정된 데이터만 검색이 된다라는 것이 읽기 읽관성을 보장한다 라고 합니다.

SELECT * FROM TCL_수강생정보 ;

DELETE FROM TCL_수강생정보
WHERE 학생이름 = '김현우' ;

SELECT * FROM TCL_수강생정보 ;

-- LOCK 란?
-- 트랜잭션에서 조작중인 데이터는 트랜잭션이 완료(COMMIT, ROLLBACK) 되기 전까지는
-- 다른 세션에서는 해당 데이터를 조작할 수 없는 상태
-- 즉 둘 이상의 세션이 같은 행을 조작하려고 할 때 출돌하는 현상

















