show databases;
create database airlinesdb;
use airlinesdb;
create table flights (
	flno int,
    startloc varchar(30),
    dest varchar(30),
    distance varchar(30),
    departs time,
    arrives time,
    price int,
	primary key(flno)
);

create table aircraft (
	aid int,
    aname varchar(30),
    cruisingrange int,
    primary key(aid)
);

create table employee(
	eid int,
    ename varchar(30),
    salary int,
	primary key(eid)
);

create table certified(
	eid int,
    aid int,
    primary key(eid,aid),
    foreign key(eid) references employee(eid),
    foreign key (aid) references aircraft(aid)
);

insert into aircraft values(101,'747',3000);
insert into aircraft values(102,'Boeing',900);
insert into aircraft values(103,'647',800);
insert into aircraft values(104,'Dreamliner',10000);
insert into aircraft values(105,'Boeing',3500);
insert into aircraft values(106,'707',1500);
insert into aircraft values(107,'Dream', 120000);

insert into employee values(701,'A',50000);
insert into employee values(702,'B',100000);
insert into employee values(703,'C',150000);
insert into employee values(704,'D',90000);
insert into employee values(705,'E',40000);
insert into employee values(706,'F',60000);
insert into employee values(707,'G',90000);

insert into certified values(701,101);
insert into certified values(701,102);
insert into certified values(701,106);
insert into certified values(701,105);
insert into certified values(702,104);
insert into certified values(703,104);
insert into certified values(704,104);
insert into certified values(701,107);
insert into certified values(702,107);
insert into certified values(703,107);
insert into certified values(704,107);
insert into certified values(702,101);
insert into certified values(703,105);
insert into certified values(704,105);
insert into certified values(705,103);

insert into flights values(101,'Bangalore','Delhi',2500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 17:15:31',5000);
insert into flights values(102,'Bangalore','Lucknow',3000,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 11:15:31',6000);
insert into flights values(103,'Lucknow','Delhi',500,TIMESTAMP '2005-05-13 12:15:31',TIMESTAMP ' 2005-05-13 17:15:31',3000);
insert into flights values(107,'Bangalore','Frankfurt',8000,TIMESTAMP '2005-05-13  07:15:31',TIMESTAMP '2005-05-13 22:15:31',60000);
insert into flights values(104,'Bangalore','Frankfurt',8500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 23:15:31',75000);
insert into flights values(105,'Kolkata','Delhi',3400,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP  '2005-05-13 09:15:31',7000);


select aname 
from aircraft
where aid in (
	select distinct aid 
    from certified
	where eid in (
		select eid 
        from employee 
        where salary > 80000)
);

select eid,max(cruisingrange)
from certified c,aircraft a 
where c.aid = a.aid
group by c.eid 
having count(*) > 3;

select * from flights;

select ename 
from employee 
where salary < (
	select min(price)
	from flights
	where 	startloc = 'Bangalore'
			and 
			dest = 'Frankfurt'
);

select aname,avg(e.salary),e.eid
from aircraft a,certified c,employee e
where 	cruisingrange > 1000
		and
        a.aid = c.aid
        and 
        c.eid = e.eid
group by a.aid,a.aname
;

select distinct e.ename 
from aircraft a,certified c, employee e
where 	a.aid = c.aid
		and c.eid = e.eid
		and aname like 'Boeing';
select * from flights;
select a.aid 
from aircraft a
where a.cruisingrange > (
	select distance
	from flights 
	where 	startloc = 'Bangalore'
			and 
			dest = 'Delhi'
);
