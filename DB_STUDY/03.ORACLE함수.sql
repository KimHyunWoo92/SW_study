-- CHAPTER 03.ORACLE �Լ� --

/*
- �Լ���?
Ư���� �Է°�(INPUT)�� �־� Ư���� ����� ���� ��� ��(OUTPUT)�� ���

- ����� �����Լ� : ����ڰ� �ʿ信 ���ؼ� ���� ������ �Լ�
- ���� �Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��Ҷ����� ȣ���ؼ� ���.
--> ������, ������, ��¥��, ��ȯ��, NULL�����Լ�, �����Լ��� �ִ�.

- �Լ�() > �Լ��� �����Ҷ� ����ϴ� �Է°��� "�Ű�����", "���ڰ�"�̶�� ǥ��.

- [������ �Լ�]
- UPPER(DATA) : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���.
- LOWER(DATA) : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���.

*/

SELECT UPPER('abcde1234@@')
  FROM DUAL ;
  
-- DUAL ���̺��̶�?
--> ����Ŭ �ְ������ SYS������ ���̺�
--> �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺�


-- �ǽ�) �������̺��� ������ FIRST_NAME�� EMAIL�� ���
-- FIRST_NAME�� �빮��, EMAIL�� �ҹ��ڷ� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES ;
  
-- LENGTH(DATA) : ��ȣ �� ���� �������� ���̸� ���ϴ� �Լ�

SELECT 'HELLO WORLD'
  FROM DUAL ;
  
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;
  
-- �ǽ�) �������̺��� ������ FIRST_NAME�� FIRST_NAME�� ���̸� ���

SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES ;
  
-- �ǽ�) ������ FIRST_NAME�� ���̰� 5�̻��� �������� ���� ID�� �̸��� ���

SELECT * FROM EMPLOYEES ;

SELECT LENGTH(FIRST_NAME),EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 5 ;
  
-- SUBSTR : ���ڿ��� �����ϴ� �Լ�
-- 1. SUBSTR(INPUT, START_POINT, LENGTH): ���ڿ� �������� ������ġ���� ������̸�ŭ ���.
-- 2. SUBSTR(INPUT, START_POINT) : ���ڿ��� ������ġ���� ���ڿ����������� ���

SELECT SUBSTR('����Ʈ���簳�߿�',1,3) AS ����Ʈ,
       SUBSTR('����Ʈ���簳�߿�',4) AS ���簳�߿�
  FROM DUAL ;
  

-- �ǽ�) �������̺��� �Ի糯¥, ����, ��, �� ���� ���
-- �� �÷����� ����, ��, �Ϻ��� ��Ī�� ����ؼ� ���

SELECT * FROM EMPLOYEES ;

SELECT SUBSTR(HIRE_DATE,1,2) AS ����
     , SUBSTR(HIRE_DATE,4,2) AS ��
     , SUBSTR(HIRE_DATE,7) AS �Ͽ�
  FROM EMPLOYEES ;
  

-- �ǽ�) DUAL ���̺��� �̿��ؼ� 'https://smhrd.or.kr'�� ���ڿ��� �Է¹޾�
--      smhrd ���ڿ��� �߶� ���

SELECT SUBSTR('https://smhrd.or.kr',9,5)
  FROM DUAL ;

-- REPLACE : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ��ִ� �Լ�
-- 1. REPLACE(DATA,�ٲٰ���� ����,�ٲ���� ����)
-- 2. RAPLACE(DATA,�ٲٰ���� ����)

-- > �ٲ���� ���� ������, �ٲٰ� ���� ���ڸ� ���ڿ� �����Ϳ��� ������ �ȴ�.

SELECT ('����Ʈ##���簳�߿�')
     , REPLACE('����Ʈ##���簳�߿�','#','-')
     , REPLACE('����Ʈ##���簳�߿�','#') AS ����
  FROM DUAL ;
  
-- �ǽ�) �������̺��� �Ի糯¥�� ����ϵ�,
-- /(������)�� ���������� �ٲ㼭 ����ϰ�, /(������)������ ���.

SELECT HIRE_DATE
     , REPLACE(HIRE_DATE,'/','-') AS ������
     , REPLACE(HIRE_DATE,'/') AS ����
  FROM EMPLOYEES ;
  
  
-- CONCAT : �� ���ڿ� �����͸� ��ġ�� �Լ�
-- �Ű������� 1���� �� �� �ְ�, 2���� ���ڿ��� ��ġ�� �Լ��̴�.
-- �ռ������� "||"�� �̿��ϸ� ���Ѵ�� ���ڿ� ������ �����ϴ�.

SELECT CONCAT('����Ʈ','���簳�߿�') || ' �ְ���'
  FROM DUAL ;
  

-- �ǽ�) �������̺��� ������ FIRST_NAME�� ����ϰ� FIRST_NAME �ڿ� '�̸���'�̶�� ���ڿ��� ���ĺ�����!

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, CONCAT('�̸���',FIRST_NAME) || ' �Դϴ�.' AS �Ұ�
  FROM EMPLOYEES ;


-- TRIM : �Է� ���� ������ �������� �� ���� ������ �����Ѵ�.

SELECT '      �������� �ְ� �Դϴ�.     '
  FROM DUAL ;

SELECT TRIM('      �������� �ְ� �Դϴ�.     ')
     , REPLACE(TRIM('      ��      ����  �� ��   �� ��      �ϴ�.     '),' ')
     , REPLACE('      ��      ����  �� ��   �� ��      �ϴ�.     ',' ')
     , REPLACE('      �������� �ְ� �Դϴ�.     ',' ')
  FROM DUAL ;

