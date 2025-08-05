CREATE TABLE sales_table (
    customer_id VARCHAR(50),
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100),
    category_name VARCHAR(100),
    product_name TEXT,
    customer_segment VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(100),
    customer_region VARCHAR(50),
    delivery_status VARCHAR(50),
    order_date DATE,
    order_id VARCHAR(50),
    ship_date DATE,
    shipping_type VARCHAR(50),
    days_for_shipment_scheduled INT,
    days_for_shipment_real INT,
    order_item_discount DECIMAL(10,2),
    sales_per_order DECIMAL(10,2),
    order_quantity INT,
    profit_per_order DECIMAL(10,2)
);

-- Q1: What Category of items was the most and least bought?
SELECT category_name, SUM(order_quantity) AS total_quantity
FROM sales_table
GROUP BY category_name
ORDER BY total_quantity DESC;

-- Q2: What sector of customers bought the most and least products?
SELECT customer_segment, SUM(order_quantity) AS total_quantity
FROM sales_table
GROUP BY customer_segment
ORDER BY total_quantity DESC;

-- Q3: What category of item was bought the most by each sector of customers
SELECT customer_segment, category_name, SUM(order_quantity) AS total_quantity
FROM sales_table
GROUP BY customer_segment, category_name
ORDER BY customer_segment, total_quantity DESC;

-- Q4: What city/state/country were products sold to the most
SELECT customer_country, customer_state, customer_city, SUM(order_quantity) AS total_quantity
FROM sales_table
GROUP BY customer_country, customer_state, customer_city
ORDER BY total_quantity DESC;

-- Q5: What was delivery status like? Who got products on time or didn’t?
SELECT delivery_status, COUNT(*) AS total_orders
FROM sales_table
GROUP BY delivery_status;

-- Q6: Delivery status by country – were goods delivered on time or late?
SELECT customer_country, delivery_status, COUNT(*) AS total_orders
FROM sales_table
GROUP BY customer_country, delivery_status
ORDER BY customer_country;

-- Q7: What category of products were the most and least profit made?
SELECT category_name, SUM(profit_per_order) AS total_profit
FROM sales_table
GROUP BY category_name
ORDER BY total_profit DESC;

-- Q8: How many days did it take to deliver particular segments of goods?
SELECT customer_segment, 
       AVG(days_for_shipment_real) AS avg_actual_delivery_days,
       AVG(days_for_shipment_scheduled) AS avg_scheduled_delivery_days
FROM sales_table
GROUP BY customer_segment;