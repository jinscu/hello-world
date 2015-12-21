select rowid,t.* from klyw_add_user t   --klyw_add_user  存放信息的表
delete from klyw_add_user
update KLYW_ADD_USER ka
    set ka.p_code = substr(ka.p_code,2) --substr 从第2个字符开始算起
    where ka.p_code like 'A%'

--员工录入
declare
  v_user_name varchar2(50);
  v_user_code varchar2(30);
  V_NUM number;
  cursor everyRow is --定义游标
    select k.P_CODE, k.P_NAME from KLYW_ADD_USER k; --select * from KLYW_ADD_USER
begin
  open everyRow;
  loop
    --循环
    <<next>>
    fetch everyRow
      into v_user_code, v_user_name;
    exit when everyRow%notfound;
    select count(1)
      into V_NUM
      from EXP_EMPLOYEES ee
     where ee.employee_code = v_user_code;
    if v_num > 0 then
      update EXP_EMPLOYEES ee
         set ee.name = v_user_name,
             ee.EMPLOYEE_TYPE_ID = 2,
             ee.ENABLED_FLAG = 'Y',
             ee.CREATED_BY = '1',
             ee.creation_date = SYSDATE,
             ee.LAST_UPDATED_BY = '1',
             LAST_UPDATE_DATE = SYSDATE
       where ee.employee_code = v_user_code;
    else
      --v_user_name := P_NAME;
      --调用函数
      --if v_user_code = (select ee.employee_code from EXP_EMPLOYEES ee where ee.name = v_user_name)
      --then return ;
      --else
      insert into EXP_EMPLOYEES ee
        (ee.employee_id,
         ee.employee_code,
         ee.name,
         ee.EMPLOYEE_TYPE_ID,
         ee.ENABLED_FLAG,
         ee.CREATED_BY,
         ee.creation_date,
         ee.LAST_UPDATED_BY,
         LAST_UPDATE_DATE)
      values
        (EXP_EMPLOYEES_S.NEXTVAL,
         v_user_code,
         v_user_name,
         2,
         'Y',
         '1',
         SYSDATE,
         '1',
         SYSDATE);
    end if;
 
  end loop;
end;


--岗位分配
declare
  v_user_name varchar2(50);
  v_user_code varchar2(30);
  V_NUM number;
  V_MIMA varchar2(100);
   v_EMPLOYEE_ID varchar2(30);

  cursor everyRow is --定义游标
    select k.P_CODE, k.P_NAME from KLYW_ADD_USER k;
begin
  open everyRow;
  loop
    --循环
    <<next>>
    fetch everyRow
      into v_user_code, v_user_name;
 
    exit when everyRow%notfound;
     select ee.employee_id into v_EMPLOYEE_ID from exp_employees ee
      where ee.EMPLOYEE_CODE = v_user_code ;
    select count(1)
      into V_NUM
      from EXP_EMPLOYEE_ASSIGNS eea
     where
       eea.employee_id = v_EMPLOYEE_ID; --POSITION_ID 不为
    if v_num > 0 then
      GOTO next;
    else
      insert into EXP_EMPLOYEE_ASSIGNS eea
        (eea.EMPLOYEES_ASSIGN_ID,
         eea.EMPLOYEE_ID,
         eea.COMPANY_ID,
         eea.POSITION_ID,
         eea.PRIMARY_POSITION_FLAG,
         eea.ENABLED_FLAG,
         CREATED_BY,
         creation_date,
         LAST_UPDATED_BY,
         LAST_UPDATE_DATE)
      values
        (EXP_EMPLOYEE_ASSIGNS_S.NEXTVAL,
         v_EMPLOYEE_ID,
         '1', -- 公司ID 韶钢是10
         '71', --视岗位而定 填岗位代码 查询：select * from exp_org_position
         'Y', --主岗位
         'Y', -- 启用
         '1',
         SYSDATE,
         '1',
         SYSDATE);
    end if;
 
  end loop;
end;


--用户开通
declare
  v_user_name varchar2(50);
  v_user_code varchar2(30);
  V_NUM number;
  V_MIMA varchar2(100);
  v_EMPLOYEE_ID varchar2(30);

  cursor everyRow is --定义游标
    select k.P_CODE, k.P_NAME from KLYW_ADD_USER k;
begin
  open everyRow;
  loop
    --循环
    <<next>>
    fetch everyRow
      into v_user_code, v_user_name;
 
    exit when everyRow%notfound;
     v_mima := SYS_LOGIN_PKG.MD5(v_user_code);
    select count(1)
      into V_NUM
      from SYS_USER su
     where su.user_name = v_user_code;
     
    if v_num > 0 then
    select ee.employee_id into v_EMPLOYEE_ID from exp_employees ee
      where ee.EMPLOYEE_CODE = v_user_code ;
    UPDATE SYS_USER su
      set su.EMPLOYEE_ID = v_EMPLOYEE_ID,
      su.FROZEN_FLAG = 'N'
      where su.USER_NAME = v_user_code;
    else
      --v_user_name := P_NAME;
      --调用函数
      --if v_user_code = (select ee.employee_code from EXP_EMPLOYEES ee where ee.name = v_user_name)
      --then return ;
      --else
      insert into SYS_USER su
        (su.USER_ID,
         su.USER_NAME,
         su.DESCRIPTION,
         su.ENCRYPTED_FOUNDATION_PASSWORD,
         su.EMPLOYEE_ID,
         su.ENCRYPTED_USER_PASSWORD,
         su.START_DATE,
         su.FROZEN_FLAG,
         su.CREATED_BY,
         su.creation_date,
         su.LAST_UPDATED_BY,
         LAST_UPDATE_DATE)
      values
        (SYS_USER_S.NEXTVAL,
         v_user_code,
         v_user_name,
         v_mima,
         v_EMPLOYEE_ID,
         v_mima,
         
         SYSDATE,
         'N',
         '1',
         SYSDATE,
         '1',
         SYSDATE);
    end if;
 
  end loop;
end;
--角色分配
declare
  v_user_name varchar2(50);
  v_user_code varchar2(30);
  V_NUM number;
  V_user_id number;

  cursor everyRow is --定义游标
    select k.P_CODE, k.P_NAME from KLYW_ADD_USER k;
begin
  open everyRow;
  loop
    --循环
    <<next>>
    fetch everyRow
      into v_user_code, v_user_name;
 
    exit when everyRow%notfound;
    select su.user_id
      into V_user_id
      from sys_user su
     where su.user_name = v_user_code;
    select count(1)
      into V_NUM
      from sys_user_role_groups sur
     where (sur.user_id =
           (select su.user_id
               from sys_user su
              where su.user_name = v_user_code)); --POSITION_ID 不为
    if v_num > 0 then
      GOTO next;
    else
      insert into sys_user_role_groups sur
        (sur.USER_ROLE_GROUP_ID,
         sur.USER_ID,
         sur.ROLE_ID,
         sur.COMPANY_ID,
         sur.START_DATE,
         CREATED_BY,
         creation_date,
         LAST_UPDATED_BY,
         LAST_UPDATE_DATE)
      values
        (SYS_USER_ROLE_GROUPS_S.NEXTVAL,
         v_user_id,
         '74', -- 角色ID 74报修 select * from sys_role
         '1', --公司ID，韶钢是1
         TRUNC(SYSDATE), --sysdate - NUMTODSINTERVAL(1, 'day'), --获取系统前一天的日期，否则会出现问题
         '1', -- 创建人ID
         SYSDATE,
         '1',
         SYSDATE);
    end if;
  end loop;
end;
