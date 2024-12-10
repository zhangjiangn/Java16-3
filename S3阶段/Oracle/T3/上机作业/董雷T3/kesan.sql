部门表：
create table dept(
      did integer primary key, --主键
      dname varchar2(20),  --部门名称
      manager varchar2(20), --外键，部门经理
      tel varchar2(30) --部门电话
);
select * from dept
alter table dept modify manager integer; --修改部门经理数据类型
alter table dept add master integer; --增加一个字段,外键，上级部门

员工表：
create table emp(
       eid integer primary key, --主键
       ename varchar2(20), --员工名称
       sex varchar2(1), --性别
       hire date, --入职时间
       sar number(8,2), --工资
       did integer --外键，所属部门
)
select * from emp 
alter table emp add constraint sexvalue check(sex in('m','f'));--添加检查约束
alter table emp drop constraint sexvalue; --删除约束
工作经历表：
create table history(
       hid integer primary key, --主键
       startdate date, --入职时间
       enddate date, --离职时间
       place varchar2(50), --公司名称
       job varchar2(20), --职位
       eid integer --外键，所属员工
)
select * from history

--根据现有的表来创建新表并复制其数据
create table emptwo as select * from emp; 
select * from emptwo;
--只创建表结构，而不复制数据
create table empwan as select * from emp where 1=2; 
select * from empwan;

--添加数据
insert into dept values(1,'董事会',5,'1111111',0);
insert into dept values(2,'市场部',6,'2222222',1);

insert into emp values(5,'tom','m',sysdate,4500.50,1);
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2);
insert into emp values(7,'kelly','f',sysdate,3491.32,1);
insert into emp values(8,'red','f',sysdate,3700.00,2);
insert into emp values(9,'blue','f',sysdate,3800.00,1);
insert into emp values(10,'green','m',sysdate,5100.00,2);
insert into emp values(11,'peter','m',sysdate,6700.00,1);

--员工工资少于6000的加500
update emp set sar=sar+500 where sar<6000;
--修改员工kellty的入职时间
update emp set hire=to_date('2002-10-01','yyyy-mm-dd') where ename='kelly';

--查询每个部门的最高工资，最低工资和平均工资
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d, emp e where d.did=e.did group by d.dname;
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d, emp e where d.did=e.did group by d.dname having avg(e.sar)<6000;
select * from (select rownum r,e.* from emp e) where r>3 and r<7;

select * from emp where sar>5000
union
select * from emp where did=2;

select * from emp
minus
select * from emptwo;

--查询工资比其所在部门平均工资高的员工信息
select * from emp where eid in(select a.eid from (select eid,sar,did from emp) a,(select did,avg(sar) sar from emp group by did) b where a.did=b.did and a.sar>b.sar);

--查询人数最多的部门，如果有多个部门人数相同，则查询部门编号最小的部门
select * from dept where did=(select did from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc) where rownum=1);





