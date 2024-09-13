/*
-- CHAPTER 06. DDL(DATA Definition Language --
- DDL�̶�?
- ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����մϴ�.

- [DDL ��ɾ� ����]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺� �ȿ� �ִ� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺� ���� ��ü�� �����ϴ� ��ɾ�

-- ���̺� ������ ���� ����ϴ� �ڷ���
-- VARCHAR2(N)  : ������ ������, Nũ�⸸ŭ �Է� ����
-- NUMBER(P, S) : ������ ���� P�ڸ���ŭ �Է¹ް�, S�ڸ���ŭ �Ҽ��� �Է� ����
-- ����Ŭ �����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� �����Ѵ�.
- ��Ȱȣ�� �����ϰ� �Ǹ� �ִ밪�� 38 ũ�Ⱑ ��.
- DATE : ���� ��¥ ���� �Է¹���

- ������ ���� ���̺��� Ȯ���ؼ� TEST_���������� ���̺� �� ������
-- ���̺�� �巡�� �� ������ SHIFT+F4�� ������

*/���̺�


CREATE TABLE TEST_���������� (
    �л�ID VARCHAR2(9),
    �л��̸� VARCHAR2(50),
    �Ҽӹ� VARCHAR2(5)
) ;

SELECT * FROM TEST_���������� ;


-- �ǽ�) ����ǥ ���̺��� Ȯ���ؼ� TEST_����ǥ ���̺��� ����

CREATE TABLE TEST_����ǥ (
    �л�ID VARCHAR2(9) ,
    ����   VARCHAR2(30) ,
    ����   NUMBER
) ;


-- �ǽ�) ���̺� �̸��� ���̺��_LOGIN ���� ����
-- �α��� ����� �ϱ����ؼ� ���̵�, ��й�ȣ, �̸���, �̸� ������ ���� �����Դϴ�.

CREATE TABLE ���̺��_LOGIN (
    ID      VARCHAR2(20),
    PW      VARCHAR2(20),
    EMAIL   VARCHAR2(20),
    NAME    VARCHAR2(20)
) ;


-- �������� : ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
-- > �������� ��Ȯ���� �����ϱ� ���� �������� ����
-- > ���� ���� ������Ŀ� ���� �������� �����̳� ���� ���ο� ������ ����.

-- [ �������� ���� ]
-- PRIMARY KEY (PK) : �⺻Ű, NOT NULL + UNIQUE -> NULL�Ұ� + �ߺ� �Ұ�
-- UNIQUE KEY (UK)  : ����Ű, NULL�� �Է� ���� ��, �ߺ��� �Ұ�!
-- NOT NULL         : NULL�� �Ұ���, �� �ԷµǾ�� �ϴ� �����Ϳ��� ����
-- CHECK            : T OR F�� �� �� �� �ִ� ������ ����, ������ �����͸� �Է� ����
-- FOREGIN KEY (FK) : �ܷ�Ű, ���̺��� �����ϴ� Ű

-- ������ ���Ἲ�̶�?
-- > �����Ϳ� ������ ���� ���¸� �ǹ�, �� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����

-- ���Ἲ ���������� ����
-- ��ü ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
-- ���� ���Ἲ(FK) : ���� �Է�, ����, ���� �Ҷ� �����Ǵ� �ٸ� ���̺���� �����Ͱ� ��Ȯ�ϰ� ���� �ǵ��� ����
-- > ���� ���迡 �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ �ϴ°�

-- [ �̹� ������ ���̺� ���������� �����ϱ� ]
-- �����
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������Ǹ� ��������(�÷�) ;

SELECT * FROM ���̺��_LOGIN ;

-- ���̺� PK �������� �����ϱ�

ALTER TABLE ���̺��_LOGIN ADD CONSTRAINT ID_PK PRIMARY KEY(ID);

-- ���̺� UK ���������� �����ϱ�
-- EMAIL Į���� UK�� ���� > �������� �̸�

ALTER TABLE ���̺��_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL) ;

-- ���̺� CHECK ���� ���� ����
-- PW(��й�ȣ)�� 3���� �̻� ������ �� �ֵ��� ����

ALTER TABLE ���̺��_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW)>=3) ;

-- ���̺� FK ���������� ����
-- �����
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������� �̸� FOREIGN KEY(�÷�)
-- REFERENCES �������̺�(�����÷���)

-- TEST_����ǥ ���̺��� ���������� ���̺� �ִ� �л�ID��� �÷��� �����ؼ� FK�� ����

ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES ����������(�л�ID) ;

-- �������� �����ϱ�
-- �����
-- ALTER TABLE ���̺� �� MODIFY �÷��� �ٲ� �������� ;

SELECT * FROM ���̺��_LOGIN ;

ALTER TABLE ���̺��_LOGIN MODIFY NAME NOT NULL ;

-- �������� �����ϱ�
-- �����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸� ;

ALTER TABLE ���̺��_LOGIN DROP CONSTRAINT PW_CHECK ;


CREATE TABLE TB_TEST1 (
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ)>5 )

) ;

CREATE TABLE TB_TEST2 (
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY(PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
) ;


-- ���̺� �÷� �߰��ϱ� -- ADD
-- ALTER TABLE ���̺�� ADD �÷��� �ڷ���(ũ��) ;

ALTER TABLE ���̺��_LOGIN ADD ADDRESS VARCHAR2(10) ;

SELECT * FROM ���̺��_LOGIN ;

-- �÷��� �ڷ��������ϱ� - MODIFY
-- ALTER TABLE ���̺�� MODIFY �÷��� �ٲ� ��������(����) ;

ALTER TABLE ���̺��_LOGIN MODIFY ADDRESS VARCHAR2(30) ;

-- �÷� �̸� �����ϱ� -RENAME

ALTER TABLE ���̺��_LOGIN RENAME COLUMN ADDRESS TO ADDR ;

-- Ư�� �÷� �����ϱ� - DROP
-- ALTER TABLE ���̺�� DROP COLUMN �÷��� ;

ALTER TABLE ���̺��_LOGIN DROP COLUMN ADDR ;

SELECT * FROM ���̺��_LOGIN ;

-- ���̺��� �̸� �����ϱ� - RENAME
-- RENAME �������̺� �� TO �ٲ� ���̺� ��
RENAME ���̺��_LOGIN TO LOGIN_TABLE ;

-- ���̺� ����
-- DROP TABLE ���̺� �̸� ;

-- TEST_���������� ���̺� ����
DROP TABLE TEST_���������� ;

-- TRUNCATE : ���̺��� �����͸� ���� ����
-- TRUNCATE TABLE ���̺� �� ;

-- ���̺� ����
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ ;
-- ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� ������
-- �������Ǳ����� ���簡 ���� �ʴ´�.

SELECT * FROM DROP_����ǥ ;

TRUNCATE TABLE DROP_����ǥ ;

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
