--�ַ�����
select initcap('hello')from dual;--����ĸ��д
select lower('HELLO')from dual;--������ĸת��Сд
select upper('hello')from dual;--������ĸת����д
select length('hello')from dual;--����
select ltrim('   hello')from dual;--ȡ��ǰ�ո�
select rtrim('hello   ')from dual;--ȡ����ո�
select rtrim('helloword', 'word')from dual;
select translate('jack','j','b')from dual;--����ĸ�滻
select replace('jack','j','bl')from dual;--��n��m
select instr('oracle','a')from dual;--��ĸλ�á�
select substr('oracle10g',6,3)from dual;--��nλ�����ĸ
select concat('oracle','10g')from dual;--�����ַ�
--���ں���
select sysdate from dual;--��ǰ����
select months_between(to_date('2010��10-21','yyyy--mm--dd'),sysdate)from dual;--��������֮��������
select add_months(sysdate,5)from dual;--��ǰ�·ݼ�5
select next_day(sysdate+12,5)from dual;--ָ�����������ܵĵ�n��
select last_day(sysdate+57)from dual;--ָ�����������µ����һ��
--ת������
select to_char(sysdate,'yyyy"��"mm"��"dd"��"')from dual;
select to_char(sysdate,'yyyy-mm--dd day hh24:mi:ss')from dual;
select to_date('2012-10-19','yyyy-mm--dd')from dual;
select to_date('10-24-2013','mm-dd-yyyy')from dual;
select to_number('$39,275.50','$99,999.99')from dual;
select to_number('��3,925.53','L9,999.99')from dual;
select to_number('0023','9999')from dual;
--nvl����
--���ű�
create table dept(
did integer primary key,--����
dname varchar2(20),--��������
manager integer,--��������ž���
tel varchar2(30),--���ŵ绰
master integer --������ϼ�����
);
--Ա����
create table emp(
eid integer primary key,--����
ename varchar2(20),--Ա������
sex varchar2(1),--�Ա�
hire date, --��ְ����
sar number(8,2),--����
did integer --�������������
)

insert into dept values(1,'���»�',5,'111111',0)
insert into dept values(2,'�г���',6,'222222',1)
insert into dept values(3,'����',7,'333333',1)
insert into dept values(4,'�ɹ���',8,'444444',1)
--Ա����
insert into emp values(5,'tom','m',sysdate-234,4500.50,1)
insert into emp values(6,'jacky','f',sysdate-543,3200.50,2)

select * from dept
select * from emp
 
update dept set tel=null where dname='�ɹ���'
select d.did,d.dname,nvl(d.tel,'��')from dept d;
 