/*
-- [������ �Լ�]
-- ROUND : Ư�� ��ġ���� �ݿø� �ϴ� �Լ�
1. ROUND(DATA,�ݿø� ��ġ)
2. ROUND(DATA) : �ݿø� ��ġ ������, �Ҽ��� ù° �ڸ����� �ݿø� ���� DEFAULT

-- TRUNC : Ư�� ��ġ���� ������ �Լ�
1. TRUNC(DATA,��������ġ)
2. TRUNC(DATA) : ������ ��ġ ������, �Ҽ��� ù��° �ڸ����� ���� ���� DEFAULT

*/


SELECT ROUND(1234.5678,1)
     , ROUND(1234.5678,3)
     , ROUND(1234.5678)
  FROM DUAL ;

SELECT TRUNC(1234.5678,1)
     , TRUNC(1234.5678,4)
     , TRUNC(1234.5678)
  FROM DUAL ;


-- MOD : ���ڸ� ���� �������� ���� ���ϴ� �Լ�
-- Ȧ��, ¦���� ������ �� �����ϰ� ����Ѵ�.
-- MOD(DATA, ��������)

SELECT MOD(10,2)
  FROM DUAL ;
  
SELECT MOD(10,3)
  FROM DUAL ;


-- [��¥�� �Լ�]
-- �Է½� �ٷ� ��µǸ�, ����ð��� �� �������� ����� �����ϴ�.
-- ��¥�� �����ʹ� ������ �����ϴ�.

SELECT SYSDATE
  FROM DUAL ;

-- ��¥ ���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "����"
     , SYSDATE -1 "����"
     , SYSDATE +1 "����"
  FROM DUAL ;

  
-- ��¥ ������ Ȱ��(�ǹ�)
SELECT SYSDATE AS ����
     , SYSDATE +1 AS �Ϸ����
     , SYSDATE +1/24 AS �ѽð�����
     , SYSDATE +1/24/60 AS �Ϻд���
     , SYSDATE +1/24/60/60 AS ���ʴ���
--     , SYSDATE + SYSDATE --> ��¥ �����ͳ����� ���� �Ұ�
  FROM DUAL ;
  
  
-- ADD_MONTHS : ��� ���� ��¥�� ���ϴ� �Լ�
-- ADD_MONTHS(��¥������, ���ϰų� �� ������)

SELECT SYSDATE AS ����
     , ADD_MONTHS(SYSDATE, +1) AS "1���� ��"
     , ADD_MONTHS(SYSDATE, -1) AS "1���� ��"
  FROM DUAL ;
  
-- [��ȯ�� �Լ�]
-- ����ȯ ������ ����
-- �ӽ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��
-- ����� ����ȯ : ������ ��ȯ�� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ� ��

-- TO_CHAR : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ���ִ� �Լ�
-- TO_CHAR(��ȯ������, ��� ����)

SELECT SALARY AS �޿�����
  FROM EMPLOYEES ;
  
SELECT TO_CHAR(SALARY,'L999,999')
  FROM EMPLOYEES ;
  
-- �ǽ�) DUAL ���̺��� �̿��ؼ� ���� ��¥ ���¸� 'YY/MM/DD/DAY'���·� ��ȯ

SELECT TO_CHAR(SYSDATE,'YY/MM/DD/DAY')
  FROM DUAL ;

-- TO_NUMBER : ���� �����͸� ���� �����ͷ� ��ȯ �ϴ� �Լ�
-- TO_NUMBER(���ڿ� ������, �ν� �� ���� ����)

SELECT TO_NUMBER('1,000','9999')
  FROM DUAL ;

-- TO_DATE : ���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
-- TO_DATE(���ڿ�������, �ν� �� ��¥ ����)

SELECT TO_DATE('2024.0408','YYYY/MM/DD')
  FROM DUAL ;

-- NVL (NULL���� ���θ� �˻��� ������, ���� �����Ͱ� NULL�� �ƴ� ��� ��ȯ�ҵ�����, �� �����Ͱ� NULL�� ��� ��ȯ �� ������)
-- �ּҰ� NULL�� �ƴѰ��� '�ۼ��Ϸ�'�� ���
-- �ּҰ� NULL�� ���� '�ּ� �̱���' �� ���

-- [NULL ó�� �Լ� ]
-- NVL / NVL2 : NULL ���� ��ü �� �� �ִ� �Լ�
-- 1. NVL(NULL���� �˻��� ������, NULL�� ��� ��ȯ�� ������)
-- 2. NVL2(NULL���� ���θ� �˻��� ������
--        ,<1>�� NULL�� �ƴ� ��� ��ȯ�� ������ <2>
--        ,<2>�� NULL�� ��� ��ȯ�� ������<3>

-- �ǽ�) �������̺��� ���ʽ��� NULL�� ��� ���� 0���� ��ü�ؼ� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES ;

-- �ǽ�) �������̺��� ����_ID�� FIRST_NAME, MANAGER_ID ���
-- MANAGER_ID�� ������ �������� ���, ������ ��ǥ�� ���

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID,'����','��ǥ')
  FROM EMPLOYEES ;

-- [ �����Լ� ]
-- DECODE : ��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ�
-- �˻���� ���ؼ� ������ ���� ��ȯ

-- DECODE(�˻����̵� �÷� �Ǵ� ������<1>,�񱳰�<2>,��ġ �� ��ȯ�� ��<3>,��ġ���� ������ ��ȯ��<4>)

-- �ǽ�) �������̺��� ����ID, FIRST_NAME, MANAGER_ID�� ���(DECODE �Լ���)

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(MANAGER_ID,NULL,'��ǥ','����')
  FROM EMPLOYEES ;
  
  











