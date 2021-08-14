/* Countries with Highest Death Count compared to Population */

select location, MAX(total_deaths) as totalDeathCount
from coviddeaths 
/*where location like '%States%' */
group by location
order by totalDeathCount desc