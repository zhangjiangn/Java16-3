-- ���ű�
create table dept(
       did integer primary key not null,  -- ���� �ǿ�
       dname varchar2(20) not null, --�������� �ǿ� 
       manager integer , --���ž��� ���
       tel varchar2(20),-- ���ŵ绰
       master integer -- �ϼ����� ���  
)

create table emp(
       eid integer primary key not null,  -- ���� �ǿ�
       ename varchar2(20) not null, --�������� �ǿ� 
       sex  varchar2(1),-- �Ա�
       hire date,-- ��ְ����
       sar number(8,2),-- ����
       did integer  -- �ϼ����� ���  
)

-- ��������
create sequence seq_Emp
increment by 1
start with 1 --- ����С��minvalue��ֵ
minvalue 1
maxvalue 100
cycle
nocache;

-- ������ͼ
create or replace view Emp_view
as 
select ename,sex,hire from emp;

-- ����ͼ�������
 -- insert into Emp_view values(seq_Emp.Nextval,'����','f',sysdate);
create or replace view Emp_view
as 
select * from empp where sar > 5500
with check option;
insert intoo Emp_view values(seq_Emp.Nextval,'','')
select * from emp;
select * from Emp_view;


insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'�ԏ�','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (seq_Emp.Nextval,'����','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);
select * from emp;

-- ���� 
create unique index Dept_index on dept(dname);
create index Emp_index on emp(ename);
select * from  user_indexes where index_name = 'DEPT_INDEX'; -- ��ѯ��ǰ�û���������������
-- �鿴ָ����������ֶ���Ϣ
select index_name,column_name,column_position
from user_ind_columns
where table_name = 'EMP';

-- ͬ���
-- DBA��Ȩ
grant create public synonym to scott;

-- scott��½��������ͬ���
create public synonym sc for emp;
-- �������û�      
create user tom
identified by tom 
account unlock

-- ��Ȩ
grant connect to tom; -- ����Ȩ��
grant unlimited tablespace to tom; -- ����ʹ�ñ�ռ�Ȩ��
grant resource to tom; -- �ܴ���ʹ�ö���Ȩ��

-- tom ��ݵ�½
select * from sc;
-- scott ��Ȩ��TOM
grant select on sc to tom;
-- �鿴��ǰ�û���ʹ�õ�ͬ���
select * from user_synonyms;

--��ռ�
-- ����һ��TEST���ݱ�ռ�
create tablespace test 
nologging
datafile 'd:/test.dbf' size 50M reuse
autoextend on next 512k Maxsize 100M
extent management local;

-- ��ѯ��ռ�
select * from v$tablespace;
-- ����һ����ʱ��ռ�
create temporary tablespace testTemp
tempfile 'd:/testTemp.dbf' size 10M reuse
autoextend on next 512k Maxsize 100M
extent management local;
select * from v$datafile;
-- ��ѯ���б�ռ�
select tablespace_name,file_id,block_id,bytes,blocks from dba_free_space;
-- ����oracle��ռ�
select tablespace_name,file_id,bytes,file_name from dba_data_files;
-- �޸��ļ���С
alter database datafile
'D:\TEST.DBF' resize 800M;
-- ������ռ�
create tablespace Team
datafile 'd:/Team.dbf' size 100M
autoextend on 
next 50M
maxsize unlimited; 
-- �����û�����Ȩ
create user TeamManager identified by admin
default tablespace Team;
grant connect to TeamManager;
grant dba to TeamManager;
grant resource to TeamManager;
