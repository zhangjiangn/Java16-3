create table dept (
            did integer primary key,--����
            dname varchar2(20),--��������
            manager integer,--��������ž���
            tel varchar2(30),--���ŵ绰
            master integer--������ϼ�����

);
create table emp(
      eid integer primary key,--����
      ename  varchar2(20),--Ա������
      sex  varchar2(1),--�Ա�
      hire date,--��ְ����
      sar number(8,2),--����
      did integer--�������������
      
)
create table  history(
       hid integer primary key,--����
       startdate date,--��ְʱ��
       enddate date,--��ְʱ��
       place  varchar2(50),--��˾����
       job varchar2(20),--ְλ
       eid integer--���������Ա��
)
--��ѯ��
select *from emp;
select *from dept;
select *from history;
--ɾ����
drop table emp;
drop table dept;
drop table history;


create table emptwo as select *from emp;
--ֻ������ṹ��������������
create table emptwo1 as select *from emp where 1=2;
--���һ����
alter table emptwo add em varchar2(25);
--�޸��е���������
alter table emptwo modify em integer;
--���Լ��
alter table emptwo add constraint cl check(sex 'm','f');
--ɾ��Լ��
alter table emptwo drop constraint cl;
--ɾ����
alter table emptwo drop column em;

--�������
insert into dept values (1,'���»�',5,'111111',0);
insert into dept values (2,'�г���',6,'111222',1);
insert into dept values (3,'����',7,'333333',1);
insert into dept values (4,'�ɹ���',8,'444444',1);
insert into emp values (5,'tom','m',sysdate-234,4500.50,1);
insert into emp values (6,'jacky','m',sysdate-543,2982.12,2);
insert into emp values (7,'kelly','f',sysdate-445,3491.32,3);
insert into emp values (8,'red','f',sysdate-143,3700.00,4);
insert into emp values (9,'blue','m',sysdate-423,3800.00,2);
insert into emp values (10,'green','m',sysdate-413,5100.00,3);
insert into emp values (11,'peter','m',sysdate-243,6700.00,4);
--������������ʱ��������Դ����֪��
insert  into emptwo select *from emp;
--�޸�
--��������6000��Ա�����ʼ�500
update emp set sar=sar-500 where sar>6000;
--�޸� kelly����ְ����
update emp set hire=to_date('2012-03-01','yyy=mm-dd')where ename='kelly';
--ɾ��
delete emp;
delete emp where ename='key';
--��ѯÿ�����ŵ���߹��ʡ���͹��ʺ�ƽ������
select d.dname ,max(e.sar),min(e.sar),avg(e.sar) from   dept d,emp e where  d.did=e.eid group by d.dname;
--��ѯƽ������С��5000�Ĳ���
select d.dname ,max(e.sar),min(e.sar),avg(e.sar) from   dept d,emp e where  d.did=e.eid group by d.dname having avg(e.sar)<5000;
--�����ַ���||
select ename ||'������'||sar||'Ԫ'from emp;
--���ĵ���������¼
select *from (select r,e*from emp e)where r>3 and r<7;
--��ѯemp���У�emptwû�еļ�¼
select *from emp minus select *from emptwo;
--��ѯemp���У�emptwoҲ�еļ�¼
select *from emp intersect select *from emptwo;
--���ʴ���5000��Ա����2�ŵĲ���Ա���󲢼�
select *from emp where sar>5000 union select *from emp where did=2;
--���ʱ������ڲ���ƽ�����ʸߵ�Ա����Ϣ
select *from emp where eid in (select a.eid from (select eid,sar,did from emp)
a,(select did ,avg(sar)sarfrom emp group by did)b where a.did=b.did and a.sar>b.sar);
--�������Ĳ��ţ�����ж�����ŵ�������ͬ�����ѯ���ű����С�Ĳ���
select* from dept where did=(select did from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc) where rownum=1);

