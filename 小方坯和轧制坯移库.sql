--小方坯移库
--求出小方坯要移库的量
select sum(weight_ac) AS WEIGHT_AC
  from tacaim1
 where account = '1602'
   and account_title_item = '01'
   and product_code = 'B4820'
   and year_mon = &year_mon;
   
--求扎制坯的移库量
select sum(weight_ac)
  from tacaim1
 where account = '1602'
   and account_title_item = '02'
   and product_code IN ('Z1400', 'Z1410')
   --and year_mon = @year_mon
   group by product_code;

select * from tacaiis where 1=2
