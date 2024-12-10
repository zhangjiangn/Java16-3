--首字母大写
select initcap('hello world') from dual;
--全变成小写
select lower('HELLO') from dual;
--全变成大写
select upper('hello') from dual;
--显示长度
select length('hello') from dual;
--去除字符串前面的空格
select ltrim('  hello  ') from dual;
--去除字符串后面的空格
select rtrim('  hello  ') from dual;
--去除字符中指定的单词
select rtrim('helloworld','world') from dual;
--将字符串中一个字母改变
select translate('jack','a','o') from dual;
--将字符串中多个字母改变
select replace ('jack','ack','oke') from dual;
--查询一串字符串某个字符前有多少个字符
select instr ('oracle','a') from dual;
--查询一串字符串的第七位起的接下来4位
select substr ('oracle10g00',7,4) from dual;
--在‘oracle’后加上‘10g0’
select concat ('oracle','10g0') from dual;
--获取当前时间
select sysdate from dual;
--计算所填写时间距离今天的天数
select months_between(to_date('2018-02-16','yyyy-mm-dd'),sysdate) from dual;
--显示5个月后的时间
select add_months(sysdate,5)from dual;
--
select next_day(sysdate+12,5) from dual;
--显示今天后180天所在月的最后一天
select last_day(sysdate + 180) from dual;
--类型转换
select to_number ('$12,345.6','$99,999.9') from dual;
select to_number ('￥12,345.6','L99,999.9') from dual;






--某公司印了一批充值卡，卡的密码是随机生成的，现在出现这个问题：
--卡里面的“O和0”（哦和零）“i和1”（哎和一），用户反映说看不清楚，公司决定，把存储在数据库中的密码中所有的“哦”都改成“零”，把所有的“i”都改成“1”；
--请编写SQL语句实现以上要求；

create table Card(
cid integer primary key,
password varchar2(20)
)

drop table Card

insert into Card values(1,'oi10o1i0o0');
insert into Card values(2,'10o1i0oi1o');
insert into Card values(3,'0i1oi0o0oi');

update Card set password = 
replace (replace (password,'o','0'),'i','1')

select * from Card







--在数据库表中有以下字符数据，如：
--13-1、13-2、13-3、13-10、13-100、13-108、13-18、13-11、13-15、14-1、14-2
--现在希望通过SQL语句进行排序，并且首先要按照前半部分的数字进行排序，然后再按照后半部分的数字进行排需，输出要排成这样：
--13-1、13-2、13-3、13-10、13-11、13-15、13-18、13-100、13-108、14-1、14-2



create table SellRecord(
sid integer primary key,
ListNumber varchar2(10)
)

select * from SellRecord

insert into SellRecord values(1,'13-1');
insert into SellRecord values(2,'13-2');
insert into SellRecord values(3,'13-3');
insert into SellRecord values(4,'13-10');
insert into SellRecord values(5,'13-100');
insert into SellRecord values(6,'13-108');
insert into SellRecord values(7,'13-18');
insert into SellRecord values(8,'13-11');
insert into SellRecord values(9,'13-15');
insert into SellRecord values(10,'14-1');
insert into SellRecord values(11,'14-2');

select * from  
SellRecord
order by to_number(substr(ListNumber,1,instr(ListNumber,'-')-1)),to_number(substr(ListNumber,instr(ListNumber,'-')+1));


