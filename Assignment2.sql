--Q1 write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909--
UPDATE orders
SET city = NULL
WHERE order_id IN ('CA-2020-161389', 'US-2021-156909');

--Q2 write a query to find orders where city is null--
select * from orders
where city is null;

--Q3 write a query to get total profit, first order date and latest order date for each category--
SELECT
    category,
    SUM(profit) AS total_profit,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date
FROM
    orders
GROUP BY
    category;

--4 Write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category.--
SELECT 
    sub_category, 
    AVG(profit) AS AvgProfit, 
    MAX(profit) AS MaxProfit
FROM 
    orders
GROUP BY 
    sub_category
HAVING 
    AVG(profit) > (MAX(profit) / 2);

5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

--6-write a query to find students who have got same marks in Physics and Chemistry.
SELECT * FROM exams;

SELECT 
    student_id 
FROM 
    exams
WHERE 
    subject IN ('Physics', 'Chemistry')
GROUP BY 
    student_id
HAVING 
    COUNT(DISTINCT subject) = 2 -- Ensure the student has marks in both Physics and Chemistry
    AND MAX(marks) = MIN(marks); -- Ensure the marks in both subjects are the same

--7- write a query to find total number of products in each category.
SELECT * from orders;
SELECT 
    category, 
    COUNT(*) AS total_products
FROM 
   orders
GROUP BY 
    category;


--8- write a query to find top 5 sub categories in west region by total quantity sold
SELECT TOP 5
sub_category,
SUM(quantity) AS Total_quantity
FROM orders
WHERE
region = 'West'
GROUP BY 
sub_category
ORDER BY
Total_quantity DESC;

--9- write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT 
    region, 
    ship_mode, 
    SUM(sales) AS total_sales
FROM 
    orders
WHERE 
    YEAR(order_date) = 2020
GROUP BY 
    region, 
    ship_mode;

--Basic Questions:

--Write a query to find the total sales for each product in the sales table.--
SELECT 
    product_name,
    product_id,
    SUM(sales) AS total_sales
FROM 
    orders
GROUP BY
    product_name, product_id;

--Count the number of employees in each department in the employees table:--
--NO TABLE AS SUCH-- 

--SELECT department_id, 
    --COUNT(*) AS employee_count
--FROM 
    --employees
--GROUP BY 
    --department_id;--

--Find the highest marks scored by students in each subject from the exams table:
SELECT * FROM exams;
SELECT subject,
MAX(marks) AS highest_marks
FROM 
exams
GROUP BY 
subject;

--Calculate the total revenue generated for each category in the products table:
SELECT * FROM orders;
SELECT 
    category,
    SUM(sales) AS Total_Revenue
FROM 
    orders
GROUP BY
    category;

--Find departments where the average salary is greater than 50,000 in the employees table:--
--SELECT 
-- department_id, 
  --  AVG(salary) AS average_salary
--FROM 
    --employees
--GROUP BY 
    --department_id
--HAVING --
    --AVG(salary) > 50000;--

--Find the categories that have been more than 10 products in the orders table--
SELECT 
    category, 
    COUNT(*) AS product_count
FROM 
    orders
GROUP BY 
    category
HAVING 
    COUNT(*) > 10;

--Find customers who have made more than 5 purchases from the orders table:
SELECT * FROM orders;

SELECT 
    customer_name,
    COUNT (*) AS product_count
FROM
    orders
GROUP BY
    customer_name
HAVING
    COUNT(*)>5;

--Find subjects where the average marks scored are below 50 in the exams table:

SELECT 
    subject,
    AVG(marks) AS Average_marks
FROM
    exams
GROUP BY
    subject
HAVING 
    AVG(marks)<50;

--Find the total sales for each product:--
SELECT
    product_name,
    SUM(sales) AS Total_sales
from 
    orders
GROUP BY
    product_name;

--Find the total quantity sold in each region:--
SELECT
    region,
    SUM(quantity) AS Total_quantity
FROM 
    orders
GROUP BY
    region;

