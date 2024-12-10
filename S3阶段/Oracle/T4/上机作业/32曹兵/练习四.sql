create table depts(
  did integer primary key,
  dname varchar2(50),
  address varchar2(50)  --
)
create table emp(
  eid integer primary key,
  ename varchar2(50),
  sar number(8,2), --����
  eTime date, --��ְʱ��
  did integer --�������ţ������
)
--��emp���һ��
alter table emp add sex varchar2(2);
--�������
insert into depts values(1,'���²�','����')
insert into depts values(2,'���˲�','')
insert into depts values(3,'����','')
insert into depts values(4,'���²�','����')
insert into depts values(5,'���۲�','')

insert into emp values(1,'����',3000.00,sysdate,1,'m');
insert into emp values(2,'��ͷ',5000.00,sysdate-25,1,'f');
insert into emp values(6,'ëë',4000.00,sysdate-15,1,'f');
insert into emp values(7,'�һ�',4500.00,sysdate-5,1,'m');
insert into emp values(8,'����',4000.00,sysdate,1,'m');

insert into emp values(3,'����',3500.00,sysdate,2,'m');
insert into emp values(4,'����',4000.00,sysdate,3,'m');
insert into emp values(5,'��ͷ',4500.00,sysdate,4,'f');
---��nvl(m,n) ��Ϊ������ʾn��
select did,dname,nvl(address,'��') from depts;
---�߼���ѯ����ѯ ��������ͬһ�������Ա���ͬ�� Ա����Ϣ��
select * from emp where (did,sex) in(select did,sex from emp where ename='����');
---������ѯcase����ѯԱ����Ϣ �ҽ�m,f��Ϊ�У�Ů��
select ename,sar,
  case sex
    when 'm' then '��'
    when 'f' then 'Ů' 
  end as sex
from emp;
---����exists����ѯ�����ڣ�Ա���Ĳ��š�
select d.* from depts d where not exists(select e.did from emp e where e.did=d.did);
---����with

--------����-------
---1��ѧ����
select abs(-83) from dual;--����ֵ
select ceil(-83.80) from dual;--����ȡ��
select ceil(83.80) from dual;
select floor(-83.80) from dual;--����ȡ��
select floor(83.80) from dual;
select round(123.67788,2) from dual;--�������루��m����nλС����
select sign(29) from dual;--��ȡ������
---2�ַ�����
select concat('cao','bing') from dual; --���������ַ�
select substr('caobingf',4,4) from dual; --�ӵڼ�����ʼ����ȡ�����ַ�
select substr('caobingf',4) from dual;
select initcap('caobing') from dual;--����ĸ��д   upper(m)������ĸ��д   lower(m)������ĸСд
select ltrim('caobx f','cao') from dual;--�Ƴ�ָ��������ַ�
select rtrim('caobxf','xf') from dual;--�Ƴ�ָ�����ұ��ַ�
select translate('caobingc','c','l') from dual; --�滻�����ַ�
select replace('caobingc','c','jl') from dual; --�滻����ַ�
select instr('caobingc','c') from dual;--�ҳ�ָ���ַ���λ��
---3���ں���
select sysdate from dual;--��ǰ����
select months_between(to_date('2017-6-23','YYYY-MM-DD'),to_date('2017-2-23','YYYY-MM-DD')) from dual;--��������֮��������
select add_months(sysdate,3) from dual;--��ָ�������� ��������
select next_day(sysdate,3) from dual; --��ȡָ������ �ڵ����ǵ�n�� �������ǵ�һ�졿 ���ص�ֵ�����ܵĵ�n�������
select last_day(sysdate) from dual; --ָ������ ���µ����һ��
---4ת������
select to_char(sysdate,'YYYY-MM-DD') from dual; --�� ָ������ ת���� ָ�������ڸ�ʽ
select to_date('2017-1-13','YYYY-MM-DD') from dual;--���� ָ�����ڵ�����
select to_number('��124.90','L999.99') from dual;
select to_number('$124.90','$999.99') from dual;
select to_number('��000124.90','L000999.99') from dual;
