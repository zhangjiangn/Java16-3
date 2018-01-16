--部门表
create table dept(
did integer primary key ,
dname varchar2(20),
maneger integer ,
tel varchar2(30),
master integer 
)
--员工表
create table emp(
eid integer primary key ,
ename varchar2(20),
sex varchar2(10),
tim date,
sar number(4,2),
did integer 
)
--工作经历
create table history(
hid integer primary key ,
startim date,
endtim date,
hname varchar2(20),
job varchar2(20),
eid integer 
)
--修改类型
alter table emp modify sar number(8,2);
select * from dept;
select * from emp;
select * from history;
insert into dept values(1,'人事部',5,'111111',0)
insert into dept values(2,'董事部',5,'111111',0);
insert into dept values(3,'市场部',5,'111111',1);
insert into dept values(4,'财务部',5,'111111',1);
insert into dept values(5,'生活部',5,'111111',1)
insert into emp values(5,'xy','男',sysdate,4500.01,1);
insert into emp values(6,'xe','男',sysdate,4500.00,2);
insert into emp values(7,'xs','女',sysdate,4500.00,3);
insert into emp values(8,'xw','男',sysdate,4500.00,4);
insert into emp values(9,'xl','女',sysdate,4500.00,1);
insert into emp values(10,'xq','女',sysdate,4500.00,2);
insert into emp values(11,'xb','男',sysdate,4500.00,3);
insert into emp values(12,'xj','女',sysdate,4500.00,4);
insert into emp values(13,'xm','女',sysdate,4500.00,1);
--修改部门表
update dept set maneger=6 where did=2
update dept set maneger=7 where did=3;
update dept set maneger=8 where did=4;
--修改工资
update emp set sar = sar+400 where eid = 6;
update emp set sar = sar+300 where eid = 7;
update emp set sar = sar+200 where eid = 8;
update emp set sar = sar+100 where eid = 9;
update emp set sar = sar+700 where eid = 12;
delete emp where ename = 'xm'
--查询前三条数据
select *  from emp where rownum < 4;
--查询每个部门最高，最低，平均工资
select dname,max(sar),min(sar),avg(sar) from dept d , emp e where d.did=e.did group by dname
--查询4-6行数据
select * from (select rownum r,e.* from emp e)where r>3 and r<7
--用连接字符串
select '编号为'||did||'的部门名称'||dname from dept
----查询工资比所在部门平均工资高的员工
select * from emp where eid in (select a.eid  from(select eid,sar,did from emp ) a,(select did,avg(sar) sar from  emp  group by did) b where b.did=a.did and a.sar>b.sar);
--查询人数最多的部门，如果多个部门人数相同，则查编号最小的
select * from dept where did =(select did from (select did,count(eid) num  from emp group by did order by num desc,did asc)where rownum=1)
--查询所有员工及部门信息
select e.*,d.dname  from emp e,dept d where d.did=e.did 
--查询所有部门及其员工。没有员工的也要查出来
select dname,ename from dept d left join emp e on  d.did=e.did 
--查询所有部门编号大于2的部门和员工
select e.*,d.dname  from emp e,dept d where d.did=e.did and d.did >2
--查询所有非部门经理的员工
select e.* from emp e where eid not in (select maneger  from  dept d) 
select dname, count(*) from dept d , emp e where d.did=e.did group by dname having count(*)=2

