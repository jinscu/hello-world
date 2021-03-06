--查看工作流监控平台
delete from wfl_workflow_instance t where t.instance_id = '1538';
select t.* from Wfl_Workflow_Vl t
--描述表
select t.rowid,t.* from fnd_descriptions t where t.description_id = 4094
-------------OA接口表-----------------------------------------------------
SELECT *
  FROM SRC_OADB_INTERFACE@PROD
 WHERE SYS_TYPE = '运维管理'
   AND STATE = '请求'; --其中sid字段就是对应表fnd_prv_temp_session中字段：ENCODED_SESSION_ID来找到redirect_url 
SELECT * FROM FND_PRV_TEMP_SESSION T; --redirect_url
SELECT * FROM SYS_SESSION T; --session_id和user_id  
-----------用户账户-------------------------------------------------------- 
SELECT * FROM SYS_USER U; --用户表      
SELECT * FROM WFL_USERS_V W; --工作流用户表
SELECT * FROM EXP_EMPLOYEES E; --员工表
SELECT * FROM WFL_EMPLOYEE_ASSIGNS_V; --工作流员工分配视图表
SELECT * FROM SYS_USER_ROLE_GROUPS R; --角色组表          
SELECT * FROM EHR_PERSON_BASIC_V V; --获取员工编码表
SELECT * FROM EXP_EMPLOYEE_TYPES_VL; --员工类型表
SELECT * FROM SYS_USER_ROLE_GROUPS T;
SELECT * FROM SYS_ROLE T WHERE T.ROLE_ID = '77'; --role_name_id=DESCRIPTION_ID    77（报修审核）

-------------相关包---------------------------------------------------------------
KLYW_BX_PKG; --运维平台核心过程包
KLYW_BX_TEST_PKG; --运维平台测试包
WFL_CORE_PKG; --工作流核心包
WFL_DOCUMENT_REFERENCE_PKG;
WFL_LOG_PKG;
WFL_WORKFLOW --（存储工作流信息）
SYS_RAISE_APP_ERRORS --错误查询表
WFL_INSTANCE_LOG --日志记录表
SYS_SESSION_PKG --session设置包
WFL_APPROVE_RECORD --（审批记录表）
FND_CODING_RULE_OBJECTS; --编码规则表
SYS_LOGIN_PKG; --密码加密包  
SRC_OA_IFACE_PKG; --OA接口包    
SMS_INTERFACE_PKG;--发送短信      
EVT_EVENT_CORE_PKG;
exp_document_history_pkg
---------公司单位------------------------------------------------------------------ 
SELECT * FROM FND_COMPANIES; --公司表         --company_code为20的失效，若分配了该公司则前台岗位和部门定以的数据差不多
SELECT * FROM EXP_ORG_POSITION; --岗位表   
SELECT * FROM EXP_ORG_UNIT; --单位表即部门表   
SELECT * FROM EXP_EMPLOYEE_ASSIGNS; --employee_id->position_id 
SELECT * FROM EXP_ORG_UNIT_VL U;
SELECT * FROM FND_COMPANIES_VL;

--------系统功能---------------------------------------------------------------------
SELECT * FROM SYS_FUNCTION;
SELECT * FROM SYS_SESSION T; --可查看 session_id和login_time
SELECT C.* FROM SYS_CODE_VALUES_V C;
SELECT * FROM FND_DESCRIPTIONS FD; --系统描述表  
SELECT * FROM FND_INTERFACE_HEADERS; --头表
SELECT * FROM FND_INTERFACE_LINES WHERE HEADER_ID = 142; --行表     
SELECT * FROM FND_CODING_RULE_OBJECTS FOR UPDATE NOWAIT; --编码规则 
SELECT * FROM sys_codes a;    --头行表结构
SELECT * FROM sys_code_values v; --在系统代码维护中会用到这两张表    

---------附件---------------------------------------------------------------------------
SELECT * FROM FND_ATM_ATTACHMENT T; --附件的详细具体信息source_pk_value
SELECT * FROM FND_ATM_ATTACHMENT_MULTI T; --table_name和table_pk_value
SELECT * FROM FND_FILEUPLOAD;

---------EXCEL数据导入-------------------------------------------------------------------                                 
SELECT * FROM KLYW_TEMP_TABLE; --自建的临时表用来存放系统名称
SELECT * FROM FND_INTERFACE_HEADERS; --提供header_id  
SELECT * FROM FND_INTERFACE_LINES T; ---系统临时表，用来存储导入的数据
SEL_EXCEL_IMPORT_PKG.INSERT_INTERFACE --系统授权表插入数据的过程
SEL_EXCEL_IMPORT_PKG; --Excel数据导入     

