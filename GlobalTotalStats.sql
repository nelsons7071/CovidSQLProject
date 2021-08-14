/* Global Total Stats */

select SUM(new_cases) as newCases, SUM(new_deaths) as newDeaths, SUM(cast(new_deaths as float))/SUM(cast(new_cases as float)) * 100 as worldWideDeathPercentage /*total_deaths, cast(total_deaths as float)/cast(total_cases as float) * 100 as DeathPercentage*/
from coviddeaths 
order by 1, 2