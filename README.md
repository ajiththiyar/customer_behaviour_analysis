# 🛍️ Customer Shopping Behavior Analysis

**Role:** Business Analyst
**Tools:** Python (Pandas) · Docker · Azure SQL Edge · SQL · Tableau

An end-to-end analytics project that transforms 3,900 raw retail transactions into actionable business recommendations — from data cleaning in Python, through structured SQL analysis on a containerized Azure SQL Edge instance, to an interactive Tableau dashboard.
<img width="2752" height="1536" alt="Strategic_Retail_Growth_Analysis_Infographic" src="https://github.com/user-attachments/assets/ec27a9c7-fec9-435f-8c92-3ca24b23b8dc" />

---

## 📌 Situation

A retail dataset of **3,900 customer transactions** (18 columns) was sitting unused — raw, unstandardized, and with missing values — containing rich signals on demographics, purchase history, subscriptions, and shopping behavior. Leadership needed clear, data-backed answers on **who was spending, what was driving revenue, and where discount and subscription strategy could be improved.**

## 🎯 Task

Turn the raw dataset into a decision-ready analysis by:
- Cleaning and standardizing the data for reliable analysis
- Answering 11 targeted business questions using SQL
- Visualizing findings in an interactive dashboard
- Translating insights into concrete business recommendations

## ⚙️ Action

- **Cleaned & prepped the data in Python** — handled missing values, standardized columns, and engineered new features (`age_group`, `purchase_frequency_days`) using Pandas
- **Loaded the cleaned data into Azure SQL Edge**, running in a Docker container, to enable structured SQL analysis
- **Answered 11 key business questions in SQL** — covering revenue by gender/age, discount behavior, top products, shipping type, customer segmentation, and subscription trends
- **Built an interactive Tableau dashboard** to visualize the findings and present them in a stakeholder-friendly format
[Dashboard](https://public.tableau.com/app/profile/ajith.attikkachalil/viz/Customer_Behaviour_Analysis_17895298538150/Dashboard1)

## 📈 Business Recommendation

The analysis surfaced clear, actionable patterns in customer segments, product performance, and subscription behavior, translating into the following recommendations:

- **Boost Subscriptions** — Promote exclusive subscriber benefits; target young adults with discounts on bags and clothing, and senior customers with jewelry-focused offers
- **Review Discount Policy** — Rebalance the discount strategy to grow sales without eroding profit margins
- **Improve Product Positioning** — Feature top-rated and best-selling products more prominently in marketing to lift visibility and conversion
- **Implement Targeted Marketing** — Prioritize high-revenue age groups and express-shipping customers, who show stronger purchasing behavior

---

## 🧰 Tech Stack
`Python` `Pandas` `Docker` `Azure SQL Edge` `T-SQL` `Tableau`

## 📂 Project Workflow
```
Raw Data (CSV) → Python (Clean & Feature Engineer) → Azure SQL Edge (Docker) → SQL Analysis → Tableau Dashboard → Business Recommendations
```
