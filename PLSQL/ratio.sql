select t.*,rowid from tacaim1 t where 1=2;
select rowid,t.* from TACAIRT t;
select rowid,t.* from tacaiis  t where APP_THROW_AI_DATE = '20151130';
select substr(APP_TRNC_DATE,1,6) from tacaiis where APP_THROW_AI_OK = 'Y';

select rowid,t.* from tacairt t

--铁水
select 
rowid,t.*
--sum(weight_ac)
  from tacaim1 t
 where account = '1641'
   and year_mon = '201507'
   and product_code = '71400'
   and account_title_item = '31'  --454634.0634
   
--坯产量
select sum(weight_ac)
  from tacaim1
 where account = '1641'
   and year_mon = '201507'
   and product_code IN ('B3210','B3610','T2210')
   and account_title_item = '01'   --135941.4792
--委托加工
select sum(weight_ac)
  from tacaim1
 where account = '1641'
   and year_mon = '201507'
   and product_code = 'B3610'
   and account_title_item = '01'
