![image](https://github.com/user-attachments/assets/10f1ef3e-b0e2-4f9c-bce4-ed567bf3d722)# Store Performance Across Regions

## Project Overview
This project analyzes retail sales performance at the store level across regions. Using SQL Server for data preparation and Tableau for visualization, I created the "Store Performance Across Regions" dashboard. The interactive dashboard enables stakeholders to monitor key metrics, identify trends, and explore store performance through intuitive visualizations.

## Steps and Methodology

### 1. Data Sources and Schema
The data for this project was sourced from the [Contoso Database](https://www.microsoft.com/en-us/download/details.aspx?id=18279). Below is the schema diagram showing the key tables and relationships used in this project:

![image](https://github.com/user-attachments/assets/6a804ae0-fa57-4e51-a59a-7346617687ca)

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

![image](https://github.com/user-attachments/assets/438138d6-5cc1-46e7-b893-4584fa790f5b)


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
Below is the final version of the "Store Performance Across Regions" dashboard:

(image)

## Outcome
The "Store Performance Across Regions" dashboard enables users to analyze performance metrics such as Sales, Gross Margin %, and Sales per Employee across multiple regions. With the ability to drill down into cities, users can assess store performance and top product categories within each country.

## Future Scope
The project can be expanded by:
- Adding more dashboards for deeper retail performance insights.
- Introducing additional KPIs and advanced analytics.
- Improving forecasting capabilities and interactivity.
