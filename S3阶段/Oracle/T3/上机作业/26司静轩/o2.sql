insert into dept2 select  dname,manager,tel from dept;


insert into dept values(1,'���»�',5,'111111',0);
insert into dept values(2,'�г���',6,'112211',1);
insert into dept values(3,'����',7,'113311',1);
insert into dept values(4,'�ɹ���',8,'114411',1);
insert into emp values(4,'baba','��',600.00,4,to_date('2018-1-14','yy-mm-dd'));--sysdate
insert into emp values(5,'hehe','��',600.00,3,to_date('2018-1-14','yy-mm-dd'));
--ʹ�����õı��������±�
create table dept2 as
select dname,manager,tel from dept where 1=2;
select *from dept2 ;
--�޸��е�����
alter table emp modify sex varchar2(2);
--ɾ��һ���ֶ�
alter table emp drop column hire;
--����һ���ֶ�
alter table emp add  hire date;
--���һ�����Լ��
alter  table emp add constraint sexvalue check(sex in('m','f'));
--ɾ��һ�����Լ��
alter table emp drop constraint sexvalue;


select *from emp;
 update emp set sar=sar+100;
 update emp set sar=sar+100 where ename='baby';
delete from emp where ename='aaa';  

select *from emp order by did asc ,sar desc;

select *from emp where sar  not between 500  and 750;


select *from emp where did in(2,3);

select avg(sar),did from emp group by did;

select sar,did from emp;









