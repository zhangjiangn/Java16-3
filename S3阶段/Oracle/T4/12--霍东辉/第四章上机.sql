--���ű�
create table dept(
did integer primary key ,--����
dname varchar2(20) , --��������
manager integer , --��������ž���
tel varchar2(30), --���ŵ绰
master integer   --������ϼ�����
);
--Ա����
create table emp(
eid integer primary key,--����
ename varchar2(20), --Ա������
sex varchar2(1), --�Ա�
hire date , --��ְ����
sar number(8,2), --����
did integer --������������� 
);
--����������
create table history(
hid integer primary key , --����
startdate date , --��ְʱ��
enddate date, --��ְʱ��
place varchar2(50), --��˾����
job varchar2(20), --ְλ
eid integer --���������Ա��
);
--�������
--���ű�������ݣ�
insert into dept values(1,'���»�',5,'1111111',0);
insert into dept values(2,'�г���',6,'2222222',0);
insert into dept values(3,'����',7,'3333333',0);
insert into dept values(4,'�ɹ���',8,'4444444',0);
--��Ա����������ݣ�
insert into emp values(5,'tom','m',sysdate-234,4500.50,1 );
insert into emp values(6,'jacky','m',sysdate-543,2982.12,2 );
insert into emp values(7,'kelly','f',sysdate-445,3491.32,3 );
insert into emp values(8,'red','f',sysdate-143,3700.00,4 );
insert into emp values(9,'blue','m',sysdate-423,3800.00,2 );
insert into emp values(10,'genji','m',sysdate-413,5100.00,3 );
insert into emp values(11,'peter','m',sysdate-243,6700.00,4 );
insert into emp values(12,'lucy','f','12-5��-05',6500.00,2);
insert into emp values(13,'key','m',to_date('2008-09-19','yyyy-mm-dd'),7200.00,3);
--1.�ַ�����
select initcap('hello') from dual;
select lower('HELLO') from dual;
select upper('hello') from dual;
select length('hello') from dual;
select ltrim('       hello') from dual;
select rtrim('hello     ')from dual;
select rtrim('helloword','word')from dual;
select translate('jack','j','b') from dual;
select replace('jack','j','bl') from dual;
select instr('oracle','a') from dual;
select substr('oracle10g',7,3) from dual;
select concat('oracle','10g') from dual;
--2.���ں���
select sysdate from dual;
select months_between(to_date('2017-12-16','yyyy-mm-dd'),sysdate) from dual;
select add_months(sysdate,5) from dual;
select next_day(sysdate+12,5) from dual;
select last_day(sysdate+57) from dual;
--3.ת������
select to_char(sysdate,'yyyy"��"mm"��"dd"��"')from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_date('2012-10-19','yyyy-mm-dd') from dual;
select to_date('10-24-2013','mm-dd-yyyy') from dual; 
select to_number('$39,275.50','$99,999.99') from dual;
select to_number('��3,925.53','L9,999.99') from dual;
--4.�߼���ѯ
update dept set tel=null where dname='�г���'
select d.did,d.dname,nvl(d.tel,'��') from dept d;
select eid,ename,
case sex
when 'm' then '��'
when 'f' then 'Ů'
else sex
end
from emp;                                                                                                                                                                                            
select d.*from dept d where not exists(select e.*from emp e where e.did=d.did);
select *from emp;
select* from history;
select *from dept;
