--����Ʒ�����
select product_code,crrt_year_std_amt,correction,ac_route from TACAIT1;
select * from tacaim6;--����Ʒ��ϸ�������
select * from tacaiis where ;
select * from tacaim4;--����Ʒ����������˵�
select rowid,t.* from tacaim1 t where 1=2;
--����ҵ�ݴ浵W1
select max(control_num) from tacairp t;--3392
--������ŵ�����ȡ����ڱ�
select t.rowid,t.* from tacaic1 t;
--WA����걸�ݱ�
select t.rowid,t.* from tacaiwam t;

--����ڱ�
select account,close_mon,control_num from TACAIC1

--��������Ӧ��������ű�ʶ
select ACCOUNT_TITLE_ITEM,account_symbol from TACAIT2;

--����ACAI13  ����Ʒ�����ݴ浵����ά��
select t.rowid,t.* from TACAIW1 t;

--����ACAI16 ����Ʒ����������˲�ѯ
select t.rowid,t.* from  TACAIM4 t;--������˱�

--����ACAI31 ����Ʒ��˴�����Ϣ��ѯ
select t.rowid,t.* from TACAIRP t WHERE account = '1602' and REPORT_CODE= 'AIR34' AND VERSION_NUM=0;

--�����
select t.rowid,t.* from tacaic2 t where  weight_symbol_2 = '_';
update tacaic2 set weight_symbol_2 = '-' where  weight_symbol_2 = '_';


--��ؽӿڱ�
select t.rowid,t.* from tacaiis t where t.rec_creator = 'acairt_dois';
tacaiiw,tacaiip,tacaifx,tacaiih,tacaitq;
tacaiiq,tacaiic,tacaiib;
select t.*, rowid
--count(*)
  from TACAIW2 t
 where t.product_code = '83620'
   and account_title_item = '31'
   and control_num = '43715'; --�ս��������ݴ浵
  
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
     
