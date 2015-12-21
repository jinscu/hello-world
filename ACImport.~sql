--成本中心与待摊码对照 
   SELECT    
                 a.ACCOUNT,    
                 a.COST_CENTER,    
                 a.WAIT_DVV_EXPN_CODE,    
                 a.WAIT_DVV_EXPN_CODE_NAME,    
                 a.DELETE_FLAG_1,    
                 a.REC_CREATOR,    
                 a.REC_CREATE_TIME,    
                 a.REC_REVISOR,    
                 a.REC_REVISE_TIME,    
                 b.COST_CENTER_DSCR AS COST_CENTER_CNAME_1    
                       FROM TACAMTD a    
                 LEFT JOIN (SELECT DISTINCT(COST_CENTER),ACCOUNT,COST_CENTER_DSCR    
                      FROM TACACT6    
                      WHERE ACCOUNT = @account     
                      AND   STATUS_CODE_AC != '1'   
                      AND   YEAR LIKE NVL(TRIMN(@year),YEAR)||'%') b    
                 ON a.ACCOUNT = b.ACCOUNT    
                 AND a.COST_CENTER = b.COST_CENTER    
                       WHERE a.ACCOUNT = @account    
                       AND a.COST_CENTER        LIKE NVL(TRIMN(@cost_center),a.COST_CENTER)||'%'    
                       AND a.WAIT_DVV_EXPN_CODE LIKE NVL(TRIMN(@wait_dvv_expn_code),a.WAIT_DVV_EXPN_CODE)||'%'    
                 AND a.DELETE_FLAG_1      <= @delete_flag_1    
                       ORDER BY a.COST_CENTER,a.WAIT_DVV_EXPN_CODE    
--授权                       
select * from TACAMTD where account  = '1602';
select distinct t.account  from TACAMTD t;   

select * from tuser where cname like '%吴%'
select  * from tuserauth where userid in (70,63)


--产副品数据导入
select t.*, t.rowid from TACAIT1 t where account = '1602'
delete from TACAIT1  where account ='1602';

select t.*, t.rowid from TACAIT1 t where  ac_route = '00' and year = '2015' and trimn(account)  is null;

update TACART9 set delete_code = '0' where  account = '1602' and year = '2015' and trimn(account)  is null;
--账面品名代码与大类码对照表维护
select * from tacart6 ;

SELECT 
--DISTINCT MATERIAL_CODE AS MATERIAL_CODE,
             --   MAT_CODE_NAME AS MATERIAL_CODE_NAME
   *          
  FROM TACART9
 WHERE ACCOUNT = '1602' and mat_code in ('FLCrMoNi','FLZBCrMoNi');
 
select * from TACART6 where material_class_code = 'FG';

update tacart6
   set rec_creator     = 'admin',
       rec_revise_time = '20150912161003',
       rec_create_time = '20150912095919',
       rec_revisor     = 'admin'
 where account = '1602' and material_class_code = 'FG'

--原料成本分离依据维护
SELECT DISTINCT   a.ACCOUNT    
                            ,   a.COST_CENTER    
                            ,   a.PRODUCT_CODE    
                            ,   a.BA_OBJECT    
                            ,   a.WCE    
                            ,   a.DIVVY_METHOD    
                            ,   a.START_WCE    
                            ,   a.END_WCE    
                            ,   a.RATIO    
                            ,   b.COST_CENTER_DSCR as COST_CENTER_CNAME    
                            ,   c.WCE_DESCRIPTION  as COST_TITLE_CNAME    
                            --,   d.DESCRIPTION    as PRODUCT_CODE_CNAME    
                         FROM TACACTC a    
                         LEFT JOIN TACACT6 b    
                         ON a.ACCOUNT     = b.ACCOUNT    
                         AND  b.YEAR        = '2015'    
                         AND  a.COST_CENTER   = b.COST_CENTER    
                     --    AND  b.ACTIVE_YYMM   >= @account_period    
                         AND  b.STATUS_CODE_AC  = '0'   
                          
                         LEFT JOIN TACACT7 c    
                         ON a.ACCOUNT     = c.ACCOUNT    
                         AND  b.YEAR        = '2015'    
                         AND  a.WCE       = c.WCE    
                     --    AND  c.ACTIVE_YYMM   >= @account_period    
                         AND  c.STATUS_CODE_AC  = '0' 
                           
                         LEFT JOIN TACAIT1 d    
                         ON a.ACCOUNT   = d.ACCOUNT    
                         AND  b.YEAR        = '2015'    
                         AND  a.PRODUCT_CODE  = d.PRODUCT_CODE   
                         WHERE a.ACCOUNT = '1602'   
                         /*AND   a.COST_CENTER  LIKE  NVL(TRIMN(@cost_center),a.COST_CENTER) || '%'    
                         AND   a.WCE      LIKE  NVL(TRIMN(@wce),a.WCE) || '%' */   
                         ORDER BY a.COST_CENTER ASC,a.WCE ASC,a.PRODUCT_CODE ASC
