
--测试字符函数
select initcap('hello')from dual;
select lower('HELLO')from dual;
select upper('hello')from dual;
select ltrim('hello') from dual;
select replace('jack','j','b')from dual;

select sysdate from dual;

select months_between(to_date('2010-10-21','yyyy-mm-dd'),sysdate)from dual;

selecrt next_day(sysdate+12.5) from dual;
select last_day(sysdate+57) from dual;


--测试转换函数
select to_char(sysdate,'yyyy"年"mm"月"dd"日"')from dual;
select to_char(sysdate,'yyy-mm-dd day hh24:mi:ss')from dual;
select to_date ('2012-10-19','yyyy-mm-dd')from dual;
select to_number('0023','9999')from dual;
select to_number ('$39,275.50','$99.999.99')from dual;
select last_day(sysdate+57)from dual;

--测试转换函数
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24: mi:ss')from dual;
select to_date('2012-10-19','yyyy-mm-dd')from dual;
select to number('$39,275.`50','$99,999.99')from dual;
select to_number('0023','9999')from dual;

--创建部门表插入数据
create table dept(
did integer primary key,
dname varchar2(20),
manager integer,
tel varchar2(30),
master integer  
);
insert into dept values(1,'张三','55','373838',788);
select *from dept 

--创建员工表并插入数据
    create table emp(
    eid integer primary key,
    ename varchar2(20),
    sex varchar2(1),
    hire date,
    sar number(8,2),
    did integer
    );    
insert into emp values(1,'张四',1,sysdate-123,5000,1)   
  
select *from emp


--高级查询
update dept set tel =null where dname='研发部'
select d.did,d.dname,nvl(d.tel,'无')from dept d;

--使用标量查询将性别显示为汉字
select eid,ename,case sex
when 'm' then '男'
when'f' then'女'
else sex
end 
from emp


select *From emp

--使用exists子句查询没有员工的部门
select d.*from dept d where not exists (select e.*from emp e where e.did=d.did);




select*from dept


