select * from BQMTQJ41 t;

--去除主键，表tacard1，主要是是先用group
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


--查看当前会话所具有的权限
select * from session_privs;
--查看当前用户的角色
select * from user_role_privs;
--查看角色所具有的权限
select * from role_sys_privs;
--系统权限等级
select * from system_privilege_map;

--//查询用户对应表
--用于显示当前用户所拥有的所有表，它只返回所对应方案的所有表（方案即用户）
select table_name from user_tables;
--用于显示当前用户可以访问的所有表，它不仅会返回当前用户方案的所有表，还会返回当前用户可以访问的其它方案的表。
select table_name from all_tables;
--查看数据字典视图
select * from dictionary;
--显示所有数据库用户的详细信息
select * from dba_users;
--查询某个用户具有怎么样的角色
select * from dba_role_privs r where r.grantee = 'SYSTEM';--注意字段名区分大小写
--查询序列
 select * from dba_sequences；
 
 --创建触发器
 CREATE OR REPLACE TRIGGER tri_tacamw0
after INSERT ON tacamw0 
FOR EACH ROW--行级触发器
BEGIN
   update tacamw0 set rownumber = 386 where rownumber = :new.rownumber ;
END tri_tacamw0;
--删除触发器
DROP TRIGGER tri_tacamw0;
