--����ĸ��д
select initcap('hello world') from dual;
--ȫ���Сд
select lower('HELLO') from dual;
--ȫ��ɴ�д
select upper('hello') from dual;
--��ʾ����
select length('hello') from dual;
--ȥ���ַ���ǰ��Ŀո�
select ltrim('  hello  ') from dual;
--ȥ���ַ�������Ŀո�
select rtrim('  hello  ') from dual;
--ȥ���ַ���ָ���ĵ���
select rtrim('helloworld','world') from dual;
--���ַ�����һ����ĸ�ı�
select translate('jack','a','o') from dual;
--���ַ����ж����ĸ�ı�
select replace ('jack','ack','oke') from dual;
--��ѯһ���ַ���ĳ���ַ�ǰ�ж��ٸ��ַ�
select instr ('oracle','a') from dual;
--��ѯһ���ַ����ĵ���λ��Ľ�����4λ
select substr ('oracle10g00',7,4) from dual;
--�ڡ�oracle������ϡ�10g0��
select concat ('oracle','10g0') from dual;
--��ȡ��ǰʱ��
select sysdate from dual;
--��������дʱ�������������
select months_between(to_date('2018-02-16','yyyy-mm-dd'),sysdate) from dual;
--��ʾ5���º��ʱ��
select add_months(sysdate,5)from dual;
--
select next_day(sysdate+12,5) from dual;
--��ʾ�����180�������µ����һ��
select last_day(sysdate + 180) from dual;
--����ת��
select to_number ('$12,345.6','$99,999.9') from dual;
select to_number ('��12,345.6','L99,999.9') from dual;






--ĳ��˾ӡ��һ����ֵ��������������������ɵģ����ڳ���������⣺
--������ġ�O��0����Ŷ���㣩��i��1��������һ�����û���ӳ˵�����������˾�������Ѵ洢�����ݿ��е����������еġ�Ŷ�����ĳɡ��㡱�������еġ�i�����ĳɡ�1����
--���дSQL���ʵ������Ҫ��

create table Card(
cid integer primary key,
password varchar2(20)
)

drop table Card

insert into Card values(1,'oi10o1i0o0');
insert into Card values(2,'10o1i0oi1o');
insert into Card values(3,'0i1oi0o0oi');

update Card set password = 
replace (replace (password,'o','0'),'i','1')

select * from Card







--�����ݿ�����������ַ����ݣ��磺
--13-1��13-2��13-3��13-10��13-100��13-108��13-18��13-11��13-15��14-1��14-2
--����ϣ��ͨ��SQL���������򣬲�������Ҫ����ǰ�벿�ֵ����ֽ�������Ȼ���ٰ��պ�벿�ֵ����ֽ������裬���Ҫ�ų�������
--13-1��13-2��13-3��13-10��13-11��13-15��13-18��13-100��13-108��14-1��14-2



create table SellRecord(
sid integer primary key,
ListNumber varchar2(10)
)

select * from SellRecord

insert into SellRecord values(1,'13-1');
insert into SellRecord values(2,'13-2');
insert into SellRecord values(3,'13-3');
insert into SellRecord values(4,'13-10');
insert into SellRecord values(5,'13-100');
insert into SellRecord values(6,'13-108');
insert into SellRecord values(7,'13-18');
insert into SellRecord values(8,'13-11');
insert into SellRecord values(9,'13-15');
insert into SellRecord values(10,'14-1');
insert into SellRecord values(11,'14-2');

select * from  
SellRecord
order by to_number(substr(ListNumber,1,instr(ListNumber,'-')-1)),to_number(substr(ListNumber,instr(ListNumber,'-')+1));


