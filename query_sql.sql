select * from sel_demo_gutty_headers;

select *
  from sel_demo_headers
 order by header_id
          
           select * from sel_demo_headers_imp;


select * from fnd_interface_headers;

select * from fnd_interface_lines;

select *
  from jin_sel_demo_headers
       
       sel_jin_pkg
       
        select *
          from sel_demo_lines
               
               create table jin_sel_demo_headers2(line_id number primary key, header_id number foreign, name varchar(50) not null, gender varchar(50) not null, birth_place varchar(50) not null, hobby varchar(50) not null, description varchar(50) not null)
               
                select * from jin_sel_demo_headers2 for update;



select *
  from sel_demo_headers
   for update

drop table jin_sel_demo_headers2

px_order_pkg wfl_common_pkg;
wfl_core_pkg
  select *
    from sys_user a, exp_employees b
   where a.employee_id = b.employee_id
     and a.employee_id = '34615'
  
   update sys_user u set
   u.description =
         (select name from exp_employees where employee_id = u.employee_id)
   where u.description is null;

select u.description from sys_user u where u.employee_id = '34615';
select * from exp_employees;

select * from sel_demo_headers;

select * from TEST_MSG_SEND;

select * from KLYW_KNOWLEDGEBASE;
var temp
select 1 into temp from dual;


select e.name from sys_user s inner join exp_employees e ON s.employee_id=e.employee_id where s.user_id=10861;



SELECT
    t1.announcement_id,
    t1.title,
    t1.message,
    TO_CHAR(t1.last_update_date,'yyyy-MM-dd HH24:mi:ss') AS last_updateTime,
    (SELECT
        e.name
    FROM
        sys_user s
    INNER JOIN exp_employees e
    ON
        s.employee_id=e.employee_id
    WHERE
        s.user_id=t1.created_by
    ) AS createdBy
FROM
    TEST_MSG_SEND t1
    



select 20654 from dual; 
select * from sel_demo_headers_imp;
sel_excel_import_pkg;

 select e.employee_code
      from sys_user s, exp_employees e
     where s.employee_id = e.employee_id
       and (s.description = '×¯ÉÙºì'
        or e.name ='×¯ÉÙºì');
        
        
 select count(1) from klyw_temp_table