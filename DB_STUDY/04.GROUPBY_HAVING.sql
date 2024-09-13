/*
-- CHAPTER 04. GROUP BY / HAVING --

- ������ �Լ� : �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
- ������ �Լ� : �������� �Է��� �޾� �ϳ��� ��������� ����� �Ǵ� �Լ�
-> ������ �Լ��� '�����Լ�'��� �θ���.
1. �����Լ��� NULL���� �����ϴ� Ư���� ������ �ִ�.
2. �����Լ��� �׷�ȭ(GROUP BY)�� �Ǿ��ִ� ���¿����� ����� �����ϴ�. **�ſ��߿�

- �����Լ��� ����
- COUNT(������) : ������ �������� ���� ��ȯ
- SUM : ������ �������� ���� ��ȯ
- MAX : ������ ������ �� ���� ���� ���� ��ȯ
- MIN : ������ ������ �� ���� ���� ���� ��ȯ
- AVG : ������ �������� ��հ��� ��ȯ

*/

-- [COUNT �Լ� Ȱ��]
-- �ǽ�) �������̺��� ���� ID�� ���� ������ ��ȸ

SELECT * FROM EMPLOYEES ;

SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEE ;
-- GROUP BY () ; : ��ǻ� �� Ű���尡 ������ �ִ� ����.(�Ұ�ȣ �ȿ� �����Ͱ� ���� ����)
-- �������̺��� �ϳ��� �׷����� ���ڴ�.

SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID         -- ���� 107��
     , COUNT(EMPLOYEE_ID)  -- ���� 1��
  FROM EMPLOYEES
GROUP BY EMPLOYEE_ID ;

-- ORA-00937: not a single-group group function
-- ���� ������ ���� �ʾƼ� ������ �߻�. > GROUP BY�� ���ָ� �ذ�ȴ�.

-- �ǽ�) �������̺��� �μ�ID�� ���� ������ ���

SELECT * FROM EMPLOYEES ;

SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES ;


-- �μ� ID�� NULL�� ������ ������ FIRST_NAME��?

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL ;


-- �ǽ�) �������̺��� �޿��� �� �հ踦 ���
SELECT * FROM EMPLOYEES ;

SELECT SUM(SALARY)
  FROM EMPLOYEES ; 
-- �ǽ�2) �������̺��� �������� �ִ�޿��� �ּұ޿� ���
SELECT * FROM EMPLOYEES ;

SELECT MAX(SALARY),MIN(SALARY)
  FROM EMPLOYEES ;

-- �ǽ�3) �������̺��� �μ�ID�� 100�� ������ ��� �޿��� ���, ������� �Ҽ��� 1���ڸ����� �ݿø�
SELECT * FROM EMPLOYEES ;

SELECT ROUND(AVG(SALARY),1)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 ;

-- �׽�Ʈ ���� ���̺� ��ȸ
SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ;

-- GROUP BY : Ư�� �÷��� �������� �׷�ȭ

-- GROUP BY �����,
-- SELECT
--   FROM
--  WHERE
-- GROUP BY

-- ������ ���� ���̺��� �Ҽӹ� �� �л��� �ο����� ��ȸ.

SELECT * FROM ���������� ;

SELECT �Ҽӹ�, COUNT(�л�ID)
  FROM ����������
GROUP BY �Ҽӹ� ;

-- �����Լ� ���� ���ǻ���
-- < SQL ������� >
-- FROM > WHERE > GRUOP BY > HAVING > SELECT > ORDER BY

-- �ǽ�) ����ǥ ���̺��� ���񺰷� �ְ� ������ ���� ������ ���
SELECT * FROM ����ǥ ;

SELECT ����, MAX(����),MIN(����)
  FROM ����ǥ
GROUP BY ���� ;

-- �ǽ�) ����ǥ ���̺��� �л����� ��� ������ ���

SELECT * FROM ����ǥ ;

SELECT ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID ;

-- �ǽ�) ����ǥ ���̺��� �л����� JAVA�� DATABASE������ ������ ���� ���

SELECT * FROM ����ǥ ;

SELECT �л�ID, SUM(����)
  FROM ����ǥ
 WHERE ���� NOT IN ('PYTHON')
GROUP BY �л�ID ;

-- [HAVING�� ]
-- GRUOP BY���� ������ ���� ��� ����.
-- ���谡 �Ϸ�� ����� ������ ���� ���͸� �ϴ� �����̴�.
-- ������ ���� ����� ����� �ȴٴ� ������ WHERE���� ���������,
-- HAVING���� �׷�ȭ�� ��󿡼� ����� �ȴٴ� ������ ������ �ٸ���.

-- �ǽ�) ����ǥ ���̺��� �л��� ��ռ����� ���ϰ�,
-- ��ռ����� 75 ������ �л��鸸 ��� 

SELECT * FROM ����ǥ ;

SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID 
HAVING AVG(����) <= 75 ;

-- �ǽ�) ������ ���� ���̺��� �ݺ� �ο����� 3�� �̻��� �ݸ� ���
SELECT * FROM ���������� ;

SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
  FROM ����������
GROUP BY �Ҽӹ� 
HAVING COUNT(�Ҽӹ�) >= 3;

-- �ǽ�) �������̺��� �μ��� �ְ� ������ 100000�̻��� �μ��� ���
SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID, MAX(SALARY*12)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY*12) >= 100000 ;

-- �ǽ�) ����ǥ ���̺��� �л��� ��ռ����� ����ϵ�,
-- NULL�� �ƴ� ���� ���, �� ������ �Ҽ��� 1�� �ڸ������� ���

SELECT * FROM ����ǥ ;

SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID 
HAVING AVG(����) IS NOT NULL ;

