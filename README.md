# 📊 Data Warehouse & Data Analytics

## 📌 Project Overview

This project implements a complete SQL-based data warehousing pipeline, transforming transactional data (OLTP) into an analytical data warehouse (OLAP) optimized for structured reporting and large-scale aggregation.

The system demonstrates how raw operational data can be converted into meaningful analytical outputs using SQL alone — a critical capability in trading, commodity markets, and financial reporting environments.

---

## 🏗️ System Architecture

**OLTP Database → ETL (SQL Transformations) → OLAP Data Warehouse → Analytical Queries**

---

### 1️⃣ OLTP Layer – Transactional System

* Fully normalized relational schema
* Designed for transactional integrity and efficient data storage
* Uses primary and foreign key constraints
* Simulates structured operational records

This layer represents raw trade or operational data before analytical transformation.

---

### 2️⃣ ETL Layer – SQL-Based Transformation

The ETL process is implemented entirely using SQL scripts.

Processes include:

* Extracting structured transactional data
* Cleaning and validating records
* Transforming and aggregating numerical fields
* Generating surrogate keys
* Populating fact and dimension tables

All transformations are handled within SQL without external tools.

---

### 3️⃣ OLAP Layer – Dimensional Warehouse

* Star schema implementation
* Central fact table containing measurable metrics
* Supporting dimension tables for descriptive attributes
* Optimized for analytical queries and aggregation

This structure significantly improves query efficiency for reporting and analysis.

---

## 📊 Analytical Capabilities (SQL)

Using advanced SQL queries, the warehouse supports:

* Aggregation across time periods (daily, monthly, yearly)
* SUM, AVG, COUNT analysis
* Group-by segmentation
* Revenue and performance metrics
* Ranking and comparative analysis
* Trend identification via time dimensions

Example analytical queries include:

* Total volume by period
* Average price by category
* Performance breakdown by dimension
* Time-based metric comparison

---

## ⚙️ Technologies Used

* SQL
* Relational Database Design
* Dimensional Modeling (Star Schema)
* ETL via SQL Scripting

---

## 📈 Key Skills Demonstrated

* Data Warehousing Architecture
* OLTP to OLAP Transformation
* SQL-Based ETL Development
* Large Dataset Aggregation
* Dimensional Modeling
* Analytical Query Optimization
* Structured Reporting
* Data Integrity Management

---