# Following Queries are written for the following database schema as per requirements mentioned in reademe.md file
# Output of Following queries are also mentioned in the respective csv file with the same serial number as the query.

# 1. List the top 10 customers who have placed the most orders, along with their contact information and total amount spent on all orders.
SELECT
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.quantity * oi.price_per_unit) AS total_spent
FROM
    Customers c
    INNER JOIN Orders o ON c.customer_id = o.customer_id
    INNER JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_id
ORDER BY
    total_orders DESC
LIMIT
    10;

#===================================================================
# 2. top 5 products that have the highest sales revenue in the current year.
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    Products p
    INNER JOIN Order_Items oi ON p.product_id = oi.product_id
    INNER JOIN Orders o ON oi.order_id = o.order_id
WHERE
    YEAR(o.order_date) = YEAR(CURDATE())
GROUP BY
    p.product_id
ORDER BY
    total_revenue DESC
LIMIT
    5;

#===================================================================
## 3. Calculate the average time it takes for an order to be processed from the time it is placed to the time it is shipped.
SELECT
    AVG(TIMESTAMPDIFF(DAY, o.order_date, o.shipped_date)) AS avg_processing_time
FROM
    Orders o
WHERE
    o.shipped_date IS NOT NULL;

#===================================================================
## 4. Identify the top 5 categories of products that have the highest sales revenue in the current year.
SELECT
    p.category,
    SUM(oi.quantity * oi.price_per_unit) AS revenue
FROM
    Products p
    INNER JOIN Order_Items oi ON p.product_id = oi.product_id
    INNER JOIN Orders o ON oi.order_id = o.order_id
WHERE
    YEAR(o.order_date) = YEAR(CURRENT_DATE())
GROUP BY
    p.category
ORDER BY
    revenue DESC
LIMIT
    5;

#===================================================================
##5. Calculate the average rating of each product, along with the number of reviews it has received.
# we have created a review table with dummy review data for this query
SELECT
    p.name,
    AVG(r.rating) AS avg_rating,
    COUNT(r.review_id) AS num_reviews
FROM
    Products p
    LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY
    p.name;

#===================================================================
## 6. Identify the top 5 employees who have the highest sales revenue in the current year, along with their contact information and total amount of commission earned.


## since commission_rate column was not in the schema altering the table now
##
#-- Add the new column
ALTER TABLE
    Employees
ADD
    COLUMN commission_rate DECIMAL(5, 2) NOT NULL DEFAULT 0.05;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    SUM(
        oi.price_per_unit * oi.quantity * (e.commission_rate / 100)
    ) AS total_commission_earned
FROM
    Employees e
    INNER JOIN Orders o ON e.employee_id = o.employee_id
    INNER JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE
    YEAR(o.order_date) = YEAR(CURRENT_DATE())
GROUP BY
    e.employee_id
ORDER BY
    total_commission_earned DESC
LIMIT
    5;

#===================================================================
# 7. Calculate the total revenue generated by the company in the current year, broken down by month.
##
SELECT
    MONTH(order_date) AS month,
    SUM(total_amount) AS revenue
FROM
    Orders
WHERE
    YEAR(order_date) = YEAR(NOW())
GROUP BY
    MONTH(order_date)
ORDER BY
    revenue DESC;

#===================================================================
# 8. Identify the top 5 customers who have spent the most money on a single order, along with the order details.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    oi.product_id,
    oi.quantity,
    oi.price_per_unit,
    oi.quantity * oi.price_per_unit AS total_price
FROM
    Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE
    oi.quantity * oi.price_per_unit = (
        SELECT
            MAX(quantity * price_per_unit)
        FROM
            Order_Items
        WHERE
            order_id = o.order_id
    )
ORDER BY
    total_price DESC
LIMIT
    5;

#===================================================================