--部门表：
create table dept(
did integer primary key ,--主键
dname varchar2(20) , --部门名称
manager integer , --外键，部门经理
tel varchar2(30), --部门电话
master integer   --外键，上级部门
);
--员工表：
create table emp(
eid integer primary key,--主键
ename varchar2(20), --员工名称
sex varchar2(1), --性别
hire date , --入职日期
sar number(8,2), --工资
did integer --外键，所属部门 
);
--工作经历表：
create table history(
hid integer primary key , --主键
startdate date , --入职时间
enddate date, --离职时间
place varchar2(50), --公司名称
job varchar2(20), --职位
eid integer --外键，所属员工
);
--添加数据
--向部门表添加数据：
insert into dept values(1,'董事会',5,'1111111',0);
insert into dept values(2,'市场部',6,'2222222',0);
insert into dept values(3,'财务部',7,'3333333',0);
insert into dept values(4,'采购部',8,'4444444',0);
--向员工表添加数据：
insert into emp values(5,'tom','m',sysdate-234,4500.50,1 );
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2 );
insert into emp values(7,'kelly','f',sysdate-445,3491.32,3 );
insert into emp values(8,'red','f',sysdate-143,3700.00,4 );
insert into emp values(9,'blue','m',sysdate-423,3800.00,2 );
insert into emp values(10,'genji','m',sysdate-413,5100.00,3 );
insert into emp values(11,'peter','m',sysdate-243,6700.00,4 );
insert into emp values(12,'lucy','f','12-5月-05',6500.00,2);
insert into emp values(13,'key','m',to_date('2008-09-19','yyyy-mm-dd'),7200.00,3);
--1.字符函数
select initcap('hello') from dual;
select lower('HELLO') from dual;
select upper('hello') from dual;
select length('hello') from dual;
select ltrim('       hello') from dual;
select rtrim('hello     ')from dual;
select rtrim('helloword','word')from dual;
select translate('jack','j','b') from dual;
select replace('jack','j','bl') from dual;
select instr('oracle','a') from dual;
select substr('oracle10g',7,3) from dual;
select concat('oracle','10g') from dual;
--2.日期函数
select sysdate from dual;
select months_between(to_date('2017-12-16','yyyy-mm-dd'),sysdate) from dual;
select add_months(sysdate,5) from dual;
select next_day(sysdate+12,5) from dual;
select last_day(sysdate+57) from dual;
--3.转换函数
select to_char(sysdate,'yyyy"年"mm"月"dd"日"')from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_date('2012-10-19','yyyy-mm-dd') from dual;
select to_date('10-24-2013','mm-dd-yyyy') from dual; 
select to_number('$39,275.50','$99,999.99') from dual;
select to_number('￥3,925.53','L9,999.99') from dual;
--4.高级查询
update dept set tel=null where dname='市场部'
select d.did,d.dname,nvl(d.tel,'无') from dept d;
select eid,ename,
case sex
when 'm' then '男'
when 'f' then '女'
else sex
end
from emp;                                                                                                                                                                                            
select d.*from dept d where not exists(select e.*from emp e where e.did=d.did);
select *from emp;
select* from history;
select *from dept;
