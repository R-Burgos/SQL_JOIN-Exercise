/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name AS "Product Name", c.Name AS "Category"
 FROM products AS p
 INNER JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE p.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS "Product Name", p.Price, r.Rating
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */ 
SELECT e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity) AS "Total Sold"
FROM sales AS s
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS "Department Name", c.Name AS "Category Name"
FROM categories as c
INNER JOIN departments as d
ON d.DepartmentID = c.DepartmentID
Where c.CategoryID = 2 OR c.CategoryID = 8;


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS "Product Name", SUM(s.Quantity) AS "Total Sold", SUM(s.PricePerUnit * s.Quantity) AS "Total Price Sold"
FROM products AS p
INNER JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE s.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS "Product Name", r.Reviewer AS "Reviewer Name", r.Rating, r.Comment AS "Reviewer Feedback"
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProductID, p.Name AS "Product Name", s.Quantity AS "Quantity Sold"
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
ORDER BY e.LastName;
