create table dept(
      did integer primary key ,
      dname varchar2(20),
      manager integer,
      tel varchar2(30),
      master integer
);

create table emp(
      eid integer primary key ,
      ename varchar2(20),
      sex varchar2(1),
      did integer
);
create table history(
      hid integer primary key ,
      startdate date, -- 入职时间
      enddate date,
      place varchar2(50),
      job varchar2(20),
      eid integer 
);
--创建新表 复制表结构而不复制数据
create table newemp3 as 
select ename,sex,hire from emp where 1=2;

--修改表结构 alter

--添加
alter table emp add hire date;
alter table emp add sar number(8,2);
alter table emp add tel integer;

--删除
alter table emp drop column tel ;
--修改
alter table emp modify sex varchar2(2);
alter table history modify startdate timestamp;
alter table history modify enddate timestamp;
--添加检查约束
alter table emp add constraint sexvalue check(sex in('m','n'));
--删除约束
alter table emp drop constraint sexvalue;

删除数据表
drop table history;


insert into dept values(1,'游戏部',2,'9999',0); 
insert into dept values(2,'文艺部',3,'8888',0); 
insert into dept values(3,'逗比部',4,'7777',1); 
insert into dept values(4,'颜值部',5,'6666',1); 
insert into dept values(5,'闲人部',6,'5555',1);
 
select * from dept;
select * from emp

insert into emp values(1,'月月','m',1,sysdate-111,8000.00);
insert into emp values(6,'小青','m',1,sysdate-111,7500.00);
insert into emp values(2,'林夕','n',2,sysdate-100,6500.88);
insert into emp values(3,'傻佩','n',3,sysdate-12,8000.00);

insert into emp values(4,'骚龙','m',3,'11-1月-15',8000.00); 

insert into emp values(5,'司机','m',3,to_date('2018-01-15','yyyy-mm-dd'),8000.00);

update emp set sar = sar+50;
update emp set sar = sar+1000 where sar<7000;

update emp set hire = to_date('2018-01-15','yyyy-mm-dd')where ename='司机';

delete emp where ename='司机';

select * from emp order by sar asc;

select * from emp order by sar desc,did asc;

select * from emp where sar between 7000 and 8000;

select * from emp where did in (1,2);

select * from emp where ename like '月%';

select * from emp where sex='m' and sar>8000;

select avg(sar) as 平均,max(sar),min(sar) from emp;

select count(eid),sum(sar) from emp;

select distinct(did) from emp;

select d.dname,max(e.sar),avg(e.sar)
from emp e,dept d
where d.did=e.eid
group by d.dname;

select d.dname,max(e.sar),avg(e.sar)
from emp e,dept d
where d.did=e.eid
group by d.dname
having avg(e.sar)>8000;

select * from emp where sar>8000
union 
select * from emp where did=2;

select * from (select rownum r,e.* from emp e)  where r>2 and r<4;

select * from emp 
minus
select * from newemp3;

select * from emp 
intersect
select * from newemp3;

select ename 

