--���ű�
create table dept(
       did integer primary key not null,--����
       dname varchar2(20), --��������
       manager integer,--�������
       tel varchar(30),--�绰
       master integer--�ϼ����ţ����
);
--Ա����
create table emp(
       eid integer primary key not null,--����
       ename varchar2(20),--Ա������
       sex varchar2(10),--�Ա�
       hire date,--��ְ����
       sar number(8,2),--����
       did integer--�������ţ����
);
--����������
create table history(
       hid integer primary key not null,--����
       stardate date,--��ְʱ��
       enddate date,--��ְʱ��
       place varchar2(20),--��˾����
       eid integer--����Ա�������
);

--�޸� Ա���� �Ա������
alter table emp modify sex varchar2(2);

--���� ���������� ְλ
alter table history add job varchar2(20);--ְλ
--ɾ�� ���������� ְλ
alter table history drop column job;

--��� �Ա�Լ��
alter table emp add constraint sexvalue check(sex in('��','Ů'));
-- ɾ��Լ��
alter table emp drop constraint sexvalue;

/*
select * from dept;
select * from emp;
select * from history;
*/
/*
drop table history;
drop table emp;
drop table dept;
*/

--����
insert into dept values(1,'������','1','123456',0);
insert into dept values(2,'�г���','2','123456',0);
insert into dept values(3,'����','3','123456',0);
insert into dept values(4,'���²�','4','123456',0);
insert into dept values(5,'����һ��','1','123456',1);
--Ա��
insert into emp values(1,'tom','��',sysdate-365,7000,1);
insert into emp values(2,'jacky','��',sysdate-365,5000,2);
insert into emp values(3,'kelly','Ů',sysdate-365,4000,3);
insert into emp values(4,'red','Ů',sysdate-365,3000,4);
insert into emp values(5,'blue','��',sysdate-365,6000,5);
insert into emp values(6,'yellow','Ů',sysdate-365,5500,2);
--��������
insert into history values(1,sysdate-365,'18-5��-05','�Ϻ�',1,'����Ա');
insert into history values(2,sysdate-365,'18-5��-05','����',2,'����Ա');
insert into history values(3,sysdate-365,'18-5��-05','����',3,'����Ա');
insert into history values(4,sysdate-365,'18-5��-05','����',4,'����Ա');
insert into history values(5,sysdate-365,'18-5��-05','����',5,'����Ա');
insert into history values(6,sysdate-365,'18-5��-05','����',6,'����Ա');
/*
select * from dept;
select * from emp;
select * from history;
*/
/*
delete from history;
delete from emp;
delete from dept;
*/


--������emptwo��empһ��
create table emptwo as
select * from emp where 1=2;

drop table emptwo;
select * from emptwo;

--��������
insert into emptwo select * from emp;
--������С��6000�ļ�500
update emp set sar=sar+500 where sar<6000;
--�޸�jacky����ְ����
update emp set hire=to_date('2012-02-01','yyyy-mm-dd') where ename='jacky';

--��ѯÿ�����ŵ���ߣ���ͣ�ƽ������
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname;
--����ƽ������С��5000��
select d.dname,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did=e.did
group by d.dname
having avg(e.sar)<5000;

--��ѯemp 3��5��
select * from (select rownum r,e. * from emp e)
where r>2 and r<6;

--���ʴ���5000�ĺ�2���� ����
select * from emp where sar>5000
union
select * from emp where did=2;

--emp�� emptwoû�е�
select * from emp
minus
select * from emptwo;

--emp��emptwoҲ��
select * from emp
intersect
select * from emptwo;

--
select ename||'�Ĺ�����'||sar||'Ԫ' from emp;

