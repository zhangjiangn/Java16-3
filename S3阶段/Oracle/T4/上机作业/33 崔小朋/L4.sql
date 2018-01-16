 select  initcap('hello') from dual;--首字母换成大写
  select lower('HELLO') from dual;--所有字木母换成小写
  select upper('hello') from dual;--所有字木母换成大写
  select length('hello') from dual;--长度
  select ltrim('       hello') from dual;--去除左边空格
  select rtrim('hello     ') from dual;--去除右边空格
  select translate('jack','j','b') from dual;--将字母j换成b
  select replace('jack','j','b1') from dual;--
  select instr('oracle','a') from dual;--
  select substr('oracle10g',7,3) from dual;--
  select concat('oracle','10g') from dual;--
  select sysdatefrom dual;
  select months_between(to_date('2010-10-21','yyyy-mm-dd'),sysdate)from dual;
  select  add_months(sysdate,5)from dual;
  select next_day(sysdate+12,5)from dual;
  select last_day(sysdate+57)from dual;
  select to_char(sysdate,'yyyy"年"mm"月"dd'"日")from dual;
  select to_char(sysdate,'yyyy-mm-ddday hh24:mi:ss')from dual;
  select to_dater('2012-10-12','yyyy-mm-dd')from dual;
  select to_date('2018-10-22','mm-dd-yyyy')from dual;
  select to_number('$3,925.50','$9,9999.99')from dual;
  select to_number('￥3,925.23','L9,9999.99')from dual;
  select to_number('0023','9999')from dual;
  
  update dept set tel=null where dname='研发部'--首先将部门tel列的值更新为空
  select d.did,d.dname,nvl(d.tel,'无') from dept d;--然后查询
  
  --使用标量查询将性别显示为汉子
  select eid, ename,
  case sex 
    when 'm'then '男'
    when 'f'then '女'
    else sex
    end
    from emp;
    --查询没有员工的部门
  select d.*from dept d where not exists (select .*from emp e where e,did=d.did);  
  
  
  
  
  
  
  
