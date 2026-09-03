/*
============================================================
Project: Bank Customer Churn Analysis
File: churn_metrics.sql
Purpose: Calculate customer churn KPIs and identify
         customer segments with high churn rates.
Database: PostgreSQL
Table: customer_churn
============================================================
*/


-- =========================================================
-- 1. OVERALL CUSTOMER METRICS
-- =========================================================

SELECT
    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = FALSE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS retention_rate_percentage

FROM customer_churn;


-- =========================================================
-- 2. CHURN DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN exited = TRUE THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,

    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) / NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS percentage_of_customers

FROM customer_churn

GROUP BY
    exited

ORDER BY
    customer_count DESC;


-- =========================================================
-- 3. CHURN BY GEOGRAPHY
-- =========================================================

SELECT
    geography,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    geography

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 4. CHURN BY GENDER
-- =========================================================

SELECT
    gender,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    gender

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 5. CHURN BY AGE GROUP
-- =========================================================

WITH customer_age_groups AS
(
    SELECT
        *,

        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65 and above'
        END AS age_group,

        CASE
            WHEN age < 25 THEN 1
            WHEN age BETWEEN 25 AND 34 THEN 2
            WHEN age BETWEEN 35 AND 44 THEN 3
            WHEN age BETWEEN 45 AND 54 THEN 4
            WHEN age BETWEEN 55 AND 64 THEN 5
            ELSE 6
        END AS age_group_order

    FROM customer_churn
)

SELECT
    age_group,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_age_groups

GROUP BY
    age_group,
    age_group_order

ORDER BY
    age_group_order;


-- =========================================================
-- 6. CHURN BY CARD TYPE
-- =========================================================

SELECT
    card_type,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    card_type

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 7. CHURN BY CUSTOMER COMPLAINT
-- =========================================================

SELECT
    CASE
        WHEN complain = TRUE THEN 'Complained'
        ELSE 'No Complaint'
    END AS complaint_status,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    complain

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 8. CHURN BY ACTIVE MEMBERSHIP STATUS
-- =========================================================

SELECT
    CASE
        WHEN is_active_member = TRUE THEN 'Active Member'
        ELSE 'Inactive Member'
    END AS membership_status,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    is_active_member

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 9. CHURN BY NUMBER OF PRODUCTS
-- =========================================================

SELECT
    num_of_products,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE exited = FALSE
    ) AS retained_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    num_of_products

ORDER BY
    num_of_products;


-- =========================================================
-- 10. CHURN BY CREDIT CARD OWNERSHIP
-- =========================================================

SELECT
    CASE
        WHEN has_cr_card = TRUE THEN 'Has Credit Card'
        ELSE 'No Credit Card'
    END AS credit_card_status,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    has_cr_card

ORDER BY
    churn_rate_percentage DESC;


-- =========================================================
-- 11. CHURN BY BALANCE RANGE
-- =========================================================

WITH customer_balance_groups AS
(
    SELECT
        *,

        CASE
            WHEN balance = 0 THEN 'Zero Balance'
            WHEN balance > 0 AND balance < 50000 THEN 'Below 50,000'
            WHEN balance >= 50000 AND balance < 100000 THEN '50,000-99,999'
            WHEN balance >= 100000 AND balance < 150000 THEN '100,000-149,999'
            WHEN balance >= 150000 AND balance < 200000 THEN '150,000-199,999'
            ELSE '200,000 and above'
        END AS balance_group,

        CASE
            WHEN balance = 0 THEN 1
            WHEN balance > 0 AND balance < 50000 THEN 2
            WHEN balance >= 50000 AND balance < 100000 THEN 3
            WHEN balance >= 100000 AND balance < 150000 THEN 4
            WHEN balance >= 150000 AND balance < 200000 THEN 5
            ELSE 6
        END AS balance_group_order

    FROM customer_churn
)

SELECT
    balance_group,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_balance_groups

GROUP BY
    balance_group,
    balance_group_order

ORDER BY
    balance_group_order;


-- =========================================================
-- 12. CHURN BY CREDIT SCORE RANGE
-- =========================================================

WITH credit_score_groups AS
(
    SELECT
        *,

        CASE
            WHEN credit_score < 500 THEN 'Below 500'
            WHEN credit_score BETWEEN 500 AND 599 THEN '500-599'
            WHEN credit_score BETWEEN 600 AND 699 THEN '600-699'
            WHEN credit_score BETWEEN 700 AND 799 THEN '700-799'
            ELSE '800 and above'
        END AS credit_score_group,

        CASE
            WHEN credit_score < 500 THEN 1
            WHEN credit_score BETWEEN 500 AND 599 THEN 2
            WHEN credit_score BETWEEN 600 AND 699 THEN 3
            WHEN credit_score BETWEEN 700 AND 799 THEN 4
            ELSE 5
        END AS credit_score_group_order

    FROM customer_churn
)

SELECT
    credit_score_group,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM credit_score_groups

GROUP BY
    credit_score_group,
    credit_score_group_order

ORDER BY
    credit_score_group_order;


-- =========================================================
-- 13. CHURN BY TENURE
-- =========================================================

SELECT
    tenure,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    tenure

ORDER BY
    tenure;


-- =========================================================
-- 14. AVERAGE CUSTOMER VALUES BY CHURN STATUS
-- =========================================================

SELECT
    CASE
        WHEN exited = TRUE THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,

    COUNT(*) AS total_customers,

    ROUND(AVG(age), 2) AS average_age,

    ROUND(AVG(credit_score), 2) AS average_credit_score,

    ROUND(AVG(balance), 2) AS average_balance,

    ROUND(AVG(estimated_salary), 2) AS average_estimated_salary,

    ROUND(AVG(tenure), 2) AS average_tenure,

    ROUND(AVG(num_of_products), 2) AS average_number_of_products

FROM customer_churn

GROUP BY
    exited

ORDER BY
    exited DESC;


-- =========================================================
-- 15. MULTIDIMENSIONAL CHURN SEGMENT ANALYSIS
-- =========================================================

SELECT
    geography,
    gender,
    card_type,

    CASE
        WHEN complain = TRUE THEN 'Complained'
        ELSE 'No Complaint'
    END AS complaint_status,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    geography,
    gender,
    card_type,
    complain

ORDER BY
    churn_rate_percentage DESC,
    total_customers DESC;


-- =========================================================
-- 16. HIGH-RISK CUSTOMER SEGMENTS
-- Only returns segments with at least 20 customers
-- to avoid highlighting very small groups.
-- =========================================================

SELECT
    geography,
    gender,
    card_type,

    CASE
        WHEN complain = TRUE THEN 'Complained'
        ELSE 'No Complaint'
    END AS complaint_status,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE exited = TRUE
    ) AS churned_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE exited = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_percentage

FROM customer_churn

GROUP BY
    geography,
    gender,
    card_type,
    complain

HAVING
    COUNT(*) >= 20

ORDER BY
    churn_rate_percentage DESC

LIMIT 20;