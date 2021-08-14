/* CTE */ 
with PopvsVac (continenent, location, date, population, DailyNewVaccinations, rollingVaccinations)
as (

select d.continent, d.location, d.date, d.population, v.new_vaccinations as DailyNewVaccinations, 
SUM(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rollingVaccinations
from coviddeaths d 
join covidvaccinations v
	on d.location = v.location
	and d.date = v.date
where d.continent is not null /*and d.location like '%States' */
/*order by 2, 3*/
)

select *, (rollingVaccinations/population) * 100 as rollingPercentage 
from PopvsVac
where location like '%States'