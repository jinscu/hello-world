delete from klyw_temp_table;--��ձ����ݣ�����ṹ��Ȼ����
alter table SEL_DEMO_HEADERS add expandfield integer;--����ֶ�
update sel_demo_headers set expandfield=null; --���ĳ������,ǰ����������Ϊ��
alter table sel_demo_headers modify expandfield varchar2(50);--�޸��ֶ�����   
-------------------���Ʊ�----------------------------------
  CREATE TABLE src_spec_bidmsg AS SELECT * FROM    src_spec_bidmsg@erdevpp.sg.com
---------------------------------------------------
--��������
CREATE SEQUENCE SPL_SUPPLIERS_BASE_INFO_s  --������
INCREMENT BY 1   -- ÿ�μӼ���  
START WITH 1      -- ��1��ʼ����  
NOMAXVALUE        -- ���������ֵ  
NOCYCLE               -- һֱ�ۼӣ���ѭ��  
CACHE 10;
create TABLE import_table--������
(
employee_code  VARCHAR2(50),
employee_name  VARCHAR2(50)
)                   

SELECT * FROM import_table FOR UPDATE;
--ɾ��������������
delete from KLYW_SYSTEMS_AT_MANAGE;
--ɾ�����弰������
drop table import_table;
truncate table KLYW_SYSTEM_AT_MANAGE;
SELECT sys_user_S.NEXTVAL user_id FROM dual;          
select sf.login_name from SPL_SUPPLIERS_BASE_INFO sf WHERE EXISTS(select 1 from SPL_SUPPLIERS_BASE_INFO s WHERE s.supplier_id=19);--exists�÷�


select o.coding_rule_object_id,
                   o.priority,
                   o.document_type,
                   o.company_id,
                   o.operation_unit_id
              from fnd_coding_rule_objects o
             where o.document_category = 'CSG_SUPPLIERS_CODE1'
               and o.enabled_flag = 'Y'    

SELECT * FROM import_table FOR UPDATE;               
               
DECLARE
  p_CODE VARCHAR2(50);
  p_NAME VARCHAR2(50);
  CURSOR C_DATA IS
    SELECT * FROM IMPORT_TABLE;
BEGIN
  OPEN C_DATA;
  LOOP
    FETCH C_DATA INTO p_CODE,p_NAME;
    /*UPDATE IMPORT_TABLE
       SET EMPLOYEE_CODE = (SELECT SUBSTR(EMPLOYEE_CODE, 2)
                              FROM IMPORT_TABLE
                             WHERE EMPLOYEE_CODE = V_CODE)
     WHERE WHERE EMPLOYEE_CODE = V_CODE;*/ 
    klyw_bx_test_pkg.IMPORT_USER(p_code=>p_code,P_NAME =>p_name);
    EXIT WHEN C_DATA%NOTFOUND;
  END LOOP;
  CLOSE C_DATA;
END;
                      
    