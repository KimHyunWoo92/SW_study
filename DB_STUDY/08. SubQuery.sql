/*
-- CHAPTER 08. SUB QUERY
���� ���� �ȿ�, ���� ������ ����
���� ���� : ���� ������ ������� ����Ͽ� ����� �����ϴ� ����
���� ���� : ���� ������ ���ǽĿ� ���� ���� �ǹ�


*/

-- �ǽ�) �������̺��� FIRST_NAME�� Jack��� ������ �޿����� ���� ������ first_name�� �޿� ���

SELECT * FROM EMPLOYEES ;

-- 1. ���̺��� ������ Ȯ����
-- 2. ������ ������ �Ǵ� jack�� �޿������� Ȯ��
-- 3. 2�� ������� ������ �������� ���ؼ� ������� ���

SELECT SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Jack' ; -- 8400
 
SELECT FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400 ;
 
 -- ���������� �̿�
 
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY <(SELECT SALARY
                  FROM EMPLOYEES
                 WHERE FIRST_NAME = 'Jack') ;
                 
-- �������̺��� James�� �޿����� ���� ������ �̸��� �޿������� ��ȸ

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES 
                  WHERE FIRST_NAME = 'James') ;
 
 
-- ORA-01427: single-row subquery returns more than one row
-- ���� �� ���������� �ϳ��� �ุ ����� �� �ִ�.

-- James�� �޿� ����

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'James';
 
-- ���� ������ Ư¡
-- 1. ���� ������ �����ڿ� ���� �� �Ǵ� ��ȸ ����� �������� ���̸� ()�� ��� ����Ѵ�.
-- 2. ���� ������ SELECT ���� ����� �÷��� ���� ������ �񱳴��� ���� �ڷ����� ������ �����ؾ� �Ѵ�.
-- 3. ���� ������ �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ��Ѵ�.
-- > ��, �� �ϳ��� �����ͷθ� ������ ������ �����ڶ�� ���� ������ ��� �� ���� �ϳ����� �Ѵ�.
-- > �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.


-- ������ ����������?
-- ���� ����� �� �ϳ��� ������ ������ ��������
-- = , >, >= , <, <= ,!= , <> , ^=

-- �ǽ�) �������̺��� FIRST_NAME�� Nancy ���� ���� �Ի��� ������ FIRST_NAME�� �Ի����� ��ȸ

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Nancy' ; -- HIRE_DATE : 2002-08-17


SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                     FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Nancy');

-- �ǽ�) �������̺��� ��ձ޿� ���� ���� �޿��� �޴� ������ �̸��� �޿������� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                  FROM EMPLOYEES)  ;
                  
-- ������ ����������?
-- ������ ���� �������� ������ ���������� ���Ѵ�.

-- ������ �������� ����
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ TRUE�� ��ȯ
--> IN (��������)
-- ANY, SOME : ���� ������ ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE���� ��ȯ
--> �񱳿����� ANY (��������)
-- ALL : ���� ������ �������� ���������� ����� ��� �����ϸ� TRUE ��ȯ
--> �񱳿����� ALL (��������)
-- EXISTS : ���� ������ ��� ���� �����ϴ��� ���θ� Ȯ���Ѵ�.(��, ���� 1�� �̻��̸� TRUE�� ��ȯ)
--> EXISTS (��������)

-- �ǽ�) �� �μ��� �ְ�޿��� ������ �޿��� �޴� ������ ������ ���
-- (�μ�ID,FIRST_NAME,�޿��� ������ ���)

SELECT * FROM EMPLOYEES ;

-- �� �μ���(GROUP BY)�ְ� �޿� ���� 
SELECT DEPARTMENT_ID , MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;


-- �������� �̿�(IN)
SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID) ;

-- ANY ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ - ANY
-- =(����)��� �߱⶧����, IN �����ڿ� ���� ����� ���

SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- ALL : ���� ���� ����� �����ϴ� ��� ���鿡 ���� ������ �����ؾ��Ѵ�.

SELECT DEPARTMENT_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) ;

-- ��������δ� �ִ밪 ���� ū �Ǹ� ����� �Ǽ�, �ִ밪�� ���ϴ� �Ͱ� ����.
-- ���������� ��� ���߿� ���� ū���� 24,000�� �񱳸� �ؼ� ũ�ų� ���� ���� ���� �����͸� ���

-- �ǽ�) �������̺��� ������ �̸��� �μ����̵� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS ( SELECT FIRST_NAME
                  FROM EMPLOYEES
                 WHERE DEPARTMENT_ID = 110 ) ;
 
-- EXISTS �����ڴ� '���翩��'�� Ȯ���� �Ѵ�.

-- ���� �÷� ��������
--> ���� ������ ����� ���� �÷��� ��ȯ �Ǿ� ���������� ���ǰ� ���ÿ� �񱳵Ǵ� ���� �ǹ�

-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������
-- �μ�ID, FIRST_NAME, �޿����� ���

SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (SALARY,DEPARTMENT_ID) IN (SELECT MAX(SALARY), DEPARTMENT_ID
                                    FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID) ;

-- �ǽ�) ���� ���̺��� Jack�� �޿����� ���� ������ �̸��� �޿��� ��ȸ�غ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Jack') ;
                  

-- �ζ��� ��(Inline View)
-- FROM������ ���� ���̺� ó�� ����ϴ� ���������̴�.
-- �ζ��κ並 ����ϸ� ���� ������ ����� ��ġ ���̺�ó�� ����� �� �ֵ�.
-- �ζ��� ��� ���� ������ ��� ó���ȴ�.

-- �μ��� �ְ� �޿��� �޴� ������ FIRST_NAME, �μ�ID, �μ��� �ְ�޿��� ���

SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME, DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- �ζ��κ�� JOIN ������ ������ ����ϸ� �ǹ��ִ� ����� ������ �� ����.

SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
  FROM EMPLOYEES A, (SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
                      FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID ) B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.SALARY = B.MAX_SALARY ;

-- �ζ��κ�� ��Ī�� �������� ������, ���� �÷��� ������ �� ����.
-- ��Ī�� �����ؾ߸� ���ϴ� �÷��� �����ؼ� �� �� �� �ִ�.
-- �������� �������� ���� �������������, ���迡���� ���� ������ �ȴ�.

-- ��Į�� ���� ���� ����( SCALAR SUB QUERY)
-- SELECT ���� ���Ǵ� ��������
-- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�Ǵ� Ư¡�� ������ ����.
-- JOIN ���� JOINó�� ����ϰ��� �Ҷ� ���

-- �����̸�, �޿�, �μ����̵�, �μ��̸��� ���

SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT E.FIRST_NAME, E.SALARY, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) ;
    
    
-- ��Į�� ���� ���� ���
-- ��Į�� ���������� ����ϸ� JOIN�� ������� �ʰ� ������ ���·� ������ ���� �� �ִ�.

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID = E.DEPARTMENT_ID)
  FROM EMPLOYEES E ;

-- ��Į�� ���������� �̿��ϸ� NULL�� �����͵� ��µǴ� Ư¡�� ������ �ִ�.

















