show databases;
create database University;
use University;
create table Student 
( 	snum int,
	sname varchar(30),
    major varchar(30),
    level char(2),
    age int,
    primary key(snum)
);

create table Faculty
(	fid int,
	fname varchar(30),
    depid int,
    primary key(fid)
);

create table Class
(	name varchar(30),
	meets_at time,
    room varchar(10),
    fid int,
    primary key(name),
    foreign key (fid) references Faculty(fid)
);

create table Enrolled
(	snum int,
	cname varchar(30),
    primary key(snum,cname),
    foreign key(snum) references Student(snum),
    foreign key(cname) references Class(name)
);

insert into Student values
(034,'Chethan','CS','SR',20),
(036,'Chirag','CS','SR',20),
(030,'Bhargav','CS','SR',20),
(167,'Shivaraj','EC','SR',20),
(198,'Vishvesh','EC','SR',20),
(143,'Dilip','ME','SR',20),
(046,'Varun','AS','SR',20),
(032,'Nandan','AS','JR',19),
(129,'Rahul','EC','JR',19),
(038,'Chethan','EC','SR',22),
(021,'Manikanta','CS','FR',18)
;

insert into Faculty values
(4001,'JSN',1),
(4002,'UV',1),
(4003,'BGP',1),
(4004,'BJ',1),
(3001,'ED',3),
(3002,'ACM',3),
(3003,'RBS',3),
(2001,'SVA',2),
(2003,'KVN',2),
(5001,'ENM',5),
(5002,'GK',5),
(7001,'JK',7),
(7002,'LN',7);

insert into Class values
('Coa','9:50:00','402',4002),
('Tfcs','8:55:00','405',4001),
('Lod','11:15:00','402',4003),
('Ece','14:00:00','205',3001),
('Maths','15:50:00','405',3002),
('Dbms','12:05:00','405',2003)
;

