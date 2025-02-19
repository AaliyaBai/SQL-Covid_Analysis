# SQL-Covid_Analysis
### COVID-19 Data Analysis using SQL

#### Project Overview

This project analyzes COVID-19 data, including cases, deaths, and vaccinations, using SQL. It involves data cleaning, exploratory data analysis (EDA), and creating views for visualization.

#### Technologies Used

SQL Server – Data querying and transformation

Power BI – Data visualization

 #### Dataset

CovidDeaths.csv: Contains COVID-19 case and death statistics.

CovidVaccinations.csv: Contains COVID-19 vaccination data.

#### Files and Their Purpose

##### 1. Covid_EDA.sql

Queries to analyze COVID-19 trends by location and date.

Calculates death percentages, infection rates, and high-risk areas.

Determines countries with the highest death counts.

##### 2. Covid_data_cleaning.sql

Creates staging tables for COVID-19 deaths and vaccinations.

Removes duplicate and invalid records.

Updates incorrect population values.

##### 3. CovidVaccinations_staging and CovidDeaths_staging

Temporary staging tables for structured data analysis.

##### 4. Views for Visualization

Perentage_of_Population_Vaccinated: Displays the percentage of vaccinated individuals per location.

GLOBAL_NUMBERS: Aggregates global COVID-19 statistics, including total cases, deaths, and death percentages.


![](https://raw.githubusercontent.com/AaliyaBai/SQL-Covid_Analysis/9af0faa70b86d816616db5280f146deb681578c6/Covid_Visualisation.png)

> Covid Data Analysis and Visualisation.

### Key SQL Queries and Insights

##### 1. COVID-19 Trends by Location

Extracts total cases, deaths, and population details.

Calculates the death rate and infection rate per country.

##### 2. Global Analysis

Aggregates worldwide COVID-19 cases and deaths.

Identifies continents with the highest death counts.

##### 3. Vaccination Analysis

Computes the rolling count of vaccinated individuals.

Determines the percentage of the population vaccinated.