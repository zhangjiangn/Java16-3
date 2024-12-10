create table depts(
  did integer primary key,
  dname varchar2(50),
  address varchar2(50)  --
)
create table emp(
  eid integer primary key,
  ename varchar2(50),
  sar number(8,2), --工资
  eTime date, --入职时间
  did integer --所属部门（外键）
)
--在emp添加一列
alter table emp add sex varchar2(2);
--添加数据
insert into depts values(1,'董事部','大佬')
insert into depts values(2,'闲人部','')
insert into depts values(3,'财务部','')
insert into depts values(4,'人事部','人事')
insert into depts values(5,'销售部','')

insert into emp values(1,'张三',3000.00,sysdate,1,'m');
insert into emp values(2,'鬼头',5000.00,sysdate-25,1,'f');
insert into emp values(6,'毛毛',4000.00,sysdate-15,1,'f');
insert into emp values(7,'灰灰',4500.00,sysdate-5,1,'m');
insert into emp values(8,'喵喵',4000.00,sysdate,1,'m');

insert into emp values(3,'李四',3500.00,sysdate,2,'m');
insert into emp values(4,'王五',4000.00,sysdate,3,'m');
insert into emp values(5,'大头',4500.00,sysdate,4,'f');
---用nvl(m,n) 【为空则显示n】
select did,dname,nvl(address,'空') from depts;
---高级查询【查询 和张三在同一部门且性别相同的 员工信息】
select * from emp where (did,sex) in(select did,sex from emp where ename='张三');
---标量查询case【查询员工信息 且将m,f改为男，女】
select ename,sar,
  case sex
    when 'm' then '男'
    when 'f' then '女' 
  end as sex
from emp;
---利用exists【查询（存在）员工的部门】
select d.* from depts d where not exists(select e.did from emp e where e.did=d.did);
---利用with

--------函数-------
---1数学函数
select abs(-83) from dual;--绝对值
select ceil(-83.80) from dual;--向上取整
select ceil(83.80) from dual;
select floor(-83.80) from dual;--向下取整
select floor(83.80) from dual;
select round(123.67788,2) from dual;--四舍五入（对m保留n位小数）
select sign(29) from dual;--获取正负号
---2字符函数
select concat('cao','bing') from dual; --链接两个字符
select substr('caobingf',4,4) from dual; --从第几个开始，截取几个字符
select substr('caobingf',4) from dual;
select initcap('caobing') from dual;--首字母大写   upper(m)所有字母大写   lower(m)所有字母小写
select ltrim('caobx f','cao') from dual;--移除指定的左边字符
select rtrim('caobxf','xf') from dual;--移除指定的右边字符
select translate('caobingc','c','l') from dual; --替换单个字符
select replace('caobingc','c','jl') from dual; --替换多个字符
select instr('caobingc','c') from dual;--找出指定字符的位置
---3日期函数
select sysdate from dual;--当前日期
select months_between(to_date('2017-6-23','YYYY-MM-DD'),to_date('2017-2-23','YYYY-MM-DD')) from dual;--两个日期之间间隔月数
select add_months(sysdate,3) from dual;--在指定日期上 加上月数
select next_day(sysdate,3) from dual; --获取指定日期 在当周是第n天 【周日是第一天】 返回的值是下周的第n天的日期
select last_day(sysdate) from dual; --指定日期 当月的最后一天
---4转换函数
select to_char(sysdate,'YYYY-MM-DD') from dual; --将 指定日期 转换成 指定的日期格式
select to_date('2017-1-13','YYYY-MM-DD') from dual;--描述 指定日期的类型
select to_number('￥124.90','L999.99') from dual;
select to_number('$124.90','$999.99') from dual;
select to_number('￥000124.90','L000999.99') from dual;
