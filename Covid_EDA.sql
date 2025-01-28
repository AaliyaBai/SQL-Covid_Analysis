select * from dbo.CovidDeaths_staging;

-- BREAKING THINGS DOWN BY LOCATION

select location, date, total_cases, new_cases, total_deaths, population
from dbo.CovidDeaths_staging
order by 1,2;

--- checking total_cases vs total_death

Select Location, date, total_cases,total_deaths, 
	(total_deaths/total_cases)*100 as DeathPercentage
From dbo.CovidDeaths_staging
Where location like '%india%' 
order by 1,2;

---- checking total_cases vs population

Select Location, date, total_cases,population, 
	(total_cases/population)*100 as Covid_Population_Rate
From dbo.CovidDeaths_staging
Where location like '%india%' 
order by 1,2;

--- Countries with high rate of covid cases compared to population

select location, population, max(total_cases) as highest_covid_count, max((total_cases/population)*100) as Covid_Population_Rate
from dbo.CovidDeaths_staging
group by location, population
order by Covid_Population_Rate desc
;


-- Countries with Highest Death Count per Population

select location,  population, max(total_deaths)as Total_Death_Count
from dbo.CovidDeaths_staging
where continent != ''
group by location, population
order by Total_Death_Count desc
;

-- BREAKING THINGS DOWN BY CONTINENT
-- Showing contintents with the highest death count per population

select continent, max(total_deaths)as Total_Death_Count
from dbo.CovidDeaths_staging
where continent != ''
group by continent
order by Total_Death_Count desc
;

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(new_deaths ) as total_deaths, SUM(new_deaths )/SUM(new_cases)*100 as DeathPercentage
From dbo.CovidDeaths_staging
Where continent != '' and new_cases != '0'
order by 1,2;

--- COVID VACCINATION EDA

select *
from CovidVaccinations_staging ;

-- Total Population vs Vaccinations


select cd.location,cd.population, cv.new_vaccinations,
 sum(cv.new_vaccinations) over(partition by cd.location order by cd.date) as RollingPeopleVaccinated
from dbo.CovidVaccinations_staging cv
join dbo.CovidDeaths_staging cd 
on cd.location = cv.location 
and cd.date = cv.date
order by 1;

-- Shows Percentage of Population that has recieved at least one Covid Vaccine

with PopVsVacc as(
select cd.location,cd.population, cv.new_vaccinations,
 sum(cv.new_vaccinations) over(partition by cd.location order by cd.date) as RollingPeopleVaccinated
from dbo.CovidVaccinations_staging cv
join dbo.CovidDeaths_staging cd 
on cd.location = cv.location 
and cd.date = cv.date
)
select location, max(RollingPeopleVaccinated/population)*100 as '%_of_PopulationVaccinated'
from PopVsVacc
group by location
order by 1;

---- Creating views for visualisation

create view Perentage_of_Population_Vaccinated as
with PopVsVacc as(
select cd.location,cd.population, cv.new_vaccinations,
 sum(cv.new_vaccinations) over(partition by cd.location order by cd.date) as RollingPeopleVaccinated
from dbo.CovidVaccinations_staging cv
join dbo.CovidDeaths_staging cd 
on cd.location = cv.location 
and cd.date = cv.date
)
select location, max(RollingPeopleVaccinated/population)*100 as '%_of_PopulationVaccinated'
from PopVsVacc
group by location
;

create view GLOBAL_NUMBERS as


Select SUM(new_cases) as total_cases, SUM(new_deaths ) as total_deaths, SUM(new_deaths )/SUM(new_cases)*100 as DeathPercentage
From dbo.CovidDeaths_staging
Where continent != '' and new_cases != '0'
order by 1,2;
