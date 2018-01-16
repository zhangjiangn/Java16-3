-- 部门表
create table dept(
       did integer primary key not null,  -- 主键 非空
       dname varchar2(20) not null, --部门名称 非空 
       manager integer , --部门经理 外键
       tel varchar2(20),-- 部门电话
       master integer -- 上级部门 外键  
)
-- 员工表
create table emp(
       eid integer primary key not null,  -- 主键 非空
       ename varchar2(20) not null, --部门名称 非空 
       sex  varchar2(1),-- 性别
       hire date,-- 入职日期
       sar number(8,2),-- 工资
       did integer  -- 上级部门 外键  
)
-- 工作经历表
create table history(
       hid integer primary key not null,-- 主键
       startdate date, --入职时间
       enddate date,-- 离职时间
       palce varchar2(50), -- 公司名称
       job varchar2(20), -- 职位
       eid  integer -- 外键 所属员工
)

-- 查询表
select * from dept
select * from emp
select * from history
-- 修改列类型
alter table emp modify hire date;
-- 增加约束
alter table emp add constraint sex_Value  check(sex in('m','f'));
-- 删除约束
alter table emp drop constraint sex_Value;
-- 添加部门信息
insert into dept(did,dname,manager,tel,master) values (1,'董事会','1','10018',0);
insert into dept(did,dname,manager,tel,master) values (2,'行政部','2','1008600',0);
insert into dept(did,dname,manager,tel,master) values (3,'外交部','5','1008601',0);
insert into dept(did,dname,manager,tel,master) values (4,'技术部','3','1008602',0);
insert into dept(did,dname,manager,tel,master) values (5,'财务部','2','1008603',0);
insert into dept(did,dname,manager,tel,master) values (6,'后勤部','5','1008604',0);

-- 添加员工信息
insert into emp(eid,ename,sex,hire,sar,did) values (1,'张涛','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (2,'秦祯','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (3,'王苏','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (4,'李牧','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (5,'赵忶','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (6,'王尔','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (7,'孙煦','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (8,'黄卿','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);
-- 修改数据
select * from dept
select * from emp
select * from history
update emp set sar = 6500 where ename = '张涛' ;
update emp set sar = sar + 500 where sar <= 5500 ;
update dept set master = 1 where did = 8 ;

-- 现有表创建表
create table empTwo as
select * from emp
where 1=2；

select * from empTwo

--查询
select * from emp order by sar asc;
select * from emp order by did asc,sar desc;
select * from emp where sar between 6000 and 7500;
select * from emp where sar not between 6000 and 6500;
select * from emp where did in (2,3,4);
select * from emp where ename like '张_'; 
select * from emp where sex = 'm' and sar>6000;
-- avg sum max min count 
select avg(sar),max(sar),min(sar),count(eid)from emp;
select count(eid),sum(sar) from emp;
select distinct(did) as 整合 from emp;
-- 分组查询
select d.dname,max(e.sar),min(e.sar),avg(e.sar),count(d.did)
from dept d ,emp e
where d.did = e.did
group by d.dname;

select d.dname ,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did = e.did
group by d.dname
having avg(e.sar)<6500;

select * from emp 
minus
select * from empTwo;

select * from emp 
intersect
select * from empTwo;

-- || 连接字符串

select ename || '的工资是' || sar || '元' from emp;

-- 子查询
select * from emp where eid not in(select manager from dept);

select * from emp where eid in(
       select e.eid
       from (select eid,sar,did from emp)e,
       (select did,avg(sar)sar
       from emp
       group by did) r
       where e.did = r.did and e.sar > r.sar);
       
       select *  from dept where did = (
       select did
       from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc)
       where rownum = 1
       );
       
-- 内外连接
insert into dept values(7,'研发部','3','1001000',0) 


select d.did , d.dname , d.tel ,m.dname 上级部门
from dept d left join dept m
on d.master = m.did;
