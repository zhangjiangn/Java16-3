--数学函数
select abs(-4) from dual;
select ceil(-4.12) from dual;
select floor(-4.12) from dual;
select cos(-4) from dual;
select sin(-4) from dual;
select power(2,16) from dual;
select mod(5,10) from dual;
select sign(-5) from dual;
select sign(5) from dual;
--字符函数
insert into Card values(1,'o0o0o0i1i1i1');
insert into Card values(2,'o0o0o0i1i1i1');
insert into Card values(3,'o0o0o0i1i1i1');
insert into Card values(4,'o0o0o0i1i1i1');
insert into Card values(5,'o0o0o0i1i1i1');
select * from Card;
--替换o和i
select translate(PassWord,'o',0) from Card;
select translate(PassWord,'i',1) from Card;
update Card set PassWord=translate(PassWord,'i',1);
update Card set PassWord=translate(PassWord,'o',0);
update Card set PassWord=translate(translate(PassWord,'o',0),'i',1);



insert into SellRecord values(1,'11-1');
insert into SellRecord values(2,'11-2');
insert into SellRecord values(3,'11-3');
insert into SellRecord values(9,'13-5');
insert into SellRecord values(4,'11-4');
insert into SellRecord values(5,'12-1');
insert into SellRecord values(6,'12-2');
insert into SellRecord values(7,'13-1');
insert into SellRecord values(8,'13-2');
insert into SellRecord values(10,'13-1');

select * from SellRecord;
--根据前后排序
select substr(ListNumber,1,instr(ListNumber,'-')-1) as a,
substr(ListNumber,instr(ListNumber,'-')+1) as b,
ListNumber from SellRecord order by a,b asc


--日期
select sysdate from dual;
select next_day(sysdate,2) from dual;
select to_char(sysdate,'yyyy"年"mm"月"dd"日"') from dual;
select to_date('2017-2-12','yyyy-mm-dd') from dual;
