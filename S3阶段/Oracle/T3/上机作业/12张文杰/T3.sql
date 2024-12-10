create table dept(
did integer primary key,
dname varchar2(20),
manage integer,
tel varchar2(30),
master integer
);

create table emp(
eid integer primary key,
ename varchar2(20),
sex varchar2(1),
hire date,
sar number(8,2),
did integer

);

create table history(
hid integer primary key,
startdate date,
place varchar2(50),
job varchar2(50),
eid integer

);

insert into dept values('1','xiao','23','hhh','452');
insert into emp values('1','张三','1',sysdate-445,'8000','1');
insert into emp values('2','张2','1',sysdate-445,'8000','2');
insert into emp values('3','张三','1',sysdate-445,'5000','1');
insert into emp values('4','张三','1',sysdate-445,'4000','1');

--利用原表创建新表
create table emptwo as select ename,sex,hire from emp;
--利用原表创建新表不带数据
create table empthere as select ename,sex,hire from emp where 1=2;


--修改列的类型
alter table emp modify sex varchar2(2);
--删除一个字段
alter table emp drop column sar;
--增加一个字段
alter table emp add sar number(8,2);

--添加检查约束
alter table emp add constraint sexvalue check(sex in('1','2'));
--删除一个约束
alter table emp drop constraint sexvalue;



----DML
update emp set sar=7000 where eid=2;
update emp set sar=6000 where eid=3;
update emp set sar=5000 where eid=4;

select *From emp order by sar asc;

select *From emp;
select *from emp order by sar asc;
select*from emp order by sar desc;
select*From emp where sar between 5000 and 8000;
select *From emp where eid in (2,1);

select*From emp where ename like'张_';
select *From emp where ename like'%三%';
select*From emp where ename like'张%';

select ename ||'的工资是'||sar||'元'from emp;



select *from emp where eid not in (select manage from dept);

select *from dept

select *from emp
select *from empthere                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

--删除表
drop table emptwo


select *from emp;
select *From emp
