--������
create table idcard(
cid integer primary key ,
cardid varchar2(20)
)
--��������
insert into idcard values(1,'1oo100l');
insert into idcard values(2,'1oo20ol');
insert into idcard values(3,'1oo30ol');
insert into idcard values(4,'loo40ol');
insert into idcard values(5,'1oo5o0l');
insert into idcard values(6,'loo6o0l');
insert into idcard values(7,'1oo70ol');
--��ѯ����
select * from idcard
--�����Ÿ���oΪ0������l��1
update idcard  set cardid = replace(replace(cardid,'o','0'),'l','1')
--����ȡ��
select ceil('45.56') from dual;--46
--����ȡ��
select floor('45.56') from dual;--45
--�������뱣��С��
select round('45.56',1) from dual;--45.6
--������
create table an(
a_n varchar2(20)
)
--ɾ����
DROP TABLE AN
--������
insert into an values('A-1');
insert into an values('A-5');
insert into an values('A-4');
insert into an values('A-2');
insert into an values('A-3');
insert into an values('A-7');
insert into an values('C-1');
insert into an values('P-1');
insert into an values('D-1');
insert into an values('B-1');
insert into an values('A-8');
--��ѯ
select substr(a_n,1,1) from an
select LENGTH(a_n) from an
--��ѯ����
select * from an order by to_number(substr(a_n,3)) desc ,substr(a_n,1,1) desc
select * from an order by  ltrim(a_n,'A-') desc
select Ltrim(a_n,'A-') from an
select Rtrim(a_n,'1-') from an
--��ȡ��ǰʱ��
select sysdate from dual
--��ָ�������ڻ����ϼ�ָ��������
select add_months(sysdate,5)from dual
--��ȡָ�����������µ����һ��
select last_day(sysdate) from dual
select to_char(sysdate,'yyyy"��"mm"��"dd"��"') from dual
