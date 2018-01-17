--创建表
create table idcard(
cid integer primary key ,
cardid varchar2(20)
)
--插入数据
insert into idcard values(1,'1o10l');
insert into idcard values(2,'1o20l');
insert into idcard values(3,'1o30l');
insert into idcard values(4,'lo40l');


--将卡号更改o为0，更改l变1
update idcard  set cardid = replace(replace(cardid,'o','0'),'l','1')
--向上取整
select ceil('45.56') from dual;

--创建表
create table ten(
a_n varchar2(20)
)

--插数据
insert into ten values('A-1');
insert into ten values('A-5');
insert into ten values('A-4');
insert into ten values('A-2');
insert into ten values('C-1');
insert into ten values('P-1');
insert into ten values('D-1');
insert into ten values('B-1');
insert into ten values('A-8');
--查询
select substr(a_n,1,1) from ten
select LENGTH(a_n) from ten
--查询排序
select * from ten order by to_number(substr(a_n,3)) desc ,substr(a_n,1,1) desc
select * from ten order by  ltrim(a_n,'A-') desc
select Ltrim(a_n,'A-') from ten
select Rtrim(a_n,'1-') from ten
--获取指定日期所在月的最后一天
select last_day(sysdate) from dual
select to_char(sysdate,'yyyy"年"mm"月"dd"日"') from dual
