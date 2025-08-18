# 🛒 Sales & Revenue Analysis (Orders Dataset)

## 📖 Overview

This notebook (`orders_pandas+SQL.ipynb`) explores **sales performance, revenue trends, and growth metrics** across products, regions, categories, and sub-categories.
The analysis leverages **SQL queries + pandas** to uncover insights that can help optimize product strategy, pricing, and regional performance.

---

## 📂 Dataset

### Schema

| Column Name    | Description                          |
| -------------- | ------------------------------------ |
| `order_id`     | Unique identifier for each order     |
| `order_date`   | Date when the order was placed       |
| `region`       | Geographic region of the order       |
| `category`     | Product’s main category              |
| `sub_category` | Sub-division of the product category |
| `product_id`   | Unique identifier for each product   |
| `sales_price`  | Revenue generated from the sale      |

---

## ⚙️ Analysis Performed

### 1️⃣ Revenue Insights

* **Top 5 revenue-generating products** identified.
* **Top 10 products per region** based on revenue contribution.

### 2️⃣ Growth Analysis

* **Month-over-Month (MoM) revenue growth** compared for **2022 vs. 2023**.
* Growth % calculated using lag functions to measure sequential month performance.

### 3️⃣ Category-Level Trends

* For each **product category**, the **month with highest sales** was identified.
* Seasonal/category-level peaks are highlighted.

### 4️⃣ Sub-Category Growth

* Computed **sales growth for each sub-category** between **2022 and 2023**.
* Identified the **fastest-growing sub-category**.
* Growth percentages stored back in the dataset using `ALTER TABLE` and `UPDATE`.

---

## 📊 Key Business Questions Answered

* **Which products generate the highest revenue?**
* **What are the top-performing products in each region?**
* **How does revenue trend month-over-month in 2022 vs. 2023?**
* **For a given category, which month performs the best?**
* **Which sub-category grew the fastest year-over-year?**

---

## 🚀 Outcome

The analysis enables business teams to:

* Focus on **top-performing products and regions** to maximize revenue.
* Spot **seasonal/category-based demand spikes** for inventory planning.
* Track **growth trajectories of sub-categories** to identify future investment areas.
* Benchmark performance across **2022 vs. 2023** to evaluate growth strategies.

---

## 🛠️ How to Run

### Prerequisites

* Python 3.8+
* Jupyter Notebook or JupyterLab
* SQL engine (MySQL/PostgreSQL/SQLite)

### Libraries Used

```bash
pip install pandas numpy sqlalchemy matplotlib seaborn
```

### Steps

1. Load the dataset (`orders` table or CSV).
2. Run SQL queries directly (via SQL engine) or inside Python (via pandas + sqlalchemy).
3. Visualize results with charts for trends & comparisons.
4. (Optional) Extend the analysis with Power BI / Tableau dashboards.

---

## 🔮 Future Enhancements

* Build **forecasting models** to predict sales growth.
* Create **real-time dashboards** for product/category performance.
* Implement **customer segmentation** for deeper purchase behavior insights.

