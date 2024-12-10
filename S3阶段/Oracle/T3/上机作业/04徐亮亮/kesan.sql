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
alter table emp add constraint sexvalue check(sex in('m','f'));--��Ӽ��Լ��
alter table emp drop constraint sexvalue; --ɾ��Լ��
����������
create table history(
       hid integer primary key, --����
       startdate date, --��ְʱ��
       enddate date, --��ְʱ��
       place varchar2(50), --��˾����
       job varchar2(20), --ְλ
       eid integer --���������Ա��
)
select * from history

--�������еı��������±�����������
create table emptwo as select * from emp; 
select * from emptwo;
--ֻ������ṹ��������������
create table empwan as select * from emp where 1=2; 
select * from empwan;

--�������
insert into dept values(1,'���»�',5,'1111111',0);
insert into dept values(2,'�г���',6,'2222222',1);

insert into emp values(5,'tom','m',sysdate,4500.50,1);
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2);
insert into emp values(7,'kelly','f',sysdate,3491.32,1);
insert into emp values(8,'red','f',sysdate,3700.00,2);
insert into emp values(9,'blue','f',sysdate,3800.00,1);
insert into emp values(10,'green','m',sysdate,5100.00,2);
insert into emp values(11,'peter','m',sysdate,6700.00,1);

--Ա����������6000�ļ�500
update emp set sar=sar+500 where sar<6000;
--�޸�Ա��kellty����ְʱ��
update emp set hire=to_date('2002-10-01','yyyy-mm-dd') where ename='kelly';

--��ѯÿ�����ŵ���߹��ʣ���͹��ʺ�ƽ������
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d, emp e where d.did=e.did group by d.dname;
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d, emp e where d.did=e.did group by d.dname having avg(e.sar)<6000;
select * from (select rownum r,e.* from emp e) where r>3 and r<7;

select * from emp where sar>5000
union
select * from emp where did=2;

select * from emp
minus
select * from emptwo;

--��ѯ���ʱ������ڲ���ƽ�����ʸߵ�Ա����Ϣ
select * from emp where eid in(select a.eid from (select eid,sar,did from emp) a,(select did,avg(sar) sar from emp group by did) b where a.did=b.did and a.sar>b.sar);

--��ѯ�������Ĳ��ţ�����ж������������ͬ�����ѯ���ű����С�Ĳ���
select * from dept where did=(select did from (select did,count(eid) cnt from emp group by did order by cnt desc,did asc) where rownum=1);





