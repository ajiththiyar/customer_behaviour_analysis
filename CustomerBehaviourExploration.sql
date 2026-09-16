 
select * from customer;

EXEC sp_rename 'customer.[age-group]', 'age_group', 'COLUMN';



 -- Q1. What is the total revenue generated male vs female customers?

 SELECT gender, SUM(purchase_amount) AS revenue
 FROM customer
 GROUP BY gender;

 -- Q2. which customers used a discount but still spent more that the average purchase amount?

 SELECT customer_id, purchase_amount from customer
 WHERE discount_applied = 'Yes' 
 AND purchase_amount > (SELECT AVG(purchase_amount) FROM customer);

 -- Q3. which are the top 5 products with the highest average rating

 SELECT TOP 5 
 item_purchased, ROUND(AVG(review_rating), 2) AS avg_rating 
 FROM customer
 GROUP BY item_purchased
 ORDER BY AVG(review_rating) DESC;

 -- Q4. What is the average purchase amount between standard and express shipping customers?

 SELECT shipping_type, AVG(purchase_amount) AS avg_purchase
 FROM customer
 GROUP BY shipping_type
 HAVING shipping_type IN ('Standard', 'Express');

 -- Q5. Do subscribed customers spend more than non-subscribed customers

 SELECT subscription_status, 
 COUNT(customer_id) AS customer_count,
 AVG(purchase_amount) AS avg_purchase,
 SUM(purchase_amount) AS total_revenue
 FROM customer
 GROUP BY subscription_status
 ORDER BY total_revenue, avg_purchase DESC;

 -- Q6. Which 5 products have the highest percentage of purchases with the discount applied?

 SELECT TOP 5 item_purchased,
    ROUND((SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS discount_percentage
 FROM customer
 GROUP BY item_purchased
 ORDER BY discount_percentage DESC;

 -- Q7. Segments customers into New, Returning, and Loyal 
 -- based on their purchase history and show the count for each segment.
with customer_type as (
    SELECT customer_id, previous_purchases,
    CASE
        WHEN previous_purchases = 1 THEN 'New'
        WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_type
    FROM customer
)

SELECT customer_type, COUNT(customer_id) AS customer_count
FROM customer_type
GROUP BY customer_type
ORDER BY customer_count DESC;

-- Q8. What are the top 3 most purchased items in each category?

WITH item_counts AS (
    SELECT category, item_purchased, COUNT(customer_id) AS purchase_count,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS rank
    FROM customer
    GROUP BY category, item_purchased
)

SELECT rank, category, item_purchased, purchase_count
FROM item_counts
WHERE rank <= 3
ORDER BY category, rank;

-- Q9. Are customers who are repeat buyers likely to subscribe?

SELECT subscription_status,
    COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status

-- Q10. What is the revenue contribution of each age group

SELECT age_group,
    SUM(purchase_amount) AS total_revenue,
    COUNT(customer_id) AS customer_count,
    ROUND(CAST((SUM(purchase_amount) * 100.0) / (SELECT SUM(purchase_amount) 
    FROM customer) AS DECIMAL(10,2)), 2) AS revenue_percentage
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;


-- Q11. What are the top 5 products bought by each age group with their revenue?
WITH ranked_puchases AS (
    SELECT age_group,
        item_purchased,
        COUNT(item_purchased) AS purchase_count,
        SUM(purchase_amount) AS total_revenue,
        ROW_NUMBER() OVER 
        (PARTITION BY age_group ORDER BY COUNT(item_purchased) DESC) AS rank
    FROM customer
    GROUP BY age_group, item_purchased
)

SELECT age_group, item_purchased, purchase_count, total_revenue, rank
FROM ranked_puchases
WHERE rank <= 5