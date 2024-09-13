-- CHAPTER 02. WHERE�� --

/*
-- WHERE �� �⺻����
- 3.SELECT ��ȸ�� �÷���,...
- 1.  FROM ��ȸ�� ���̺��,
- 2. WHERE ��ȸ�� ���� �����ϱ� ���� ���ǽ�

*/


-- �ǽ�)�������̺��� ���� ID�� 105�� ������ FIRST_NAME�� LAST_NAME ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- �ǽ�) �μ� ���̺��� �Ŵ��� ���̵� 100�� �μ� �̸��� �μ����̵� �̤���

SELECT * FROM DEPARTMENTS ;

SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 -- �ǽ�) �������̺��� �޿��� 9000�� ������ ����ID�� FIRST_NAME,�޿� ���
 
SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY = 9000 ;
 
-- ��������� (+, -, *, /)

SELECT SALARY, SALARY-2
  FROM EMPLOYEES ;
  
-- �񱳿����� ( >, >=, <, <=)


-- �ǽ�) �������̺��� �޿��� 5000������ ������ FIRST_NAME �� �޿������� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000 ;


-- �ǽ�) �������̺��� ������ 50000������ �������� �̸�(FIRST_NAME)�� ������ ���
-- ������ 'AnnSal' �̶�� ��Ī�� ��� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000;
 

/*
-- � �� ������
- = : ����
- !=, <> , ^= : ���� �ʴ�.
- NOT A=B : ���� �ʴ�.
*/

-- �ǽ�) �������̺��� �������̵� IT_PROG�� �ƴ� ������ FIRST_NAME�� ����ID ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES 
 WHERE JOB_ID != 'IT_PROG' ;
 
 
-- �ǽ�) �������̺��� EMAIL ������ SKING�� ������ ��� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;
 
-- �ǽ�) �������̺��� EMAIL ������ SKING�� �ƴ� ������ ��� ���� ���

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL != 'SKING' ;
 
/*
-- �� ������ > �ΰ��̻��� ������ ����
- AND : ������ ��� �����ϴ� ��� TRUE�� ��ȯ
- OR : �ϳ��� �����̶� �����ϴ� ��� TRUE�� ��ȯ
*/

-- �ǽ�) �������̺��� �μ����̵� 90�̰�, �޿��� 5000�̻��� ������ID�� ���� �̸��� ���

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 AND SALARY >= 5000 ;
 
-- �ǽ�) �������̺��� �μ����̵� 100�̰ų� �Ի��� 06�� 02�� 02�� ���Ŀ� �Ի��� ������ �������

SELECT * FROM EMPLOYEES ;

DESC EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02' ;
 
-- �ǽ�) �������̺��� �μ�ID�� 100�̰ų� 90�� �����߿���
-- ����ID�� 101�� ������ ����ID, �̸�, ������ ���, ������ "����" ��Ī ����

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "����"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ; 
 
-- ������ ������ ���� ������� �޶�����.(AND �����ڰ� OR ���� �켱������ ����)

/*
-- [NULL���� ������]
- IS NULL : ������ ���� NULL�� ���� ��ȸ
- NOT NULL : ������ ���� NULL�� �ƴѰ��� ��ȸ
*/

-- �ǽ�) �������̺��� ���ʽ��� �ִ� ������ FIRST_NAME, ���ʽ� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;
 
-- �ǽ�) �������̺��� �Ŵ��� ���̵� ���������� �̸���?

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL ;
 
 /*
 -- [SQL ������] : SQL���� ����� �� �ִ� ������
 - IN : Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ��
    =(����)+OR(��������)�� �Բ� ���� ����� ��´�.
    NULL���� �����ϴ� Ư���� ������ �ִ�.
    
 - BETWEEN :
 - LIKE :
 
 */

-- �ǽ�) �������̺��� �μ����̵� 30�̰ų� 50�̰ų� 90�� ������ ��� ������ ���
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 ;
    
-- IN ������ Ȱ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90) ;
 
-- NOT IN ������ Ȱ��
-- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- !=(��񱳿�����) + AND(��������)
-- NULL���� ����ϰ� �Ǹ�, �����Ͱ� ����� �ȵǴ� ������ �߻�

-- �ǽ�) �������̺��� �Ŵ������̵� 100,120,121�� �ƴ� �������� �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME,MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 ;


SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100,120,121) ;
 
-- �ǽ�) �������̺��� �������̵� AD_VP�̰ų� ST_MAN�� ������ �̸��� �������̵� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID = 'AD_VP'
    OR JOB_ID = 'ST_MAN' ;
    
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP','ST_MAN') ;
 
 
-- �ǽ�) �������̺��� �Ŵ������̵� 145, 147, 148, 149�� �ƴ� ������ �̸��� �Ŵ������̵� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 145
   AND MANAGER_ID != 146
   AND MANAGER_ID != 147
   AND MANAGER_ID != 148
   AND MANAGER_ID != 149 ;


SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145,146,147,148,149) ;
 
/*
-- [BETWEEN ������]
- ���� ���� ���� �����͸� ��ȸ�� �� ���
EX)
SELECT
  FROM
 WHERE �÷��� BETWEEN �ּҰ�(A) AND �ִ밪(B) ;
*/

-- �ǽ�) �������̺��� �޿��� 10000�̻� 20000������ ������ �̸��� �޿��� ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ;
 
-- �ǽ�) �������̺��� 2005�⿡ �Ի��� �������� �̸��� �Ի��� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;

/*
-- ���ϵ�ī�� % ����
�÷� LIKE '%����' > �ش� ���ڷ� ������ ��� ������ �˻�
EX
COMPANY LIKE '%���߿�' > ���߿����� ������ ��� ������ ���

*/

-- �ǽ�) �������̺��� 650���� �����ϴ� �ڵ��� ��ȣ�� ã��

SELECT * FROM EMPLOYEES ;

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%' ;
 
-- �ǽ�) �������̺��� FIRST_NAME�� S�� �����ϰ� N���� ������ ������ �̸� ã��

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
-- �ǽ�) �������̺��� �̸��� it���� ������ �� 4������ ������ �̸��� ã��

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it' ;
 
-- �ǽ�) �������̺��� �ι�° ���ڰ� e�� ������ �̸� ã��

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%' ;
 
-- �ǽ�) �������̺��� 01���� �Ի��� ������ ��� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%' ;

/*

������ �Լ�
- �������Լ� : ���� �����͸� �����ϴ� �Լ�
- ������ �Լ� : ���� �����͸� �����ϰ� ��ġ�� �����ϴ� �Լ�
- ��¥�� �Լ� : ��¥ �����͸� �ٷ�� �Լ�
- ��ȯ�� �Լ� : �ڷ����� ��ȯ�ϴ� �Լ�
- NULL �Լ� : NULLó�� �Լ�
- ���� �Լ� : ��Ȳ�� ���� �ٸ� �����ʹ� ��ȯ�ϴ� �Լ�

*/



 
 
 
 







