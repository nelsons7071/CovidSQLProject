/* Countries with Highest Infection Rate compared to Population */

select location, population, MAX(total_cases) as HighestInfectionCount, MAX(cast(total_cases as float))/cast(population as float) * 100 as percentPopulationInfected
from coviddeaths 
where total_cases is not null and population is not null
group by location, population 
order by PercentPopulationInfected desc