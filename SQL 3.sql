use ineuron ;

select * from empinfo ;
create table marsemp (
mars_id int,
base_id int,
first_name varchar(30),
last_name varchar (30));

insert into marsemp values ( 5265,11,"rahul" ,"singh");
insert into marsemp values ( 4125,12,"vodamort" ,"dev");   /* dont forget brackets after values*/
insert into marsemp values (4512,13,"modi" ,"narendra");
insert into marsemp values (99980,14,"john" ,"jones");
insert into marsemp values (4444,15,"bhaiya" ,"ji");

select *  from marsemp;

                                                                       /* syntax of join statement*/
/*select *
from marsemp                                  
------join empinfo
on marsemp.base_id = empinfo.id 
where ------condition---
order by -----table name----   */

select *                                                                /* (*)means selection all columns*/
from marsemp 
inner join  empinfo
on marsemp.mars_id = empinfo.id 
order by marsemp.mars_id desc ;

select mars_id , id , age , city, base_id                                                           /* only selcted columns*/
from marsemp 
inner join  empinfo
on marsemp.mars_id = empinfo.id 
order by marsemp.mars_id desc ;

select mars_id , id , age , city, base_id  , m.first_name as mfn   , e.lst_nm as eln                 /* only selcted columns  ans alias */
from marsemp as m 
inner join  empinfo as e
on m.mars_id = e.id 
order by m.mars_id desc ;

select *
from marsemp as m                                                                                      /* right join will give all right items */
right join empinfo as e 
on m.mars_id = e.id 
where m.mars_id is null or e.id is null ;                                                               /* see use of null syntax*/   
 
 
 
                                                                                    /* how to create a column as status new just for looking in output*/
select lst_nm , id , city , "avenger" as status 
from empinfo;                                                                        /* use of status keyword*/

                                                                                      /* use of join key word*/
select lst_nm , id , city , "avenger" as status 
from empinfo
union 
select first_name , mars_id ,last_name, "marsian guy" as status              /* in union statement no of column have to be same no and same data type*/
from marsemp ;


                                                     /* If we want to separately mark in id / or if some field is same value use concat fx */
select concat("m",id) as new_id  , lst_nm , city , "avenger" as status 
from empinfo
union 
select concat("e",mars_id )as new_id , first_name ,last_name, "marsian guy" as status              
from marsemp ;