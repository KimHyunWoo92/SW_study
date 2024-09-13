-- CHAPTER 01. SELECT --

-- �ּ���ȣ

-- ����ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ����� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�

-- �ּ�����(2) : /**/ �������� �ѹ��� �ּ�ó�� ����

/*
1. SQL ���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �ݵ�� ����Ŭ��(;)�� �������Ѵ�.
4. SQL ���� ����� : CTRL+ENTER, F9
*/

DESC EMPLOYEES ;
-- DESC��(DESCRIBE): SQL���� ���Ǵ� �����ͺ��̽� ���̺� ������ Ȯ���ϴ� ��ɾ�

SELECT FIRST_NAME FROM EMPLOYEES ;
-- select first_name from employees ;
-- SQL������ ��ҹ��� ���о��� �ν��� ����������, �빮�ڸ� ���°��� �������̴�.

SELECT FIRST_NAME
  FROM EMPLOYEES ;
 
/* 
- [SELECT �� �⺻ ����]

- 2.SELECT ��ȸ�� �÷���1,....
- 1.FROM   ��ȸ�� ���̺��1,....


- ��ü��ȸ
- * (�ƽ�Ÿ����ũ) -> ��ü�� �ǹ� / SELECT���� ���
*/

-- �������̺��� ��ü ������ ���

SELECT *
  FROM EMPLOYEES ;

-- �μ������̺��� ��ü ������ ���
SELECT *
  FROM DEPARTMENTS ;
  
-- �ǽ�) �������̺��� ����ID, ������ ���� �̸��� ������ ���

SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
  FROM EMPLOYEES ;
  
  
-- �ǽ�) �μ����̺��� �μ�ID, �μ���, ��ġID ���

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS ;

-- �ǽ�) �������̺��� FIRST_NAME, ����ID, �޿�, �Ŵ���ID ���

SELECT FIRST_NAME, EMPLOYEE_ID, SALARY, MANAGER_ID
  FROM EMPLOYEES ;
  
SELECT JOB_ID
  FROM EMPLOYEES ;
  
/*
-- [������ �ߺ� ����]
- DISTINCT : ������ �ߺ� ����

- DISTINCT �����
- SELECT   DISTINCT ��ȸ�� �÷���1,....
- FROM     ��ȸ�� ���̺��

*/

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
-- �ǽ�) �������̺��� �Ի��� �ߺ������Ͽ� ���

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
  
-- �ǽ�) �������̺��� JOB_ID�� �μ�ID�� �ߺ� �����Ͽ� ���

SELECT * FROM EMPLOYEES ;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

-- ���� �÷��� �ߺ��� �־ �ٸ��� �÷��� ���� �ٸ��� ���� �ٸ��� ����Ѵ�.

-- �ǽ�) �������̺��� �����̸��� �޿��� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES ;
  
-- TIP 1
-- �÷��� ���� ������ �����մϴ�. (+, -, *, /)

-- �������̺��� ������ �̸��� �޿���, ������ ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY, SALARY*12
  FROM EMPLOYEES ;

/*  
-- [�÷��� ��Ī ��� ���]
- Alias ��� �ϸ� �Ѵ��� ���� ���� �����ϴ� ��
- As Ű���带 ����Ͽ� ��Ī�� �����մϴ�.

- 1. SELECT �÷� ��Ī
- 2. SELECT �÷� "��Ī"
- 3. SELECT �÷� As ��Ī
- 4. SELECT �÷� As "��Ī"

*/
SELECT FIRST_NAME, SALARY*12 ����
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 "����"
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 AS ����
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY*12 AS "����"
  FROM EMPLOYEES ;
  
  
-- �ǽ�) �������̺��� �Ի���, �Ի��� �������� ���
-- ��, �Ի����� ��Ī�� "�Ի���"��, �Ի��ϴ������� ��Ī�� "�Ի��ϴ�����" ����ؼ� ���

SELECT * FROM EMPLOYEES ;

SELECT HIRE_DATE AS "�Ի���",
       HIRE_DATE+1 AS "�Ի��ϴ�����"
  FROM EMPLOYEES ;

/* ORDER BY
- Ư�� �÷��� �������� ���ĵ� ���·� ����ϴµ� ���.
- SQL������ �⺻������ ������������ ����.
- SQL ����������� ���� �������� ����ȴ�.
- ASC : �������� ���� (1,2,3,4...)
- DESC : �������� ���� (....,4,3,2,1)
*/

-- �ǽ�) �������̺��� ��� ������ ������ �޿� �������� �������� �����Ͽ� ���

SELECT * FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY DESC ;

-- �ǽ�) �������̺��� �ֱٿ� �Ի��� ��¥�� �������� ������ FIRST_NAME�� ������ HIRE_DATE�� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- �ǽ�) �������̺��� ����ID,�μ�ID,FIRST_NAME,������ �޿� ������ ���
-- ��,�μ�ID�� ��������, �޿��� ������������ ���

SELECT * FROM EMPLOYEES ;


SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;

-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������� ���.

/* [NULL]
- NULL ���̶� �������� ���� ������ ��� �ִ� ���¸� ���մϴ�.
- ���� �������� �ʰų� �������� ���� ���� �ǹ��մϵ�.
- ���� 0�� ���ڿ� ''�� NULL���� �ƴմϴ�.
- NULL�� ������ �ϸ� ��� ���� ������ NULL���� ���´�.
- NULL�� �񱳸� �ϸ� ������ FALSE ���� ���´�.
*/

-- �ǽ�) �������̺��� ����ID, ���ʽ�, ���ʽ� �ι��� ������ ���
-- ��, ���ʽ��ι��� ������ "UP_BONUS"�� ��Ī�� ����Ͽ� ���

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES ;

-- �ǽ�) ����1���� UP_BONUS�� ��� ���� Ȯ���Ͽ� �� �׷��� ��� ���� ���Դ��� ����
-- COMMISSION_PCT ���� NULL�̸� UP_BONUS�� ���� ������ NULL�̴�.







