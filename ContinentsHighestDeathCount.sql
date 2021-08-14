/* Continents with Highest Death Count compared to Population */

select location, MAX(cast(total_deaths as int)) as totalDeathCount
from coviddeaths 
/*where location like '%States%' */
where continent is null and total_deaths is not null
group by location
order by totalDeathCount desc