--部门表：
create table dept(
did integer primary key,--主键
dname varchar2(20),--部门名称
manager integer,--外键，部门经理
tel varchar2(30),--部门电话
master integer --外键，上级部门
);
--员工表：
create table emp(
eid integer primary key,--主键
ename varchar2(20),--员工名称
sex varchar2(1),--性别
hire date, --入职日期
sar number(8,2),--工资
did integer --外键，所属部门
);
--工作经历表：
create table history(
hid integer primary key,--主键
stardata date,--入职时间
enddate date,--离职时间
place varchar2(50),--公司名称
job varchar2(20),--职位
eid integer--外键，所属员工
);
--查询部门表，员工表，工作经历表
select * from dept
select * from emp
select * from history
--添加数据
--部门表
insert into dept values(1,'董事会',5,'111111',0)
insert into dept values(2,'市场部',6,'222222',1)
insert into dept values(3,'财务部',7,'333333',1)
insert into dept values(4,'采购部',8,'444444',1)
--员工表
insert into emp values(5,'tom','m',sysdate-234,4500.50,1)
insert into emp values(6,'jacky','f',sysdate-543,3200.50,2)
--使用现有表创建表
create table historytwo as
select place,job from history;--where 1=2

select * from historytwo

--修改列类型
alter table historytwo modify place varchar2(100)
--删除一个字段
alter table historytwo drop column job
--增加一个字段
alter table historytwo add job integer
--添加一个约束
alter table emp add constraint sexvalue check(sex in('m','f'))
--删除一个约束
alter table emp drop constraint sexvalue
--删除数据表
drop table historytwo
--将所有人的工资加500
update emp set sar=sar+500
--将工资少于6000的员工工资加500
update emp set sar=sar+500 where sar<6000
--工资升序
select * from emp order by sar asc
--between..and
select * from emp where sar between 4000 and 6000
--in或not in
select * from emp where did in(1,2)
--like
select * from emp where ename like 't%' 
--||
select ename ||'的工资是'||sar||'元'from emp

