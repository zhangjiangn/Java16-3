--创建部门表
create table dept(
       did integer primary key ,
       dname varchar2(20) ,
       manager integer,
       tel varchar2(30)
);

--创建员工表
create table emp(
       eid integer primary key ,
       ename varchar2(20),
       sex varchar2(20),
       hire date,
       sar integer      
);
--创建工作经历表
create table history(
       hid integer primary key ,
       startdate date,
       enddate date,
       place varchar2(50),
       job varchar2(20),
       eid integer--外键，所属员工
);
select * from dept
select * from emp;
select * from history

--添加字段
alter table emp add did integer;
alter table dept add master integer;

--添加数据
insert into dept(did,dname,manager,tel,master) values(1,'市场部',1,03968520,3);
insert into dept(did,dname,manager,tel,master) values(2,'财务部',2,03968510,3);
insert into dept(did,dname,manager,tel) values(3,'董事会',3,03968888);
insert into dept(did,dname,tel) values(4,'闲人部',00000000);

insert into emp(eid,ename,sex,hire,sar,did) values(1,'张文杰','男',sysdate,5000,1);
insert into emp(eid,ename,sex,hire,sar,did) values(9,'陈汉宵','男',sysdate,4800,1);
insert into emp(eid,ename,sex,hire,sar,did) values(2,'张卫健','男',sysdate,5000,2);
insert into emp(eid,ename,sex,hire,sar,did) values(3,'黄建','男',sysdate,5500,2);
insert into emp(eid,ename,sex,hire,sar,did) values(8,'杜永青','男',sysdate,5300,2);
insert into emp(eid,ename,sex,hire,sar,did) values(4,'王海龙','男',sysdate,6000,3);
insert into emp(eid,ename,sex,hire,sar,did) values(6,'李佩','女',sysdate,6300,3);
insert into emp(eid,ename,sex,hire,sar,did) values(7,'曹兵','女',sysdate,6050,3);
insert into emp(eid,ename,sex,hire,sar) values(10,'zhangyue','男',sysdate,6000);

insert into history(hid,startdate,enddate,place,job,eid) values(1,to_date('2008-09-19','yyyy-mm-dd'),to_date('2016-05-06','yyyy-mm-dd'),'上海','营销员',1);
insert into history(hid,startdate,enddate,place,job,eid) values(2,to_date('2008-09-19','yyyy-mm-dd'),to_date('2008-09-19','yyyy-mm-dd'),'南京','会计员',2);
insert into history(hid,startdate,enddate,place,job,eid) values(3,to_date('2008-09-19','yyyy-mm-dd'),to_date('2008-09-19','yyyy-mm-dd'),'广州','销售经理',3);


--批量插入（is模式）
create table emptwo(
       yid integer,
       yname varchar2(20)
);
insert into emptwo(yid,yname) select eid,ename from emp;
select * from emptwo;

--使用update更新数据
update emp set sar=sar+500 where sar<5500;
--按条件删除数据
delete emp where ename='zhangyue';

--查询每个部门的最高工资、最低工资、平均工资(联接查询)
select d.dname , min(e.sar) as minsar ,max(e.sar) as maxsar,avg(e.sar) as avgsar from emp e , dept d where d.did=e.did group by d.dname ;
--查询每个部门的最高工资、最低工资、平均工资(联接查询)且平均工资小于6000的
select d.dname , min(e.sar) as minsar ,max(e.sar) as maxsar,avg(e.sar) as avgsar from emp e , dept d where d.did=e.did group by d.dname having avg(e.sar)<6000 ;

--查询emp表第四到第六行记录
select * from(
         select rownum r, e.* from emp e) where r>3 and r<7 ;
--将工资大于5000的员工和2号部门的员工求
select * from emp where sar>5000
union
select * from emp where did=2;
--连接操作
select ename||'的工资是'||sar||'元' from emp;

--查询工资比其所在部门平均工资高的员工
select * from emp where eid in(

select a.eid from
(select eid, did ,sar from emp) a,

(select did, avg(sar) as avgsar from emp group by did) b where a.did=b.did and a.sar>b.avgsar);

--查询人数最多的部门，如果多个部门的人数相同则查询部门编号最小的部门
select * from dept where did=(
select did from (
select did, count(eid) peo from emp group by did order by peo desc, did asc) where rownum=1 );

--查询所有员工及其所在的部门信息
select e.eid, e.ename,e.sex ,e.sar ,d.dname , d.tel from emp e ,dept d where e.did=d.did

--查询所有部门及其部门下的员工(没员工的部门也要查询出来)
select * from dept d left join emp e on d.did=e.did ;

         


 
