# 📊 Organization's Financial Performance Intelligence 
> **An End-to-End SQL & Power BI Solution for Strategic Financial Auditing, Revenue Tracking, and Operational Optimization.**

---





## 1. Project Overview
In many corporate structures, financial data remains "dark"—stored in silos that make it difficult for leadership to see the bigger picture. This project addresses the **Organization's Financial** health by integrating fragmented transactional data into a unified, interactive intelligence suite.

The dashboard serves as a diagnostic tool to identify **profitability leakages**, track **budget adherence**, and monitor **departmental efficiency**. By leveraging SQL for backend processing, the solution ensures that the data is not only visually appealing but also mathematically rigorous and scalable for large datasets.

---

##  2.Data Architecture & SQL Pipeline
I architected and implemented a relational database from the ground up, incorporating a structured SQL-based ETL process to transform, cleanse, and optimize raw data prior to visualization in Power BI.I architected and implemented a relational database from the ground up, incorporating a structured SQL-based ETL process to transform, cleanse, and optimize raw data prior to visualization in Power BI.

### **Database Schema Design**
The data is organized into a **Star Schema** to optimize query performance and reporting flexibility:
* **Fact Table:** `Transactions`, `Revenue` (containing revenue, costs, and timestamps).
* **Dimension Tables:** `Account`, and `Customers`.

# 🏗️ Data Model Overview

The database follows a **star schema design**, separating measurable business events (fact tables) from descriptive attributes (dimension tables) to ensure efficient analytics in Power BI.

---

# 📂 Dimension Tables

## 📘 Customers
Stores customer demographic information for segmentation and behavioral analysis.

**Primary Key:** `customer_id`

| Column Name   | Description |
|--------------|------------|
| customer_id  | Unique customer identifier |
| customer_name| Customer full name |
| gender       | Customer gender |
| location     | Customer location |
| join_date    | Registration date |

---

## 📘 Accounts
Contains descriptive account information linked to customers.

**Primary Key:** `account_id`  
**Foreign Key:** `customer_id`

| Column Name  | Description |
|-------------|------------|
| account_id  | Unique account identifier |
| customer_id | Links to customer |
| account_type| Savings / Current / Fixed Deposit |
| Currency     | Different Currency notes |
| open_date   | Account opening date |
| status      | Account status |

---

# 📊 Fact Tables

## 💰 Transactions
Records all customer transaction activities.

**Primary Key:** `transaction_id`  
**Foreign Key:** `account_id`

| Column Name         | Description |
|--------------------|------------|
| transaction_id     | Unique transaction ID |
| account_id         | Linked account |
| transaction_date   | Date of transaction |
| transaction_type   | Deposit / Withdrawal |
| transaction_amount | Transaction value |
| transaction_status | Completed / Pending / Failed |

---

## 💵 Revenue
Captures revenue generated from account activities.

**Primary Key:** `revenue_id`  
**Foreign Key:** `account_id`

| Column Name    | Description |
|---------------|------------|
| revenue_id    | Unique revenue ID |
| account_id    | Linked account |
| revenue_date  | Date recorded |
| revenue_source| Revenue category |
| revenue_amount| Revenue value |

---

**Model Structure:**  
Customers → Accounts → Transactions / Revenue




### **SQL Transformation Logic**
I developed a series of SQL Views to clean and aggregate the **Organization's Financial** records. Key operations included:
* **Currency Normalization:** Standardizing global transactions into a single reporting currency.
* **Null Handling:** Ensuring that missing expense reports did not skew the Net Profit calculations.
* **Complex Joins:** Consolidating payroll, operational overhead, and gross sales into a single view.

```sql
/* Distribution analysis of completed transactions to assess deposit and withdrawal activity. */
SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) 
         FROM transactions 
         WHERE transaction_status = 'Completed'),
        2
    ) AS percentage
FROM transactions
WHERE transaction_status = 'Completed'
GROUP BY transaction_type;
```
##  3.Technical Stack
To ensure a scalable and high-performance environment, the following technologies were utilized:
* **SQL (PostgreSQL/SQL Server):** Primary engine for data storage, relational schema design, and complex server-side aggregations.
* **Power BI Desktop:** Used for advanced data modeling, DAX implementation, and interactive UI/UX design.
* **Power Query (M):** Utilized for the ETL (Extract, Transform, Load) layer, connecting SQL views to the reporting engine.
* **DAX:** Applied for sophisticated Time-Intelligence, Year-over-Year (YoY) growth, and dynamic margin calculations.

