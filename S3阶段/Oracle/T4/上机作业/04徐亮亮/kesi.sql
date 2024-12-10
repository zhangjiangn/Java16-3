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

--�ַ�����
select initcap('hello') from dual;
select lower('HELLO') from dual;
select upper('hello') from dual;
select length('hello') from dual;
select ltrim('  hello') from dual;

select rtrim('hello  ') from dual;
select rtrim('helloword','word') from dual;

select translate('jack','j','b') from dual;
select replace('jack','ja','bl') from dual;
select instr('oracle','a') from dual;
select substr('oracle10g',7,3) from dual;
select concat('oracle','10g') from dual;

--���ں���
select sysdate from dual;
select months_between(to_date('2018-1-15','yyyy-mm-dd'),sysdate) from dual;
select add_months(sysdate,5) from dual;
select next_day(sysdate+12,5) from dual;
select last_day(sysdate+57) from dual;
--ת������
select to_char(sysdate,'yyyy"��"mm"��"dd"��"') from dual;
select to_char(sysdate,'yyyy-mm-dd day hh24:mi:ss') from dual;
select to_char(sysdate,'yyyy-mm-dd day am:hh24:mi:ss') from dual;

select to_date('2013-10-16','yyyy-mm-dd') from dual;

select to_number('$39,275.50','$99,999.99') from dual;
select to_number('��3,925.53','L9,999.99') from dual;
select to_number('��12,925.5','L99,999.9') from dual;
select to_number('0023','9999') from dual;

--����
update dept set tel=null where dname='�г���';
select d.did,d.dname,nvl(d.tel,'����') from dept d;
--��jackyͬһ�����Ա���ͬ��Ա��
select * from emp where (sex,did) in(select sex,did from emp where ename='jacky');

select eid,ename,
 case sex
  when 'm' then '��' 
  when 'f' then 'Ů' 
  else sex
  end 
  from emp;
  
--����exists
select d.*from dept d where exists (select e.*from emp e where e.did=d.did);
select d.*from dept d where not exists (select e.*from emp e where e.did=d.did);






