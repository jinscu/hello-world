--将W5表数据插入到W6表
MERGE INTO TACAIM6 M1
USING (select ACCOUNT,
              PRODUCT_CODE,
              AC_ROUTE,
              MAT_NO,
              sum(decode(BACK_CODE_2, ' ', wt, 0)) as nrml_wt,
              sum(decode(BACK_CODE_2, 'W1L', wt, 0)) as undue_wt,
              sum(decode(BACK_CODE_2, 'W2', wt, 0)) as unacep_wt
         from (select A.ACCOUNT,
                      A.PRODUCT_CODE,
                      A.AC_ROUTE,
                      A.MAT_NO,
                      A.ACCOUNT_TITLE_ITEM,
                      A.BACK_CODE_2,
                      decode(B.ACCOUNT_SYMBOL, '-', -1, 1) * A.MAT_ACT_WT as wt
                 from tacaiw5 A, tacait2 B
                where A.ACCOUNT = B.ACCOUNT
                  and A.ACCOUNT_TITLE_ITEM = B.ACCOUNT_TITLE_ITEM
                  and B.YEAR = &YEAR
                  and A.ACCOUNT = &ACCOUNT)
        group by ACCOUNT, PRODUCT_CODE, AC_ROUTE, MAT_NO
        order by ACCOUNT, PRODUCT_CODE, AC_ROUTE, MAT_NO) C2
ON (M1.ACCOUNT = C2.ACCOUNT AND M1.PRODUCT_CODE = C2.PRODUCT_CODE AND M1.MAT_NO = C2.MAT_NO AND M1.AC_ROUTE = C2.AC_ROUTE)
WHEN MATCHED THEN
  UPDATE
     SET M1.AI_NRML_STORE_WG   = M1.AI_NRML_STORE_WG + C2.nrml_wt,
         M1.AI_UNDUE_STORE_WG  = M1.AI_UNDUE_STORE_WG + C2.undue_wt,
         M1.AI_UNACEP_STORE_WG = M1.AI_UNACEP_STORE_WG + C2.unacep_wt
WHEN NOT MATCHED THEN
  INSERT
    (M1.ACCOUNT,
     M1.PRODUCT_CODE,
     M1.AC_ROUTE,
     M1.MAT_NO,
     M1.AI_NRML_STORE_WG,
     M1.AI_UNDUE_STORE_WG,
     M1.AI_UNACEP_STORE_WG)
  VALUES
    (C2.ACCOUNT,
     C2.PRODUCT_CODE,
     C2.AC_ROUTE,
     C2.MAT_NO,
     C2.nrml_wt,
     C2.undue_wt,
     C2.unacep_wt)
;tacaim4

--画面ACAI13  产副品交易暂存档资料维护
select t.rowid,t.* from TACAIm6 t where control_num = '151694';
select count(*) from tacaiw1l;  --7873
select distinct count(control_num) from tacaiw1l;
--画面ACAI16 产副品与存货大类对账查询
select t.rowid,t.* from  TACAIM4 t;--大类对账表
select * from tacaiwb where  app_code = 'IC'
--画面ACAI31 产副品检核错误信息查询
select t.rowid,t.* from TACAIRP t WHERE account = '1602' and REPORT_CODE= 'AIR34' AND VERSION_NUM=0;

select count(*) from 
tacaiiw
SELECT * from TACAIW1L where 1=2
--tacaiip 

;
                             
select rowid,t.* from tacamta t  where t.energy_code1 = 'A601'                               ;

tacaier          ;

select * from tacaiip;

select * from tacaic2;

select t.rowid,t.* from tacard1 t where t.account_period = '201507' and account = '1602';

select * from tacard1 t,tacard1 t1 where t.account = t1.account and t.account_period = t1.account_period;

SELECT sum(weight_ac) AS WEIGHT_AC FROM TACAIM1  
       where account = '1602' 
       and account_title_item = '02' 
       and product_code IN('Z1400', 'Z1410') 
       and year_mon = '201508'--@year_mon 
       group by product_code

