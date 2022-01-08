
show databases;
use ineuron;
show  tables ;
select * from earthquake limit 10;                       
select max(magnitude), min(magnitude) from earthquake;




/*  HOW TO CREATE PROCEDURES -----STORED PROCEDURE-----  SIMILAR TO FUNCTIONS CAN BE CALLED */
/*STORED PROCEDURE CAN BE ---IN ----OUT ----- DEPENDING ON DIRECTION OF ARGUMENT */
/* normal query to return values of magnitude > 8.5*/
select * from earthquake where magnitude>8;

/*  now use stored procedures  */

delimiter &&
create procedure top_earthquake()
begin
select * from earthquake where magnitude>8;
end &&
delimiter ;

call top_earthquake()                                                   /*          calling of the fx          */
                                                                       

/* STORED PROCEDURE USING IN */
delimiter &&
create procedure top_earthquake_by_arg(in a int)                        /* syntax of passing argument in calling fx via (in ---a --int) */
begin
select * from earthquake order by magnitude desc limit a;
end &&
delimiter 

call top_earthquake_by_arg(5)                                           /* user input */

/* STORED PROCEDURE USING OUT */
delimiter &&
create procedure count_earthquake(out d int )
begin 
select count(*) from earthquake where magnitude >8.2 into d;                                      /*    syntax of out procedure     */
end &&
delimiter  ;

call count_earthquake(@t) ;
select @t;


/*  STORED PROCEDURE USING OUT AND IN SAME CLAUSE  */
delimiter && 
create procedure country_count(in e varchar(50),out f int)
begin
select count(*) from earthquake where cause =e  into f ;
end &&a
delimiter ;

call country_count("nuclear explosion", @o);
select @o;




select distinct cause from earthquake ;  
                        
/* USING STORED PROCEDURES FOR UPDATING */

update earthquake set magnitude = 8.4 where earthquake_id = 3285 ;           /* by normal update*/


																			/* creating a  stored in procedure fx */
delimiter &&
create procedure update_top_earthquake(in b float , in c int)
begin
update earthquake set magnitude = b where earthquake_id = c ; 
end &&
delimiter ;
       
call update_top_earthquake( 8.5 , 3285)






/*Nested query because all the queries are run on table column first to give output then its output is used to run on other table.
Q1 --> Find the list of events who are having magniude greater than the average magniude*/
select count(*) from earthquake where (select avg(magnitude) from earthquake ) < magnitude;                           /*valid */ 
select count(*) from earthquake where avg(magnitude)  < magnitude;                                       /* single query can not give 2 output */

/* Q2 -> Find the count of customers who has a greater totalCharges than customer_id: '9237-HQITU' */
select COUNT(*) from earthquake where ( select magnitude from earthquake where earthquake_id=10) < magnitude;



use classicmodels;
show tables;
select * from products;
select * from orderdetails;


/*Q3 --> We want the product code, name & msrp of products whose price of each product is less than 200$ */
select productcode , productname, msrp from products where productcode = (select productcode from orderdetails where priceeach < 200 ) ; /*wrong*/
                                                                                                /* use of in */
select productcode , productname, msrp from products where productcode in (select productcode from orderdetails where priceeach < 200 ) ; 
select ordernumber , quantityordered from orderdetails where quantityordered in (30,40,50);




