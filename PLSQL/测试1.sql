--ƾ֤���ݱ�
 SELECT cc.*,cc.rowid FROM bid_cost_certificate cc WHERE /*cc.create_date >SYSDATE-0.5
      AND*/ cc.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')
 
--�����˻���
  SELECT bb.*,bb.rowid FROM bid_cost_base_account bb WHERE /*bb.create_date >SYSDATE-0.5
      AND*/ bb.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')
      
--�����˻���
  SELECT ct.*,ct.rowid FROM bid_cost_cash_totals ct WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ ct.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')

--��ϸ�˻���
  SELECT cd.*,cd.rowid FROM bid_cost_cash_details cd WHERE /*cd.create_date>SYSDATE-0.5
      AND*/ cd.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')

--�˿��¼��
  SELECT dr.*,dr.rowid FROM bid_cost_drawback_record dr WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ dr.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')

--���������
  SELECT cp.*,cp.rowid FROM bid_cost_cut_payment cp WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ cp.account_name IN ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')

--ί��Ͷ���˱�
   --ע�⣺������������Ĳ������ݣ����Ҫ������ɾ������ͨ��ǰ̨���Զ����ɣ�ֻ�б���ļ�¼��������ҵ���в����ģ��ڴ�ֻ�ܱ༭�й��ֶΣ�����ɾ��ĳ����¼����
   SELECT 
cs.baozhj_cl_status,cs.baozhj_cl_type,cs.baozhj_cl_date,cs.baozhj_cl_memo,--��֤���й��ֶ�
cs.file_sale_flag,cs.sales_flag,  --�ļ��ѣ������ѣ��й��ֶ�
cs.*,cs.rowid  
        FROM   SRC_CONSIGN_SUPPLIERS      CS WHERE cs.consign_header_id=16811
   ǿ�����˱����ݼ�¼����ɾ����ֻ���޸��ֶ����ݣ�����
   --ע�ͣ����Ͻ���״̬ baozhj_cl_status��  /0.δ��/1.����/2.���˴����/3.������ͬ��/4.�����ѷ��/5.���˿�(�ѷ���)/9.����/��������֤��״̬����
 

--��֤�������¼��
  SELECT jl.*,jl.rowid FROM bid_cost_bzj_chuli_jl jl WHERE --jl.create_date>SYSDATE-0.5
      jl.supplier_name IN  ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')
      
--������������¼��
  SELECT rj.*,rj.rowid FROM bid_cost_wrt_red_op_jl rj WHERE rj.supplier_name IN
      ('�㶫������Ϣ�����ɷ����޹�˾','�����н�˰��Ϣϵͳ�������޹�˾','������Ϣ��ȫ�������޹�˾','�㶫ʡ��Ϣ�������޹�˾','��������ɷ����޹�˾')
            
--�˿���¼��
SELECT jl.drawback_apprv_flag,jl.*,jl.rowid FROM BID_COST_DRAWBACK_OP_JL jl
