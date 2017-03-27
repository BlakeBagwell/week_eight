select name from restaurant order by distance;

select name from restaurant order by distance limit 2;

select name from restaurant order by stars desc limit 2;

select 
	* 
from 
	restaurant 
where 
	distance < 2 
order by 
	stars desc 
limit 2;

select count(*) from restaurant;

select category, count(category) as Num_of_restaurants from restaurant group by category;

select 
	category,
	avg(stars) as average_stars
from 
	restaurant 
group by 
	category;


select 
	category, max(stars) 
from 
	restaurant 
group by 
	category;