----------运维表-----------------------------------------------------------------------------
select t.rowid,t.* from  KLYW_SYSTEM_AT_MANAGE t where system_type_code >= 56; --系统管理表
select distinct system_type_code,system_type_type from klyw_system_at_manage
SELECT * FROM KLYW_TEMP_TABLE; --临时表,excel导入数据时可能会用到
SELECT * FROM TRO_TYPE T; --故障类型
SELECT * FROM REPAIR_FORMS FOR UPDATE; --订单表select * from repair_forms_backup;
SELECT * FROM WFL_APPROVE_RECORD_V; --审批者记录
SELECT * FROM WFL_UNIT_V;
select * from  wfl_workflow_node_vl t where t.workflow_id =21 ;--查看工作流节点
-----------工作流----------------------------------------------------------------------------
SELECT * FROM REPAIR_FORMS FOR UPDATE; --订单表
SELECT * FROM WFL_WORKFLOW; --工作流类型，工作流代码  
SELECT * FROM WFL_USERS_V; --结合了sys_user 和emp_exployees
SELECT * FROM WFL_DOCUMENT_REFERENCE; --记录工作流类型-关联表   
SELECT * FROM WFL_INSTANCE_NODE_RULE T; --包含了审批规则会调用哪些存储过程：RULE_RECORD_ID     
SELECT * FROM WFL_WORKFLOW_VL F;
SELECT * FROM WFL_WORKFLOW_NODE_VL;
SELECT * FROM WFL_WORKFLOW_INSTANCE T; --工作流实例表-关键是该表要有记录
SELECT * FROM WFL_WORKFLOW_NODE n WHERE n.sequence_num=80; --工作流节点表 node_id,check_proc(校验的存储过程)，pre_node_proc（节点前处理过程）       
SELECT * FROM WFL_WORKFLOW_NODE_ACTION; --节点动作表,只有action_id 需要描述表   
SELECT * FROM WFL_WORKFLOW_ACTION;--action_id
SELECT * FROM WFL_APPROVE_RECORD T; --审批记录表comment_text,node_id,intance_id
SELECT * FROM WFL_INSTANCE_NODE_RECIPIENT T WHERE t.instance_id=1084;--待办事项用户直接看到的待办事项对应的表。用户可以在首页或者待办事项中看到待审批记录。用户审批结束后，将备份该记录，并删除当前待办事项
SELECT * FROM WFL_WORKFLOW_ACTION_VL AC; --包含动作描述：action_title    
SELECT * FROM WFL_INSTANCE_NODE_RULE T WHERE t.rule_record_id=4733; --实例审批规则表，当工作流流转到一个节点时，获取预先定义的审批人规则，插入此表记录。包含了审批规则会调用哪些存储过程  
SELECT * FROM wfl_instance_node_hierarchy w WHERE w.hierarchy_record_id=8207;--审批层次表，与上表连用；对'实例审批规则'每一条记录进行分析，调用每一个审批规则对应的审批人获取过程，创建该规则对应的审批层次记录。
SELECT * FROM WFL_NOTIFICATION_RECORD T; --通知表     
SELECT * FROM wfl_approve_record r WHERE r.instance_id=1084;--记录审批的表,审批记录是判断节点审批类型中是否审批通过的重要依据 
SELECT * FROM WFL_INSTANCE_HISTORIES T; --操作历史表，点了那个按钮，操作者是谁
SELECT * FROM WFL_BUSINESS_RULE_PARAMETERS; --业务规则参数表，parameter_code   
SELECT * FROM Wfl_Business_Rules;--权限规则定义business_rule_code       
select * from wfl_workflow_procedure t  ;--工作流过程设置表

------------工作流配置-----------------------------------------------------------------------
--该过程与表wfl_document_reference关联 工作流模块获取其他业务模块数据关系说明表：WFL_DOCUMENT_REFERENCE
BEGIN
  WFL_DOCUMENT_REFERENCE_PKG.LOAD_WFL_DOCUMENT_REFERENCE('WFL_JIN', --单据类型
                                                         'WFL_JIN', --单据类型的前台描述
                                                         'repair_forms', --单据表
                                                         'repairformid', --单据表的ID字段
                                                         'repairformnumber	', --单据表的number字段
                                                         '',
                                                         'created_by',
                                                         '',
                                                         'Y',
                                                         'ZHS',
                                                         1);

END;

--------------------------------------------------------------------------------------
--表单加密       
SELECT * FROM SRC_ENCRYPT_FORM_TB;
