--������˱�
select rowid,t.* from TMMBW01_DZ t;--�߰�
select rowid,t.* from TMMBW01_MXDZ T where produdct_code = ' ';--��ϸ���˱�
select rowid,t.* from TMMSM01_DZ t;--��
select rowid,t.* from TMMSM01_MXDZ T where product_code = 'J0110';--��ϸ���˱�
select rowid,t.* from TMMHP01_DZ t;--���  
select rowid,t.* from TMMHP01_MXDZ T;--��ϸ���˱�
select rowid,t.* from TMMCW01_DZ t;--�ذ�
select rowid,t.* from TMMCW01_MXDZ T;--��ϸ���˱�
select t.rowid,t.* from TSMDF54_DZ t;--����Ʒ
select t.rowid,t.* from TSMDF54_MXDZ t;

--M4��M6������ˣ��Ƚ�ͬһ������Ʒ��������Ƿ�һ��
select 'M6' AS "TABLE",
       account,
       product_code,
       sum(ai_store_weight) as total_weight,
       sum(ai_nrml_store_wg),
       sum(ai_undue_store_wg),
       sum(ai_unacep_store_wg)
  from TACAIM6 t
 where product_code = 'L0110'
 group by account, product_code
 UNION
select 'M4' AS "TABLE",account,
       product_code,
       (ai_nrml_store_wg+ai_undue_store_wg+ai_unacep_store_wg) as total_weight,
       ai_nrml_store_wg,
       ai_undue_store_wg,
       ai_unacep_store_wg
  from TACAIM4 t
 where product_code = 'L0110';
--���ݱ� 
select account,
       APP_THROW_AI_MODE,
       APP_TRNC_DATE,
       PRODUCT_CODE,
       ACCOUNT_TITLE_ITEM,
       COST_CENTER,
       MAT_NO,
       MAT_ACT_WT,
       IN_MAT_NO,
       DEVO_PRODUCT_CODE,
       IN_MAT_WT_AI--,
       --TOWARD_MCHN_MODE
  from 
--  tacaifxc t
--  tacaiiwc t
--  tacaiipc t
    tacaiisc t
--  tacaiw1 t
--    tacaiwam t
 where t.mat_no = '5G50775219'
 and account = '1602'
 group by mat_no;

select t.rowid,t.* from tacaim1 t;
select t.rowid,t.* from tacaiwa t where t.mat_no = '5Z21005103';
select t.rowid,t.* from tacaim6 t where t.mat_no = '5G50778313';
select t.rowid,t.* from tacaiwa t where t.mat_no = '5G50778313';


--�ڳ�����
select product_code,sum(mat_act_wt) from TMMCW01 group by product_code;
select product_code,sum(mat_act_wt) from LTMMSM01_TEST group by product_code;
select product_code,sum(mat_act_wt) from LTMMHP01_TEST group by product_code;
select product_code,sum(mat_act_wt) from LTMMBW01_TEST group by product_code;
--��W0�����ڳ�������
select product_code, sum(mat_act_wt)
  from tacaiw0
 where account_title_item = '00'
   and AC_ROUTE = '00'
 group by product_code��
 select distinct account_title_item from tacaiiw
