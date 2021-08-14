/* Total Cases vs Population */

select location, date, population, total_cases, cast(total_cases as float)/cast(population as float) * 100 as percentageInfected
from coviddeaths 
/*where location like '%States%' */
order by 1, 2