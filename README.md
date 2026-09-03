# Customer Churn Analysis

## Overview

Customer churn remains one of the most significant challenges for financial institutions. Acquiring new customers typically costs more than retaining existing ones, making customer retention a critical business priority.

This project explores customer churn patterns using SQL-powered exploratory data analysis and an interactive Power BI dashboard. The objective is to identify the key characteristics of customers who are likely to leave, uncover the drivers of churn, and provide data-driven recommendations that can help improve customer retention strategies.

The solution demonstrates an end-to-end analytics workflow, from data ingestion and storage in PostgreSQL to business intelligence reporting in Power BI.

---

## Business Problem

Customer attrition directly impacts revenue, profitability, and long-term customer relationships. Understanding the factors that influence customer churn enables organizations to proactively engage at-risk customers before they leave.

### Objectives

- Calculate and monitor the overall customer churn rate.
- Identify customer segments with elevated churn risk.
- Analyze the influence of demographic, financial, and behavioral factors on customer attrition.
- Generate actionable insights to support customer retention efforts.
- Develop an interactive dashboard for stakeholder decision-making.

---

## Data Source

**Dataset:** Bank Customer Churn Dataset

**Source:** Kaggle

**Dataset Link:**  
[Bank Customer Churn Dataset](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn)

---

## Dataset Attributes

| Category | Attributes |
|-----------|-----------|
| Customer Information | Customer ID, Geography, Gender, Age |
| Account Information | Tenure, Balance, Number of Products |
| Financial Indicators | Credit Score, Estimated Salary |
| Customer Engagement | Active Membership Status, Credit Card Ownership |
| Customer Experience | Satisfaction Score, Complaint Status |
| Target Variable | Exited (Churn Status) |

---

## Solution Architecture

```text
Kaggle Dataset
       │
       ▼
Python ETL Pipeline
       │
       ▼
PostgreSQL Database
       │
       ▼
SQL Exploratory Data Analysis
       │
       ▼
Power BI Dashboard
       │
       ▼
Business Insights & Recommendations
```

---

## Technology Stack

| Technology | Purpose |
|------------|---------|
| Python | Data Extraction & Loading |
| PostgreSQL | Data Storage |
| SQL | Data Exploration & KPI Analysis |
| Power BI | Dashboard Development |
| GitHub | Documentation & Portfolio Showcase |

---

## Project Structure

```text
customer-churn-analysis/

├── data/
│   └── customer_churn.csv
│
├── sql/
│   ├── database_creation.sql
│   ├── exploratory_analysis.sql
│   └── churn_metrics.sql
│
│
├── dashboard/
│   └── Customer_Churn.pbix
│
├── images/
│   ├── overview.png
│   ├── demographics.png
│   ├── behavior.png
│
│
├── README.md

```

---

# Dashboard Pages

The Power BI dashboard consists of four analytical views designed to answer key business questions.

---

## 1. Overview

### Purpose

Provide an executive summary of customer churn performance.

### KPIs

- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate (%)
- Retention Rate (%)
- Average Customer Balance
- Average Customer Age

### Visuals

- Churned vs Retained Distribution
- Customer Distribution by Geography
- Customer Population Overview
- Executive Insights Panel

### Key Question

> How severe is customer churn across the customer base?

---

## 2. Demographics

### Purpose

Analyze customer characteristics and identify demographic groups with elevated churn risk.

### Visuals

- Churn by Gender
- Churn by Geography
- Churn Rate by Age Group
- Age Distribution by Churn Status
- Customer Segmentation Matrix

### Key Question

> Which customer demographics are most likely to leave?

---

## 3. Behavior

### Purpose

Understand how customer engagement, product adoption, and financial behavior influence churn.

### Visuals

- Churn by Active Membership Status
- Churn by Number of Products
- Churn by Credit Card Ownership
- Balance Distribution
- Credit Score Analysis
- Customer Detail Analysis

### Key Question

> Which behavioral factors contribute most to customer attrition?

---

## 4. Risk

### Purpose

Identify high-risk customer segments and provide strategic recommendations.

### Visuals

- Top High-Risk Customer Segments
- Churn Risk Heat Map
- Customer
