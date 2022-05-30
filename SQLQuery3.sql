-- A
SELECT cust.last_name , cust.first_name , cust.pack_id , pack.speed
FROM customers cust JOIN packages pack
ON      cust.pack_id = pack.pack_id 
  
-- B
SELECT cust.last_name , cust.first_name , cust.pack_id , pack.speed
FROM customers cust JOIN packages pack
ON      cust.pack_id = pack.pack_id
WHERE cust.pack_id IN (27, 22)
ORDER BY cust.last_name  
  
-- 2
-- A
SELECT pack.pack_id , pack.speed, pack.monthly_payment, sect.sector_name
FROM packages pack JOIN sectors sect
ON      pack.sector_id = sect.sector_id
  
-- B
SELECT cust.last_name , cust.first_name , pack.pack_id , pack.speed, pack.monthly_payment, sect.sector_name
FROM packages pack JOIN sectors sect
ON      pack.sector_id = sect.sector_id
                                    JOIN customers cust
ON     cust.pack_id = pack.pack_id
  
-- C
SELECT cust.last_name , cust.first_name , pack.pack_id , pack.speed, pack.monthly_payment, sect.sector_name
FROM packages pack JOIN sectors sect
ON      pack.sector_id = sect.sector_id
                                    JOIN customers cust
ON     cust.pack_id = pack.pack_id
WHERE sect.sector_name = 'Business'
  
-- 3
SELECT cust.last_name , cust.first_name , cust.join_date, pack.pack_id , pack.speed ,sect.sector_name
FROM packages pack JOIN sectors sect
ON      pack.sector_id = sect.sector_id
                                    JOIN customers cust
ON     cust.pack_id = pack.pack_id
WHERE sect.sector_name = 'Private' AND year(cust.join_date) = 2006 
  
-- 4
SELECT pack.pack_id ,  pack.speed, pack.monthly_payment , grd.grade_name
FROM packages pack JOIN pack_grades grd
ON      pack.monthly_payment BETWEEN grd.min_price AND grd.max_price 
  
-- 5
-- A
SELECT cust.last_name , cust.first_name ,  pack.speed , pack.monthly_payment
FROM customers cust JOIN packages pack
ON      cust.pack_id = pack.pack_id 
  
-- B
SELECT cust.last_name , cust.first_name ,  pack.speed , pack.monthly_payment
FROM customers cust LEFT OUTER JOIN packages pack
ON      cust.pack_id = pack.pack_id 
  
-- C
SELECT cust.last_name , cust.first_name ,  pack.speed , pack.monthly_payment
FROM customers cust RIGHT OUTER JOIN packages pack
ON      cust.pack_id = pack.pack_id 
  
-- D
SELECT cust.last_name , cust.first_name ,  pack.speed , pack.monthly_payment
FROM customers cust FULL OUTER JOIN packages pack
ON      cust.pack_id = pack.pack_id 
  
-- 6
SELECT cust1.last_name , cust1.first_name , cust1.pack_id
FROM customers cust1 JOIN customers cust2
ON cust2.last_name = 'Taylor' AND cust2.first_name = 'Amado'
AND      cust2.pack_id = cust1.pack_id
  
-- 7
SELECT cust1.last_name , cust1.first_name , cust1.pack_id , cust1.monthly_discount
FROM customers cust1 JOIN customers cust2
ON cust2.Customer_Id = 103
AND cust1.monthly_discount < cust2.monthly_discount
  
-- 8
SELECT pack1.pack_id , pack2.speed
FROM    packages pack1 JOIN packages pack2
ON         pack2.pack_id = 10
AND       pack1.speed = pack2.speed