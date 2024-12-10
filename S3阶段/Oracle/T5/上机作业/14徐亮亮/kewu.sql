
部门表：
create table dept(
      did integer primary key, --主键
      dname varchar2(20),  --部门名称
      manager varchar2(20), --外键，部门经理
      tel varchar2(30) --部门电话
);
select * from dept
alter table dept modify manager integer; --修改部门经理数据类型
alter table dept add master integer; --增加一个字段,外键，上级部门

员工表：
create table emp(
       eid integer primary key, --主键
       ename varchar2(20), --员工名称
       sex varchar2(1), --性别
       hire date, --入职时间
       sar number(8,2), --工资
       did integer --外键，所属部门
)
select * from emp 
--添加数据
insert into dept values(1,'董事会',5,'1111111',0);
insert into dept values(2,'市场部',6,'2222222',1);

insert into emp values(5,'tom','m',sysdate,4500.50,1);
insert into emp values(6,'jacky','m',sysdate,2982.12,2);
insert into emp values(7,'kelly','f',sysdate,3491.32,1);
insert into emp values(8,'red','f',sysdate,3700.00,2);
insert into emp values(9,'blue','f',sysdate,3800.00,1);
insert into emp values(10,'green','m',sysdate,5100.00,2);
insert into emp values(11,'peter','m',sysdate,6700.00,1);










--根据emp表创建视图，并向视图添加数据
create or replace view empview
as
select ename,sex,hire from emp;
insert into empview values(20,'coco','f',sysdate);
select * from emp;
select * from empview;

--修改视图定义，加入with check option选项后，再次添加数据
create or replace view empview
as
select * from emp where sar>5000
with check option;
insert into empview values(21,'pepers','m',sysdate,3456.3);
insert into empview values(22,'apple','m',sysdate,6567.4);

--给dept表的dname列创建唯一索引，给emp表的ename列创建不唯一索引
create unique index deptindex on dept(dname);
create index empindex on emp(ename);

--删除索引使用
drop index deptindex;
drop index empindex;

--创建新用户dip/dip，并授予其登录和访问资源的权限
create user dip indexified by dip account unlock;
grant connect to dip;--连接权限
grant unlimited tablespace to dip;--无限使用表空间权限
grant resource to dip;--能创建和使用对象的权限

--使用scott用户创建同义词，并授dip访问权限后,使用dip登录并访问同义词
conn sys as sysdba;
grant create public synonym to scott;
conn scott/tiger;
create public synonym sc for emp;
grant select on sc to dip;
conn dip/dip;
select * from sc;

--使用scott用户创建私有同义词并访问
create synonym sc2 for emp;
select * from sc2;
--删除同义词使用drop语句
drop public synonym sc;
drop synonym sc2;

--创建一个初值为3，最小值为0，最大值为10，循环取值的序列
create sequence seq_emp
increment by 1
start with 3
minvalue 0
maxvalue 10
cycle 
nocache;
--测试时使用：
select seq_emp.nextval from dual;
insert into empview values(seq_emp.nextval,'apple','m',sysdate,6567.4);

select seq_emp.currval from dual;

--表空间
--sys查看有哪些表空间
select * from v$tablespace;
--查看有哪些数据文件
select * from v$datafile;

--创建test数据表空间：
create tablespace test
	nologging
	datafile 'd:/test01.dbf' size 50M reuse
	autoextend on next 512k maxsize 100M
	extent management local;
  
--创建test表空间的临时表空间
create temporary tablespace testtemp
	tempfile 'f:/testtemp01.dbf' size 10M
	extent management local;
  
--创建日志表空间
create undo tablespace testundo
	datafile 'f:/testundo.log' size 10M;

--表空间脱机
alter tablespace test offline normal;
--恢复表空间为联机状态
alter tablesapce test online;













