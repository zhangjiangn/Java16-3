create table dept(
did integer primary key,--����
dname varchar2(20),--��������
manager integer,--��������ž���
tel varchar2(20),--���ŵ绰
master integer--������ϼ�����
)
create table emp(
eid integer primary key,--����
ename varchar2(20),--Ա������
sex varchar2(1),--Ա���Ա�
hire date,--��ְ����
sar number(5,2),--����
did integer--�������������
)
create table history(
hid integer primary key,--����
startdate date,--��ְʱ��
enddate date,--��ְʱ��
place varchar2(50),--��˾����
job varchar2(20),--ְλ
eid integer--���������Ա��
)
