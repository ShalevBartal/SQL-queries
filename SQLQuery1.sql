select * 
from customers

select pack_id,speed,monthly_payment as mp
from packages

select pack_id,speed,monthly_payment,monthly_payment*12 as yearly_payment
from packages

select distinct City,State
from customers
order by State

select top 10 Last_Name
from customers
where Last_Name like '%_a%'

select LEN (Last_Name)
from customers
where Last_Name like '%_a%'

select REPLACE (last_name,'a','') as new ,Last_Name
from customers

SELECT first_name , last_name , monthly_discount ,
              CASE WHEN monthly_discount BETWEEN 0 AND 10 THEN 'A'
                        WHEN monthly_discount BETWEEN 11 AND 20 THEN 'B'
                        WHEN monthly_discount BETWEEN 21 AND 30 THEN 'C'
                        ELSE 'D'
             END AS 'Grades'
FROM customers 

select min(monthly_discount)
from customers

select count(distinct city)
from customers

select gender,avg(monthly_discount)
from customers
group by gender

