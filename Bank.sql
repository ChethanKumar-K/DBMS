show databases;
create database BankingApp;
use BankingApp;

create table Branch(branch_name varchar(15),
	branch_city varchar(15),
    assets float
);
alter table Branch add Primary key(branch_name);
desc Branch;
create table Accounts (accno int,
	branch_name varchar(15),
    balance float,
    Primary key(accno)
);
alter table Accounts add Foreign key(branch_name) references Branch(branch_name);
create table Loan(
		loan_no int,
        branch_name varchar(15),
        amount float,
        primary key(loan_no),
        foreign key (branch_name) references Branch(branch_name)
);

create table Depositor (
	accno int,
	customer_name varchar(15),
    customer_street varchar(30),
    customer_city varchar(15),
    primary key (accno),
    foreign key (accno) references Accounts (accno)
);
create table Borrower (
		customer_name varchar(15),
        loan_no int,
        primary key(customer_name),
        foreign key (loan_no) references Loan(loan_no)
);
desc Borrower;
desc Branch;
insert into Branch (branch_name , branch_city,assets) values
	("Bommasandra","Bangalore",12000),
    ("ElectronicCity","Bangalore",35000),
    ("Hebbagodi","Bangalore",6000),
    ("Townhall","Bangalore",50000),
    ("Navi Mumbai","Mumbai",40000),
    ("Aurobind Marg","Delhi",53000),
    ("Gandhi Chowk","Delhi",80000),
    ("Tilaknagar","Mumbai",40000);
select * from Branch;
insert into Accounts (accno,branch_name,balance)
values (7873,"Tilaknagar",2120.22),
	(8241,"Gandhi Chowk",4500.25),
    (9845,"Gandhi Chowk",56200.27),
    (6164,"Tilaknagar",52510.55),
    (4420,"Tilaknagar",85620.36),
    (8867,"Aurobind Marg",65230.78),
    (1972,"Bommasandra",12006.28),
    (0912,"Townhall",5623.78),
    (7019,"Townhall",78653.86),
    (1633,"Bommasandra",895.23),
    (8983,"Bommasandra",450.78),
    (1738,"ElectronicCity",4876.06),
    (8076,"Townhall",7856.12);
desc Depositor;

insert into Depositor (accno,customer_name,customer_street,customer_city)
values (7873,"Ramesh","AmbedkarRoad","Tilaknagar"),
	(9845,"Suresh","MGRoad","Gandhi Chowk"),
    (6164,"Naresh","TagoreRoad","ElectronicCity"),
    (4420,"Dinesh","TendulkarRoad","Tilaknagar"),
    (1972,"Ganesh","JiganiRoad","Bommasandra"),
    (0912,"Brijesh","JCRoad","Townhall"),
    (1738,"Aneesh","ThogurRoad","ElectronicCity");
    
desc Loan;

insert into Loan (loan_no , branch_name,amount)
values (87920,"ElectronicCity",12000),
	(37120,"Bommasandra",85000),
    (96325,"Bommasandra",2200),
    (81349,"Townhall",5600),
    (99808,"Townhall",53300),
    (12955,"Tilaknagar",45030);
    
desc Borrower;

insert into Borrower (customer_name, loan_no)
values ("Dilip",87920),
	("Dinesh",37120),
    ("Suresh",96325),
    ("Naresh",81349),
    ("Brijesh",99808),
    ("Satish",12955);
select * from Borrower;

select accno,customer_name from Depositor group by Depositor.customer_city;