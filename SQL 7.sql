use classicmodels;
show tables;
select * from customers limit 10;

/*  ALL VIEWS ARE SHOWN ON THE LEFT HAND SIDE */
/*  CREATING VIEW IS OK , BUT CREATING TABLE EATS APWAY THE SPACE */
/*  CREATING TABLE VS CREATING VIEW   */
create table usa_people as                            /* creating a separate table for usa people see in schema we have created a new table */
select * from customers where country = "usa";        /* here physical table is created and thus space is taken*/    
select * from usa_people;


create view usa_people_view as                        /* creating view for  usa people  */
select * from customers where country = "usa";        /* here  no physical table is created and thus no space is taken*/ 
select * from usa_people_view;       




create view details as
select prd.productline , prd.productname , prd.productcode ,prd.buyprice , pdl.textdescription from products as prd inner join productlines as pdl
on prd.productline = pdl.productline;             

select * from details   ;  

show full tables where table_type ="VIEW"           /*  SYNTAX IS IMP TO VIEW OR SEE IN SCHEMA   */

/* drop view viewname */                             /* to drop or drop from schema */


select * from productlines limit 10;
select * from products limit 10;

/* Window functions 
Find combined msrp for each productLine  */
select distinct productline from products ;

select productline , sum(msrp)   from products 
where productline in  ("Classic Cars" ,"Motorcycles", "Planes", "Ships","Trains" ,"Trucks and Buses")
group by  productline ;                               /* it will do coustomised group by vintage cars is removed */

select productline , sum(msrp)   from products        /* it will do grouping of all by default*/
group by  productline ;


/* USE OF RANK FX */

drop table test_marks;
Create table test_marks (
marks int);
select * from test_marks;
insert into test_marks values( 101, 102, 102, 103, 104,105,105, 106);                     /*  will show error as it considers till all as  1 row entry  */
insert into test_marks values (101), (102), ( 102), (103), (104), (105),(105), (106);     /* separated by bracket this will enter in multirow  */

select marks, rank()
over(order by marks) as test_rank from test_marks;                                         /*  syntax of rank () fx */

select marks, row_number ()                                                                /* syntax of row no and rank is same */
over (order by marks) from test_marks ;





