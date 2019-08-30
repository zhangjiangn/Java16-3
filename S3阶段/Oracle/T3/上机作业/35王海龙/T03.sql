--�������ű�
create table dept(
       did integer primary key ,
       dname varchar2(20) ,
       manager integer,
       tel varchar2(30)
);

--����Ա����
create table emp(
       eid integer primary key ,
       ename varchar2(20),
       sex varchar2(20),
       hire date,
       sar integer      
);
--��������������
create table history(
       hid integer primary key ,
       startdate date,
       enddate date,
       place varchar2(50),
       job varchar2(20),
       eid integer--���������Ա��
);
select * from dept
select * from emp;
select * from history

--����ֶ�
alter table emp add did integer;
alter table dept add master integer;

--�������
insert into dept(did,dname,manager,tel,master) values(1,'�г���',1,03968520,3);
insert into dept(did,dname,manager,tel,master) values(2,'����',2,03968510,3);
insert into dept(did,dname,manager,tel) values(3,'���»�',3,03968888);
insert into dept(did,dname,tel) values(4,'���˲�',00000000);

insert into emp(eid,ename,sex,hire,sar,did) values(1,'���Ľ�','��',sysdate,5000,1);
insert into emp(eid,ename,sex,hire,sar,did) values(9,'�º���','��',sysdate,4800,1);
insert into emp(eid,ename,sex,hire,sar,did) values(2,'������','��',sysdate,5000,2);
insert into emp(eid,ename,sex,hire,sar,did) values(3,'�ƽ�','��',sysdate,5500,2);
insert into emp(eid,ename,sex,hire,sar,did) values(8,'������','��',sysdate,5300,2);
insert into emp(eid,ename,sex,hire,sar,did) values(4,'������','��',sysdate,6000,3);
insert into emp(eid,ename,sex,hire,sar,did) values(6,'����','Ů',sysdate,6300,3);
insert into emp(eid,ename,sex,hire,sar,did) values(7,'�ܱ�','Ů',sysdate,6050,3);
insert into emp(eid,ename,sex,hire,sar) values(10,'zhangyue','��',sysdate,6000);

insert into history(hid,startdate,enddate,place,job,eid) values(1,to_date('2008-09-19','yyyy-mm-dd'),to_date('2016-05-06','yyyy-mm-dd'),'�Ϻ�','Ӫ��Ա',1);
insert into history(hid,startdate,enddate,place,job,eid) values(2,to_date('2008-09-19','yyyy-mm-dd'),to_date('2008-09-19','yyyy-mm-dd'),'�Ͼ�','���Ա',2);
insert into history(hid,startdate,enddate,place,job,eid) values(3,to_date('2008-09-19','yyyy-mm-dd'),to_date('2008-09-19','yyyy-mm-dd'),'����','���۾���',3);


--�������루isģʽ��
create table emptwo(
       yid integer,
       yname varchar2(20)
);
insert into emptwo(yid,yname) select eid,ename from emp;
select * from emptwo;

--ʹ��update��������
update emp set sar=sar+500 where sar<5500;
--������ɾ������
delete emp where ename='zhangyue';

--��ѯÿ�����ŵ���߹��ʡ���͹��ʡ�ƽ������(���Ӳ�ѯ)
select d.dname , min(e.sar) as minsar ,max(e.sar) as maxsar,avg(e.sar) as avgsar from emp e , dept d where d.did=e.did group by d.dname ;
--��ѯÿ�����ŵ���߹��ʡ���͹��ʡ�ƽ������(���Ӳ�ѯ)��ƽ������С��6000��
select d.dname , min(e.sar) as minsar ,max(e.sar) as maxsar,avg(e.sar) as avgsar from emp e , dept d where d.did=e.did group by d.dname having avg(e.sar)<6000 ;

--��ѯemp����ĵ������м�¼
select * from(
         select rownum r, e.* from emp e) where r>3 and r<7 ;
--�����ʴ���5000��Ա����2�Ų��ŵ�Ա����
select * from emp where sar>5000
union
select * from emp where did=2;
--���Ӳ���
select ename||'�Ĺ�����'||sar||'Ԫ' from emp;

--��ѯ���ʱ������ڲ���ƽ�����ʸߵ�Ա��
select * from emp where eid in(

select a.eid from
(select eid, did ,sar from emp) a,

(select did, avg(sar) as avgsar from emp group by did) b where a.did=b.did and a.sar>b.avgsar);

--��ѯ�������Ĳ��ţ����������ŵ�������ͬ���ѯ���ű����С�Ĳ���
select * from dept where did=(
select did from (
select did, count(eid) peo from emp group by did order by peo desc, did asc) where rownum=1 );

--��ѯ����Ա���������ڵĲ�����Ϣ
select e.eid, e.ename,e.sex ,e.sar ,d.dname , d.tel from emp e ,dept d where e.did=d.did

--��ѯ���в��ż��䲿���µ�Ա��(ûԱ���Ĳ���ҲҪ��ѯ����)
select * from dept d left join emp e on d.did=e.did ;

         


 
