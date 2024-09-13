/*
-- CHAPTER 05. JOIN --
- JOIN : ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

- �� ���� (NON EQUI JOIN)
> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� JOIN
> �������(=) �ƴ� �����ڵ��� ����� ������ �ǹ� (> , >=, <, <=, BETWEEN)

- � ���� (EQUI JOIN) 
> �� ���� ���̺��� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� JOIN
> �������(=)�� ����ؼ� ������ �ǹ�
> ���� ���� ���Ǵ� ������ ����

-- [ ������ ��� ��� ]
SELECT ���̺�1.�÷�
  FROM ���̺�1, ���̺�2 > ���̺�1�� 2�� �����ϰڴ�.
 WHERE ���̺�1.�÷� = ���̺�2. �÷� > ���� ����(���� ���� ���� �÷�)
 
*/

-- �ǽ�) ������ ���� ���̺�� ����ǥ ���̺��� �л�ID, �л��̸�, ����, ���� ������ ���

SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ;

SELECT ����������.�л�ID, ����������.�л��̸�
     , ����ǥ.����, ����ǥ.����
  FROM ����������, ����ǥ
 WHERE ����������.�л�ID = ����ǥ.�л�ID ;

-- �ǽ�) �������̺��� ����ID,FIRST_NAME, �μ����̺��� �μ� �̸� ������ ���

SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS 
 WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID ;
 
-- ��Ī ���

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMNETS D
 WHERE E.DEPARTMENT_ID, D.DEPARTMENT_ID ;
 
-- ����ID�� 100�� ������ FIRST_NAME�� �μ��̸��� ���
-- 
SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID =100 ;

-- �ܵ������� �����ϴ� �÷��� .(���)�� �������൵ ����� ����.
-- ���������� ���̺� ����� �����ִ� ���� ��ȣ�Ѵ�.
-- ���� ������ �Ǵ� �÷��� ��κ� PK�� FK����� �̷������. ������ �� �׷����� �ƴϴ�.

/*
-- ANSI(�̱�����ǥ������) ������ ��� DBMS���� ��밡���� �������� ��𼭵�
-- ��밡���ؼ� �� ����� ���� �մϴ�.

--[ANSI ���� ������� ��� ]
SELECT ���̺�1.�÷���, ���̺�2. �÷���...
  FROM ���̺�1 INNER JOIN ���̺�2
    ON (���̺�1.�÷��� = ���̺�2.�÷���) ; > ���� ����
 WHERE �Ϲ� ������
 
*/

-- �ǽ�) �������̺��� �������̺��� ����ID, ����ID, ����TITLE ������ ���
SELECT * FROM EMPLOYEES ;
SELECT * FROM JOBS ;

SELECT E.EMPLOYEE_ID,E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID) ;
    

-- CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
-- > ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
-- īƼ�� ���̶� �θ��� > ��� ����� ���� ��ȸ�� ���� ����.

-- SELECT ��ȸ�� �÷���,...
--   FROM ���̺�1 CROSS JOIN ���̺�2 ;

-- > ON ���� �������� ������ CROSS JOIN�̴�.

-- �ǽ�) ����ID, �μ�ID, �μ��̸��� ���

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;
 
/*
-- OUTER JOIN : �ܺ������̶�� �ϸ�, �ΰ��� ���̺��� �������� ��ȸ�ϰ�,
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ������ ����ϴ� ���� ����.
-- > ���� �������� NULL���� ����ϰ� ������ ���

- LEFT OUTER JOIN : ���� �ܺ� ����
- FULL OUTER JOIN : ��ü �ܺ� ����
- RIGHT OUTER JOIN : ������ �ܺ� ����

ANSI ǥ�ع���
SELECT ���̺�1.�÷�, ���̺�2.�÷�,...
  FROM ���̺�1 LEFT OUTER JOIN ���̺�2
    ON ���̺�1.�÷��� = ���̺�2.�÷���
- OUTER ��������

����Ŭ ����<LEFT OUTER JOIN> ����//FULL OUTER JOIN�� ����Ŭ������ ������������.
SELECT  
  FROM ���̺�1, ���̺�2
 WHERE ���̺�1.�÷��� = ���̺�2.�÷���+
- LEFT �����̸�, WHERE������ LEFT�ݴ���(RIGHT)�� (+)ǥ��
- RIGHT �����̸�, RIGHT�ݴ���(LEFT)�ʿ� (+) ǥ��

*/

SELECT * FROM DEPARTMENTS ;
SELECT * FROM EMPLOYEES ;
-- �ǽ�) �� �μ��� �Ŵ��� ������ �μ��̸�, �Ŵ��� ���̵�, FIRST_NAME���
-- �� �μ��� �����ڸ� ã�� ����, EMPLOYEES���� MANAGER_ID�� �Ҽ��� ��Ÿ���� ���ÿ�, �μ��� BOSS�� ǥ���ϰ�����.
-- ����, DEPARTMENTS�� MANAGER_ID�� EMPLOYEE_ID �� ��Ī������, �� �μ��� ���� ��Ÿ�� �� �ִ�.

    
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    
-- LEFT OUTER JOIN Ȱ��
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    
-- LEFT OUTER JOIN�� ORACLE �������� ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+) ;
 

-- RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

-- RIGHT OUTER JOIN�� ORACLE �������� ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID ;

-- FULL OUTER JOIN

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
    

-- [ 3���� ���̺� ���� ]
-- �μ����̺�, ��ġ���̺�, �������̺��� INNER JOIN �Ͽ�,
-- �μ��̸�, ����, �����̸��� ���
SELECT * FROM DEPARTMENTS ;
SELECT * FROM LOCATIONS ;
SELECT * FROM COUNTRIES ;

SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D INNER JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
       INNER JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID) ;


SELECT D.DEPARTMENT_NAME, L.CITY ,C.COUNTRY_NAME
  FROM DEPARTMENTS D, LOCATIONS L , COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID ;
   

