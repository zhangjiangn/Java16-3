create table dept(
       did integer primary key,
       dname varchar2(20),
       address varchar2(20)
);
insert into dept values(1,'董事会','上海');
insert into dept values(2,'市场部','北京');
insert into dept values(3,'财务部','杭州');
select * from dept;

create table emp(
       eid integer primary key,
       ename varchar2(20),
       sex varchar2(1),
       sar varchar2(20)
);
insert into emp values(1,'tom','m','5000');
insert into emp values(2,'kelly','f','4000');
insert into emp values(3,'peter','m','6000');
select * from emp;


create table newdept as select * from dept;
select * from newdept;
create table newdept as select * from dept where 1=2;
alter table dept add addtime date;
alter table dept modify addtime timestamp;
alter table dept drop column addtime;
delete newdept where did=4;

insert into dept values(4,'人事部','广州',sysdate);
insert into newdept select * from dept;
update emp set sar = sar+500;
update emp set sar = sar+500 where sar<5000;
select max(sar),min(sar),avg(sar) from emp ;


select * from dept minus select * from newdept;
select * from dept intersect select * from newdept;
select ename || '的工资是' || sar ||'元' from emp;










