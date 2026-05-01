# 🛒 Olist E-Commerce Sales Analysis
### End-to-end data analysis project using SQL • Python • Power BI

![Python](https://img.shields.io/badge/Python-3.x-blue) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-blue) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow) ![Status](https://img.shields.io/badge/Status-Completed-green)

---

## 📌 Project Overview

Analysed **96,000+ real e-commerce orders** from the Brazilian Olist platform (2016–2018) to extract actionable business insights around revenue trends, product performance, customer geography, delivery efficiency, and payment behaviour.

---

## 🙋 My Role

- Performed data cleaning using Python (pandas)
- Wrote SQL queries to answer business questions
- Built Power BI dashboard with KPIs and filters
- Created business insights and recommendations.

---

## 🎯 Business Questions Answered

| # | Business Question |
|---|---|
| 1 | What is the monthly revenue trend? |
| 2 | Which product categories generate the most revenue? |
| 3 | Which states have the highest number of orders? |
| 4 | What is the average review score by category? |
| 5 | Which payment methods are most used? |
| 6 | What is the avg delivery time & which states have delays? |
| 7 | What % of customers are repeat buyers? |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python (pandas, numpy)** | Data cleaning, null handling, feature engineering |
| **PostgreSQL (pgAdmin)** | Business queries, aggregations, JOINs |
| **Power BI Desktop** | Interactive dashboard, DAX measures, KPI cards |
| **Jupyter Notebook** | Exploratory analysis |
| **GitHub** | Version control & portfolio |

---

## 📁 Project Structure

```
Olist_Ecommerce_Analysis/
│
├── data/
│   └── clean/                    ← Cleaned CSV files
│       ├── olist_master_clean.csv
│       ├── orders_clean.csv
│       ├── order_items_clean.csv
│       ├── customers_clean.csv
│       ├── products_clean.csv
│       ├── payments_clean.csv
│       └── reviews_clean.csv
│
├── notebooks/
│   └── olist_data_cleaning.ipynb ← Python cleaning notebook
│
├── sql/
│   └── olist_business_queries.sql ← All 7 SQL queries
│
├── dashboard/
│   └── olist_dashboard.pbix      ← Power BI dashboard file
│
├── report/
│   └── Olist_Business_Report.docx ← Full business report
│
└── README.md
```

---

## 📊 Dashboard Preview

> Power BI Dashboard with 5 KPI cards, 5 visuals, 2 slicers, and 5 key insights

**KPIs:**
- Total Revenue: R$ 17.95M
- Total Orders: 95K+
- Avg Order Value: R$ 188.14
- Avg Review Score: 4.10 ★
- Late Delivery Rate: 9.01%

---

## 🔍 Key Findings

- 📈 **137% revenue growth** from 2017 to 2018 — strong business scaling
- 🏆 **Health & Beauty** is the #1 revenue category (R$ 1.26M)
- 🌍 **São Paulo alone** contributes 43% of all orders — heavy geographic concentration
- 💳 **74% of payments** made by credit card — debit/voucher opportunity exists
- ⏱️ **9% late delivery rate** — 1 in 11 orders delayed, directly impacting review scores
- 🔁 **97% one-time buyers** — major customer retention opportunity

---

## 🧹 Data Cleaning Highlights

- Filtered 99,441 orders → 96,454 delivered orders
- Removed 981,148 duplicate geolocation rows
- Translated 74 Portuguese category names to English
- Engineered 3 new features: `delivery_days`, `is_late`, `purchase_yearmonth`
- Merged 6 tables into master CSV: **109,068 rows × 31 columns**

---

## 💼 Business Recommendations

1. **Expand Health & Beauty** — highest revenue, strong growth potential
2. **Target RJ, MG, RS states** — reduce over-dependency on São Paulo
3. **Improve northern state logistics** — highest late delivery rates
4. **Launch loyalty program** — convert 97% one-time buyers to repeat customers
5. **Investigate office furniture quality** — lowest review scores across categories

---

## 📂 Dataset

- **Source:** [Brazilian E-Commerce Dataset — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 9 CSV files, 100K+ real orders
- **Period:** October 2016 – August 2018

---

## 👩‍💻 Author

**Shubhangi Rajmane** — Data Analyst

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/shubhangirajmane)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/shubhangirajmane)
[![Email](https://img.shields.io/badge/Email-Contact-red)](mailto:shubhangibelkunde@gmail.com)