--Find the total profit for each category:--
SELECT
    category,
    SUM(profit) AS total_profit
FROM
    orders
Group BY
    category;

--Find the average discount applied to orders in each ship mode:--
SELECT
    ship_mode,
    AVG(discount) AS Avg_discount
FROM
    orders
GROUP BY
    ship_mode;

--Count the number of orders placed in each segment:--
SELECT
    segment,
    COUNT(*) AS ORDER_COUNT
FROM
    orders
GROUP BY
    segment;

--Find customers who made purchases worth more than $10,000:
SELECT
    customer_id,
    SUM(sales) AS toatl_purchases
FROM
    orders
GROUP BY
    customer_id
HAVING
    SUM(sales)>10000;

--Find the sub-categories with an average profit less than $50:
SELECT
    sub_category,
    AVG(profit) AS average_profit
FROM
    orders
GROUP BY
    sub_category
HAVING
    AVG(profit)<50;

--List regions where total sales exceeded $50,000:
SELECT
    region,
    SUM(sales) AS total_sales
FROM
    orders
GROUP BY
    region
HAVING 
    SUM(sales)>50000;

--Find cities where the total quantity sold is greater than 500--
SELECT
    city,
    SUM(quantity) AS total_quantity
FROM 
    orders
GROUP BY
    city
HAVING
    SUM(quantity)>500;

--Find the top 3 most profitable products--
SELECT
    TOP 3 product_name,
    SUM(profit) AS total_profit
FROM 
    orders
GROUP BY
    product_name
ORDER BY
    total_profit DESC;

--Find regions where the average discount is greater than 20%--
SELECT
    region,
    AVG(discount) AS Average_Discount
FROM 
orders
GROUP BY
    region
HAVING
    AVG(discount)> 0.2;

--Find sub-categories that contribute to more than 20% of total sales:
SELECT 
    sub_category, 
    SUM(sales) AS total_sales, 
    (SUM(sales) * 100.0 / (SELECT SUM(sales) FROM orders)) AS sales_percentage
FROM 
    orders
GROUP BY 
    sub_category
HAVING 
    (SUM(sales) * 100.0 / (SELECT SUM(sales) FROM orders)) > 20;

--Identify customers who have ordered more than 10 unique products:
SELECT
    customer_name,
    COUNT(Distinct product_name) AS unique_products
FROM 
    orders
GROUP BY
    customer_name
HAVING
    COUNT(Distinct product_name) >10;

--Find the most popular product in terms of quantity sold for each region--
SELECT 
    region,
    product_name,
    SUM(quantity) AS Total_quantity
FROM 
    orders
GROUP BY
    region,product_name
ORDER BY
    region,Total_quantity DESC;

--List the top 5 states with the highest total sales:--
SELECT * FROM orders;
SELECT TOP 5
    [state],
    SUM(sales) AS total_sales
FROM 
    orders
GROUP BY
    [state]
ORDER BY
    [state],total_sales;
--DATA BASED QUERIES--
--Find the total sales and profit for each year:--
SELECT
    YEAR(order_date) AS YEAR,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
 orders
GROUP BY
 YEAR(order_date);

--Find the total quantity sold in each month of 2020:
SELECT
    MONTH(order_date) AS MONTH,
    SUM(quantity) AS total_quantity
FROM 
    orders
WHERE
    YEAR(order_date)= 2020
GROUP BY
    MONTH(order_date);

--Find orders shipped late (ship_date after order_date) and their total count:
SELECT
    COUNT(*) AS Late_orders
FROM 
    orders
WHERE
 ship_date>order_date;

--Find the total profit generated by orders placed in Q1 (January to March) of 2021:
SELECT 
    SUM(profit) AS total_profit
FROM 
    orders
WHERE 
    YEAR(order_date) = 2021 
    AND MONTH(order_date) BETWEEN 1 AND 3;

--Find the average time taken to ship an order in days:--
SELECT 
    AVG(DATEDIFF(day, order_date, ship_date)) AS avg_shipping_time
FROM 
    orders;
