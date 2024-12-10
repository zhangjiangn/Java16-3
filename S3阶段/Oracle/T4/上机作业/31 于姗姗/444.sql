select * from emp;                                                                                        
select floor(3.14) from emp;
select round(3.1485845,3) from emp;
select mod(10,3) from emp;
select power(2,10) from emp;
select length('hello') from dual;
select upper('hello') from dual;
select translate('jack','j','l') from dual;
select instr('hello','e') from dual;
select concat('hello world') from dual;
select lower('FUN') from dual;
select sysdate from dual; 
select months_between(sysdate,to_date('2017-10-11','yyyy-mm-dd')) from dual;
select add_moths(sysdate,5) from dual;
select next_day(sysdate,5) from dual;
select last_day(sysdate) from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'ddd') from dual;
select to_date('2017-06-23','yyyy-mm-dd') from dual;
select to_date('23-06-2017','dd-mm-yyyy') from dual;
select to_number('$12,4556.7','$99,9999.9') from dual;
select ENAME,
case JOB
     when 'CLERK' then 'Ï´Íë'                                      
     when 'SALESMAN' then '²Á×À×Ó' 
     else JOB     
end
from emp;
select * from DEPT; 
select dname,nvl(loc,'ÎÞ') from dept;

create table ass(
password varchar2(20) not null);
insert into ass values('i123');
insert into ass values('i234');
insert into ass values('i456');
insert into ass values('o123');
insert into ass values('o123');
insert into ass values('o123');
select * from ass;
select replace ('i123 and i234 and i456','i','1')from ass;
select replace ('o123 and o234 and o456','o','0')from ass;



create table SellRecord(
ListNumber varchar2(20) not null);
insert into SellRecord values('13-1');
insert into SellRecord values('13-2');
insert into SellRecord values('13-6');
insert into SellRecord values('13-65');
insert into SellRecord values('13-23');
insert into SellRecord values('13-108');
insert into SellRecord values('13-82');
insert into SellRecord values('14-53');
insert into SellRecord values('14-1');
select * from SellRecord;

select ListNumber from SellRecord order by to_number(substr(list_number,1,instr(list_number,'-')-1)),to_number(substr(list_number,instr(list_number,'-')+1));
      
