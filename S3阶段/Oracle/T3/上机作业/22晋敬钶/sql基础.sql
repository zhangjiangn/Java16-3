--���ű�
create table dept (
       did integer primary key,--����
       dname varchar2(20), --��������
       manager integer, --��������ž���
       tel varchar2(20),--���ŵ绰
       master integer --������ϼ�����
);
insert into dept(did,dname) values(1,'�г���')
insert into dept(did,dname) values(2,'�з���')
insert into dept(did,dname,manager) values(3,'���²�',1)
--Ա����
create table emp(
       eid integer primary key, --����
       ename varchar2(20),--Ա������
       sex varchar2(1),--�Ա�
       hire date,--��ְ����
       sar number(8,2),--����
       did integer --�������������
       )
insert into emp(eid,ename,sex,sar,did) values(1,'��ǰ��','m',5000,1);
insert into emp(eid,ename,sex,sar,did) values(2,'����ǹ','m',6000,2);
insert into emp(eid,ename,sex,sar,did) values(3,'������','m',5600,2);
insert into emp(eid,ename,sex,sar,did) values(4,'��һ��','w',8000,3);
update emp set sex='��' where eid = 1 ;
update emp set sex='��' where eid = 2 ;
update emp set sex='��' where eid = 3 ;
update emp set sex='Ů' where eid = 4 ;
--����������
create table history(
       hid integer primary key,--����
       startdate date,--��ְʱ��
       enddate date,--��ְʱ��
       place varchar2(50),--��˾����
       job varchar2(20),--ְλ
       eid integer -- ���������Ա��
);

select * from dept;
select * from emp;
select * from history;
 --�޸ı�ṹʹ��alter���
alter table emp modify sex varchar2(2); --�޸�������
alter table dept drop column master; --ɾ��һ���ֶ�
alter table emp add constraint sexvalue check(sex in('��','Ů'));--���һ�����Լ��
alter table emp drop constraint sexvalue; --ɾ��һ��Լ��
--��������ʹ��update���
update emp set sar=sar+500 where sar<6000;--����������6000��Ա�����ʼ�500
--ɾ������ʹ��delete���
delete emp;--ɾ��������������
delete emp where ename = '��ǰ��';--������ɾ��
select max(sar),min(sar) from emp ;--
select ename,sar from emp where sar in (select max(sar) from emp);--��ѯ�������Ա��������
-- ||���������ַ���
select ename ||'�Ĺ�����' ||sar||'Ԫ' from emp;
