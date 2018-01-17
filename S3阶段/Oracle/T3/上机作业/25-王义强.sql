select*from aws
select*from w
--创建一个新表 来自老表 不要表中的信息
create table dept3 as select* from dept where  1=2
--创建一个表
create table w (
id integer ,
money integer,
aid integer
)
delete  aws where id=null;
--向表中添加一个列
alter table aws add master  integer;
alter table aws add  monry integer;
alter table aws add  name varchar(5);
--修改列的类型
alter table aws modify master char;
--删除一个列
alter table aws drop column tame
--定义一个约束
alter table aws add constraint aa check(master in('a','b'));
--删除约束
alter table aws drop constraint aa
--添加信息
insert into aws values(1,111,'技术');
insert into aws values(5,1,'技一');
insert into aws values(6,1,'技二');
insert into aws values(2,222,'销售');
insert into aws values(3,333,'科研');
insert into aws values(4,444,'人力');
insert into w values(1,222222,2);
insert into w values(2,22222,1);
insert into w values(3,22222,2);
insert into w values(4,2222,3);
insert into w values(5,222222,1);
insert into w values(6,222,2);
insert into w values(7,22,1);
insert into w values(8,222,2);
insert into w values(9,222,3);
insert into w values(10,222,1);
--添加数据，数据来自另一个表
insert into dept3 select*from dept
--在一张表中查询技术部的分布门
select a.id,a.name,w.monry,w.name from aws a,aws w where a.monry=w.id;
--查询monry最少 如果有多个显示id最小的
select id,monry from(
select id, monry from aws order by  monry asc,id )
where rownum=1

select id,money,aid from w
select aid,avg(money) from w group by aid

select w.id,w.money from(select id,money,aid from w) w,(select aid,avg(money) from w group by aid) a where w.aid=a.aid and w.money>a.aid
