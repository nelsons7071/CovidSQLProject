/* Continents with Highest Death Count compared to Population */

select location, SUM(cast(new_deaths as int)) as totalDeathCount
from coviddeaths 
/*where location like '%States%' */
where continent is null and total_deaths is not null and location not in ('World', 'European Union', 'International')
group by location
order by totalDeathCount desc