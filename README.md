# WALMART-SALES-DATA-ANALYSIS
Walmart Sales Analysis using Advanced SQL
Project Overview

This project focuses on analyzing Walmart sales data using Advanced SQL concepts to generate meaningful business insights.
The dataset contains transaction-level sales information including branch, city, product category, payment methods, ratings, profit margin, and revenue.

The main objective of this project is to solve real-world business problems using SQL queries and improve analytical thinking for data analyst roles.

Tools & Technologies Used
PostgreSQL
SQL
PgAdmin
SQL Concepts Used

This project demonstrates the use of advanced SQL techniques such as:

CTE (Common Table Expressions)
Window Functions
RANK()
PARTITION BY
JOIN Operations
Aggregate Functions
SUM()
AVG()
COUNT()
MIN()
MAX()
Date & Time Functions
CASE Statements
Grouping & Filtering
Database Schema

The dataset contains the following columns:

Column Name	Description
invoice_id	Unique transaction ID
branch	Store branch
city	Store city
category	Product category
unit_price	Price per unit
quantity	Number of items sold
sale_date	Date of sale
sale_time	Time of sale
payment_method	Payment type
rating	Customer rating
profit_margin	Profit percentage
total	Total transaction amount
Business Problems Solved
1. Payment Method Analysis
Identified different payment methods
Calculated total transactions and quantity sold
2. Highest Rated Category by Branch
Used Window Function (RANK())
Found top-rated category in each branch
3. Busiest Day in Each Branch
Analyzed transaction frequency by weekday
Identified peak business days
4. Quantity Sold by Payment Method
Compared item sales across payment methods
5. Category Rating Analysis by City
Calculated:
Average Rating
Minimum Rating
Maximum Rating
6. Profit Analysis by Category
Calculated total revenue and profit
Identified highest profit-generating categories
7. Most Preferred Payment Method by Branch
Used CTE + Window Function
Determined most commonly used payment method
8. Sales Shift Analysis
Categorized sales into:
Morning
Afternoon
Evening
Measured invoice count by shift
9. Revenue Decrease Ratio Analysis
Used:
CTE
JOIN
Compared 2022 vs 2023 revenue
Identified branches with highest revenue decline
Key Learnings

Through this project, I improved my understanding of:

Writing optimized SQL queries
Solving business problems using SQL
Data aggregation and analytical reporting
Using Window Functions for ranking and comparison
Implementing CTEs for complex query structuring
Revenue and profit analysis
