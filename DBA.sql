select * from BQMTQJ41 t;

--ȥ����������tacard1����Ҫ��������group
select t.rowid,
       t.ACCOUNT,
       t.ACCOUNT_PERIOD,
       t.WORK_DATE,
       t.AREA_CODE,
       t.MAT_CODE,
       t.PSCS_MAT_CODE,
       t.MAT_NAME,
       t.THROW_MODE
  from tacard1 t,
       (select ACCOUNT,
               ACCOUNT_PERIOD,
               WORK_DATE,
               AREA_CODE,
               MAT_CODE,
               PSCS_MAT_CODE,
               MAT_NAME,
               THROW_MODE
          from tacard1
         group by ACCOUNT,
                  ACCOUNT_PERIOD,
                  WORK_DATE,
                  AREA_CODE,
                  MAT_CODE,
                  PSCS_MAT_CODE,
                  MAT_NAME,
                  THROW_MODE
        having count(*) > 1) t1
 where t.ACCOUNT = t1.ACCOUNT
   and t.ACCOUNT_PERIOD = t1.ACCOUNT_PERIOD
   and t.WORK_DATE = t1.WORK_DATE
   and t.AREA_CODE = t1.AREA_CODE
   and t.MAT_CODE = t1.MAT_CODE
   and t.PSCS_MAT_CODE = t1.PSCS_MAT_CODE
   and t.MAT_NAME = t1.MAT_NAME
   and t.THROW_MODE = t1.THROW_MODE


--�鿴��ǰ�Ự�����е�Ȩ��
select * from session_privs;
--�鿴��ǰ�û��Ľ�ɫ
select * from user_role_privs;
--�鿴��ɫ�����е�Ȩ��
select * from role_sys_privs;
--ϵͳȨ�޵ȼ�
select * from system_privilege_map;

--//��ѯ�û���Ӧ��
--������ʾ��ǰ�û���ӵ�е����б���ֻ��������Ӧ���������б��������û���
select table_name from user_tables;
--������ʾ��ǰ�û����Է��ʵ����б��������᷵�ص�ǰ�û����������б����᷵�ص�ǰ�û����Է��ʵ����������ı�
select table_name from all_tables;
--�鿴�����ֵ���ͼ
select * from dictionary;
--��ʾ�������ݿ��û�����ϸ��Ϣ
select * from dba_users;
--��ѯĳ���û�������ô���Ľ�ɫ
select * from dba_role_privs r where r.grantee = 'SYSTEM';--ע���ֶ������ִ�Сд
--��ѯ����
 select * from dba_sequences��
 
 --����������
 CREATE OR REPLACE TRIGGER tri_tacamw0
after INSERT ON tacamw0 
FOR EACH ROW--�м�������
BEGIN
   update tacamw0 set rownumber = 386 where rownumber = :new.rownumber ;
END tri_tacamw0;
--ɾ��������
DROP TRIGGER tri_tacamw0;
