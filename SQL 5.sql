use ineuron;
show tables;
select * from cust_details;

select concat(cust_name , "--" , geography) as name_geo , gender from cust_details;     /* concate fx */
select substr(cust_name, 3,2), cust_name from cust_details;                             /*  sub string fx from substr(cust_name, 3,2)
																						    in cust_name from 3rd , nxt 2 character  */   
                                                                                            
select character_length(cust_name), upper(cust_name), cust_name from cust_details;    /* length , upper case fx */

create table transaction_detail (
p_name varchar(50) , 
order_date datetime ,
amount int );

show tables;
insert into transaction_detail values ('asus','01.01.2021',1000);                             /*date time has format yymmdd*/
insert into transaction_detail values ('moto','3.02.2021',2000);
insert into transaction_detail values ('iphone','21.03.2021',3000);
insert into transaction_detail values ('redmi','12.04.2021',4000);
insert into transaction_detail values ('lenovo','10.05.2021',5000);
select * from transaction_detail;

select left(p_name,2) , p_name from transaction_detail;                                         /*get n  leter of name*/
select left(p_name,character_length(p_name)-1) , p_name from transaction_detail;                /*leave last letter of name and print rest*/
select substr(p_name,1,character_length(p_name)-1) , p_name from transaction_detail;            /*leave last letter of name and print rest*/



																				 /* diff in dates orderdate and system date*/
select datediff(sysdate(), order_date)as datediff_today, p_name, amount, order_date from transaction_detail;
select date_format(order_date,'%y') , p_name from transaction_detail;            /* returns year from date format   or '%d' '%m'*/ 
select day(order_date),p_name  from transaction_detail;  
select adddate("2020.10.21",interval -2 day) ;                                   /* removes  no of days and presents*/ 
select * from transaction_detail where p_name regexp '[am]';                     /* multiple string check by regexp in [] brackets*/
select * from transaction_detail where p_name regexp '[t-z]';                     /* anyone from t,u,v,w,x,y.z */