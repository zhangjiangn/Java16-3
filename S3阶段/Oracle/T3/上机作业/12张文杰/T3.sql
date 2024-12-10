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
insert into emp values('1','����','1',sysdate-445,'8000','1');
insert into emp values('2','��2','1',sysdate-445,'8000','2');
insert into emp values('3','����','1',sysdate-445,'5000','1');
insert into emp values('4','����','1',sysdate-445,'4000','1');

--����ԭ�����±�
create table emptwo as select ename,sex,hire from emp;
--����ԭ�����±�������
create table empthere as select ename,sex,hire from emp where 1=2;


--�޸��е�����
alter table emp modify sex varchar2(2);
--ɾ��һ���ֶ�
alter table emp drop column sar;
--����һ���ֶ�
alter table emp add sar number(8,2);

--��Ӽ��Լ��
alter table emp add constraint sexvalue check(sex in('1','2'));
--ɾ��һ��Լ��
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

select*From emp where ename like'��_';
select *From emp where ename like'%��%';
select*From emp where ename like'��%';

select ename ||'�Ĺ�����'||sar||'Ԫ'from emp;



select *from emp where eid not in (select manage from dept);

select *from dept

select *from emp
select *from empthere                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

--ɾ����
drop table emptwo


select *from emp;
select *From emp
