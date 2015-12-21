--凭证单据表
 SELECT cc.*,cc.rowid FROM bid_cost_certificate cc WHERE /*cc.create_date >SYSDATE-0.5
      AND*/ cc.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')
 
--基本账户表
  SELECT bb.*,bb.rowid FROM bid_cost_base_account bb WHERE /*bb.create_date >SYSDATE-0.5
      AND*/ bb.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')
      
--汇总账户表
  SELECT ct.*,ct.rowid FROM bid_cost_cash_totals ct WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ ct.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')

--明细账户表
  SELECT cd.*,cd.rowid FROM bid_cost_cash_details cd WHERE /*cd.create_date>SYSDATE-0.5
      AND*/ cd.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')

--退款记录表：
  SELECT dr.*,dr.rowid FROM bid_cost_drawback_record dr WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ dr.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')

--费用收入表：
  SELECT cp.*,cp.rowid FROM bid_cost_cut_payment cp WHERE /*ct.create_date>SYSDATE-0.5
      AND*/ cp.account_name IN ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')

--委托投标人表：
   --注意：上述其它各表的测试数据，如必要都可以删除，再通过前台测试而生成，只有本表的记录是在其它业务中产生的，在此只能编辑有关字段，不能删除某条记录！！
   SELECT 
cs.baozhj_cl_status,cs.baozhj_cl_type,cs.baozhj_cl_date,cs.baozhj_cl_memo,--保证金有关字段
cs.file_sale_flag,cs.sales_flag,  --文件费（工本费）有关字段
cs.*,cs.rowid  
        FROM   SRC_CONSIGN_SUPPLIERS      CS WHERE cs.consign_header_id=16811
   强调：此表数据记录不可删除，只可修改字段内容！！！
   --注释：保障金处理状态 baozhj_cl_status：  /0.未收/1.已收/2.拟退待审核/3.拟退已同意/4.拟退已否决/5.已退款(已返回)/9.放弃/其他：保证金状态错误
 

--保证金处理建议记录表：
  SELECT jl.*,jl.rowid FROM bid_cost_bzj_chuli_jl jl WHERE --jl.create_date>SYSDATE-0.5
      jl.supplier_name IN  ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')
      
--冲红请求操作记录表：
  SELECT rj.*,rj.rowid FROM bid_cost_wrt_red_op_jl rj WHERE rj.supplier_name IN
      ('广东铂亚信息技术股份有限公司','广州市金税信息系统集成有限公司','蓝盾信息安全技术有限公司','广东省信息工程有限公司','北明软件股份有限公司')
            
--退款建议记录表：
SELECT jl.drawback_apprv_flag,jl.*,jl.rowid FROM BID_COST_DRAWBACK_OP_JL jl
