create table dept(
did integer primary key,--主键
dname varchar2(20),--部门名称
manager integer,--外键，部门经理
tel varchar2(20),--部门电话
master integer--外键，上级部门
)
create table emp(
eid integer primary key,--主键
ename varchar2(20),--员工名称
sex varchar2(1),--员工性别
hire date,--入职日期
sar number(5,2),--工资
did integer--外键，所属部门
)
create table history(
hid integer primary key,--主键
startdate date,--入职时间
enddate date,--离职时间
place varchar2(50),--公司名称
job varchar2(20),--职位
eid integer--外键，所属员工
)
