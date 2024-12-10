
���ű�
create table dept(
      did integer primary key, --����
      dname varchar2(20),  --��������
      manager varchar2(20), --��������ž���
      tel varchar2(30) --���ŵ绰
);
select * from dept
alter table dept modify manager integer; --�޸Ĳ��ž�����������
alter table dept add master integer; --����һ���ֶ�,������ϼ�����

Ա����
create table emp(
       eid integer primary key, --����
       ename varchar2(20), --Ա������
       sex varchar2(1), --�Ա�
       hire date, --��ְʱ��
       sar number(8,2), --����
       did integer --�������������
)
select * from emp 
--�������
insert into dept values(1,'���»�',5,'1111111',0);
insert into dept values(2,'�г���',6,'2222222',1);

insert into emp values(5,'tom','m',sysdate,4500.50,1);
insert into emp values(6,'jacky','m',sysdate,2982.12,2);
insert into emp values(7,'kelly','f',sysdate,3491.32,1);
insert into emp values(8,'red','f',sysdate,3700.00,2);
insert into emp values(9,'blue','f',sysdate,3800.00,1);
insert into emp values(10,'green','m',sysdate,5100.00,2);
insert into emp values(11,'peter','m',sysdate,6700.00,1);










--����emp������ͼ��������ͼ�������
create or replace view empview
as
select ename,sex,hire from emp;
insert into empview values(20,'coco','f',sysdate);
select * from emp;
select * from empview;

--�޸���ͼ���壬����with check optionѡ����ٴ��������
create or replace view empview
as
select * from emp where sar>5000
with check option;
insert into empview values(21,'pepers','m',sysdate,3456.3);
insert into empview values(22,'apple','m',sysdate,6567.4);

--��dept���dname�д���Ψһ��������emp���ename�д�����Ψһ����
create unique index deptindex on dept(dname);
create index empindex on emp(ename);

--ɾ������ʹ��
drop index deptindex;
drop index empindex;

--�������û�dip/dip�����������¼�ͷ�����Դ��Ȩ��
create user dip indexified by dip account unlock;
grant connect to dip;--����Ȩ��
grant unlimited tablespace to dip;--����ʹ�ñ�ռ�Ȩ��
grant resource to dip;--�ܴ�����ʹ�ö����Ȩ��

--ʹ��scott�û�����ͬ��ʣ�����dip����Ȩ�޺�,ʹ��dip��¼������ͬ���
conn sys as sysdba;
grant create public synonym to scott;
conn scott/tiger;
create public synonym sc for emp;
grant select on sc to dip;
conn dip/dip;
select * from sc;

--ʹ��scott�û�����˽��ͬ��ʲ�����
create synonym sc2 for emp;
select * from sc2;
--ɾ��ͬ���ʹ��drop���
drop public synonym sc;
drop synonym sc2;

--����һ����ֵΪ3����СֵΪ0�����ֵΪ10��ѭ��ȡֵ������
create sequence seq_emp
increment by 1
start with 3
minvalue 0
maxvalue 10
cycle 
nocache;
--����ʱʹ�ã�
select seq_emp.nextval from dual;
insert into empview values(seq_emp.nextval,'apple','m',sysdate,6567.4);

select seq_emp.currval from dual;

--��ռ�
--sys�鿴����Щ��ռ�
select * from v$tablespace;
--�鿴����Щ�����ļ�
select * from v$datafile;

--����test���ݱ�ռ䣺
create tablespace test
	nologging
	datafile 'd:/test01.dbf' size 50M reuse
	autoextend on next 512k maxsize 100M
	extent management local;
  
--����test��ռ����ʱ��ռ�
create temporary tablespace testtemp
	tempfile 'f:/testtemp01.dbf' size 10M
	extent management local;
  
--������־��ռ�
create undo tablespace testundo
	datafile 'f:/testundo.log' size 10M;

--��ռ��ѻ�
alter tablespace test offline normal;
--�ָ���ռ�Ϊ����״̬
alter tablesapce test online;













