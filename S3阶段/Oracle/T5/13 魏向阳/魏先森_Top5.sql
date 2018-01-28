-- 部门表
create table dept(
       did integer primary key not null,  -- 主键 非空
       dname varchar2(20) not null, --部门名称 非空 
       manager integer , --部门经理 外键
       tel varchar2(20),-- 部门电话
       master integer -- 上级部门 外键  
)

create table emp(
       eid integer primary key not null,  -- 主键 非空
       ename varchar2(20) not null, --部门名称 非空 
       sex  varchar2(1),-- 性别
       hire date,-- 入职日期
       sar number(8,2),-- 工资
       did integer  -- 上级部门 外键  
)

-- 创建序列
create sequence seq_Emp
increment by 1
start with 1 --- 不能小于minvalue的值
minvalue 1
maxvalue 100
cycle
nocache;

-- 创建视图
create or replace view Emp_view
as 
select ename,sex,hire from emp;

-- 向视图添加数据
 -- insert into Emp_view values(seq_Emp.Nextval,'赵兮','f',sysdate);
create or replace view Emp_view
as 
select * from empp where sar > 5500
with check option;
insert intoo Emp_view values(seq_Emp.Nextval,'','')
select * from emp;
select * from Emp_view;


insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'张涛','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'秦祯','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'王苏','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'李牧','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'赵忶','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'王尔','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'孙煦','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'黄卿','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);
select * from emp;

-- 索引 
create unique index Dept_index on dept(dname);
create index Emp_index on emp(ename);
select * from  user_indexes where index_name = 'DEPT_INDEX'; -- 查询当前用户创建的所有索引
-- 查看指定表的索引字段信息
select index_name,column_name,column_position
from user_ind_columns
where table_name = 'EMP';

-- 同义词
-- DBA授权
grant create public synonym to scott;

-- scott登陆创建公共同义词
create public synonym sc for emp;
-- 创建新用户      
create user tom
identified by tom 
account unlock

-- 授权
grant connect to tom; -- 连接权限
grant unlimited tablespace to tom; -- 无限使用表空间权限
grant resource to tom; -- 能创建使用对象权限

-- tom 身份登陆
select * from sc;
-- scott 授权给TOM
grant select on sc to tom;
-- 查看当前用户等使用的同义词
select * from user_synonyms;

--表空间
-- 创建一个TEST数据表空间
create tablespace test 
nologging
datafile 'd:/test.dbf' size 50M reuse
autoextend on next 512k Maxsize 100M
extent management local;

-- 查询表空间
select * from v$tablespace;
-- 创建一个临时表空间
create temporary tablespace testTemp
tempfile 'd:/testTemp.dbf' size 10M reuse
autoextend on next 512k Maxsize 100M
extent management local;
select * from v$datafile;
-- 查询空闲表空间
select tablespace_name,file_id,block_id,bytes,blocks from dba_free_space;
-- 增加oracle表空间
select tablespace_name,file_id,bytes,file_name from dba_data_files;
-- 修改文件大小
alter database datafile
'D:\TEST.DBF' resize 800M;
-- 创建表空间
create tablespace Team
datafile 'd:/Team.dbf' size 100M
autoextend on 
next 50M
maxsize unlimited; 
-- 创建用户及授权
create user TeamManager identified by admin
default tablespace Team;
grant connect to TeamManager;
grant dba to TeamManager;
grant resource to TeamManager;
