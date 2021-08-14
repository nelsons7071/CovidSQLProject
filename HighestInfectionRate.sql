/* Countries with Highest Infection Rate compared to Population */

select location, population, MAX(total_cases) as total_cases, MAX(cast(total_cases as float)/cast(population as float)) * 100 as percentPopulationInfected
from coviddeaths 
/*where location like '%States%' */
group by location, population
order by percentPopulationInfected desc