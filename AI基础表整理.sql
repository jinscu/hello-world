--产副品代码表
select product_code,crrt_year_std_amt,correction,ac_route from TACAIT1;
select * from tacaim6;--产副品明细库存主档
select * from tacaiis where ;
select * from tacaim4;--产副品与存货大类对账档
select rowid,t.* from tacaim1 t where 1=2;
--月作业暂存档W1
select max(control_num) from tacairp t;--3392
--控制序号档，和取会计期表
select t.rowid,t.* from tacaic1 t;
--WA表的年备份表
select t.rowid,t.* from tacaiwam t;

--会计期表
select account,close_mon,control_num from TACAIC1

--账务代码对应的账务符号标识
select ACCOUNT_TITLE_ITEM,account_symbol from TACAIT2;

--画面ACAI13  产副品交易暂存档资料维护
select t.rowid,t.* from TACAIW1 t;

--画面ACAI16 产副品与存货大类对账查询
select t.rowid,t.* from  TACAIM4 t;--大类对账表

--画面ACAI31 产副品检核错误信息查询
select t.rowid,t.* from TACAIRP t WHERE account = '1602' and REPORT_CODE= 'AIR34' AND VERSION_NUM=0;

--规则表
select t.rowid,t.* from tacaic2 t where  weight_symbol_2 = '_';
update tacaic2 set weight_symbol_2 = '-' where  weight_symbol_2 = '_';


--相关接口表
select t.rowid,t.* from tacaiis t where t.rec_creator = 'acairt_dois';
tacaiiw,tacaiip,tacaifx,tacaiih,tacaitq;
tacaiiq,tacaiic,tacaiib;
select t.*, rowid
--count(*)
  from TACAIW2 t
 where t.product_code = '83620'
   and account_title_item = '31'
   and control_num = '43715'; --日交易数据暂存档
  
  select count(*), control_num
    from tacaiw1
   where account = '1602'
     and app_trnc_date = '20150731'
     group by  control_num having count(*) > 1 ;
     
select rowid,t.* from tacaiis t where 
--APP_TRNC_DATE = '20151130' and 
APP_TRANSACTION_T = '100000' and REC_CREATOR = 'acairt_dois' ;

select * from tacaiis t where t.rec_creator = 'acairt_dois'
select * from tacaim1 where product_code = '83210';
select * from tacairt      ;
select rowid,t.* from tacaim1 t where 1=2t.account = '1641' and year_mon = '201507' and product_code in ('71400','83210','83610','B3210', 'B3610', 'T2210');
select rowid,t.* from tacaiwam t  where t.mat_no = 'Z30687310444'    ;

   ;backlog 
     
