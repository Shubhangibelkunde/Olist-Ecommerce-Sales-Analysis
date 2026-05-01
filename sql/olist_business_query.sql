-- QUERY 1: Monthly Revenue Trend
-- Business Question: What is the monthly revenue trend?

SELECT
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS year_month,
    TO_CHAR(o.order_purchase_timestamp, 'Mon-YYYY') AS month_name,
    COUNT(DISTINCT o.order_id)                      AS total_orders,
    ROUND(SUM(p.payment_value)::NUMERIC, 2)         AS total_revenue,
    ROUND(AVG(p.payment_value)::NUMERIC, 2)         AS avg_order_value
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM'),
    TO_CHAR(o.order_purchase_timestamp, 'Mon-YYYY')
ORDER BY year_month;

-- QUERY 2: Top 10 Product Categories by Revenue
-- Business Question: Which product categories generate the most revenue?

SELECT
    p.product_category_name_english     AS category,
    COUNT(DISTINCT oi.order_id)         AS total_orders,
    ROUND(SUM(oi.price)::NUMERIC, 2)    AS total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2)    AS avg_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_category_name_english IS NOT NULL
GROUP BY p.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- QUERY 3: Orders by State
-- Business Question: Which states have the highest number of orders?

SELECT
    c.customer_state                        AS state,
    COUNT(DISTINCT o.order_id)              AS total_orders,
    ROUND(SUM(p.payment_value)::NUMERIC, 2) AS total_revenue,
    ROUND(AVG(p.payment_value)::NUMERIC, 2) AS avg_order_value
FROM orders o
JOIN customers c   ON o.customer_id  = c.customer_id
JOIN payments p    ON o.order_id     = p.order_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- QUERY 4: Average Review Score by Category
-- Business Question: What is the average review score by category?

SELECT
    p.product_category_name_english         AS category,
    COUNT(r.review_id)                      AS total_reviews,
    ROUND(AVG(r.review_score)::NUMERIC, 2)  AS avg_review_score,
    SUM(CASE WHEN r.review_score >= 4 THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) AS negative_reviews
FROM reviews r
JOIN orders o      ON r.order_id    = o.order_id
JOIN order_items oi ON o.order_id  = oi.order_id
JOIN products p    ON oi.product_id = p.product_id
WHERE p.product_category_name_english IS NOT NULL
GROUP BY p.product_category_name_english
ORDER BY avg_review_score DESC
LIMIT 10;

-- QUERY 5: Payment Method Analysis
-- Business Question: Which payment methods are most used?

SELECT
    payment_type,
    COUNT(*)                                        AS total_transactions,
    ROUND(SUM(payment_value)::NUMERIC, 2)           AS total_revenue,
    ROUND(AVG(payment_value)::NUMERIC, 2)           AS avg_payment,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
    2)                                              AS percentage
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- QUERY 6: Delivery Time Analysis
-- Business Question: What is avg delivery time & which states have delays?

 SELECT
    c.customer_state                                        AS state,
    COUNT(o.order_id)                                       AS total_orders,
    ROUND(AVG(o.delivery_days)::NUMERIC, 1)                 AS avg_delivery_days,
    SUM(o.is_late)                                          AS late_orders,
    ROUND(
        SUM(o.is_late) * 100.0 / COUNT(o.order_id),
    2)                                                      AS late_delivery_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.delivery_days IS NOT NULL
GROUP BY c.customer_state
ORDER BY late_delivery_pct DESC;

-- QUERY 7: Repeat Customer Analysis
-- Business Question: What % of customers are repeat buyers?

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),
customer_segments AS (
    SELECT
        customer_unique_id,
        order_count,
        CASE
            WHEN order_count = 1 THEN 'One-time buyer'
            WHEN order_count = 2 THEN 'Returning buyer'
            ELSE 'Loyal buyer (3+ orders)'
        END AS customer_type
    FROM customer_orders
)
SELECT
    customer_type,
    COUNT(*)                                            AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
    2)                                                  AS percentage
FROM customer_segments
GROUP BY customer_type
ORDER BY total_customers DESC;

-- Full Summary Dashboard View
SELECT
    COUNT(DISTINCT o.order_id)                          AS total_orders,
    COUNT(DISTINCT c.customer_unique_id)                AS unique_customers,
    ROUND(SUM(p.payment_value)::NUMERIC, 2)             AS total_revenue,
    ROUND(AVG(p.payment_value)::NUMERIC, 2)             AS avg_order_value,
    ROUND(AVG(r.review_score)::NUMERIC, 2)              AS avg_review_score,
    ROUND(
        SUM(o.is_late) * 100.0 / COUNT(o.order_id),
    2)                                                  AS late_delivery_pct
FROM orders o
JOIN customers c   ON o.customer_id  = c.customer_id
JOIN payments p    ON o.order_id     = p.order_id
JOIN reviews r     ON o.order_id     = r.order_id;
 
