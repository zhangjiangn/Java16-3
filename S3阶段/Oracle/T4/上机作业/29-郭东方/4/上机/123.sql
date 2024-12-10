--字符函数
select initcap('hello')from dual;--首字母大写
select lower('HELLO')from dual;--所有字母转换小写
select upper('hello')from dual;--所有字母转换大写
select length('hello')from dual;--长度
select ltrim('   hello')from dual;--取消前空格
select rtrim('hello   ')from dual;--取消后空格
select rtrim('helloword', 'word')from dual;
select translate('jack','j','b')from dual;--首字母替换
select replace('jack','j','bl')from dual;--查n替m
select instr('oracle','a')from dual;--字母位置、
select substr('oracle10g',6,3)from dual;--第n位后的字母
select concat('oracle','10g')from dual;--链接字符
--日期函数
select sysdate from dual;--当前日期
select months_between(to_date('2010—10-21','yyyy--mm--dd'),sysdate)from dual;--两个日期之间间隔月数
select add_months(sysdate,5)from dual;--当前月份加5
select next_day(sysdate+12,5)from dual;--指定日期所在周的第n天
select last_day(sysdate+57)from dual;--指定日期所在月的最后一天
--转换函数
select to_char(sysdate,'yyyy"年"mm"月"dd"日"')from dual;
select to_char(sysdate,'yyyy-mm--dd day hh24:mi:ss')from dual;
select to_date('2012-10-19','yyyy-mm--dd')from dual;
select to_date('10-24-2013','mm-dd-yyyy')from dual;
select to_number('$39,275.50','$99,999.99')from dual;
select to_number('￥3,925.53','L9,999.99')from dual;
select to_number('0023','9999')from dual;
--nvl函数
--部门表：
create table dept(
did integer primary key,--主键
dname varchar2(20),--部门名称
manager integer,--外键，部门经理
tel varchar2(30),--部门电话
master integer --外键，上级部门
);
--员工表：
create table emp(
eid integer primary key,--主键
ename varchar2(20),--员工名称
sex varchar2(1),--性别
hire date, --入职日期
sar number(8,2),--工资
did integer --外键，所属部门
)

insert into dept values(1,'董事会',5,'111111',0)
insert into dept values(2,'市场部',6,'222222',1)
insert into dept values(3,'财务部',7,'333333',1)
insert into dept values(4,'采购部',8,'444444',1)
--员工表
insert into emp values(5,'tom','m',sysdate-234,4500.50,1)
insert into emp values(6,'jacky','f',sysdate-543,3200.50,2)

select * from dept
select * from emp
 
update dept set tel=null where dname='采购部'
select d.did,d.dname,nvl(d.tel,'无')from dept d;
 
