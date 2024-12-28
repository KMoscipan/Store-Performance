# Store Performance Across Regions

## Project Overview
This project focuses on analyzing retail sales performance at the store level across multiple regions. By leveraging SQL Server for data preparation and Tableau for visualization, I developed the "Store Performance Across Regions" dashboard. This interactive tool enables users to monitor key performance metrics, uncover sales patterns over time, and evaluate store performance through interactive visualizations.

### Watch the Dashboard in Action

https://github.com/user-attachments/assets/15465a64-caab-4218-9130-5fa9bc08d5e8

## Steps and Methodology

### 1. Data Sources and Schema
The data for this project was sourced from the [Contoso Database](https://www.microsoft.com/en-us/download/details.aspx?id=18279). Below is the schema diagram showing the key tables and relationships used:

![image](https://github.com/user-attachments/assets/a76a6898-ae13-4a8a-9e55-753da044b8b7)

### 2. Tools Used
- **SQL Server**: For data retrieval, cleaning, and preparation.
- **Tableau**: For designing the interactive dashboard.

### 3. Data Preparation and Quality Assurance
Before creating the dashboard, I conducted a thorough data preparation process:

- **Quality Checks**:
  - Checked for missing values, duplicates, and orphaned records using SQL queries.
  - Verified data ranges (e.g. ensuring SalesAmount was non-negative).
- **SQL Views**:
  - Created three SQL views to structure and join data from key tables, preparing it for use in Tableau.
- **Documentation**:
  - Detailed SQL scripts for quality checks ([data_quality_checks.sql](https://github.com/KMoscipan/Store-Performance/blob/main/data_quality_checks.sql)) and view creation ([tableau_data_views.sql](https://github.com/KMoscipan/Store-Performance/blob/main/tableau_data_views.sql)) are provided in the repository.

### 4. Tableau Data Model
The data in Tableau was organized with efficient relationships between tables, ensuring seamless creation of visualizations

<img width="338" alt="image" src="https://github.com/user-attachments/assets/b52fe0db-eb3a-4eb6-bf64-e150edc88ac1" />

### 5. Dashboard Development
The "Store Performance Across Regions" dashboard was designed with user-friendliness and functionality in mind.

#### Key Features and Functionalities

- **Filters**:  
  - Month, Year, City, and Country filters for dynamic analysis across different levels.

- **Custom Visualizations**:  
  - **Tree Map**: Highlights top product categories with LOD-based dynamic percentage calculations.  
  - **Lollipop Chart**: Displays top-performing stores based on sales.  
  - **Interactive Map**: Allows users to explore store performance dynamically across regions.

- **Dynamic Interactivity**:  
  - Parameter-driven actions update visualizations and metrics instantly.  
  - Tooltips provide additional data insights on hover.

- **Data Presentation**:  
  - Consistent formatting for currencies, percentages, and large numbers ensures clarity and readability.  
  - Dynamic titles update based on map selection (city or country).

## Final Dashboard
You can access the full interactive "Store Performance Across Regions" dashboard on [Tableau Public](https://public.tableau.com/app/profile/katarzyna.moscipan/viz/StorePerformanceAcrossRegions/Dashboard2_1):

![image](https://github.com/user-attachments/assets/387a4d2d-4c50-4858-8d5d-4ffa53f6db4c)

## Outcome
The "Store Performance Across Regions" dashboard delivers:

- Key metrics: Sales, Gross Margin %, Sales per Employee, Sales per Square Meter.
- Performance Insights: Top-performing stores and product categories by region.
- Period Analysis: Filters for month, year, and city to explore sales patterns within a defined timeframe.

## Future Scope
Potential enhancements include:
- Adding more dashboards for deeper retail performance insights.
- Introducing additional KPIs and advanced analytics.
- Expanding interactivity and implementing forecasting capabilities.
