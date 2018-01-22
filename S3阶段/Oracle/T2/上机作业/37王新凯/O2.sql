create table emp(
eid integer primary key,
ename varchar2(20),
sex varchar2(1),
sar number(8,2),
did integer
);
create table dept(
did integer primary key,
dname varchar2(20),
manager integer,
tel varchar2(20),
master integer
);
create table history(
hid integer primary key,
job varchar2(20),
eid integer
);
alter table emp add ress varchar2(20)
alter table emp modify ress varchar2(30)
alter table emp add sex char(2)
alter table emp add constraint cl check(sex in('m','f'));
alter table emp drop constraint cl;
alter table emp drop column sex;
insert into emp values(1,'tom','m',6000,1);
insert into emp values(2,'jim','f',6000,2);
insert into emp values(3,'timi','m',6000,3);
insert into dept values(1,'研发部',5,'111111',0);
insert into dept values(2,'市场部',6,'111111',1);
insert into dept values(3,'董事部',7,'111111',1);
insert into dept values(4,'采购部',8,'111111',1);



create table empt as select * from emp where 1=2;
select * from emp;
select * from empt;
drop table empt;
update emp set name='tom';
delete emp where id=3;
insert into empt select * from emp where id=2;
create table dept(
did integer primary key,
dname varchar2(20),
sar integer
);
select * from dept


drop table emp;
drop table dept;
