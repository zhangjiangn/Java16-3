--部门表
create table dept(
       did integer primary key not null,--主键
       dname varchar2(20), --部门名称
       manager integer,--经理，外键
       tel varchar(30),--电话
       master integer--上级部门，外键
);
--员工表
create table emp(
       eid integer primary key not null,--主键
       ename varchar2(20),--员工姓名
       sex varchar2(10),--性别
       hire date,--入职日期
       sar number(8,2),--工资
       did integer--所属部门，外键
);
--工作经历表
create table history(
       hid integer primary key not null,--主键
       stardate date,--入职时间
       enddate date,--离职时间
       place varchar2(20),--公司名称
       eid integer--所属员工，外键
);

--修改 员工表 性别的类型
alter table emp modify sex varchar2(2);

--增加 工作经历表 职位
alter table history add job varchar2(20);--职位
--删除 工作经历表 职位
alter table history drop column job;

--添加 性别约束
alter table emp add constraint sexvalue check(sex in('男','女'));
-- 删除约束
alter table emp drop constraint sexvalue;

/*
select * from dept;
select * from emp;
select * from history;
*/
/*
drop table history;
drop table emp;
drop table dept;
*/

--部门
insert into dept values(1,'技术部','1','123456',0);
insert into dept values(2,'市场部','2','123456',0);
insert into dept values(3,'财务部','3','123456',0);
insert into dept values(4,'人事部','4','123456',0);
insert into dept values(5,'技术一部','1','123456',1);
--员工
insert into emp values(1,'tom','男',sysdate-365,7000,1);
insert into emp values(2,'jacky','男',sysdate-365,5000,2);
insert into emp values(3,'kelly','女',sysdate-365,4000,3);
insert into emp values(4,'red','女',sysdate-365,3000,4);
insert into emp values(5,'blue','男',sysdate-365,6000,5);
insert into emp values(6,'yellow','女',sysdate-365,5500,2);
--工作经历
insert into history values(1,sysdate-365,'18-5月-05','上海',1,'程序员');
insert into history values(2,sysdate-365,'18-5月-05','北京',2,'程序员');
insert into history values(3,sysdate-365,'18-5月-05','广州',3,'程序员');
insert into history values(4,sysdate-365,'18-5月-05','杭州',4,'程序员');
insert into history values(5,sysdate-365,'18-5月-05','深圳',5,'程序员');
insert into history values(6,sysdate-365,'18-5月-05','拉萨',6,'程序员');
/*
select * from dept;
select * from emp;
select * from history;
*/
/*
delete from history;
delete from emp;
delete from dept;
*/


--创建表emptwo和emp一样
create table emptwo as
select * from emp where 1=2;

drop table emptwo;
select * from emptwo;

--增加数据
insert into emptwo select * from emp;
--将工资小雨6000的加500
update emp set sar=sar+500 where sar<6000;
--修改jacky的入职日期
update emp set hire=to_date('2012-02-01','yyyy-mm-dd') where ename='jacky';

--查询每个部门的最高，最低，平均工资
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname;
--保留平均工资小于5000的
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname
having avg(e.sar)<5000;

--查询emp 3到5行
select * from (select rownum r,e. * from emp e)
where r>2 and r<6;

--工资大于5000的和2部门 并集
select * from emp where sar>5000
union
select * from emp where did=2;

--emp有 emptwo没有的
select * from emp
minus
select * from emptwo;

--emp有emptwo也有
select * from emp
intersect
select * from emptwo;

--
select ename||'的工资是'||sar||'元' from emp;

