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

--字符函数
select initcap('hello') from dual;
select lower('HELLO') from dual;
select upper('hello') from dual;
select length('hello') from dual;
select ltrim('  hello') from dual;

select rtrim('hello  ') from dual;
select rtrim('helloword','word') from dual;

select translate('jack','j','b') from dual;
select replace('jack','ja','bl') from dual;
select instr('oracle','a') from dual;
select substr('oracle10g',7,3) from dual;
select concat('oracle','10g') from dual;

--日期函数
select sysdate from dual;
select months_between(to_date('2018-1-15','yyyy-mm-dd'),sysdate) from dual;
select add_months(sysdate,5) from dual;
select next_day(sysdate+12,5) from dual;
select last_day(sysdate+57) from dual;
--转换函数
select to_char(sysdate,'yyyy"年"mm"月"dd"日"') from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_char(sysdate,'yyyy-mm-dd day am:hh24:mi:ss') from dual;

select to_date('2013-10-16','yyyy-mm-dd') from dual;

select to_number('$39,275.50','$99,999.99') from dual;
select to_number('￥3,925.53','L9,999.99') from dual;
select to_number('￥12,925.5','L99,999.9') from dual;
select to_number('0023','9999') from dual;

--其他
update dept set tel=null where dname='市场部';
select d.did,d.dname,nvl(d.tel,'不详') from dept d;
--与jacky同一部门性别相同的员工
select * from emp where (sex,did) in(select sex,did from emp where ename='jacky');

select eid,ename,
 case sex
  when 'm' then '男' 
  when 'f' then '女' 
  else sex
  end 
  from emp;
  
--存在exists
select d.*from dept d where exists (select e.*from emp e where e.did=d.did);
select d.*from dept d where not exists (select e.*from emp e where e.did=d.did);






