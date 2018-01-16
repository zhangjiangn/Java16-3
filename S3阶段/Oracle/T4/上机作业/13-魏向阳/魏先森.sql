-- 字符函数

select initcap('hello') from dual; -- 转换首字母为大写
select lower('HELLO') from dual; -- 转换大写为小写
select upper('hello') from dual; -- 转换小写为大写
select length('hello') from dual; -- 字符长度
select ltrim('  hello') from dual; -- 删除字符前空格
select ltrim('Hello Word!','Hello') from dual;
select rtrim('hello  ') from dual; -- 删除字符后空格
select rtrim('Hello Word','Word') from dual;
select translate('Evan','E','A') from dual; -- 替换'E'为'A' ， 只能替换单个字符
select replace('Avan','v','le') from dual; -- 替换v为le 可替换多个字符
select instr('oracle','a') from dual; -- 查看所选字符的下标
select substr('Tan_Top1',7,2) from dual; -- 截取从下标7开始的后2位字符
select concat('Tan','_Top1') from dual;  -- 结合字符串

-- 日期函数

select sysdate from dual; -- 查看当前系统时间
select months_between(to_date('2018-1-16','yyyy-MM-dd'),sysdate) FROM dual; -- 获取两个日期之间相隔的月数
select add_months(sysdate,5) from dual; -- 在指定日期的基础上加上指定的月数 获取新日期
select next_day(sysdate,2) from dual; -- 获取指定日期所在周的第几天
select last_day(sysdate) from dual; -- 获取指定日期所在月的最后一天

-- 转换函数
select to_char(sysdate,'yyyy-MM-dd HH:mi:ss') from dual; -- 转换日期为指定格式
select to_char(sysdate,'yyyy-MM-dd day hh24:mi:ss') from dual;
select to_date('2012/5/20','yyyy-MM-dd') from dual;
select to_date('10/9/2012','mm-dd-yyyy') from dual; -- 转换字符串为日期类型 后面用来描述字符串的格式
select to_number('$32,920,50','$99,999,99') from dual;
select to_number('￥32,920,50','L99,999,99') from dual; 
select to_number('0235','9999') from dual; -- 转换字符串为数值

-- Nvl和标量函数的高级查询
-- 部门表
create table dept(
       did integer primary key not null,  -- 主键 非空
       dname varchar2(20) not null, --部门名称 非空 
       manager integer , --部门经理 外键
       tel varchar2(20),-- 部门电话
       master integer -- 上级部门 外键  
)

-- 员工表
create table emp(
       eid integer primary key not null,  -- 主键 非空
       ename varchar2(20) not null, --部门名称 非空 
       sex  varchar2(1),-- 性别
       hire date,-- 入职日期
       sar number(8,2),-- 工资
       did integer  -- 上级部门 外键  
)
-- 添加部门信息
insert into dept(did,dname,manager,tel,master) values (1,'董事会','1','10018',0);
insert into dept(did,dname,manager,tel,master) values (2,'行政部','2','1008600',0);
insert into dept(did,dname,manager,tel,master) values (3,'外交部','5','1008601',0);
insert into dept(did,dname,manager,tel,master) values (4,'技术部','3','1008602',0);
insert into dept(did,dname,manager,tel,master) values (5,'财务部','2','1008603',0);
insert into dept(did,dname,manager,tel,master) values (6,'后勤部','5','1008604',0);
update dept set master = 1 where did = 6 ;
-- 添加员工信息
insert into emp(eid,ename,sex,hire,sar,did) values (1,'张涛','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (2,'秦祯','f',sysdate,7500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (3,'王苏','m',to_date('2018-1-15','yyyy-mm-dd'),6500,2);
insert into emp(eid,ename,sex,hire,sar,did) values (4,'李牧','m',to_date('2018-1-15','yyyy-mm-dd'),5500,3);
insert into emp(eid,ename,sex,hire,sar,did) values (5,'赵忶','f',sysdate,5500,4);
insert into emp(eid,ename,sex,hire,sar,did) values (6,'王尔','m',to_date('2015-1-25','yyyy-mm-dd'),6500,5);
insert into emp(eid,ename,sex,hire,sar,did) values (7,'孙煦','m',to_date('2018-1-15','yyyy-mm-dd'),6500,6);
insert into emp(eid,ename,sex,hire,sar,did) values (8,'黄卿','m',to_date('2017-1-15','yyyy-mm-dd'),6500,1);

select * from dept;
select * from emp;
-- nvl函数查询
update dept set tel = null where dname ='后勤部';
select d.did,d.dname,d.manager,nvl(d.tel,'暂无') from dept d;
--标量函数查询
select eid,ename,
       case sex
       when 'm' then '男'
       when 'f' then '女'
       else sex
       end
       from emp;
-- exists 子查询
select d.* from dept d where not exists (
       select e.* from emp e where e.did = d.did
);


/*
案例1：
某公司印了一批充值卡，卡的密码是随机生成的，现在出现这个问题：
卡里面的“O和0”（O和0）“i和1”（i和1），用户反映说看不清楚，公司决定，把存储在数据库中的密码中所有的“O”都改成“0”，把所有的“i”都改成“1”；
请编写SQL语句实现以上要求；
数据库表名：Card
密码字段名：PassWord
*/

create table Card(

       PassWord varchar2(20)  not null  -- 主键 非空
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
案例2：
在数据库表中有以下字符数据，如：
13-1、13-2、13-3、13-10、13-100、13-108、13-18、13-11、13-15、14-1、14-2
现在希望通过SQL语句进行排序，并且首先要按照前半部分的数字进行排序，然后再按照后半部分的数字进行排需，输出要排成这样：
13-1、13-2、13-3、13-10、13-11、13-15、13-18、13-100、13-108、14-1、14-2
数据库表名：SellRecord
字段名：ListNumber
*/

create table SellRecord(

       ListNumber varchar2(20)  not null  -- 主键 非空
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

