--存货对账表
select rowid,t.* from TMMBW01_DZ t;--线棒
select rowid,t.* from TMMBW01_MXDZ T where produdct_code = ' ';--明细对账表；
select rowid,t.* from TMMSM01_DZ t;--坯
select rowid,t.* from TMMSM01_MXDZ T where product_code = 'J0110';--明细对账表；
select rowid,t.* from TMMHP01_DZ t;--厚板  
select rowid,t.* from TMMHP01_MXDZ T;--明细对账表；
select rowid,t.* from TMMCW01_DZ t;--特棒
select rowid,t.* from TMMCW01_MXDZ T;--明细对账表；
select t.rowid,t.* from TSMDF54_DZ t;--产成品
select t.rowid,t.* from TSMDF54_MXDZ t;

--M4和M6大类对账，比较同一个产副品代码的量是否一致
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
--备份表 
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


--期初数据
select product_code,sum(mat_act_wt) from TMMCW01 group by product_code;
select product_code,sum(mat_act_wt) from LTMMSM01_TEST group by product_code;
select product_code,sum(mat_act_wt) from LTMMHP01_TEST group by product_code;
select product_code,sum(mat_act_wt) from LTMMBW01_TEST group by product_code;
--求W0表中期初的数据
select product_code, sum(mat_act_wt)
  from tacaiw0
 where account_title_item = '00'
   and AC_ROUTE = '00'
 group by product_code；
 select distinct account_title_item from tacaiiw
