--- creating staging table for CovidDeaths
select *
into CovidDeaths_staging
from CovidDeaths ;

SELECT *
FROM  Portfolio_Projects..CovidDeaths_staging;


select location, population, total_cases
from Portfolio_Projects..CovidDeaths_staging
WHERE population = '0' 
;

with duplicate_cte as
( select *,
row_number() over(partition by location, population, date, total_cases, 
		new_cases, iso_code, continent order by location) as row_num
from dbo.CovidDeaths_staging
)
select *
from duplicate_cte
where row_num > 0;

SELECT *
FROM  Portfolio_Projects..CovidDeaths_staging
where population = '0';

update  Portfolio_Projects..CovidDeaths_staging
set population = NULL
where population = '0';

SELECT *
FROM  Portfolio_Projects..CovidDeaths_staging
where location = 'international';

--- creating staging table for CovidVaccinations
select *
into CovidVaccinations_staging
from CovidVaccinations ;

