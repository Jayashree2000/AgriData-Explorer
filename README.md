## 🌾 AgriData Explorer — Indian Agriculture Analytics Platform

AgriData Explorer is a data-driven analysis and visualization solution built using Python, SQL & Power BI to explore state-wise and district-wise crop production, area under cultivation, and yield trends across India.
It enables researchers, policymakers, and agricultural planners to identify trends, gaps, opportunities, and performance patterns in Indian agriculture.

## 🧩 Features

**✔️ Insight Dashboard**

Visual analytics for multi-crop production & yield

Trend, comparison & correlation-based statistical charts

Region-wise (state & district) data drill-down

Supports bar, line, map, scatter & pie chart analysis

**✔️ Data Exploration & EDA**

Exploratory Data Analysis using Python

Year-wise, state-wise & crop-wise breakdown

Multi-crop performance comparison (Rice, Wheat, Sugarcane, Millet, Oilseeds, Cotton, etc.)

**✔️ SQL-Driven Insights**

Analytical SQL queries provided to solve real-world agricultural questions

Year-wise, location-wise & crop-wise aggregation

Production growth & yield comparisons

**✔️ Power BI Dashboard**

Interactive visualization & filtering

KPI-based decision intelligence

Dynamic slicers for crop, region & year

## ⚙️ Tech Stack

| Layer       | Technology                                   |
| ----------- | -------------------------------------------- |
| Data Tools  | Python (Pandas, Plotly, Matplotlib, Seaborn) |
| Database    | MySQL / CSV                                  |
| Analysis    | Jupyter Notebook                             |
| BI & Report | Power BI                                     |

## 🧱 System Architecture
           ┌────────────────────────────────┐
           │        Data Sources            │
           │   (ICRISAT / Govt Datasets)    │
           └─────────────────┬──────────────┘
                             │
                             ▼
           ┌────────────────────────────────┐
           │   Data Cleaning & Processing   │
           │   (Python + Pandas Preprocessing)
           └─────────────────┬──────────────┘
                             │
                             ▼
           ┌────────────────────────────────┐
           │     Analysis Engine & SQL      │
           │   (EDA, Correlation, Insights) │
           └─────────────────┬──────────────┘
                             │
                             ▼
           ┌────────────────────────────────┐
           │ Visualization Layer            │
           │  (Power BI + Python Charts)    │
           └────────────────────────────────┘
