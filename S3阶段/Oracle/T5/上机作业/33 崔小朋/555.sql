create or replace view empview
as
select eid,ename,sex,shij from emp;
insert into empview values(20,'as','m',sysdate);
select * from empview;

create or replace view empview
as
select * from emp where sar>5000;
with check option;
insert into empview values(21,'as','m',sysdate,6500,6);
insert into empview values(22,'as','m',sysdate,4000,7);

create unique index detindex on dept(dname);
create index empindex on emp(ename);
drop index deptindex;
drop index empindex;

create user dip identified by dip account unlock;
grant connect to dip;
grant unlimited tablespace to dip;
grant resource to dip;

conn sys as sysdba;
grant create public synonym to scott;
conn scott/123;
create public synonym sc for emp;
grant select on sc to dip;
conn dip/dip;
select * from sc;
create synonym sc2 for emp;
select * from sc2;
drop public synonym sc;
drop synonym sc2;
 
create sequence seqname
increment by 1
start with 3
minvalue 0
maxvalue 10
cycle
nocache;
select seqname.nextval from dual;
select seqname.currval from dual;

create tablespace test 
nologging 
datafile 'c:/test.dbf' size 50M reuse
autoextend on next 512K maxsize 100M
extent management local;
create temporary tablespace testemp
tempfile 'c:/testemp.dbf' size 100M
extent management local;
create undo tablespace testundo
datafile 'c:/testundo.log' size 10M;

alter tablespace test offline normal;
alter tablespace test 
rename datafile '原来的数据文件路径和名称'
to '新的数据文件路径和名称';
alter tablespace test online;
