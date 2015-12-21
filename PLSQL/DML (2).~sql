delete from klyw_temp_table;--清空表数据，但表结构依然存在
alter table SEL_DEMO_HEADERS add expandfield integer;--添加字段
update sel_demo_headers set expandfield=null; --清空某列数据,前提是列允许为空
alter table sel_demo_headers modify expandfield varchar2(50);--修改字段类型   
-------------------复制表----------------------------------
  CREATE TABLE src_spec_bidmsg AS SELECT * FROM    src_spec_bidmsg@erdevpp.sg.com
---------------------------------------------------
--创建序列
CREATE SEQUENCE SPL_SUPPLIERS_BASE_INFO_s  --序列名
INCREMENT BY 1   -- 每次加几个  
START WITH 1      -- 从1开始计数  
NOMAXVALUE        -- 不设置最大值  
NOCYCLE               -- 一直累加，不循环  
CACHE 10;
create TABLE import_table--创建表
(
employee_code  VARCHAR2(50),
employee_name  VARCHAR2(50)
)                   

SELECT * FROM import_table FOR UPDATE;
--删除表中所有数据
delete from KLYW_SYSTEMS_AT_MANAGE;
--删除表定义及其数据
drop table import_table;
truncate table KLYW_SYSTEM_AT_MANAGE;
SELECT sys_user_S.NEXTVAL user_id FROM dual;          
select sf.login_name from SPL_SUPPLIERS_BASE_INFO sf WHERE EXISTS(select 1 from SPL_SUPPLIERS_BASE_INFO s WHERE s.supplier_id=19);--exists用法


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
                      
    