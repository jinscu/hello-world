
--清理接口表
delete tacaiiw t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiis t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiip t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaifx t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaitq t where  t.app_trnc_date like '201509%' and t.account='1602';
-- t where t.account='1602' and t.app_trnc_date like '201507%' ;
--清空备份表（一星期）
delete tacaiiwb t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiisb t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiipb t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaifxb t where  t.app_trnc_date like '201509%' and t.account='1602'; 
--delete tacaitqb t where  t.app_trnc_date like '201509%' and t.account='1602'; 

delete tacaiiwc t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiisc t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiipc t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaifxc t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaitqc t where  t.app_trnc_date like '201509%' and t.account='1602';

--清理暂存档
delete tacaiw0 t where  t.app_trnc_date like '201509%' and t.account='1602'; 
delete tacaiw1 t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiw1l t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiwa t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiwal t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiw2 t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiw5 t where  t.app_trnc_date like '201509%' and t.account='1602';

delete tacaiwb t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiwc t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiwd t where  t.app_trnc_date like '201509%' and t.account='1602';
delete tacaiw4 t where  t.account='1602';

--主档表
delete tacaim1 t where  t.YEAR_MON like '201509%';
delete tacaim2 t where  t.YEAR_MON like '201509%';
delete tacaim3 t where  t.YEAR_MON like '201509%';
delete tacaim4 t where  t.account='1602';
delete tacaim6 t where  t.account='1602';
delete tacaic7 t where  t.account='1602';
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--清理接口表
delete tacaiiw;
delete tacaiis;
delete tacaiip;
delete tacaifx;
delete tacaitq;
-- t where t.account='1602' and t.app_trnc_date like '201507%' ;
--清空备份表（一星期）
delete tacaiiwb;
delete tacaiisb;
delete tacaiipb;
delete tacaifxb; 
--delete tacaitqb; 

delete tacaiiwc;
delete tacaiisc;
delete tacaiipc;
delete tacaifxc;
delete tacaitqc;

--清理暂存档
delete tacaiw0; 
delete tacaiw1;
delete tacaiw1l;
delete tacaiwa;
delete tacaiwal;
delete tacaiw2;
delete tacaiw5;
truncate table tacaiw5;

delete tacaiwb;
delete tacaiwc;
delete tacaiwd;
delete tacaiw4;

--主档表
delete tacaim1;
delete tacaim2;
delete tacaim3;
delete tacaim4;
delete tacaim6;
truncate table tacaim6;
delete tacaic7;
------------------------------------------------------------------------------------------------------------------
--AI数据导入
select t.rowid,t.* from tacaiiw t;
select t.rowid,t.* from tacaiis t;
select t.rowid,t.* from tacaifx t;
------------------------------------------------------------------------------------------------------------------

--查询基础表
select rowid,t.* from tacaiiw t where  t.app_trnc_date like '201509%' and t.account='1602';
select rowid,t.* from tacaiis t where  t.app_trnc_date like '201509%' and t.account='1602';
select rowid,t.* from tacaiip t where  t.app_trnc_date like '201509%' and t.account='1602';
select rowid,t.* from tacaifx t where  t.app_trnc_date like '201509%' and t.account='1602';
select rowid,t.* from tacaitq t where  t.app_trnc_date like '201509%' and t.account='1602';
select rowid,t.* from tacaiwa t where  t.app_trnc_date like '201509%' and t.account='1602';
select * from tesuserinfo where ENAME='admin'  --sgcx_1231
--查询 
select * from  tacaiwa t where  t.account='1602'  and t.app_trnc_date like '201507%' order by control_num;
select * from  tacaiwb t where t.close_mon= '201507' and t.account='1602';
select * from  tacaiwc t where t.app_trnc_date like '201507%' and t.account='1602';
select * from  tacaiwd t where t.app_trnc_date like '201507%' and t.account='1602';

--查询
select * from  tacaiw0 t where t.account='1602' and t.app_trnc_date like '201507%';
select control_num,t.* from  tacaiw1 t where t.rec_creator = 'acaizpyk_do' t.account='1602' and t.app_trnc_date like '20150630%' ;
select * from  tacaiw1l t where t.app_trnc_date like '201507%' and t.account='1602';
select * from  tacaiw2 t where t.app_trnc_date like '201507%' and t.account='1602';
select * from  tacaiw4 t where  t.account='1602';
select * from  tacaiw5 t where t.app_trnc_date like '201507%' and t.account='1602';
select account,control_num from tacaic1 ;--1	1602	195954

select * from  tacaim1 t where t.year_mon like '201507%' and t.account='1602';
select * from  tacaim2 t where t.year_mon like '201507%' and t.account='1602';
delete tacaim2 t where t.account='1602'  and t.year_mon like '201507%';

select * from tacaiac where account = '1602' and year_mon = '201507'
update tacaiac set voucher_num = '1' where account = '1602' and year_mon = '201507'

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


