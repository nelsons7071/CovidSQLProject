/* Creating a view to store data for later visualizations */

create view PercentPopulationVaccinated2 as 
select d.continent, d.location, d.date, d.population, v.new_vaccinations as DailyNewVaccinations, 
SUM(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rollingVaccinations
from coviddeaths d 
join covidvaccinations v
	on d.location = v.location
	and d.date = v.date
where d.continent is not null /*and d.location like '%States' */
/*order by 2, 3*/