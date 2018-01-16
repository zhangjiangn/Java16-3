--创建表
create table idcard(
cid integer primary key ,
cardid varchar2(20)
)
--插入数据
insert into idcard values(1,'1oo100l');
insert into idcard values(2,'1oo20ol');
insert into idcard values(3,'1oo30ol');
insert into idcard values(4,'loo40ol');
insert into idcard values(5,'1oo5o0l');
insert into idcard values(6,'loo6o0l');
insert into idcard values(7,'1oo70ol');
--查询数据
select * from idcard
--将卡号更改o为0，更改l变1
update idcard  set cardid = replace(replace(cardid,'o','0'),'l','1')
--向上取整
select ceil('45.56') from dual;--46
--向下取整
select floor('45.56') from dual;--45
--四舍五入保留小数
select round('45.56',1) from dual;--45.6
--创建表
create table an(
a_n varchar2(20)
)
--删除表
DROP TABLE AN
--插数据
insert into an values('A-1');
insert into an values('A-5');
insert into an values('A-4');
insert into an values('A-2');
insert into an values('A-3');
insert into an values('A-7');
insert into an values('C-1');
insert into an values('P-1');
insert into an values('D-1');
insert into an values('B-1');
insert into an values('A-8');
--查询
select substr(a_n,1,1) from an
select LENGTH(a_n) from an
--查询排序
select * from an order by to_number(substr(a_n,3)) desc ,substr(a_n,1,1) desc
select * from an order by  ltrim(a_n,'A-') desc
select Ltrim(a_n,'A-') from an
select Rtrim(a_n,'1-') from an
--获取当前时间
select sysdate from dual
--在指定的日期基础上加指定的月数
select add_months(sysdate,5)from dual
--获取指定日期所在月的最后一天
select last_day(sysdate) from dual
select to_char(sysdate,'yyyy"年"mm"月"dd"日"') from dual
