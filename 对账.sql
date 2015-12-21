--ºñ°å
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='J0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from tmmhp01_dz where company_code='1641' and product_code='J0210' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from tmmhp01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hmmhp01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';

--Å÷×Ó
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='Z0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from TMMSM01_dz where company_code='1641' and product_code='Z0210' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from TMMSM01 where company_code='1641' and product_code='Z0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hMMSM01 where company_code='1641' and product_code='Z0210' and MAT_NO='8E5C05002000';

--Ïß°ô
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='J0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from TMMBW01_dz where company_code='1641' and product_code='J0210' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from TMMBW01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hMMBW01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';

--ÌØ¸Ö
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='J0210' and mat_no='8E5C05002000';
select sum(MAT_NET_WT) from TMMCW01_dz where company_code='1641' and product_code='J0210' and CUST_MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from TMMCW01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';
select sum(MAT_ACT_WT) from hMMCW01 where company_code='1641' and product_code='J0210' and MAT_NO='8E5C05002000';


select sum(MAT_ACT_WT) from TMMSM01 where company_code='1641' and product_code='Z0210';
select sum(AI_STORE_WEIGHT) from tacaim6 where account='1641' and product_code='Z0210';
select sum(MAT_NET_WT) from TMMSM01_dz where company_code='1641' and product_code='Z0210';

select sum(MAT_ACT_WT) from LTMMSM01_test where company_code='1641' and product_code='Z0210';
