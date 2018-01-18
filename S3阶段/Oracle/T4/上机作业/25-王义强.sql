--返回绝对值
  select abs(-111) from dual
--向上取整
  select ceil(1.21) from dual
--向下取整
  select floor(-111) from dual
--m的n次方
  select power(2,3) from dual
--取余
  select mod(10,3) from dual
--算术平方根
  select sqrt(9) from dual
--获取n的正负号返回-1或1
  select sign(-11) from dual
    
--链接两个字符串
  select concat('m','n') from dual
--截取索引n开始的k个字符
  select substr('qweqwe',2,2) from dual
--去除左空格、后边值为要去的字
  select ltrim('asdasda','as') from dual
--所有字母大写
  select upper('asdzxc') from dual
--所有字母小写
  select lower('SDFSDXC') from dual
--首字母大写
  select initcap('asdzxc') from dual 
--将所有n替换成m
  select translate('asdzxcasd','a','w') from dual 
--查询m的索引
  select instr('asdzxc','d') from dual
--用k字符串替换m字符串 k省略删除m
  select replace('asdzxc','sd','ww') from dual
--获取两个日期相隔的月数
  select months_between(sysdate,to_date('2013-1-1','yyyy-MM-dd')) from dual
--获取指定日期所在月份的最后一天
  select last_day(sysdate) from dual
--获取指定日期所在周的第n天日期
  select next_day(sysdate,5) from dual
--在指定的日期加上指定的月数返回日期
  select add_months(sysdate,15) from dual
--将日期转换为m指定的格式
  select to_char(sysdate,'yyyy-mm-dd am hh:mi-ss') from dual
--将字符串转换为数值
  select to_number('$123','$999') from dual
  
  create table w(
  sex char(2)
  )
  drop table w
  select*from w 
  insert into w values ('ff');
  insert into w values ('mm');
  insert into w values ('ff');
  insert into w values ('mn');
  insert into w values ('ff');
  insert into w values ('mm');
  select  case sex when 'f' then '男' when 'm' then '女' end from w
  update w set sex=( select translate('ff','f','g') from dual) where sex='ff'
 
