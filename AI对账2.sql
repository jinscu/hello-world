--厚板
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1602' and product_code='J0110' and mat_no='P0000032049'; --成本明细库存表
select sum(MAT_NET_WT) from tmmhp01_dz where company_code='1602' and product_code='J0120' and CUST_MAT_NO='P0000032049'; --交易快照表
select sum(MAT_ACT_WT) from tmmhp01 where company_code='1602' and product_code='J0110' and MAT_NO='P0000032049';--生产库存表
select sum(MAT_ACT_WT) from hmmhp01 where company_code='1602' and product_code='J0110' and MAT_NO='P0000032049';--生产库存历史表
select sum(MAT_ACT_WT) from tacaiwam where account='1602' and product_code='J0110' and mat_no='P0000032049';
select * from tacaim4 where account='1602' and product_code='J0110' and mat_no='P0000032049';


--坯子
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='T2210' and mat_no='5G50772203';
select sum(mat_net_wt) from TMMSM01_dz where company_code='1641' and product_code='T2210' and CUST_MAT_NO='5G50772203';
select sum(MAT_ACT_WT) from TMMSM01 where company_code='1641' and product_code='T2210' and MAT_NO='5G50772203';
select sum(MAT_ACT_WT) from hMMSM01 where company_code='1641' and product_code='T2210' and MAT_NO='5G50772203';
select * from hMMSM01 where company_code='1641' and product_code='T2210' and MAT_NO='5G50772203';

--线棒
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1602' and product_code='J0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from TMMBW01_dz where company_code='1602' and product_code='J0110' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from TMMBW01 where company_code='1602' and product_code='J0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hMMBW01 where company_code='1602' and product_code='J0210' and MAT_NO='8E5C05002000';

--特钢
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1602' and product_code='J0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from TMMCW01_dz where company_code='1602' and product_code='J0110' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from TMMCW01 where company_code='1602' and product_code='J0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hMMCW01 where company_code='1602' and product_code='J0210' and MAT_NO='8E5C05002000';


select sum(MAT_ACT_WT) from TMMSM01 where company_code='1602' and product_code='Z0210';
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1602' and product_code='Z0210';
select sum(MAT_NET_WT) from TMMSM01_dz where company_code='1602' and product_code='Z0210';

select sum(MAT_ACT_WT) from LTMMSM01_test where company_code='1602' and product_code='Z0210';


--产品
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1602' and product_code='T2110' and mat_no='P0000032049'; --成本明细库存表
select sum(MAT_NET_WT) from tsmdf54_dz where company_code='1641' and product_code='T2110' and CUST_MAT_NO='P0000032049'; --交易快照表
select sum(MAT_ACT_WT) from tsmdf54 where company_code='1602' and product_code='T2110' and MAT_NO='P0000032049';--生产库存表
select sum(MAT_ACT_WT) from hmmhp01 where company_code='1602' and product_code='T2110' and MAT_NO='P0000032049';--生产库存历史表
select sum(MAT_ACT_WT) from tacaiwam where account='1602' and product_code='J0120' and mat_no='P0000032049';
select * from tacaim4 where account='1602' and product_code='J0120' and mat_no='P0000032049';
