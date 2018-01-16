create table dept (
            did integer primary key,--主键
            dname varchar2(20),--部门名称
            manager integer,--外键，部门经理
            tel varchar2(30),--部门电话
            master integer--外键，上级部门

);
create table emp(
      eid integer primary key,--主键
      ename  varchar2(20),--员工名称
      sex  varchar2(1),--性别
      hire date,--入职日期
      sar number(8,2),--工资
      did integer--外键，所属部门
      
)
create table  history(
       hid integer primary key,--主键
       startdate date,--入职时间
       enddate date,--离职时间
       place  varchar2(50),--公司名称
       job varchar2(20),--职位
       eid integer--外键，所属员工
)
--查询表
select *from emp;
select *from dept;
select *from history;
--删除表
drop table emp;
drop table dept;
drop table history;


create table emptwo as select *from emp;
--只创建表结构，而不复制数据
create table emptwo1 as select *from emp where 1=2;
--添加一个列
alter table emptwo add em varchar2(25);
--修改列的数据类型
alter table emptwo modify em integer;
--添加约束
alter table emptwo add constraint cl check(sex 'm','f');
--删除约束
alter table emptwo drop constraint cl;
--删除列
alter table emptwo drop column em;

--添加数据
insert into dept values (1,'董事会',5,'111111',0);
insert into dept values (2,'市场部',6,'111222',1);
insert into dept values (3,'财务部',7,'333333',1);
insert into dept values (4,'采购部',8,'444444',1);
insert into emp values (5,'tom','m',sysdate-234,4500.50,1);
insert into emp values (6,'jacky','m',sysdate-543,2982.12,2);
insert into emp values (7,'kelly','f',sysdate-445,3491.32,3);
insert into emp values (8,'red','f',sysdate-143,3700.00,4);
insert into emp values (9,'blue','m',sysdate-423,3800.00,2);
insert into emp values (10,'green','m',sysdate-413,5100.00,3);
insert into emp values (11,'peter','m',sysdate-243,6700.00,4);
--向表中添加数据时，数据来源于已知表
insert  into emptwo select *from emp;
--修改
--工资少于6000的员工工资加500
update emp set sar=sar-500 where sar>6000;
--修改 kelly的入职日期
update emp set hire=to_date('2012-03-01','yyy=mm-dd')where ename='kelly';
--删除
delete emp;
delete emp where ename='key';
--查询每个部门的最高工资、最低工资和平均工资
select d.dname ,max(e.sar),min(e.sar),avg(e.sar) from   dept d,emp e where  d.did=e.eid group by d.dname;
--查询平均工资小于5000的部门
select d.dname ,max(e.sar),min(e.sar),avg(e.sar) from   dept d,emp e where  d.did=e.eid group by d.dname having avg(e.sar)<5000;
--链接字符串||
select ename ||'工资是'||sar||'元'from emp;
--第四到第六条记录
select *from (select r,e*from emp e)where r>3 and r<7;
--查询emp表有，emptw没有的记录
select *from emp minus select *from emptwo;
--查询emp表有，emptwo也有的记录
select *from emp intersect select *from emptwo;
--工资大于5000的员工和2号的部门员工求并集
select *from emp where sar>5000 union select *from emp where did=2;
--工资比其所在部门平均工资高的员工信息
select *from emp where eid in (select a.eid from (select eid,sar,did from emp)
a,(select did ,avg(sar)sarfrom emp group by did)b where a.did=b.did and a.sar>b.sar);
--人数最多的部门，如果有多个部门的人数相同，则查询部门编号最小的部门
select* from dept where did=(select did from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc) where rownum=1);

