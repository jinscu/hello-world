SELECT to_date(NUMTOYMINTERVAL(10,'year'),'yyyy-mm-dd') FROM DUAL;
SELECT SYSDATE+NUMTOYMINTERVAL(10,'year') FROM DUAL;
select trunc(sysdate) from dual;
select replace('I''am a new employeer','employeer','student') from dual;
 select count(*)
        --into r_sys_user
        from sys_user
       where user_name = upper('jin11');
sys_login_pkg
SELECT * FROM sys_user u WHERE u.user_name=upper('jin11');
SELECT u.user_name FROM sys_user u WHERE u.user_id=13506;
select sf.login_name from SPL_SUPPLIERS_BASE_INFO sf WHERE EXISTS(select 1 from SPL_SUPPLIERS_BASE_INFO s WHERE s.supplier_id=19);


create table klyw_temp_table
(
temp_id    NUMBER not null,
attribute_1  VARCHAR2(100),
attribute_2  VARCHAR2(100),
attribute_3  VARCHAR2(100),
attribute_4  VARCHAR2(100),
attribute_5  VARCHAR2(100),
attribute_6  VARCHAR2(100),
attribute_7  VARCHAR2(100),
attribute_8  VARCHAR2(100),
attribute_9  VARCHAR2(100),
attribute_10  VARCHAR2(100)
)
--删除表中所有数据
delete from KLYW_SYSTEMS_AT_MANAGE;
--删除表定义及其数据
drop table KLYW_SYSTEM_AT_MANAGE;
truncate table KLYW_SYSTEM_AT_MANAGE;
--工作流
SELECT
    t.*,
    wfl_common_pkg.can_cancel_instance(1436,t.instance_id) allow_cancel,
    DECODE(t.last_approve_name, NULL, NULL, TO_CHAR(t.LAST_UPDATE_DATE, 'yyyy-mm-dd hh24:mi')) LAST_UPDATE_DATE_desc
FROM
    (SELECT
        rs.*,
        TO_CHAR(rs.creation_date, 'yyyy-mm-dd hh24:mi') creation_date_desc,
        (SELECT
            code_value_name
        FROM
            sys_code_values_v
        WHERE
            code       = 'WFL_WORKFLOW_INSTANCE_STATUS' AND
            code_value = TO_CHAR(rs.status)
        ) status_name,
        wfl_common_pkg.get_current_node(rs.workflow_id, rs.instance_id, rs.current_node) curr_approve_name,
        wfl_common_pkg.get_wfl_user_name(rs.created_by) create_by_name,
        wfl_common_pkg.get_wfl_user_name(
        (SELECT
            r.created_by
        FROM
            wfl_approve_record r
        WHERE
            r.record_id =
            (SELECT
                MAX(record_id)
            FROM
                wfl_approve_record
            WHERE
                instance_id = rs.instance_id
            )
        )) last_approve_name,
        (SELECT
            wdr.document_desc
        FROM
            wfl_document_reference_vl wdr
        WHERE
            rs.workflow_category = wdr.workflow_category
        ) ORDER_TYPE,
        TO_CHAR(
        (SELECT
            MAX(nr.date_limit)
        FROM
            wfl_instance_node_recipient nr,
            wfl_workflow_node n
        WHERE
            nr.instance_id = rs.instance_id AND
            nr.node_id     = n.node_id AND
            n.sequence_num = rs.current_node
        ), 'yyyy-mm-dd hh24:mi') date_limit
    FROM
        (SELECT
            a.instance_id,
            a.workflow_id,
            a.current_node,
            a.created_by,
            a.creation_date,
            a.document_number ORDER_NO,
            b.name workflow_name,
            a.LAST_UPDATE_DATE,
            b.workflow_category,
            a.status,
            b.can_cancel,
            a.status_desc,
            a.instance_amount
        FROM
            wfl_workflow_instance a,
            wfl_workflow_vl b
        WHERE
            a.created_by  =1436 AND
            a.workflow_id = b.workflow_id AND
            a.status      = 1
        ORDER BY
            a.creation_date DESC
        ) rs
    ) t;
    
  --工作流-被退回的申请  
    SELECT v.comment_text,
       s.*,
       TO_CHAR(s.last_update_date, 'yyyy-mm-dd hh24:mi') last_update_date

  FROM (SELECT i.*,
               i.document_number order_no,
               '退回' AS type,
               (SELECT l.employee_name
                  FROM wfl_users_employee_v l
                 WHERE l.user_id = i.last_updated_by) name,
               wf.name AS workflow_name,
               wf.description AS workflow_desc,
               wf.UPDATE_FORM,
               (SELECT r.document_desc
                  FROM wfl_document_reference_vl r
                 WHERE r.workflow_category = wf.workflow_category) order_type
          FROM (SELECT MAX(i.instance_id) instance_id
                  FROM wfl_workflow_instance i, wfl_workflow w1
                 WHERE i.status = -1
                   AND i.created_by = 10861
                   AND i.workflow_id = w1.workflow_id
                   AND NOT EXISTS
                 (SELECT 1
                          FROM wfl_workflow_instance a, wfl_workflow w2
                         WHERE a.instance_id > i.instance_id
                           AND a.workflow_id = w2.workflow_id
                           AND w1.workflow_category = w2.workflow_category
                           AND a.instance_param = i.instance_param)
                 GROUP BY w1.workflow_category, i.instance_param) t,
               wfl_workflow_instance i,
               wfl_workflow_vl wf
         WHERE i.instance_id = t.instance_id
           AND i.workflow_id = wf.workflow_id) s,
       wfl_approve_record_v v
 where v.instance_id = s.instance_id;
 
 --repairforms_backup
 create table REPAIR_FORMS_BACKUP
