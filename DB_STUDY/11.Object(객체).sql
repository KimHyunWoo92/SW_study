/*
-- ��ü?
- �����ͺ��̽� ���� �����ϴ� ������ ���� ����

-- View ��?
-- �ϳ� �̻��� ���̺��� ���� ������ ���� ��������� ������ ���̺�

-- ������
- ���� : ���� ����ϴ� SELECT ������ �����ϱ� ���ؼ� ���.
- ���ȼ� : ���̺��� Ư�� �����͸� ���� ��Ű�� �ʱ� ���ؼ� ���.

-- �� ���� ���
-- CREATE VIEW �� �̸�(�ʼ�)
-- AS ������ SELECT�� (�ʼ�)

-- �� ���� ���
-- DROP VIEW �� �̸�

*/

SELECT * FROM EMPLOYEES ;

-- �������� ���� (����ID, �̸�, �̸���, �������̵�, �޿�)

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100 ;
 
-- �� ���� ���
-- CREATE VIEW �� �̸�(�ʼ�)
-- AS ������ SELECT�� (�ʼ�)

CREATE VIEW VIEW_EMP100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100 ;

SELECT * FROM VIEW_EMP100 ;

/*
-- ��������?
- Ư�� ��Ģ�� ���� ���� ���ڸ� �����ϴ� '��ü'
- ��� ����ǥ ó�� ��� ���� ��ȣ�� ������ִ� ����
- �ַ� PK �÷����� ������ ���� ���鶧 ���

-- ������ ��� ���
-- ������ �̸�.CURRVAL ������ ���� ��ȣ ��ȯ
-- ������ �̸�.NEXTVAL ���� ��ȣ ��ȯ

*/

CREATE TABLE DB_SEQUENCE (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(10),
    CLASS   VARCHAR2(50)
) ;

SELECT * FROM DB_SEQUENCE ;

-- ������ ����

CREATE SEQUENCE SEQ_DB_SEQUENCE_HYUN
    INCREMENT BY 1 -- 1�� �����ϰڴ�.
    START WITH 10 -- ���۹�ȣ�� 10���� �����ϰڴ�.
    MAXVALUE 20 -- 20������ ��ȣ�� �ްڴ�.
    -- ȸ���� 10�� �ްڴ�.
    MINVALUE 0
    NOCYCLE ; -- 20���� �����ϸ� �ߴ��ϰڴ�.

-- ������ ��ȸ
SELECT * FROM USER_SEQUENCES ;

-- ������ Ȱ���� ����
SELECT * FROM DB_SEQUENCE ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '������','AI�м����񽺸�') ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '������','AI�м����񽺸�') ;

INSERT INTO DB_SEQUENCE (ID, NAME, CLASS)
VALUES (SEQ_DB_SEQUENCE_HYUN.NEXTVAL , '������','AI�м����񽺸�') ;

-- ������ ����
DROP SEQUENCE SEQ_DB_SEQUENCE_HYUN ;







