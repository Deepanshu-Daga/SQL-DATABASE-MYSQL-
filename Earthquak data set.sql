use ineuron;
create table earthquake (
earthquake_id int ,
occurred_on date ,
latitude float ,
longitude float,
depth float,
magnitude float,
calculation_method  varchar(50),
network_id varchar(50),
place varchar(50),
cause varchar(50),
primary key(earthquake_id));

select * from earthquake limit 100;
select count(*) from earthquake ;

/* select cause from  earthquake */       /* this will give all 6000 rows cause individually */
select distinct cause from earthquake ;        /* output is all distinct */
select min(magnitude) , max(magnitude) from earthquake;  
                                                                             /* order by by default gives acending order */
select place, magnitude , occurred_on from earthquake where cause ="explosion" order by occurred_on desc limit 1;

/* 10 largest earthquake*/
select * from earthquake order by magnitude desc limit 10;

/* count earthquakes with in a week*/
select * from earthquake where place like "%a%" and occurred_on between  10-03-1990 and 20-04-1991;
