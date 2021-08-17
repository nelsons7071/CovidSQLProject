/* Global Total Stats */

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(new_cases as float)) * 100 as worldWideDeathPercentage /*total_deaths, cast(total_deaths as float)/cast(total_cases as float) * 100 as DeathPercentage*/
from coviddeaths 
order by 1, 2