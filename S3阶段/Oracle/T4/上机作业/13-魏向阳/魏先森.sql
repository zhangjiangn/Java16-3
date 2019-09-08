-- �ַ�����

select initcap('hello') from dual; -- ת������ĸΪ��д
select lower('HELLO') from dual; -- ת����дΪСд
select upper('hello') from dual; -- ת��СдΪ��д
select length('hello') from dual; -- �ַ�����
select ltrim('  hello') from dual; -- ɾ���ַ�ǰ�ո�
select ltrim('Hello Word!','Hello') from dual;
select rtrim('hello  ') from dual; -- ɾ���ַ���ո�
select rtrim('Hello Word','Word') from dual;
select translate('Evan','E','A') from dual; -- �滻'E'Ϊ'A' �� ֻ���滻�����ַ�
select replace('Avan','v','le') from dual; -- �滻vΪle ���滻����ַ�
select instr('oracle','a') from dual; -- �鿴��ѡ�ַ����±�
select substr('Tan_Top1',7,2) from dual; -- ��ȡ���±�7��ʼ�ĺ�2λ�ַ�
select concat('Tan','_Top1') from dual;  -- ����ַ���

-- ���ں���

select sysdate from dual; -- �鿴��ǰϵͳʱ��
select months_between(to_date('2018-1-16','yyyy-MM-dd'),sysdate) FROM dual; -- ��ȡ��������֮�����������
select add_months(sysdate,5) from dual; -- ��ָ�����ڵĻ����ϼ���ָ�������� ��ȡ������
select next_day(sysdate,2) from dual; -- ��ȡָ�����������ܵĵڼ���
select last_day(sysdate) from dual; -- ��ȡָ�����������µ����һ��

-- ת������
select to_char(sysdate,'yyyy-MM-dd HH:mi:ss') from dual; -- ת������Ϊָ����ʽ
select to_char(sysdate,'yyyy-MM-dd day hh24:mi:ss') from dual;
select to_date('2012/5/20','yyyy-MM-dd') from dual;
select to_date('10/9/2012','mm-dd-yyyy') from dual; -- ת���ַ���Ϊ�������� �������������ַ����ĸ�ʽ
select to_number('$32,920,50','$99,999,99') from dual;
select to_number('��32,920,50','L99,999,99') from dual; 
select to_number('0235','9999') from dual; -- ת���ַ���Ϊ��ֵ

-- Nvl�ͱ��������ĸ߼���ѯ
-- ���ű�
create table dept(
       did integer primary key not null,  -- ���� �ǿ�
       dname varchar2(20) not null, --�������� �ǿ� 
       manager integer , --���ž��� ���
       tel varchar2(20),-- ���ŵ绰
       master integer -- �ϼ����� ���  
)

-- Ա����
create table emp(
       eid integer primary key not null,  -- ���� �ǿ�
       ename varchar2(20) not null, --�������� �ǿ� 
       sex  varchar2(1),-- �Ա�
       hire date,-- ��ְ����
       sar number(8,2),-- ����
       did integer  -- �ϼ����� ���  
)
-- ��Ӳ�����Ϣ
insert into dept(did,dname,manager,tel,master) values (1,'���»�','1','10018',0);
insert into dept(did,dname,manager,tel,master) values (2,'������','2','1008600',0);
insert into dept(did,dname,manager,tel,master) values (3,'�⽻��','5','1008601',0);
insert into dept(did,dname,manager,tel,master) values (4,'������','3','1008602',0);
insert into dept(did,dname,manager,tel,master) values (5,'����','2','1008603',0);
insert into dept(did,dname,manager,tel,master) values (6,'���ڲ�','5','1008604',0);
update dept set master = 1 where did = 6 ;
-- ���Ա����Ϣ
insert into emp(eid,ename,sex,hire,sar,did) values (1,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (2,'����','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (3,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (4,'����','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (5,'�ԏ�','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (6,'����','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (7,'����','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (8,'����','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);

select * from dept;
select * from emp;
-- nvl������ѯ
update dept set tel = null where dname ='���ڲ�';
select d.did,d.dname,d.manager,nvl(d.tel,'����') from dept d;
--����������ѯ
select eid,ename,
       case sex
       when 'm' then '��'
       when 'f' then 'Ů'
       else sex
       end
       from emp;
-- exists �Ӳ�ѯ
select d.* from dept d where not exists (
       select e.* from emp e where e.did = d.did
);


/*
����1��
ĳ��˾ӡ��һ����ֵ��������������������ɵģ����ڳ���������⣺
������ġ�O��0����O��0����i��1����i��1�����û���ӳ˵�����������˾�������Ѵ洢�����ݿ��е����������еġ�O�����ĳɡ�0���������еġ�i�����ĳɡ�1����
���дSQL���ʵ������Ҫ��
���ݿ������Card
�����ֶ�����PassWord
*/

create table Card(

       PassWord varchar2(20)  not null  -- ���� �ǿ�
)
select * from card;
insert into card(password) values ('A21-BN15360O110I'); 
insert into card(password) values ('B11-BN15360O110I'); 
insert into card(password) values ('F84-BN15360O110I'); 
insert into card(password) values ('G45-BN15360O110I'); 
insert into card(password) values ('T30-BN15360O110I'); 
insert into card(password) values ('R52-BN15360O110I'); 
insert into card(password) values ('Q10-BN15360O110I'); 

update card set password = replace(password,'O','0');
update card set password = replace(password,'I','1');

/*
����2��
�����ݿ�����������ַ����ݣ��磺
13-1��13-2��13-3��13-10��13-100��13-108��13-18��13-11��13-15��14-1��14-2
����ϣ��ͨ��SQL���������򣬲�������Ҫ����ǰ�벿�ֵ����ֽ�������Ȼ���ٰ��պ�벿�ֵ����ֽ������裬���Ҫ�ų�������
13-1��13-2��13-3��13-10��13-11��13-15��13-18��13-100��13-108��14-1��14-2
���ݿ������SellRecord
�ֶ�����ListNumber
*/

create table SellRecord(

       ListNumber varchar2(20)  not null  -- ���� �ǿ�
)
insert into SellRecord(ListNumber) values ('1-10'); 
insert into SellRecord(ListNumber) values ('2-1'); 
insert into SellRecord(ListNumber) values ('1-15'); 
insert into SellRecord(ListNumber) values ('3-20'); 
insert into SellRecord(ListNumber) values ('13-18'); 
insert into SellRecord(ListNumber) values ('13-10'); 
insert into SellRecord(ListNumber) values ('13-11'); 
insert into SellRecord(ListNumber) values ('13-18'); 
insert into SellRecord(ListNumber) values ('13-15'); 
insert into SellRecord(ListNumber) values ('13-100'); 
insert into SellRecord(ListNumber) values ('14-1'); 
insert into SellRecord(ListNumber) values ('14-2'); 
insert into SellRecord(ListNumber) values ('13-3');
 
select * from SellRecord;