select distinct account from   TACACTC ;
SELECT * from tacactc where account = 'BS';
update TACACTC set account = '1602' where account = 'BS';
delete from tacactc t where t.rowid in  (
SELECT a.rowid
  from tacactc a, tacactc b
 where a.cost_center = b.cost_center
   and a.product_code = b.product_code
   and a.ba_object = b.ba_object
   and a.wce = b.wce
   and a.account = 'BS')
   
select * from TACACT6 b where year = '2015' AND  b.STATUS_CODE_AC  = '0' ;
update tacact6 b set  year = '2015', b.STATUS_CODE_AC  = '0' ;  account = '1602'  where

delete from tacact6 t where t.rowid in (
select b.rowid from tacact6 b where year = '2015' AND  b.STATUS_CODE_AC  = '0' and account = 'SG'
)

select * from TACACT7 c where c.YEAR        = '2015' AND  c.STATUS_CODE_AC  = '0'  and account = '1602'

--能源介质代码转换
select t.rowid,t.* from tacamt9 t where rownum = 1 where form_id in (63604,63602,63601,63603,63605);
delete from tacamt9 where form_id in (63604,63602,63601,63603,63605);
select count(*),a.form_id from tacamt9 a group by a.form_id
--能介对照表
select t.rowid,t.*from tacamta t where 1=2;
delete from tacamta;
select t.rowid,t.* from tacamta t ,(
select * from (
select count(*) num ,
a.cost_center,a.cost_center_cname,
a.energy_code1,a.energy_cname from tacamta a 
group by a.cost_center,a.cost_center_cname,a.energy_code1,a.energy_cname
）where num >1) m 
where t.cost_center=m.cost_center and t.cost_center_cname=m.cost_center_cname and
t.energy_code1=m.energy_code1 and t.energy_cname=m.energy_cname   ；

-----------------------
    SELECT a.*,    
                 b.MATERIAL_CLASS_CODE_NAME,    
                 c.MATERIAL_CODE_NAME    
                 FROM TACART6 a    
                       LEFT JOIN  TACARTB b    
                       ON a.ACCOUNT = b.ACCOUNT    
                       AND a.MATERIAL_CLASS_CODE = b.MATERIAL_CLASS_CODE    
                 LEFT JOIN (SELECT DISTINCT MATERIAL_CODE AS MATERIAL_CODE ,    
                       MAT_CODE_NAME AS MATERIAL_CODE_NAME     
                       FROM TACART9    
                       WHERE ACCOUNT = @account    
                      /* AND AREA_CODE  LIKE  NVL(TRIMN(@area_code),AREA_CODE)||'%'    
                       AND MATERIAL_CODE  LIKE  NVL(TRIMN(@material_code),MATERIAL_CODE)||'%' */   
                       AND DELETE_CODE='0'
                       ) c    
                 ON a.MATERIAL_CODE = c.MATERIAL_CODE    
                 WHERE a.ACCOUNT = @account    
                 AND a.AREA_CODE       LIKE  NVL(TRIMN(@area_code),a.AREA_CODE)||'%'    
                   AND a.MATERIAL_CODE       LIKE  NVL(TRIMN(@material_code),a.MATERIAL_CODE)||'%'    
                       AND a.MATERIAL_CLASS_CODE LIKE  NVL(TRIMN(@material_class_code),a.MATERIAL_CLASS_CODE)||'%'    
                       AND a.DELETE_CODE <= @delete_code    
                       ORDER BY a.AREA_CODE,a.MATERIAL_CODE   ;
                       
select t.rowid,t.* from TACART9 t where t.account = '1602' AND DELETE_CODE='0' and MATERIAL_CODE in 
(
select MATERIAL_CODE from TACART6 t where t.rec_create_time = '20150916152240' )                                       

--轧辊待摊抛账
    SELECT       
                 a.ACCOUNT,    
                 a.COST_CENTER,    
                 a.WAIT_DVV_EXPN_CODE,    
                 a.ACCOUNT_TITLE_CODE_DR,    
                 a.ID_CODE_DEBIT,    
                 a.REF_CODE_DEBIT,    
                 a.DEBIT_END,    
                 a.ADD_CODE_1_DEBIT,    
                 a.ACCOUNT_TITLE_CODE_CR,    
                 a.ID_CODE_CREDIT,    
                 a.REF_CODE_CREDIT,    
                 a.CREDIT_END,    
                 a.ADD_CODE_1_CREDIT,    
                 a.WCE,    
                 a.STD_PRICE_1,    
                 a.MEASURE_UNIT,    
                 a.FLAG_MESSAGE,    
                 a.SIGN_CODE_3,    
                 a.DELETE_FLAG_1,    
                 a.T_CODE,    
                 b.COST_CENTER_DSCR AS COST_CENTER_CNAME_1,    
                 c.WAIT_DVV_EXPN_CODE_NAME,    
                 d.ACCT_TITLE_CNAME AS ACCOUNT_TITLE_CODE_DR_NAME,    
                 e.ACCT_TITLE_CNAME AS ACCOUNT_TITLE_CODE_CR_NAME    
                       FROM TACAMTF a    
                 LEFT JOIN (SELECT DISTINCT COST_CENTER,    
                      ACCOUNT,    
                      COST_CENTER_DSCR    
                      FROM TACACT6    
                      WHERE ACCOUNT = @account    
                      AND   STATUS_CODE_AC != '1'    
                      AND   YEAR LIKE NVL(TRIMN(@year),YEAR)||'%') b    
                 ON  a.ACCOUNT = b.ACCOUNT    
                 AND a.COST_CENTER = b.COST_CENTER    
                 LEFT JOIN (SELECT DISTINCT WAIT_DVV_EXPN_CODE,    
                      ACCOUNT,COST_CENTER,    
                      WAIT_DVV_EXPN_CODE_NAME    
                      FROM TACAMTD    
                      WHERE ACCOUNT = @account    
                      AND   DELETE_FLAG_1 != '1') c    
                 ON  a.ACCOUNT = c.ACCOUNT    
                 AND a.WAIT_DVV_EXPN_CODE = c.WAIT_DVV_EXPN_CODE    
                 AND a.COST_CENTER = c.COST_CENTER    
                 LEFT JOIN (SELECT DISTINCT(ACCT_TITLE_CODE),ACCT_TITLE_CNAME    
                            FROM TACACD6) d    
                 ON a.ACCOUNT_TITLE_CODE_DR = d.ACCT_TITLE_CODE    
                 LEFT JOIN (SELECT DISTINCT(ACCT_TITLE_CODE),ACCT_TITLE_CNAME    
                            FROM TACACD6) e    
                 ON a.ACCOUNT_TITLE_CODE_CR = e.ACCT_TITLE_CODE    
                         WHERE a.ACCOUNT = @account    
                 AND   a.COST_CENTER        LIKE NVL(TRIMN(@cost_center),a.COST_CENTER)||'%'    
                 AND   a.WAIT_DVV_EXPN_CODE LIKE NVL(TRIMN(@wait_dvv_expn_code),a.WAIT_DVV_EXPN_CODE)||'%'    
                 ORDER BY a.DELETE_FLAG_1 DESC,a.ACCOUNT,a.COST_CENTER,a.WAIT_DVV_EXPN_CODE    ;
                 
--能源成本分离


SELECT   a.YEAR,
a.MON,
                    a.COST_CENTER  
                  , a.DET  
                  , a.WCE  
                  , a.RATIO  
                  , a.ACT_N  
                  , b.COST_CENTER_DSCR as COST_CENTER_CNAME  
                  , c.WCE_DESCRIPTION  as COST_TITLE_CNAME  
                  --, d.DESCRIPTION    as DET_CODE_CNAME  
               FROM TACACTZ a  
               LEFT JOIN TACACT6 b 
               ON a.ACCOUNT     = b.ACCOUNT  
               AND  a.YEAR        = b.year  
               AND  a.COST_CENTER   = b.COST_CENTER  
             --  AND  b.ACTIVE_YYMM   >= @account_period  
               AND  b.STATUS_CODE_AC  = '0' 
               LEFT JOIN TACACT7 c  
               ON a.ACCOUNT     = c.ACCOUNT  
               AND  a.YEAR        = c.year  
               AND  a.WCE       = c.WCE  
             --  AND  c.ACTIVE_YYMM   >= @account_period  
               AND  c.STATUS_CODE_AC  = '0' 
               LEFT JOIN TACACT9 d  
               ON a.ACCOUNT   = d.ACCOUNT  
               AND  a.YEAR      = d.year  
               AND  a.COST_CENTER = d.COST_CENTER  
               --AND  a.DET     = d.DET 
               WHERE a.ACCOUNT = '1602'  
               AND   a.YEAR || MON = '201508'  
               --AND   a.COST_CENTER LIKE  NVL(TRIMN(@cost_center),a.COST_CENTER) || '%'  
               ORDER BY a.COST_CENTER,a.DET,a.WCE;  
             
SELECT t.rowid,t.* from TACACTZ  t  where account = '1602' ;   
update tacactz set mon = '08' where mon = '8' 
SELECT t.rowid,t.* from TACACT6  t   ;  
select t.rowid,t.* from TACACT9 t where 2 = 1 account  = '1602';
update TACACT7 set STATUS_CODE_AC = '0';
SELECT t.rowid,t.* from TACACT7  t  where account = '1602' ;  
update TACACT9 set account = '1602';
select count(*) from tacact7 having count(*)>1 group by (ACCOUNT, YEAR, WCE)
