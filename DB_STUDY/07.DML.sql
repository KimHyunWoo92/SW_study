/*
-- CHAPTER 07. DML(DATA Manipulation Language)

DML�� ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �Ҷ� ����ϴ� ���Ǿ��̴�.

SELECT ������ ��ȸ
INSERT ������ �߰�
UPDATE ������ ����
DELETE ������ ����

INSERT INTO ���̺��(�÷�1, �÷�2,....)

VALUES(��1,��2,....)

INSERT INTO �� �Է��� �÷��� VALUES�� �Է��� ��1, ��2�� 1:1 ���� �Ǳ⶧����, ������
�ڷ����� �°� �Է��ؾ� ��

INSERT INTO ���̺��()

VALUES(�Է°�)
�÷��� �����ϴ� ���, 

-- ����� 1)
--INSERT INTO ���̺� ��(�÷�1, �÷�2,...)
--VALUES (��1,��2,....)

-- ����� 2)
--INSERT INTO
-- VALUES (��,....)
-- Į������Ʈ ������ VALUES�� �Է��� ���� �ش� ���̺��� �÷� ������ �ڷ����� �°� �Է��ؾ���.

*/

--1. MEMBER_JOIN ���̺� ���� ���� �ֱ�

INSERT INTO MEMBER_JOIN (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_DATE,MEMBER_AGE,MEMBER_TEL,MEMBER_EMAIL)
VALUES ('SMHRD01','12345','������',SYSDATE,33,'010-1234-5678','rlagusdn@email.com') ;

SELECT * FROM MEMBER_JOIN ;

--2. MEMBER_JOIN ���̺� ���� ģ���� ������ �ֱ� (��ȭ��ȣ�� �̸����� NULL������ �Է�)
--��������� NULL���� �Է��ϴ� ���
INSERT INTO MEMBER_JOIN(MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_DATE,MEMBER_AGE,MEMBER_TEL,MEMBER_EMAIL)
VALUES ('SMHRD02','23456','������',SYSDATE,30,NULL,'') ;

SELECT * FROM MEMBER_JOIN ;

--3. MEMBER_JOIN���̺� ���� ģ���� ���� �ֱ� (��ȭ��ȣ�� �̸����� NULL������ �Է�)
-- NULL���� �Ͻ������� �Է��ϴ� ���
INSERT INTO MEMBER_JOIN(MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_DATE,MEMBER_AGE)
VALUES ('SMHRD03','34567','���ٻ�',SYSDATE,30) ;

SELECT * FROM MEMBER_JOIN ;



-- [���̺� ������ ���� ����Ʈ ]

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO MEMBER_JOIN (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_DATE, MEMBER_AGE, MEMBER_TEL, MEMBER_EMAIL)
VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');

SELECT * FROM MEMBER_JOIN ; 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO MEMBER_JOIN (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_DATE, MEMBER_AGE, MEMBER_TEL, MEMBER_EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO MEMBER_JOIN (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_DATE, MEMBER_AGE, MEMBER_TEL, MEMBER_EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO MEMBER_JOIN (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_DATE, MEMBER_AGE, MEMBER_TEL, MEMBER_EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO MEMBER_JOIN (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_DATE, MEMBER_AGE, MEMBER_TEL, MEMBER_EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

CREATE TABLE HY_SONGLIST (
    NO      NUMBER(3),
    TITLE   VARCHAR2(20),
    SINGER  VARCHAR2(20),
    GENDER  VARCHAR2(10),
    
    CONSTRAINT NO_PK PRIMARY KEY(NO),
    CONSTRAINT NOT_NULL_TITLE CHECK(TITLE IS NOT NULL),
    CONSTRAINT GENDER_MW CHECK(GENDER = '����' OR GENDER = '����')
) ;

INSERT INTO HY_SONGLIST(NO,TITLE,SINGER,GENDER)
VALUES (1,'���˹���','������','����');

INSERT INTO HY_SONGLIST(NO,TITLE,SINGER,GENDER)
VALUES(2,'RAINDROP','������','����');

INSERT INTO HY_SONGLIST(NO,TITLE,SINGER,GENDER)
VALUES(3,'ĵ��','HOT',NULL) ;

SELECT * FROM HY_SONGLIST ;


-- UNIQUE CONSTRAINT (HR.SYS_C007110)

-- �÷� ����Ʈ�� ���� �ʰ� INSERT�� �ϴ� ���

SELECT * FROM MEMBER_JOIN ;

INSERT INTO MEMBER_JOIN
VALUES ('SMHRD04',22222,'�̸���',SYSDATE,24,'010-2222-2222','ABCE@NAVER.COM') ;

SELECT * FROM MEMBER_JOIN ;


-- UPDATE : ���̺��� �����͸� �����ϰ� ������ ���

-- �����
-- UPDATE ���̺� ��
-- SET ������ �÷� - �����ҵ����� ,...
-- WHERE �����͸� ������ ��� ���� �����ϱ� ���� ���� ;
-- *** WHERE �������� ������ ��� ���̺� �� ���ڿ��� ��� �÷��� �����Ͱ� ������ �ȴ�.

SELECT * FROM MEMBER_JOIN ;

-- �������� ������ ����

UPDATE MEMBER_JOIN
SET MEMBER_AGE = 33
WHERE MEMBER_NAME = '������' ;

UPDATE MEMBER_JOIN
SET MEMBER_TEL = '2345-5678' , MEMBER_EMAIL = 'RANADA@NAVER.COM'
WHERE MEMBER_ID = 'SMHRD02' ;

-- DELETE : �����͸� ������ �� ����ϴ� ��ɾ�

-- �����
-- DELETE FROM ���̺� ��
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
-- *** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� �����ȴ�.

-- 30�� ������ ȸ������ ���� ����

SELECT * FROM MEMBER_JOIN ;

DELETE FROM MEMBER_JOIN
WHERE MEMBER_AGE <= 30 ;

SELECT * FROM MEMBER_JOIN ;



















