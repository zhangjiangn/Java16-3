--���ű�
create table dept(
did integer primary key,--����
dname varchar2(20),--��������
manager integer,--��������ž���
tel varchar2(30),--���ŵ绰
master integer --������ϼ�����
);
--Ա����
create table emp(
eid integer primary key,--����
ename varchar2(20),--Ա������
sex varchar2(1),--�Ա�
hire date, --��ְ����
sar number(8,2),--����
did integer --�������������
);
--����������
create table history(
hid integer primary key,--����
stardata date,--��ְʱ��
enddate date,--��ְʱ��
place varchar2(50),--��˾����
job varchar2(20),--ְλ
eid integer--���������Ա��
);
--��ѯ���ű�Ա��������������
select * from dept
select * from emp
select * from history
--�������
--���ű�
insert into dept values(1,'���»�',5,'111111',0)
insert into dept values(2,'�г���',6,'222222',1)
insert into dept values(3,'����',7,'333333',1)
insert into dept values(4,'�ɹ���',8,'444444',1)
--Ա����
insert into emp values(5,'tom','m',sysdate-234,4500.50,1)
insert into emp values(6,'jacky','f',sysdate-543,3200.50,2)
--ʹ�����б�����
create table historytwo as
select place,job from history;--where 1=2

select * from historytwo

--�޸�������
alter table historytwo modify place varchar2(100)
--ɾ��һ���ֶ�
alter table historytwo drop column job
--����һ���ֶ�
alter table historytwo add job integer
--���һ��Լ��
alter table emp add constraint sexvalue check(sex in('m','f'))
--ɾ��һ��Լ��
alter table emp drop constraint sexvalue
--ɾ�����ݱ�
drop table historytwo
--�������˵Ĺ��ʼ�500
update emp set sar=sar+500
--����������6000��Ա�����ʼ�500
update emp set sar=sar+500 where sar<6000
--��������
select * from emp order by sar asc
--between..and
select * from emp where sar between 4000 and 6000
--in��not in
select * from emp where did in(1,2)
--like
select * from emp where ename like 't%' 
--||
select ename ||'�Ĺ�����'||sar||'Ԫ'from emp

