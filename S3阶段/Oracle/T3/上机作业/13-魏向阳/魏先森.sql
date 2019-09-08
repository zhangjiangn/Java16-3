-- ���ű�
create table dept(
       did integer primary key not null,  -- ���� �ǿ�
       dname varchar2(20) not null, --�������� �ǿ� 
       manager integer , --���ž��� ���
       tel varchar2(20),-- ���ŵ绰
       master integer -- �ϼ����� ���  
)
-- Ա����
create table emp(
       eid integer primary key not null,  -- ���� �ǿ�
       ename varchar2(20) not null, --�������� �ǿ� 
       sex  varchar2(1),-- �Ա�
       hire date,-- ��ְ����
       sar number(8,2),-- ����
       did integer  -- �ϼ����� ���  
)
-- ����������
create table history(
       hid integer primary key not null,-- ����
       startdate date, --��ְʱ��
       enddate date,-- ��ְʱ��
       palce varchar2(50), -- ��˾����
       job varchar2(20), -- ְλ
       eid  integer -- ��� ����Ա��
)

-- ��ѯ��
select * from dept
select * from emp
select * from history
-- �޸�������
alter table emp modify hire date;
-- ����Լ��
alter table emp add constraint sex_Value  check(sex in('m','f'));
-- ɾ��Լ��
alter table emp drop constraint sex_Value;
-- ��Ӳ�����Ϣ
insert into dept(did,dname,manager,tel,master) values (1,'���»�','1','10018',0);
insert into dept(did,dname,manager,tel,master) values (2,'������','2','1008600',0);
insert into dept(did,dname,manager,tel,master) values (3,'�⽻��','5','1008601',0);
insert into dept(did,dname,manager,tel,master) values (4,'������','3','1008602',0);
insert into dept(did,dname,manager,tel,master) values (5,'����','2','1008603',0);
insert into dept(did,dname,manager,tel,master) values (6,'���ڲ�','5','1008604',0);

-- ���Ա����Ϣ
insert into emp(eid,ename,sex,hire,sar,did) values (1,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (2,'����','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (3,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (4,'����','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (5,'�ԏ�','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (6,'����','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (7,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (8,'����','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);
-- �޸�����
select * from dept
select * from emp
select * from history
update emp set sar = 6500 where ename = '����' ;
update emp set sar = sar + 500 where sar <= 5500 ;
update dept set master = 1 where did = 8 ;

-- ���б�����
create table empTwo as
select * from emp
where 1=2��

select * from empTwo

--��ѯ
select * from emp order by sar asc;
select * from emp order by did asc,sar desc;
select * from emp where sar between 6000 and 7500;
select * from emp where sar not between 6000 and 6500;
select * from emp where did in (2,3,4);
select * from emp where ename like '��_'; 
select * from emp where sex = 'm' and sar>6000;
-- avg sum max min count 
select avg(sar),max(sar),min(sar),count(eid)from emp;
select count(eid),sum(sar) from emp;
select distinct(did) as ���� from emp;
-- �����ѯ
select d.dname,max(e.sar),min(e.sar),avg(e.sar),count(d.did)
from dept d ,emp e
where d.did = e.did
group by d.dname;

select d.dname ,max(e.sar),min(e.sar),avg(e.sar)
from dept d,emp e
where d.did = e.did
group by d.dname
having avg(e.sar)<6500;

select * from emp 
minus
select * from empTwo;

select * from emp 
intersect
select * from empTwo;

-- || �����ַ���

select ename || '�Ĺ�����' || sar || 'Ԫ' from emp;

-- �Ӳ�ѯ
select * from emp where eid not in(select manager from dept);

select * from emp where eid in(
       select e.eid
       from (select eid,sar,did from emp)e,
       (select did,avg(sar)sar
       from emp
       group by did) r
       where e.did = r.did and e.sar > r.sar);
       
       select *  from dept where did = (
       select did
       from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc)
       where rownum = 1
       );
       
-- ��������
insert into dept values(7,'�з���','3','1001000',0) 


select d.did , d.dname , d.tel ,m.dname �ϼ�����
from dept d left join dept m
on d.master = m.did;
