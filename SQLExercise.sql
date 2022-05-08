
/*
SQL Exercise
Link to DB 
https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all
*/

/* FIND all customers in Berlin */
SELECT * 
FROM Customers
WHERE City='Berlin';


/* Find all customers in Mexico city */
SELECT * 
FROM Customers
WHERE City='México D.F.';


/* Find avg. price of all products */
SELECT AVG(Price) 
FROM Products;


/* Find number of products that have price = 18 */
SELECT Count(Price) 
FROM Products
WHERE Price=18;


/* Find orders between 1996-08-01 and 1996-09-06 */
SELECT * 
FROM Orders
WHERE OrderDate 
BETWEEN '1996-08-01' AND '1996-09-06';


/* Find customers with more than 3 orders */
SELECT COUNT(Orders.OrderID) as OrderC, Orders.CustomerID 
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Orders.CustomerID
HAVING OrderC > 3;

/* Find all customers that are from the same city */
SELECT * 
FROM Customers
WHERE City IN
(SELECT City FROM Customers GROUP BY City HAVING COUNT(*) > 1)
ORDER BY City;