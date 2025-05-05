# Azure Synapse Data Warehousing Project

## Goal

The primary goal of this project is to understand key concepts of **Data Warehousing** and apply them using **Azure Synapse Analytics**. This end-to-end project involves:

- **Ingesting** data via pipelines  
- **Transforming** data using low-code **Data Flows**  
- **Modeling** data into **Fact** and **Dimension** tables using SQL  
- **Storing** the processed data for further analytics and reporting

---

## Project Workflow

### 1. **Extract**  
Data was sourced from **Azure Data Lake** and ingested into a **Bronze container** using pipelines created in **Azure Synapse Analytics**.

![Extract](https://github.com/user-attachments/assets/a3af7d7c-1cac-4ec6-8c59-2a0a8151ef8f)

---

### 2. **Transform**  
The ingested data was processed using the **Data Flow** feature in Synapse. This low-code interface enabled efficient data cleansing, joining, and transformation. The transformed data was stored in the **Silver container**.

![Transform 1](https://github.com/user-attachments/assets/1cb5029d-dd04-42cd-a0cc-92a11c72b90b)  
![Transform 2](https://github.com/user-attachments/assets/88bd8851-2c6e-411c-894a-ff86cd11baa2)

---

### 3. **Load & Model**  
Using **SQL queries** and the **External Table** feature in Synapse Analytics, the data was structured into **Fact** and **Dimension** tables. The final modeled data was stored in **Azure Storage** for use in dashboards and reporting tools.

![Load & Model](https://github.com/user-attachments/assets/ea1bdecf-2d96-4099-9729-4c5aa673cc13)

---

## Key Azure Services Used

- **Azure Synapse Analytics**
- **Azure Data Lake Storage**
- **Synapse Pipelines**
- **Synapse Data Flows**
- **Azure SQL Pools**

---

## Summary

This project demonstrates a full **Data Warehousing pipeline** built on Azure's modern data stack. It covers the essential phases of **ETL (Extract, Transform, Load)** and showcases how **Synapse Analytics** can be leveraged for scalable, efficient data processing and modeling.
