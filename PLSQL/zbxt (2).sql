SELECT * FROM SPL_SUPPLIERS_BASE_INFO FOR UPDATE; --��Ͷ���˻�����Ϣ���� 
SELECT * FROM EXP_EMPLOYEES; --��Ա��Ϣ
SELECT * FROM EXP_ORG_UNIT EO; --���ű�    

----------------��ذ�---------------------------------
SGSW_REGISTER; --Ͷ����ע���
SELECT SPL_SUPPLIERS_BASE_INFO_S.NEXTVAL FROM DUAL;
CSG_SUPPLIERS_WFL;
CSG_SRC_SUPPLIER_REGISTRATION;       

------------������------------------------------------
CSG_SRC_SUPPLIER_REGISTRATION --�ύ��������

------------����----------------------------
  SELECT T.ROWID, T.*
    FROM SRC_CONSIGN_SUPPLIERS T
   WHERE T.SUPPLIER_ID = 7523
     AND T.CONSIGN_HEADER_ID = 115; --��ĿͶ���˱�
SELECT T.ROWID, T.* FROM BID_COST_CERTIFICATE T WHERE T.AMOUNT = 33333;
SELECT T.ROWID, T.* FROM BID_COST_CUT_PAYMENT T;
SELECT T.ROWID, T.* FROM BID_COST_CASH_TOTALS T;
SELECT T.ROWID, T.* FROM SRC_SOURCING_INFO T;
SELECT T.ROWID, T.* FROM BID_COST_BASE_ACCOUNT T;
SELECT T.ROWID, T.* FROM T_ZJJK_V_WSYHJSCX_ZBJK_NEW T; --����ϵͳ������ͼ    
SELECT T.ROWID, T.* FROM BID_COST_SPL_ACCOUNT_V T; --�½��ı�ϵͳͶ������ͼ 
-----------��------------------------------------------------------------
KLSW_COST_HANDLE_PKG --�ⶨ���ϰ�   
YEAR_BZJ_TK --��ȱ�֤���˿�
PROJ_BZJ_CL --��Ŀ��֤���˿�     
CAIWU_ND_BZJ_HUANYUAN; --��ȱ�֤��ĳ���/��죨Ҳ����ԭ������
CAIWU_BZJ_HUANYUAN ---��Ŀ��֤��ĳ���/��죨Ҳ����ԭ������    
GET_PROCESSING_STAGE_NAME --����ȡ��֤��Ĵ����׶�           
SRC_SUPPLY_ITEM_PKG;
SRC_SOURCING_INFO_PKG;
SRC_EXPENSE_PKG;

-------------------�޸�------------------------------------------------------------------    
FND_PRV_LOGIN_ACCOUNT --ͣ��       ��Ϊsys_user            

--���ݼ���
SRC_ENCRYPT_FORM_TB