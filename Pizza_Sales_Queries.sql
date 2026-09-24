CREATE TABLE pizza_sales(
pizza_id INT PRIMARY KEY,
order_id INT,	
pizza_name_id VARCHAR(50) NOT NULL,
quantity INT,
order_date	DATE,	
order_time	TIME,	
unit_price	FLOAT,	
total_price	FLOAT,	
pizza_size VARCHAR(50)	NOT NULL,
pizza_category VARCHAR(50)	NOT NULL,
pizza_ingredients VARCHAR(200)	NOT NULL,
pizza_name VARCHAR(50)	NOT NULL
);

SELECT * FROM  pizza_sales;


--1.Find the total revenue for all pizza orders

SELECT SUM(total_price) AS total_revenue 
FROM pizza_sales;

--2.Find the average order value all pizza orders

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS average_order_value
FROM pizza_sales;

--3.Find the total pizzas sold

SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;

--4.Find the total number of orders placed

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

--5.Find the average number of pizzas sold per order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_pizzas_per_order
FROM pizza_sales;

--6.Find the daily trend for total orders

SELECT TO_CHAR(order_date, 'Day')  AS order_day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Day');

--7.Find the monthly trend for total orders

SELECT TO_CHAR(order_date, 'Month')  AS month_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Month');

--8.Find the percentage of sales by pizza category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

--9.Find the percentage of sales by pizza size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;

--10.Find the total pizzas sold by pizza category

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

--11.Find the top 5 Pizzas by Revenue

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

--12.Find the bottom 5 Pizzas by Revenue

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

--13.Find the Top 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

--14.Find the bottom 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

--15.Find the Top 5 Pizzas by Total Orders

SELECT pizza_name, COUNT(DISTINCT (order_id)) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

--16.Find the bottom 5 Pizzas by Total Orders

SELECT pizza_name, COUNT(DISTINCT (order_id)) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;