select *
  from tacard1 t,
       (select distinct ACCOUNT,
                        ACCOUNT_PERIOD,
                        WORK_DATE,
                        AREA_CODE,
                        MAT_CODE,
                        PSCS_MAT_CODE,
                        MAT_NAME,
                        THROW_MODE,
                        rowid
          from tacard1) t1
 where t.rowid = t1.rowid
 t.account = t1.account
   and t.ACCOUNT_PERIOD = t1.ACCOUNT_PERIOD
   and t.WORK_DATE = t1.WORK_DATE
   and t.AREA_CODE = t1.AREA_CODE
   and t.MAT_CODE = t1.MAT_CODE
   and t.PSCS_MAT_CODE = t1.PSCS_MAT_CODE
   and t.MAT_NAME = t1.MAT_NAME
   and t.THROW_MODE = t1.THROW_MODE;
   
select t.rowid,t.* from TACAIWAL t;

select t.rowid,t.* from TACAIfx t;
   select * from tacaiis where MAT_ACT_WT<0;

select t.rowid,t.* from tacaiM6 t;

SELECT * FROM TACAIM6 WHERE PRODUCT_CODE = 'B3210';

update TACARLG lg
   set lg.wce =
       (select wce
          from tacarta a
         where a.account = lg.account
           and a.material_code = lg.mat_code
           and a.trade_type = '31A'
           and nvl(trim(lg.cost_center), 1) =
               decode(trim(lg.cost_center), null, 1, a.cost_center))
 where lg.account = &account
   and lg.account_period = &period
 
 update TACARLG lg
    set lg.wce =
        NVL((select wce
           from tacarta a
          where a.account = lg.account
            and a.material_code = lg.mat_code
            and a.trade_type = '31A'
            and nvl(trim(lg.cost_center), '1') =
                decode(trim(lg.cost_center), null, '1', a.cost_center)),' ')
  where lg.account = &account
    and lg.account_period = &period
 
 select t.account,
        t.account_period,
        t.cost_center,
        t.wce,
        t.product_code,
        t.quantity
   from TACARLG t
  where t.account = &account
    and t.account_period = &period
    and trim(t.product_code) is not null

delete  from tacaitq;
--相关接口表
tacaiis,tacaiiw,tacaiip,tacaifx,tacaiih,tacaitq;
tacaiiq,tacaiic,tacaiib;
select * from tacaigy;TACAIC1

--------------------
 select *
   from tacaiw1
  WHERE ACCOUNT = &account
    AND PRODUCT_CODE || TRIM(case
                               when SUBSTR(PRODUCT_CODE, 3, 1) in ('0', '2', '4', '6', '8') then
                                (case
                                  when ACCOUNT_TITLE_ITEM in ('01', '31', '72') then
                                   COST_CENTER
                                  else
                                   ' '
                                end)
                               when SUBSTR(PRODUCT_CODE, 3, 1) in ('1', '3', '5', '7', '9') then
                                decode(ACCOUNT_TITLE_ITEM, '72', COST_CENTER, ' ')
                               else
                                ' '
                             end) || ACCOUNT_TITLE_ITEM NOT IN
        (SELECT DISTINCT (PRODUCT_CODE || TRIM(case
                                                 when SUBSTR(PRODUCT_CODE, 3, 1) in
                                                      ('0', '2', '4', '6', '8') then
                                                  (case
                                                    when ACCOUNT_TITLE_ITEM in ('01', '31', '72') then
                                                     COST_CENTER
                                                    else
                                                     ' '
                                                  end)
                                                 when SUBSTR(PRODUCT_CODE, 3, 1) in
                                                      ('1', '3', '5', '7', '9') then
                                                  decode(ACCOUNT_TITLE_ITEM, '72', COST_CENTER, ' ')
                                                 else
                                                  ' '
                                               end) || ACCOUNT_TITLE_ITEM)
           FROM TACAIT4
          WHERE ACCOUNT = &account
            AND YEAR = &year
            AND SEQ_NUM_1 = '1')
    AND CHECK_ERROR_CODE = ' '
    AND BACK_CODE_1 = ' '
    AND SUBSTR(ACCOUNT_TITLE_ITEM, 1, 1) <> '9'
    and ACCOUNT_TITLE_ITEM <> '00'


