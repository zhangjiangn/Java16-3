create table depts(
  did integer primary key,
  dname varchar2(50),
  dUsername integer --部门经理（外键）
)
create table emp(
  eid integer primary key,
  ename varchar2(50),
  sar number(8,2), --工资
  eTime date, --入职时间
  did integer --所属部门（外键）
)
--在depts添加一列[上级部门sDept（外键）]
alter table depts add sDept integer;
 alter table depts add tel varchar2(30);
--删除一个字段
alter table depts drop column tel;
---添加数据（depts）
insert into depts values(1,'董事部',1,1)
insert into depts values(2,'闲人部',0,0)
insert into depts values(3,'财务部',0,0)
insert into depts values(4,'人事部',0,0)
---添加数据（emp）
insert into emp values(1,'张三',3000.00,sysdate,1)
insert into emp values(5,'鬼头',5000.00,sysdate-25,1)
insert into emp values(2,'李四',3500.00,sysdate,2)
insert into emp values(3,'王五',4000.00,sysdate,3)
insert into emp values(4,'大头',4500.00,sysdate,4)
---创建一个depts的新表
create table deptsNew as select dname from depts;   --新表和原表的数据一致
create table deptsNewTwo as select dname from depts where 1=2;   --新表和原表的字段一致 新表中没有数据

select * from deptsNew
select * from deptsNewTwo
--新表中的数据 来自 原表中的数据
insert into deptsNewTwo(dname) select dname from depts;
--将所有人的工资增加500元
update emp set sar=sar+500;
--将工资大于5000的员工减少500元(不包括工资等于5000的哦)
update emp set sar=sar-500 where sar>5000;
--查询 根据sar（升）和eTime（降）                  
select * from emp order by sar asc;
select * from emp order by eTime desc;
--查询所有1号和2号的员工(根据集合)
select * from emp where eid in(1,2);
--查询姓“张”的所有员工（模糊查询）
select * from emp where ename like '张_';
--查询每个部门 的最高工资、最低工资、平均工资
select max(e.sar) as 最高工资,min(e.sar) as 最低工资,avg(e.sar) as 平均工资,d.dname as 部门名称
from emp e,depts d
where e.did=d.did
group by d.dname
--查询所有部门中 平均工资小于4500的部门
select avg(e.sar) as 平均工资,d.dname as 部门名称
from emp e,depts d
where e.did=d.did
group by d.dname
having avg(e.sar)<4500
--rownum?
select * from (select rownum r,e.* from emp e) where r>=3 and r<=5;
--原表中有数据 新表中没有数据
select dname from depts
minus
select dname from deptsNew
--原表中有数据 新表中也有数据
select dname from depts
intersect
select dname from deptsNew
--用||
select ename||'的工资是'||sar from emp;

select * from depts

select * from emp




