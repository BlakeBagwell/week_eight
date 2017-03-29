--1 What are all projects that use HTML?

select
	*
from
	project, project_uses_tech, tech
where
	project_uses_tech.project_id = project.id and
	project_uses_tech.tech_id = tech.id and
	tech.name = 'HTML';

--2 What are all technologies used by the Personal Website?

select
	*
from
	project, project_uses_tech, tech
where

	project_uses_tech.project_id = project.id,
	project_uses_tech.tech_id = tech_id,
	project.name = 'Personal Website';

--3 Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?

select
	*
from
	tech
left outer join
	project_uses_tech on project_uses_tech.tech_id = tech.id
left outer join
	project on project_uses_tech.project_id = project.id
where
	project_uses_tech.tech_id is null;

select -- CORRECT! You don't need the second join, because you don't need any actual data from the project table. The one above worked but it has more than what is needed.
	*
from
	tech
left outer join
	project_uses_tech on project_uses_tech.tech_id = tech.id
where
	project_uses_tech.tech_id is null;

--4 Based on the previous query, get the count of the number of techs used by each project.

select
	project.name, count(project_uses_tech.tech_id)
from
	project
left outer join
	project_uses_tech on project_uses_tech.project_id = project.id
left outer join
	tech on project_uses_tech.tech_id = tech.id
group by
	project.id;

--5 Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?

select
	project.name, project_uses_tech.tech_id
from
	project
left outer join
	project_uses_tech on project_uses_tech.project_id = project.id
left outer join
	tech on project_uses_tech.tech_id = tech.id
where
	project_uses_tech.tech_id is null;

--6 Based on the previous query, get the count of the number of projects that use each tech.

select
	tech.name, count(project) --we want to dispaly the tech name and the project count for each
from
	tech --we start with the tech table,
left outer join
	project_uses_tech on project_uses_tech.tech_id = tech.id --connect it with the P-U-T table,
left outer join
	project on project_uses_tech.project_id = project.id --and finally connect it with the project table
group by
	tech.id; --then we group it by tech's unique ids

--7 List all projects along with each technology used by it. You will need to do a three-way join.

select
	project.name, tech.name;

--8 List all the distinct techs that are used by at least one project.

select
	distinct(tech.id), tech.name
from
	project
inner join
	project_uses_tech on project_uses_tech.project_id = project.id
inner join
	tech on project_uses_tech.tech_id = tech.id

	--we use inner join because we dont ant to include languages that aren't used in anything, meaning that the value in tech_id would be null. 
