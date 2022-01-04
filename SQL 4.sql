use ineuron ;
show tables
 

select   * from emp2 ;

alter table emp2                   /* alter adds or drops */ 
drop adrs;                          /* delete is not allowed in alter*/

alter table emp2                   
add  adrs  varchar(20) ;           /* syntax is imp*/

select * from cust_details ;

alter table cust_details            /* age column added but values are null */
add age int ;

update cust_details                  /*if not in safe mode this will update the age */
set age = 30 
where gender ="M";


                                      /*importing a csv file     left panels click on tables */
                                       /* its slow when it comes to large csv file*/
show tables     
select * from student  ;      

drop table student  ;                  /* drop table */




create database imdb ;
use imdb ;    
show tables;                            /* no tables in newly created data base imdb */           
select count(*) from person;  




   /*"index","MID","PID","ID"                                         sample to create empty table
"0","tt2388771","nm0000288","0"
"1","tt2388771","nm0000949","1"
"2","tt2388771","nm1212722","2"                 */


create table m_cast (
index_  varchar (50),                                /*  empty table created*/
mid varchar(50),
pid varchar(50),
id varchar (50));

/*HOW TO IMPORT FAST USING DIRECTORTY
open mysql  -----create your database ------create an empty table in that database as per csv column


in cmd >>> cd    C:\Program Files\MySQL\MySQL Server 8.0\bin
mysql   -u    root   -p
put pasward 
SET GLOBAL local_infile=1;
quit ;
mysql  --local-infile=1  -u    root   -p
show databases ;
use (DATABASE U WANT );
LOAD DATA LOCAL INFILE 'C:\\Users\\deepa\\Downloads\\imdb_dataset\\M_Cast.csv'
INTO TABLE m_cast
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY  '\r\n'  IGNORE 1 ROWS ;                      */                     

drop table m_cast;   
                                               /*  drop will dump all rows with table also*/
delete * from m_cast;  
                                              /* delete will dump all rows only and will empty table*/
show tables;

select count(*) from m_cast;



use ineuron ;
show tables
select * from cust_details;

select gender , count(*) from cust_details                    /* use of group by */
group by gender ;

select gender , geography ,count(*) from cust_details          /* multiple group by and order by */
group by gender , geography order by count(*);

select gender , geography ,count(*) from cust_details          
group by gender , geography order by geography;

                                             /* where caluse is used on individal records but on agreegated records having clause is used */
select gender , geography ,count(cust_id) from cust_details          
group by gender , geography where count(cust_id) >10;                            /* where clause -- wrong syntax*/

select gender , geography ,count(cust_id) from cust_details                       /* agreegated clause uses having */
group by gender , geography having count(cust_id) >10; 		

/*using sequence */
select * from 
where              
group by 
having
order by
limit 





									