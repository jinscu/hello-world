-----------�û�-------------------------------------------------------- 
SELECT * FROM SYS_USER U WHERE U.USER_ID = 13506; --�û���
SELECT * FROM SYS_ROLE R WHERE R.ROLE_CODE = 'TBZC_USER'; --��ɫ�� 
SELECT E.EMPLOYEE_CODE FROM EXP_EMPLOYEES E WHERE E.NAME = '�˿�';
SELECT * FROM WFL_EMPLOYEE_ASSIGNS_V; --������Ա��������ͼ��
SELECT * FROM WFL_USERS_V; --�������û���  
SELECT *
  FROM SYS_USER_ROLE_GROUPS R, SYS_USER U
 WHERE R.USER_ID = U.USER_ID; --��ɫ���          
 SELECT V.PERSON_CODE
  FROM EHR_PERSON_BASIC_V V
 WHERE CORP_CODE = 'BSKH'
   AND V.PERSON_NAME = '�¾���'; --��ȡԱ�������
SELECT * FROM EXP_ORG_UNIT_VL U WHERE U.UNIT_CODE = 'DEPT_001';
SELECT * FROM FND_COMPANIES_VL;
SELECT * FROM EXP_EMPLOYEE_TYPES_VL; --Ա�����ͱ�

---------��˾��λ------------------------------------------------------------ 
SELECT * FROM FND_COMPANIES; --��˾��
SELECT * FROM EXP_ORG_POSITION; --��λ��   
SELECT * FROM EXP_ORG_UNIT; --��λ��
SELECT * FROM EXP_EMPLOYEE_ASSIGNS; --��λ�������ȡ����λ  

--------ϵͳ����--------------------------------------------------
SELECT * FROM SYS_FUNCTION;
SELECT C.*, C.CODE_VALUE_NAME
  FROM SYS_CODE_VALUES_V C
 WHERE C.CODE = 'KLYW_REQUISITION_STATUS';
SELECT *
  FROM FND_DESCRIPTIONS FD
 WHERE FD.DESCRIPTION_ID = '3484'
   AND FD.LANGUAGE = 'ZHS'; --ϵͳ������   
SELECT * FROM FND_INTERFACE_HEADERS; --ͷ��
SELECT * FROM FND_INTERFACE_LINES WHERE HEADER_ID = 142; --�б�     
SELECT * FROM FND_CODING_RULE_OBJECTS FOR UPDATE NOWAIT; --������� 
 
---------����-----------------------------------------------------------
FND_ATM_ATTACHMENT_MULTI
FND_FILEUPLOAD

-------��ά��--------------------------------------------------------------
SELECT * FROM KLYW_SYSTEM_AT_MANAGE K WHERE K.CONTACT_CODE = '00000'; --ϵͳ�����
SELECT * FROM KLYW_TEMP_TABLE FOR UPDATE NOWAIT; --��ʱ��,excel��������ʱ���ܻ��õ�
SELECT * FROM TRO_TYPE WHERE TRO_TYPE_TYPE = '�ظּ컯��ϵͳ'; --��������
SELECT * FROM REPAIR_FORMS FOR UPDATE; --������select * from repair_forms_backup;
SELECT * FROM WFL_APPROVE_RECORD_V; --�����߼�¼
SELECT *
  FROM WFL_UNIT_V T��
        SELECT T.UNIT_CODE, F.LANGUAGE
          FROM EXP_ORG_UNIT T, FND_DESCRIPTIONS F
         WHERE T.DESCRIPTION_ID = F.DESCRIPTION_ID
           AND F.DESCRIPTION_TEXT = '�㶫�ظ���ɽ�ɷ����޹�˾-��˾�칫��'; --��ȡ��λ��������
SELECT FND_INTERFACE_HEADERS_S.NEXTVAL HEADER_ID FROM DUAL;
SEL_EXCEL_IMPORT_PKG; --Excel���ݵ���
SELECT * FROM ASSETS_TYPE; --�ʲ���
SELECT W.*, W.DISPLAY_FORM FROM WFL_WORKFLOW W;

----------------������--------------------------
SELECT * FROM REPAIR_FORMS FOR UPDATE; --������
SELECT * FROM WFL_WORKFLOW; --���������ͣ�����������
SELECT * FROM WFL_DOCUMENT_REFERENCE; --��¼����������-������
SELECT *
  FROM FND_DESCRIPTIONS FD
 WHERE FD.DESCRIPTION_ID =
       (SELECT R.DESCRIPTION_ID
          FROM WFL_DOCUMENT_REFERENCE R
         WHERE R.WORKFLOW_CATEGORY = 'WFL_JIN'); --��ѯ����
SELECT * FROM WFL_WORKFLOW_INSTANCE T WHERE T.WORKFLOW_ID = 6; --������ʵ����-�ؼ��Ǹñ�Ҫ�м�¼
SELECT * FROM WFL_WORKFLOW_NODE��; --�������ڵ��             
SELECT * FROM WFL_WORKFLOW_NODE_ACTION; --�ڵ㶯����    
SELECT * FROM WFL_WORKFLOW_ACTION;
SELECT * FROM WFL_WORKFLOW_ACTION_VL AC WHERE AC.ACTION_TITLE = '��ͬ��'; --��������������action_title
-------------��ذ�-------------------------------
KLYW_BX_PKG;
KLYW_BX_TEST_PKG; --��άƽ̨��������
WFL_CORE_PKG�� WFL_DOCUMENT_REFERENCE_PKG;
WFL_LOG_PKG;
WFL_WORKFLOW --���洢��������Ϣ��
SYS_RAISE_APP_ERRORS --�����ѯ��
WFL_INSTANCE_LOG --��־��¼��
SYS_SESSION_PKG --session���ð�
WFL_APPROVE_RECORD --��������¼��
  SELECT * FROM WFL_USERS_V WV WHERE WV.EMPLOYEE_NAME = '����'; --�������û���
FND_CODING_RULE_OBJECTS; --��������
SYS_LOGIN_PKG --������ܰ�
--�ù������wfl_document_reference����
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