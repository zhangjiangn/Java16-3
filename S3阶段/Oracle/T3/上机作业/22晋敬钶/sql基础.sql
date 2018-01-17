--部门表
create table dept (
       did integer primary key,--主键
       dname varchar2(20), --部门名称
       manager integer, --外键，部门经理
       tel varchar2(20),--部门电话
       master integer --外键，上级部门
);
insert into dept(did,dname) values(1,'市场部')
insert into dept(did,dname) values(2,'研发部')
insert into dept(did,dname,manager) values(3,'董事部',1)
--员工表
create table emp(
       eid integer primary key, --主键
       ename varchar2(20),--员工名称
       sex varchar2(1),--性别
       hire date,--入职日期
       sar number(8,2),--工资
       did integer --外键，所属部门
       )
insert into emp(eid,ename,sex,sar,did) values(1,'王前顶','m',5000,1);
insert into emp(eid,ename,sex,sar,did) values(2,'王保枪','m',6000,2);
insert into emp(eid,ename,sex,sar,did) values(3,'徐掷雷','m',5600,2);
insert into emp(eid,ename,sex,sar,did) values(4,'陈一发','w',8000,3);
update emp set sex='男' where eid = 1 ;
update emp set sex='男' where eid = 2 ;
update emp set sex='男' where eid = 3 ;
update emp set sex='女' where eid = 4 ;
--工作经历表
create table history(
       hid integer primary key,--主键
       startdate date,--入职时间
       enddate date,--离职时间
       place varchar2(50),--公司名称
       job varchar2(20),--职位
       eid integer -- 外键，所属员工
);

select * from dept;
select * from emp;
select * from history;
 --修改表结构使用alter语句
alter table emp modify sex varchar2(2); --修改列类型
alter table dept drop column master; --删除一个字段
alter table emp add constraint sexvalue check(sex in('男','女'));--添加一个检查约束
alter table emp drop constraint sexvalue; --删除一个约束
--更新数据使用update语句
update emp set sar=sar+500 where sar<6000;--将工资少于6000的员工工资加500
--删除数据使用delete语句
delete emp;--删除表中所有数据
delete emp where ename = '王前顶';--按条件删除
select max(sar),min(sar) from emp ;--
select ename,sar from emp where sar in (select max(sar) from emp);--查询工资最高员工的姓名
-- ||用作连接字符串
select ename ||'的工资是' ||sar||'元' from emp;
