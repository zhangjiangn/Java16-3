create table depts(
  did integer primary key,
  dname varchar2(50),
  dUsername integer --���ž��������
)
create table emp(
  eid integer primary key,
  ename varchar2(50),
  sar number(8,2), --����
  eTime date, --��ְʱ��
  did integer --�������ţ������
)
--��depts���һ��[�ϼ�����sDept�������]
alter table depts add sDept integer;
 alter table depts add tel varchar2(30);
--ɾ��һ���ֶ�
alter table depts drop column tel;
---������ݣ�depts��
insert into depts values(1,'���²�',1,1)
insert into depts values(2,'���˲�',0,0)
insert into depts values(3,'����',0,0)
insert into depts values(4,'���²�',0,0)
---������ݣ�emp��
insert into emp values(1,'����',3000.00,sysdate,1)
insert into emp values(5,'��ͷ',5000.00,sysdate-25,1)
insert into emp values(2,'����',3500.00,sysdate,2)
insert into emp values(3,'����',4000.00,sysdate,3)
insert into emp values(4,'��ͷ',4500.00,sysdate,4)
---����һ��depts���±�
create table deptsNew as select dname from depts;   --�±��ԭ�������һ��
create table deptsNewTwo as select dname from depts where 1=2;   --�±��ԭ����ֶ�һ�� �±���û������

select * from deptsNew
select * from deptsNewTwo
--�±��е����� ���� ԭ���е�����
insert into deptsNewTwo(dname) select dname from depts;
--�������˵Ĺ�������500Ԫ
update emp set sar=sar+500;
--�����ʴ���5000��Ա������500Ԫ(���������ʵ���5000��Ŷ)
update emp set sar=sar-500 where sar>5000;
--��ѯ ����sar��������eTime������                  
select * from emp order by sar asc;
select * from emp order by eTime desc;
--��ѯ����1�ź�2�ŵ�Ա��(���ݼ���)
select * from emp where eid in(1,2);
--��ѯ�ա��š�������Ա����ģ����ѯ��
select * from emp where ename like '��_';
--��ѯÿ������ ����߹��ʡ���͹��ʡ�ƽ������
select max(e.sar) as ��߹���,min(e.sar) as ��͹���,avg(e.sar) as ƽ������,d.dname as ��������
from emp e,depts d
where e.did=d.did
group by d.dname
--��ѯ���в����� ƽ������С��4500�Ĳ���
select avg(e.sar) as ƽ������,d.dname as ��������
from emp e,depts d
where e.did=d.did
group by d.dname
having avg(e.sar)<4500
--rownum?
select * from (select rownum r,e.* from emp e) where r>=3 and r<=5;
--ԭ���������� �±���û������
select dname from depts
minus
select dname from deptsNew
--ԭ���������� �±���Ҳ������
select dname from depts
intersect
select dname from deptsNew
--��||
select ename||'�Ĺ�����'||sar from emp;

select * from depts

select * from emp




