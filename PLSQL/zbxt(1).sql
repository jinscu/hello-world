select * from SPL_SUPPLIERS_BASE_INFO for update;--（投标人基本信息表）
--相关包
SGSW_REGISTER;--投标人注册包
select SPL_SUPPLIERS_BASE_INFO_s.nextval from dual;
CSG_SUPPLIERS_WFL; 
csg_src_supplier_registration;     
---------------工作流-------------
 csg_src_supplier_registration --提交工作流包




---------------------------------