(
  REPAIRFORMID           NUMBER not null,
  REPAIRFORMNUMBER       VARCHAR2(20),
  REPAIRMANJOBNUMBER     VARCHAR2(10),
  REPAIRMANNAME          VARCHAR2(10),
  REPAIRDEPTCODE         VARCHAR2(20),
  REPAIRDEPTNAME         VARCHAR2(240),
  COMPUTERCODE           VARCHAR2(20),
  SYSTEMNAME             VARCHAR2(240),
  REPAIRTYPECODE         VARCHAR2(20),
  REPAIRDATE             DATE,
  REPAIRCONTENT          VARCHAR2(1000),
  REPAIRATTACHMENTID     NUMBER,
  HANDLERESULT           VARCHAR2(1),
  SCHEMEASSESSMENT       VARCHAR2(1000),
  SCHEMEATTACHMENTID     NUMBER,
  ESTIMATELABORHOUR      NUMBER,
  PLANFINISHDATE         DATE,
  APPROVALLABORHOUR      NUMBER,
  SUGGESTFINISHDATE      DATE,
  SCHEDULING             VARCHAR2(1000),
  SCHEDULINGATTACHMENTID NUMBER,
  HANDLINGSUGGESTION     VARCHAR2(1000),
  DEPTSUGGESTION         VARCHAR2(1000),
  SOURCETYPE             VARCHAR2(10),
  REASONTYPE             VARCHAR2(10),
  MAINTENANCETYPE        VARCHAR2(10),
  MAINTENANCECONTENT     VARCHAR2(1000),
  USERSSATISFACTION      VARCHAR2(10),
  EVALUATIONCONTENT      VARCHAR2(1000),
  STATUS                 VARCHAR2(10),
  ACCEPTPEOPLECODE       VARCHAR2(10),
  ACCEPTPEOPLE           VARCHAR2(20),
  ACCEPTTIME             DATE,
  RESPONSIBLEPERSONCODE  VARCHAR2(10),
  RESPONSIBLEPERSON      VARCHAR2(20),
  CREATEBY               VARCHAR2(10),
  CREATETIME             DATE,
  UPDATEBY               VARCHAR2(10),
  UPDATETIME             DATE,
  ATTRIBUTE1             VARCHAR2(240),
  ATTRIBUTE2             VARCHAR2(240),
  ATTRIBUTE3             VARCHAR2(240),
  ATTRIBUTE4             VARCHAR2(240),
  ATTRIBUTE5             VARCHAR2(240),
  ATTRIBUTE6             VARCHAR2(240),
  ATTRIBUTE7             VARCHAR2(240),
  ATTRIBUTE8             VARCHAR2(240),
  ATTRIBUTE9             VARCHAR2(240),
  ATTRIBUTE10            VARCHAR2(240),
  ATTRIBUTE11            VARCHAR2(240),
  ATTRIBUTE12            VARCHAR2(240),
  ATTRIBUTE13            VARCHAR2(240),
  ATTRIBUTE14            VARCHAR2(240),
  ATTRIBUTE15            VARCHAR2(240),
  PHONE                  VARCHAR2(20),
  SYSTEMCODE             VARCHAR2(10),
  REPAIRFORMPHONE        VARCHAR2(15),
  LAST_UPDATED_BY        NVARCHAR2(10),
  LAST_UPDATE_DATE       DATE,
  MANAGE_ID              NUMBER,
  UNIT_ACCEPTER_CODE     VARCHAR2(10),
  UNIT_ACCEPTER_NAME     VARCHAR2(20)
)
 
tablespace HEC
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column REPAIR_FORMS.ATTRIBUTE1
  is '判断是否到昆仑运维';
comment on column REPAIR_FORMS.ATTRIBUTE2
  is '判断是否到运改部';
comment on column REPAIR_FORMS.ATTRIBUTE3
  is '判断是否到运改部室主任';
comment on column REPAIR_FORMS.ATTRIBUTE4
  is '判断是否到运改部领导';
comment on column REPAIR_FORMS.ATTRIBUTE5
  is '判断运改部领导是否要确认';
comment on column REPAIR_FORMS.UNIT_ACCEPTER_CODE
  is '单位内部审核人员工号';
comment on column REPAIR_FORMS.UNIT_ACCEPTER_NAME
  is '单位内部审核人员名字';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPAIR_FORMS
  add constraint REPAIR_FORMS_PK primary key (REPAIRFORMID)
  using index 
  tablespace HEC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );                 
  
  SELECT
    t1.SUPPLIER_ID,
    t1.SUPPLIER_NAME,
    t1.SUPPLIER_CODE,
    t1.VENDORS_CODE,
    t1.CORPORATION,
    t1.ENROL_AMOUNT,
    t1.ENROL_DATE
FROM
    SPL_SUPPLIERS_BASE_INFO t1
WHERE
    t1.login_name=
    lower((SELECT u.user_name FROM sys_user u WHERE u.user_id=13580))      
    
    
    
 

    
    