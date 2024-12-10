--���ű�
create table dept(
did integer primary key ,--����
dname varchar2(20) , --��������
manager integer , --��������ž���
tel varchar2(30), --���ŵ绰
master integer   --������ϼ�����
);
--Ա����
create table emp(
eid integer primary key,--����
ename varchar2(20), --Ա������
sex varchar2(1), --�Ա�
hire date , --��ְ����
sar number(8,2), --����
did integer --������������� 
);
--����������
create table history(
hid integer primary key , --����
startdate date , --��ְʱ��
enddate date, --��ְʱ��
place varchar2(50), --��˾����
job varchar2(20), --ְλ
eid integer --���������Ա��
);
--���Ʊ�:
create table emptwo as
select ename,sex , hire from emp;

create table emptwo as
select ename,sex , hire from emp where 1=2;
--�޸ı�ṹ:
--�޸��е�����
alter table emp modify sex varchar2(2);
--ɾ��һ���ֶ�
alter table dept drop column master;
--����һ���ֶ�
alter table dept add master integer;
--���һ�����Լ��
alter table emp add constraint sexvalue check(sex in('m','f'));
--ɾ��һ��Լ��
alter table emp drop constraint sexvalue;
--ɾ����
drop table dept;
drop table emptwo;
drop table history;

--�������
--���ű�������ݣ�
insert into dept values(1,'���»�',5,'1111111',0);
insert into dept values(2,'�г���',6,'2222222',0);
insert into dept values(3,'����',7,'3333333',0);
insert into dept values(4,'�ɹ���',8,'4444444',0);
--��Ա����������ݣ�
insert into emp values(5,'tom','m',sysdate-234,4500.50,1 );
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2 );
insert into emp values(7,'kelly','f',sysdate-445,3491.32,3 );
insert into emp values(8,'red','f',sysdate-143,3700.00,4 );
insert into emp values(9,'blue','m',sysdate-423,3800.00,2 );
insert into emp values(10,'genji','m',sysdate-413,5100.00,3 );
insert into emp values(11,'peter','m',sysdate-243,6700.00,4 );
insert into emp values(12,'lucy','f','12-5��-05',6500.00,2)
insert into emp values(13,'key','m',to_date('2008-09-19','yyyy-mm-dd'),7200.00,3);
insert into emptwo (ename,hire,sex)select ename,hire,sex from emp;
--�������˵Ĺ��ʼ�500��
update emp set sar=sar+500;
--����������6000��Ա�����ʼ�500��
update emp set sar=sar+500 where sar<6000;
--�޸�kelly����ְ����
update emp set hire=to_date('2012-03-01','yyyy-mm-dd') where ename='kelly'
--ɾ��������
delete emp;
--������ɾ����
delete emp where ename='key';
--select��ѯ
select* from emp order by sar asc;--��������
select*from emp order by did asc,sar desc;--���ű�����򣬹��ʽ���
--between...and
select*from emp where sar between 3000 and 6000;
select*from emp where sar not between 3000 and 6000;
--in���������
select*from emp where did in(2,3);
--ģ����ѯ
select*from emp where ename like 't%';
--and��or
select*from emp where sex='f' and sar>5000;
select*from emp where sex='f'or sar>5000;
--�ۺϺ���
select avg(sar),max(sar),min(sar) from emp;
select count(eid),sum(sar)from emp;
--distinct���
select distinct(did) from emp;
--group by��ѯ
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname;
--having
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname
having avg(e.sar)<5000;
--rownumα�в�ѯ
select*from (select rownum r,e.*from emp e)
where r>3 and r<7;
--union,unionall,intersect��minus���ϲ���
select*from emp where sar>5000
union
select*from emp where did=2;
select*from emp
minus
select* from emptwo;
select*from emp
intersect
select* from emptwo;
--||�������ַ���
select ename ||'�Ĺ�����'||sar||'Ԫ' from emp;
--�Ӳ�ѯ
select*from emp where eid not in(select manager from dept);
select eid ,sar,did from emp;
select did,avg(sar)
from emp
group by did;
select a.eid
from(select eid,sar,did from emp)a,
(select did,avg(sar)sar
from emp
group by did)b
where a.did=b.did and a.sar>b.sar
);
select *from emp;
select* from history;
select *from emptwo;
