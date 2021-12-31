use ineuron;            /* using ineuron data base */
create table empinfo (
fst_nm varchar(20),
lst_nm varchar(20),
id int not null,
age int,
city varchar(20),
state varchar(20),
primary key (id));

select * from empinfo;
insert into empinfo values ( "john","jones",99980,45,"payson","arizona")
insert into empinfo values ( "daga","deepu",55522,52,"muscat","austria")
insert into empinfo values ( "modi","narendra",4512,62,"gandhinagar","gujrat")
insert into empinfo values ( "goku","son",426523,35,"manga","dbz")
insert into empinfo values ( "naruto","ujumaki",6225,25,"leaf","konaha")
insert into empinfo values ( "kapil","dev",4125,80,"mumbai","india");
insert into empinfo values ( "gaurav","taneja",45225,45,"mumbai","india");
insert into empinfo values ( "warren","buffett",45227,16,"ohama","usa");

select * from empinfo ;                                                         /*by default gives all table risky for large data set */
select * from empinfo limit 2 ;                                                 /* now limit is set*/

select max(age),min(age) from empinfo;                                         /* gives the min and max */
 

select fst_nm,id,age,state from empinfo;                                      /* to get only required column*/
select fst_nm,id,age,state from empinfo where age >45 and city like "%a%" ;   /* multiple commands */
select count(*) from empinfo     /* count of all records */
select count(*) from empinfo where age > 30 ; 

/* use of alias personalised naming */
select count(*) as total_count from empinfo where age > 30                   /* heading of count colum has changed*/
select fst_nm as FN , lst_nm as LN from empinfo where age > 30               /* personalised view changed  in actual data set they are still the same*/
select * from empinfo                                                        /* recheck all the column name still remains the same*/

select fst_nm as FN , lst_nm as LN from empinfo as EMP where EMP.age > 30    /* used while using data from multiple tables*/
select fst_nm FN , lst_nm  LN from empinfo EMP where EMP.age > 30            /* removing as will also work both are same*/


																		    /* its an update block updates existing values */
update empinfo 
set fst_nm ="voldamord"
where id = 4125;

select * from empinfo order by id ;                                 

update empinfo 
set fst_nm ="deepanshu" , age = 70 
where id = 45227    ;                                       /* if primary key is defined all updates will include primary key in where statement*/

update empinfo 
set fst_nm ="dee" , age = 60
where fst_nm="warren"  ;                                    /* although same as above will not work since primary key not mentioned*/

update empinfo 
set state ="haryana"
where id in ( 4125,4512);                                   /* use of in command*/

select sum(age) from empinfo;                               /* sum use*/


delete from empinfo 
where fst_nm= "goku";

/*select released_year , avg (tempo) 
from music 
group by released_year 
order by released_year ; */                                 /* use of group by command sample not for this data set*/

/*select released_year , round(avg (tempo))
from music 
group by released_year 
order by released_year ; */                                 /* use of group by and round command command sample not for this data set*/
