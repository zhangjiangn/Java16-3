--������
create table idcard(
cid integer primary key ,
cardid varchar2(20)
)
--��������
insert into idcard values(1,'1o10l');
insert into idcard values(2,'1o20l');
insert into idcard values(3,'1o30l');
insert into idcard values(4,'lo40l');


--�����Ÿ���oΪ0������l��1
update idcard  set cardid = replace(replace(cardid,'o','0'),'l','1')
--����ȡ��
select ceil('45.56') from dual;

--������
create table ten(
a_n varchar2(20)
)

--������
insert into ten values('A-1');
insert into ten values('A-5');
insert into ten values('A-4');
insert into ten values('A-2');
insert into ten values('C-1');
insert into ten values('P-1');
insert into ten values('D-1');
insert into ten values('B-1');
insert into ten values('A-8');
--��ѯ
select substr(a_n,1,1) from ten
select LENGTH(a_n) from ten
--��ѯ����
select * from ten order by to_number(substr(a_n,3)) desc ,substr(a_n,1,1) desc
select * from ten order by  ltrim(a_n,'A-') desc
select Ltrim(a_n,'A-') from ten
select Rtrim(a_n,'1-') from ten
--��ȡָ�����������µ����һ��
select last_day(sysdate) from dual
select to_char(sysdate,'yyyy"��"mm"��"dd"��"') from dual
