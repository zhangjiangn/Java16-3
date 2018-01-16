--部门表：
create table dept(
did integer primary key ,--主键
dname varchar2(20) , --部门名称
manager integer , --外键，部门经理
tel varchar2(30), --部门电话
master integer   --外键，上级部门
);
--员工表：
create table emp(
eid integer primary key,--主键
ename varchar2(20), --员工名称
sex varchar2(1), --性别
hire date , --入职日期
sar number(8,2), --工资
did integer --外键，所属部门 
);
--工作经历表：
create table history(
hid integer primary key , --主键
startdate date , --入职时间
enddate date, --离职时间
place varchar2(50), --公司名称
job varchar2(20), --职位
eid integer --外键，所属员工
);
--复制表:
create table emptwo as
select ename,sex , hire from emp;

create table emptwo as
select ename,sex , hire from emp where 1=2;
--修改表结构:
--修改列的类型
alter table emp modify sex varchar2(2);
--删除一个字段
alter table dept drop column master;
--增加一个字段
alter table dept add master integer;
--添加一个检查约束
alter table emp add constraint sexvalue check(sex in('m','f'));
--删除一个约束
alter table emp drop constraint sexvalue;
--删除表
drop table dept;
drop table emptwo;
drop table history;

--添加数据
--向部门表添加数据：
insert into dept values(1,'董事会',5,'1111111',0);
insert into dept values(2,'市场部',6,'2222222',0);
insert into dept values(3,'财务部',7,'3333333',0);
insert into dept values(4,'采购部',8,'4444444',0);
--向员工表添加数据：
insert into emp values(5,'tom','m',sysdate-234,4500.50,1 );
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2 );
insert into emp values(7,'kelly','f',sysdate-445,3491.32,3 );
insert into emp values(8,'red','f',sysdate-143,3700.00,4 );
insert into emp values(9,'blue','m',sysdate-423,3800.00,2 );
insert into emp values(10,'genji','m',sysdate-413,5100.00,3 );
insert into emp values(11,'peter','m',sysdate-243,6700.00,4 );
insert into emp values(12,'lucy','f','12-5月-05',6500.00,2)
insert into emp values(13,'key','m',to_date('2008-09-19','yyyy-mm-dd'),7200.00,3);
insert into emptwo (ename,hire,sex)select ename,hire,sex from emp;
--将所有人的工资加500：
update emp set sar=sar+500;
--将工资少于6000的员工工资加500：
update emp set sar=sar+500 where sar<6000;
--修改kelly的入职日期
update emp set hire=to_date('2012-03-01','yyyy-mm-dd') where ename='kelly'
--删除表数据
delete emp;
--按条件删除：
delete emp where ename='key';
--select查询
select* from emp order by sar asc;--工资升序
select*from emp order by did asc,sar desc;--部门编号升序，工资降序
--between...and
select*from emp where sar between 3000 and 6000;
select*from emp where sar not between 3000 and 6000;
--in集合运算符
select*from emp where did in(2,3);
--模糊查询
select*from emp where ename like 't%';
--and或or
select*from emp where sex='f' and sar>5000;
select*from emp where sex='f'or sar>5000;
--聚合函数
select avg(sar),max(sar),min(sar) from emp;
select count(eid),sum(sar)from emp;
--distinct语句
select distinct(did) from emp;
--group by查询
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname;
--having
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname
having avg(e.sar)<5000;
--rownum伪列查询
select*from (select rownum r,e.*from emp e)
where r>3 and r<7;
--union,unionall,intersect和minus集合操作
select*from emp where sar>5000
union
select*from emp where did=2;
select*from emp
minus
select* from emptwo;
select*from emp
intersect
select* from emptwo;
--||符连接字符串
select ename ||'的工资是'||sar||'元' from emp;
--子查询
select*from emp where eid not in(select manager from dept);
select eid ,sar,did from emp;
select did,avg(sar)
from emp
group by did;
select a.eid
from(select eid,sar,did from emp)a,
(select did,avg(sar)sar
from emp
group by did)b
where a.did=b.did and a.sar>b.sar
);
select *from emp;
select* from history;
select *from emptwo;
