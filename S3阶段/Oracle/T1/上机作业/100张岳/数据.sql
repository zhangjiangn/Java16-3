--���ű�
create table dept(
did integer primary key ,
dname varchar2(20),
maneger integer ,
tel varchar2(30),
master integer 
)
--Ա����
create table emp(
eid integer primary key ,
ename varchar2(20),
sex varchar2(10),
tim date,
sar number(4,2),
did integer 
)
--��������
create table history(
hid integer primary key ,
startim date,
endtim date,
hname varchar2(20),
job varchar2(20),
eid integer 
)
--�޸�����
alter table emp modify sar number(8,2);
select * from dept;
select * from emp;
select * from history;
insert into dept values(1,'���²�',5,'111111',0)
insert into dept values(2,'���²�',5,'111111',0);
insert into dept values(3,'�г���',5,'111111',1);
insert into dept values(4,'����',5,'111111',1);
insert into dept values(5,'���',5,'111111',1)
insert into emp values(5,'xy','��',sysdate,4500.01,1);
insert into emp values(6,'xe','��',sysdate,4500.00,2);
insert into emp values(7,'xs','Ů',sysdate,4500.00,3);
insert into emp values(8,'xw','��',sysdate,4500.00,4);
insert into emp values(9,'xl','Ů',sysdate,4500.00,1);
insert into emp values(10,'xq','Ů',sysdate,4500.00,2);
insert into emp values(11,'xb','��',sysdate,4500.00,3);
insert into emp values(12,'xj','Ů',sysdate,4500.00,4);
insert into emp values(13,'xm','Ů',sysdate,4500.00,1);
--�޸Ĳ��ű�
update dept set maneger=6 where did=2
update dept set maneger=7 where did=3;
update dept set maneger=8 where did=4;
--�޸Ĺ���
update emp set sar = sar+400 where eid = 6;
update emp set sar = sar+300 where eid = 7;
update emp set sar = sar+200 where eid = 8;
update emp set sar = sar+100 where eid = 9;
update emp set sar = sar+700 where eid = 12;
delete emp where ename = 'xm'
--��ѯǰ��������
select *  from emp where rownum < 4;
--��ѯÿ��������ߣ���ͣ�ƽ������
select dname,max(sar),min(sar),avg(sar) from dept d , emp e where d.did=e.did group by dname
--��ѯ4-6������
select * from (select rownum r,e.* from emp e)where r>3 and r<7
--�������ַ���
select '���Ϊ'||did||'�Ĳ�������'||dname from dept
----��ѯ���ʱ����ڲ���ƽ�����ʸߵ�Ա��
select * from emp where eid in (select a.eid  from(select eid,sar,did from emp ) a,(select did,avg(sar) sar from  emp  group by did) b where b.did=a.did and a.sar>b.sar);
--��ѯ�������Ĳ��ţ�����������������ͬ���������С��
select * from dept where did =(select did from (select did,count(eid) num  from emp group by did order by num desc,did asc)where rownum=1)
--��ѯ����Ա����������Ϣ
select e.*,d.dname  from emp e,dept d where d.did=e.did 
--��ѯ���в��ż���Ա����û��Ա����ҲҪ�����
select dname,ename from dept d left join emp e on  d.did=e.did 
--��ѯ���в��ű�Ŵ���2�Ĳ��ź�Ա��
select e.*,d.dname  from emp e,dept d where d.did=e.did and d.did >2
--��ѯ���зǲ��ž����Ա��
select e.* from emp e where eid not in (select maneger  from  dept d) 
select dname, count(*) from dept d , emp e where d.did=e.did group by dname having count(*)=2

