
--�����ַ�����
select initcap('hello')from dual;
select lower('HELLO')from dual;
select upper('hello')from dual;
select ltrim('hello') from dual;
select replace('jack','j','b')from dual;

select sysdate from dual;

select months_between(to_date('2010-10-21','yyyy-mm-dd'),sysdate)from dual;

selecrt next_day(sysdate+12.5) from dual;
select last_day(sysdate+57) from dual;


--����ת������
select to_char(sysdate,'yyyy"��"mm"��"dd"��"')from dual;
select to_char(sysdate,'yyy-mm-dd day hh24:mi:ss')from dual;
select to_date ('2012-10-19','yyyy-mm-dd')from dual;
select to_number('0023','9999')from dual;
select to_number ('$39,275.50','$99.999.99')from dual;
select last_day(sysdate+57)from dual;

--����ת������
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24: mi:ss')from dual;
select to_date('2012-10-19','yyyy-mm-dd')from dual;
select to number('$39,275.`50','$99,999.99')from dual;
select to_number('0023','9999')from dual;

--�������ű��������
create table dept(
did integer primary key,
dname varchar2(20),
manager integer,
tel varchar2(30),
master integer  
);
insert into dept values(1,'����','55','373838',788);
select *from dept 

--����Ա������������
    create table emp(
    eid integer primary key,
    ename varchar2(20),
    sex varchar2(1),
    hire date,
    sar number(8,2),
    did integer
    );    
insert into emp values(1,'����',1,sysdate-123,5000,1)   
  
select *from emp


--�߼���ѯ
update dept set tel =null where dname='�з���'
select d.did,d.dname,nvl(d.tel,'��')from dept d;

--ʹ�ñ�����ѯ���Ա���ʾΪ����
select eid,ename,case sex
when 'm' then '��'
when'f' then'Ů'
else sex
end 
from emp


select *From emp

--ʹ��exists�Ӿ��ѯû��Ա���Ĳ���
select d.*from dept d where not exists (select e.*from emp e where e.did=d.did);




select*from dept


