/* Temp Table */ 

drop table if exists PercentPopulationVaccinated;

create table PercentPopulationVaccinated
(
continent varchar(255), 
location varchar(255), 
date date, 
population integer, 
new_vaccinations integer, 
rollingPeopleVaccinated float
);

insert into PercentPopulationVaccinated(
select d.continent, d.location, d.date, d.population, v.new_vaccinations as DailyNewVaccinations, 
SUM(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rollingVaccinations
from coviddeaths d 
join covidvaccinations v
	on d.location = v.location
	and d.date = v.date
where d.continent is not null /*and d.location like '%States' */
/*order by 2, 3*/
);


select *, (PercentPopulationVaccinated.RollingPeopleVaccinated/population) * 100 as PercentPopulationVaccinated 
from PercentPopulationVaccinated