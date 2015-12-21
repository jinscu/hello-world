PL/SQL Developer Test script 3.0
9
-- Created on 2015-12-17 by 金贺辉
--分配用户:员工定义->员工分配->用户定义->角色定义
--intance_id 就是单据ID
--action_id 动作ID  转交时会涉及到action_type默认是0,20151217作转交修改，设定了转交默认action_type默认是0
--record_id是每作一个审批动作都会产生一条审批记录
记录的创建者是user_id

--描述表
select t.rowid,t.* from fnd_descriptions t where t.description_id = 4088
0
0
