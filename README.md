# Store Performance Across Regions

## Project Overview
This project analyzes retail sales performance at the store level across regions. Using SQL Server for data preparation and Tableau for visualization, I created the "Store Performance Across Regions" dashboard. The interactive dashboard enables stakeholders to monitor key metrics, identify trends, and explore store performance through intuitive visualizations.

## Steps and Methodology

### 1. Data Sources and Schema
The data for this project was sourced from the [Contoso Database](https://www.microsoft.com/en-us/download/details.aspx?id=18279). Below is the schema diagram showing the key tables and relationships used in this project:

![image](https://github.com/user-attachments/assets/a76a6898-ae13-4a8a-9e55-753da044b8b7)

### 2. Tools Used
- **SQL Server**: For data retrieval, cleaning, and preparation.
- **Tableau**: For designing the interactive dashboard.

### 3. Data Preparation and Quality Assurance
Before creating the dashboard, I conducted a thorough data preparation process:

- **Quality Checks**:
  - Checked for missing values, duplicates, and orphaned records using SQL queries.
  - Verified data ranges (e.g., ensuring SalesAmount was non-negative).
- **SQL Views**:
  - Created three SQL views to structure and join data from key tables, preparing it for use in Tableau.
- **Documentation**:
  - Detailed SQL scripts for quality checks (`quality_checks.sql`) and view creation (`views.sql`) are provided in the repository.

### 4. Tableau Data Model
I organized the data in Tableau, ensuring efficient relationships between tables and simplifying the creation of visualizations.

<img width="338" alt="image" src="https://github.com/user-attachments/assets/b52fe0db-eb3a-4eb6-bf64-e150edc88ac1" />

### 5. Dashboard Development
The "Store Performance Across Regions" dashboard was designed in Tableau to deliver a user-friendly experience with robust features.

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

### Final Dashboard
The "Store Performance Across Regions" dashboard can be accessed via [Tableau](https://public.tableau.com/app/profile/katarzyna.moscipan/viz/StorePerformanceAcrossRegions/Dashboard2):

<img width="799" alt="image" src="https://github.com/user-attachments/assets/c530e11d-1472-4865-8df9-2f1a91fc2ef8" />

## Outcome
The "Store Performance Across Regions" dashboard enables users to analyze performance metrics such as Sales, Gross Margin %, and Sales per Employee across multiple regions. With the ability to drill down into cities, users can assess store performance and top product categories within each country.

## Future Scope
The project can be expanded by:
- Adding more dashboards for deeper retail performance insights.
- Introducing additional KPIs and advanced analytics.
- Improving forecasting capabilities and interactivity.
