USE demo
GO
--shalev queries
--1.
WITH "MY-CTE" AS 
(
SELECT last_name, department_id, salary, 
		ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) SAL_RNK
FROM employees 
)
SELECT * 
FROM "MY-CTE"
WHERE SAL_RNK <= 2 
--2.

;WITH "GROUPS-CTE" AS    
	(    
	SELECT * , NTILE(3) OVER (ORDER BY p_unitprice) NTL    
	FROM products     
	)    
SELECT CAST(MIN(p_unitprice) AS VARCHAR) + '-' + CAST(MAX(p_unitprice) AS VARCHAR) PriceRange, COUNT(*) NumOfProducts    
FROM "GROUPS-CTE"   
GROUP BY NTL

--3.
;WITH "RNK-CTE" AS 
(
SELECT SEC_1.from_d s1, 
	   SEC_1.to_d s2, 
	   SEC_2.to_d s3, 
	   SEC_3.to_d s4,
	   ISNULL(SEC_1.distance,0) + ISNULL(SEC_2.distance,0) + ISNULL(SEC_3.distance,0) DISTANCE,
	   DENSE_RANK() OVER (ORDER BY ISNULL(SEC_1.distance,0) + ISNULL(SEC_2.distance,0) + ISNULL(SEC_3.distance,0)) RNK
FROM distances SEC_1 JOIN distances SEC_2  
ON   SEC_1.to_d = SEC_2.from_d
					 LEFT OUTER JOIN distances SEC_3 
ON   SEC_2.to_d = SEC_3.from_d
WHERE SEC_1.from_d = 'Ramat Gan'
)
SELECT * 
FROM "RNK-CTE" 
WHERE RNK <= 2 

--.4
;WITH "GAPS-CTE"  
AS  
   (  
       SELECT productID GapStart ,   
              LEAD(productID) OVER (ORDER BY productID)   GapEnd ,   
              LEAD(productID) OVER (ORDER BY productID) - productID Gap   
       FROM products   
   )  
SELECT GapStart, GapEnd   
FROM "GAPS-CTE" 
WHERE GAP > 1 

--.5
;WITH "RN-CTE" AS  
   (  
   SELECT digit1, digit2, digit3, digit4 ,   
          ROW_NUMBER() OVER (PARTITION BY digit1 ORDER BY digit2 DESC, digit3 DESC, digit4 DESC) RN  
   FROM   digits    
   )  
SELECT digit1, digit2, digit3, digit4  
FROM "RN-CTE" 
WHERE RN = 1   
GO  

--.6
WITH "DIGITS-CTE"
AS
(
SELECT digit1 AS GRP, digit1*1000 + digit2 *100 + digit3 * 10 + digit4 AS NUM
FROM   digits 
)
SELECT MAX(NUM)
FROM "DIGITS-CTE"
GROUP BY GRP