---

##  4.Key Performance Indicators (KPIs)
The dashboard tracks the four strategic pillars of the **Organization's Financial** stability:
1. **Gross Revenue:** Total top-line income generated across all business units.
2. **Net Profit Margin:** The ultimate health metric—revenue remaining after all operational and non-operational costs.
3. **OpEx Ratio:** Measuring operational efficiency by comparing expenses against total revenue.
4. **Budget Variance:** Analyzing the delta between the organization's actual performance and its projected financial targets.

---

##  5.Strategic Visualization & Insights

### **Organization's Financial Health Overview**
The dashboard provides a high-level executive summary with drill-down capabilities for granular analysis.

![Financial Overview](Organization's%20screenshot.png)

### **Key Strategic Insights:**
* **Margin Compression:** SQL-driven analysis identified that while revenue grew by 8%, profit margins shrunk by 2%, signaling that operational overhead is scaling faster than sales.
* **High-Cost Clusters:** By grouping data by department in SQL, we discovered that 50% of the budget variance is concentrated in just two departments, highlighting a need for a resource audit.

---

##  6.Advanced DAX & Business Logic
The following DAX logic was developed to provide the "Organization's Financial" team with dynamic time-intelligence:

```dax
/* Month-Over-Month (MoM) Revenue Growth Calculation*/
Revenue MoM Growth % = 
DIVIDE(
    [Total Revenue] - [Revenue Last Month],
    [Revenue Last Month]
)
```
##  7.Limitations & Future Enhancements
While this dashboard provides a robust strategic overview of the **Organization's Financial** status, the following technical and analytical boundaries exist:

* **Data Granularity:** The current model utilizes **Monthly Aggregations**. Transitioning to a daily refresh cycle would allow for more precise "Pulse Checks" on specific intra-month sales campaigns and short-term operational fluctuations.
* **Pipeline Automation:** The current workflow is semi-automated via SQL views. Future iterations aim to implement a **Live SQL Connection** through an On-premises Data Gateway to enable real-time financial reporting and eliminate manual refresh triggers.
* **Predictive AI:** Integrating **Power BI’s AI-powered visuals** (such as *Key Influencers* and *Time-Series Forecasting*) to predict the **Organization's Financial** position based on historical seasonality.



---

##  8.Conclusion
The **Organization's Financial** Intelligence project demonstrates that data-driven decision-making is only as strong as the architecture behind it. By using **SQL** to ensure data integrity and **Power BI** for executive storytelling, this dashboard provides a roadmap for sustainable growth. 

It shifts the organization from a **Reactive state** (responding to fiscal deficits after they occur) to a **Proactive strategy** (anticipating risks and optimizing for growth). Every financial move is now backed by a verified, scalable "Single Source of Truth."

---

##  9.How to Deploy
To replicate this environment or review the technical setup, follow these steps:

# Deployment Instructions

Follow these steps to set up the database and Power BI report in your local environment.

## 1. MySQL Setup
a. Navigate to the `/SQL_Scripts` folder in this repository.

b. Open your MySQL client (MySQL Workbench, phpMyAdmin, or terminal).

c. Execute the following SQL files in order:
   - `Schema_Setup.sql` – creates the database and tables.
   - `Views_Aggregation.sql` – creates views and aggregation queries.

## 2. Power BI Configuration
a. Download and open the `.pbix` file.

b. Go to **Transform Data > Data Source Settings**.

c. Click **Change Source** and provide your MySQL server credentials:
   - **Server:** `localhost` (or your MySQL host)
   - **Database:** name of the database created in Step 1
   - **User & Password:** your MySQL credentials
d. Confirm changes and close the dialog.

## 3. Data Refresh
- On the **Home** ribbon in Power BI, click **Refresh** to populate the visuals with data from your MySQL database.


---

### 👨‍💻 Technical Credits
**Developed by:** [Denzel Ayogu]  
**Technical Stack:** SQL (Backend Architecture) | Power BI (Visualization) | Power Query (ETL) | DAX (Business Logic)
