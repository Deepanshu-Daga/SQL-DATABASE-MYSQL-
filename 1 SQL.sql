create database ineuron;
create database goldman;
show databases;
use ineuron;
create table CUST_DETAILS (
CUST_NAME varchar (25),
CUST_ID int,
GENDER varchar(1),
GEOGRAPHY varchar(25),
CHURN int);

select * from CUST_DETAILS;
insert into CUST_DETAILS value ('DEEP',88,'M','HARYANA',0);
insert into CUST_DETAILS value ('NEHA',12,'F','DELHI',0);
insert into CUST_DETAILS value ('RAM',13,'F','BANGLORE',0);
insert into CUST_DETAILS value ('',80,'M','HYD',0);

select * from CUST_DETAILS where GENDER = "F";

create table CUST_DETAILS_PK (
CUST_NAME varchar (25),
CUST_ID int  NOT NULL ,
GENDER varchar(1),
GEOGRAPHY varchar(25),
CHURN int,
primary key(CUST_ID));

insert into CUST_DETAILS_PK value ('DEEP',88,'M','HARYANA',0);
insert into CUST_DETAILS_PK value ('NEHA',12,'F','DELHI',0);
insert into CUST_DETAILS_PK value ('RAM',13,'F','BANGLORE',0);
insert into CUST_DETAILS_PK value ('RAJA',80,'M','HYD',0);

select * from CUST_DETAILS_PK ;

insert into CUST_DETAILS_PK value ('GOKU',80,'M','HYD',0);
insert into CUST_DETAILS_PK value ('NARUTO',80,'M','HYD',0);

select * from cust_details_pk ;

create table dept(
deptid int not null,
deptname varchar(20),
deptadd varchar(10),
primary key(deptid));      


create table emp(
empid int not null,
empname varchar(20),
empadd varchar(10),
deptid int ,
primary key(empid),
foreign key(deptid) references dept(deptid));     /*here deptid becomes forign key because its used in other table as primary key
                                                    here emp table is child bdcause it has a column that is primary to other table
                                                    so if we try to add or del anything first from emp ( child table error pops*/

insert into	emp values (11,'ash','mumbai',01);     /* can not add first to child table*/

insert into	dept values (01,'ash','mumbai'); 
insert into	dept values (02,'ash','surat');        /* add the value first in parent table*/
insert into	dept values (03,'ash','gujrat'); 

select * from dept ;
insert into	emp values (11,'raghu','mumbai',01);    /* child table only takes in values for which parent primary key exist here deptid 01 ok*/
insert into	emp values (13,'raja','surat', 04 );    /* child table for deptid 04 not defined yet in parent table thus can not add any element here*/
 

