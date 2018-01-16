create table emptwo as select ename,sex,hire from emp;

alter table emp modify sex varchar2(2);
alter table dept drop column master;
alter table dept add master integer;
alter table emp add constraint sexvalue check(sex in('m','f'));
alter table emp drop constraint sexvalue;

insert into dept values(1,'董事会',5,'1111111',0);
insert into dept values(2,'市场部',6,'2222222',1);
insert into dept values(3,'财务部',7,'3336333',1);
insert into dept values(4,'采购部',8,'4444444',1);
insert into emp values(5,'www','m',sysdate-234,4500.50,1);
insert into emp values(6,'kkk','m',sysdate-224,4600.50,2);
insert into emp values(7,'xxx','f',sysdate-244,4700.50,3);
insert into emp values(8,'ddd','m',sysdate-334,4800.50,4);
insert into emp values(9,'ggg','f',sysdate-434,10000.50,2);

select * from emp

update emp set sar=sar+500;

update emp set sar=sar+500 where sar<6000

delete emp;

select * from emp order by sar asc
select * from emp order by sar desc
select * from emp order by did asc,sar desc
select * from emp where ename like 'w%'
select  avg(sar),max(sar),min(sar) from emp 
select count(eid),sum(sar) from emp
select distinct(did) from emp order by did desc
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d,emp e where d.did=e.did group by d.dname
select d.dname,max(e.sar),min(e.sar),avg(e.sar) from dept d,emp e where d.did=e.did group by d.dname having avg(e.sar)<5000

select * from (select rownum r,e.* from emp e) where r>2 and r<4
select ename||'的工资是'||sar||'元' from emp


select * from emp where eid in(
select a.eid from (select eid,sar,did from emp) a,
                   (select did,avg(sar) sar from emp group by did) b
                 where a.did=b.did and a.sar>b.sar  
)
