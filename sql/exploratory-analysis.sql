/* 1. Dataset Overview */

SELECT COUNT(*) AS total_customers
FROM customer_churn;

SELECT
COUNT(*) FILTER (WHERE exited = TRUE) AS churned_customers,
COUNT(*) FILTER (WHERE exited = FALSE) AS retained_customers
FROM customer_churn;



/* =========================================
2. Overall Churn Rate
========================================= */

SELECT
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*), 2) 
AS churn_rate_percentage
FROM customer_churn;


/* =========================================
3. Churn by Geography
========================================= */

SELECT
geography,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY geography
ORDER BY churn_rate DESC;


/* =========================================
4. Churn by Gender
========================================= */

SELECT
gender,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate DESC;



/* =========================================
5. Churn by Age
========================================= */

SELECT
CASE
WHEN age < 30 THEN 'Under 30'
WHEN age BETWEEN 30 AND 39 THEN '30-39'
WHEN age BETWEEN 40 AND 49 THEN '40-49'
WHEN age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY age_group
ORDER BY churn_rate DESC;


/* =========================================
6. Churn by Credit Card Ownership
========================================= */

SELECT
has_cr_card,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY has_cr_card;


/* =========================================
7. Churn by Active Membership
========================================= */

SELECT
is_active_member,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY is_active_member;


/* =========================================
8. Churn by Number of Products
========================================= */
SELECT
num_of_products,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY num_of_products
ORDER BY num_of_products;


/* =========================================
9. Churn by Card Type
========================================= */

SELECT
card_type,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY card_type
ORDER BY churn_rate DESC;


/* =========================================
10. Churn by Complaint Status
========================================= */

SELECT
complain,
COUNT(*) AS customers,
SUM(CASE WHEN exited THEN 1 ELSE 0 END) AS churned,
ROUND(100.0 * SUM(CASE WHEN exited THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY complain;


/* =========================================
12. Top Churn Indicators
========================================= */
SELECT
geography,
gender,
card_type,
complain,
exited
FROM customer_churn
WHERE exited = TRUE;