-----------用户-------------------------------------------------------- 
SELECT * FROM SYS_USER U WHERE U.USER_ID = 13506; --用户表
SELECT * FROM SYS_ROLE R WHERE R.ROLE_CODE = 'TBZC_USER'; --角色表 
SELECT E.EMPLOYEE_CODE FROM EXP_EMPLOYEES E WHERE E.NAME = '邓凯';
SELECT * FROM WFL_EMPLOYEE_ASSIGNS_V; --工作流员工分配视图表
SELECT * FROM WFL_USERS_V; --工作流用户表  
SELECT *
  FROM SYS_USER_ROLE_GROUPS R, SYS_USER U
 WHERE R.USER_ID = U.USER_ID; --角色组表          
 SELECT V.PERSON_CODE
  FROM EHR_PERSON_BASIC_V V
 WHERE CORP_CODE = 'BSKH'
   AND V.PERSON_NAME = '陈景雄'; --获取员工编码表
SELECT * FROM EXP_ORG_UNIT_VL U WHERE U.UNIT_CODE = 'DEPT_001';
SELECT * FROM FND_COMPANIES_VL;
SELECT * FROM EXP_EMPLOYEE_TYPES_VL; --员工类型表

---------公司单位------------------------------------------------------------ 
SELECT * FROM FND_COMPANIES; --公司表
SELECT * FROM EXP_ORG_POSITION; --岗位表   
SELECT * FROM EXP_ORG_UNIT; --单位表
SELECT * FROM EXP_EMPLOYEE_ASSIGNS; --岗位分配表，获取主岗位  

--------系统功能--------------------------------------------------
SELECT * FROM SYS_FUNCTION;
SELECT C.*, C.CODE_VALUE_NAME
  FROM SYS_CODE_VALUES_V C
 WHERE C.CODE = 'KLYW_REQUISITION_STATUS';
SELECT *
  FROM FND_DESCRIPTIONS FD
 WHERE FD.DESCRIPTION_ID = '3484'
   AND FD.LANGUAGE = 'ZHS'; --系统描述表   
SELECT * FROM FND_INTERFACE_HEADERS; --头表
SELECT * FROM FND_INTERFACE_LINES WHERE HEADER_ID = 142; --行表     
SELECT * FROM FND_CODING_RULE_OBJECTS FOR UPDATE NOWAIT; --编码规则 
 
---------附件-----------------------------------------------------------
FND_ATM_ATTACHMENT_MULTI
FND_FILEUPLOAD

-------运维表--------------------------------------------------------------
SELECT * FROM KLYW_SYSTEM_AT_MANAGE K WHERE K.CONTACT_CODE = '00000'; --系统管理表
SELECT * FROM KLYW_TEMP_TABLE FOR UPDATE NOWAIT; --临时表,excel导入数据时可能会用到
SELECT * FROM TRO_TYPE WHERE TRO_TYPE_TYPE = '特钢检化验系统'; --故障类型
SELECT * FROM REPAIR_FORMS FOR UPDATE; --订单表select * from repair_forms_backup;
SELECT * FROM WFL_APPROVE_RECORD_V; --审批者记录
SELECT *
  FROM WFL_UNIT_V T；
        SELECT T.UNIT_CODE, F.LANGUAGE
          FROM EXP_ORG_UNIT T, FND_DESCRIPTIONS F
         WHERE T.DESCRIPTION_ID = F.DESCRIPTION_ID
           AND F.DESCRIPTION_TEXT = '广东韶钢松山股份有限公司-公司办公室'; --获取单位部门名称
SELECT FND_INTERFACE_HEADERS_S.NEXTVAL HEADER_ID FROM DUAL;
SEL_EXCEL_IMPORT_PKG; --Excel数据导入
SELECT * FROM ASSETS_TYPE; --资产表
SELECT W.*, W.DISPLAY_FORM FROM WFL_WORKFLOW W;

----------------工作流--------------------------
SELECT * FROM REPAIR_FORMS FOR UPDATE; --订单表
SELECT * FROM WFL_WORKFLOW; --工作流类型，工作流代码
SELECT * FROM WFL_DOCUMENT_REFERENCE; --记录工作流类型-关联表
SELECT *
  FROM FND_DESCRIPTIONS FD
 WHERE FD.DESCRIPTION_ID =
       (SELECT R.DESCRIPTION_ID
          FROM WFL_DOCUMENT_REFERENCE R
         WHERE R.WORKFLOW_CATEGORY = 'WFL_JIN'); --查询描述
SELECT * FROM WFL_WORKFLOW_INSTANCE T WHERE T.WORKFLOW_ID = 6; --工作流实例表-关键是该表要有记录
SELECT * FROM WFL_WORKFLOW_NODE；; --工作流节点表             
SELECT * FROM WFL_WORKFLOW_NODE_ACTION; --节点动作表    
SELECT * FROM WFL_WORKFLOW_ACTION;
SELECT * FROM WFL_WORKFLOW_ACTION_VL AC WHERE AC.ACTION_TITLE = '不同意'; --包含动作描述：action_title
-------------相关包-------------------------------
KLYW_BX_PKG;
KLYW_BX_TEST_PKG; --运维平台工作流包
WFL_CORE_PKG； WFL_DOCUMENT_REFERENCE_PKG;
WFL_LOG_PKG;
WFL_WORKFLOW --（存储工作流信息）
SYS_RAISE_APP_ERRORS --错误查询表
WFL_INSTANCE_LOG --日志记录表
SYS_SESSION_PKG --session设置包
WFL_APPROVE_RECORD --（审批记录表）
  SELECT * FROM WFL_USERS_V WV WHERE WV.EMPLOYEE_NAME = '陈亮'; --工作流用户表
FND_CODING_RULE_OBJECTS; --编码规则表
SYS_LOGIN_PKG --密码加密包
--该过程与表wfl_document_reference关联
BEGIN WFL_DOCUMENT_REFERENCE_PKG.LOAD_WFL_DOCUMENT_REFERENCE('WFL_JIN',
                                                             'WFL_JIN',
                                                             'repair_forms',
                                                             'repairformid',
                                                             'repairformnumber	',
                                                             '',
                                                             'created_by',
                                                             '',
                                                             'Y',
                                                             'ZHS',
                                                             1);

END;