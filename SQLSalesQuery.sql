-- Total Revenue

SELECT SUM(total_price) AS Total_Revenue FROM SalesDB.dbo.pizza_sales

-- Average Order Value 

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value FROM SalesDB.dbo.pizza_sales

-- Total Pizza Sold

SELECT SUM(quantity) AS Total_Pizza_Sold FROM SalesDB.dbo.pizza_sales

-- Total Order Placed

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM SalesDB.dbo.pizza_sales

-- Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM SalesDB.dbo.pizza_sales

-- Daily Trend for Total Orders

SELECT DATENAME(DW,order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Order FROM SalesDB.dbo.pizza_sales  GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for Total Orders

SELECT DATENAME(MONTH,order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_Order FROM SalesDB.dbo.pizza_sales  GROUP BY DATENAME(MONTH,order_date) ORDER BY Total_Order DESC

-- Percentage of Sales by Pizza Catagory

SELECT pizza_category, ROUND(SUM(total_price),2) as Total_Sales, ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM SalesDB.dbo.pizza_sales),2) 
FROM SalesDB.dbo.pizza_sales
GROUP By pizza_category


-- Percentage of Sales by Pizza Catagory in January

SELECT pizza_category, ROUND(SUM(total_price),2) as Total_Sales, ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM SalesDB.dbo.pizza_sales WHERE MONTH(order_date)=1),2)
FROM SalesDB.dbo.pizza_sales
WHERE MONTH(order_date)=1 GROUP By pizza_category


-- Percentage of Sales by Pizza Size

SELECT pizza_size, ROUND(SUM(total_price),2) as Total_Sales, ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM SalesDB.dbo.pizza_sales),2) 
FROM SalesDB.dbo.pizza_sales
GROUP By pizza_size


-- Top and Bottom 5 best sellers by Revenue, Total Quantity and Total Orders

SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC


SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders FROM SalesDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC



