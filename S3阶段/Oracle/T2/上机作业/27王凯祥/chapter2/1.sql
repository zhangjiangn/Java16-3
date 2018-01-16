create table dept(
did integer primary key,
dname varchar2(20),
manager integer,
tel varchar2(30),
master integer
);

create table emp(
eid integer primary key,
ename varchar2(20),
sex varchar2(1),
hire date,
sar number(8,2),
did integer
);


create table history(
hid integer primary key,
stardate date,
enddate date,
place varchar2(50),
job varchar2(20),
eid integer
);




