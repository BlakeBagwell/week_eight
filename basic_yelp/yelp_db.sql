CREATE TABLE restaurant (
  id serial primary key,
  name varchar,
  address varchar,
  category varchar
);

CREATE TABLE reviewer (
  id serial primary key,
  name varchar,
  email varchar,
  karma integer,
  CHECK (karma >= 0 and karma <= 7)
);

CREATE TABLE review (
  id serial primary key,
  reviewer_id varchar REFERENCES reviewer (id),
  stars integer,
  CHECK (stars >= 0 and stars <= 5),
  title varchar,
  review_text varchar,
  restaurant_id integer REFERENCES restaurant (id)
);

--1 List all the reviews for a given restaurant given a specific restaurant ID.
select
	*
from
	review
where
	review.restaurant_id = 5;

--2 List all the reviews for a given restaurant, given a specific restaurant name.

select
	title, review_text, restaurant.name
from
	review, restaurant
where
	review.restaurant_id = restaurant.id and
	restaurant.name = 'The Optimist';

-- or

select
	title, review_text, restaurant.name
from
	review
inner join
	restaurant
on
	review.restaurant_id = restaurant.id
where
	restaurant.name = 'The Optimist';

--3 List all the reviews for a given reviewer, given a specific author name.

select
	review.review_text
from
	review
inner join
	reviewer
on
	review.reviewer_id = reviewer.id
where
	reviewer.name = 'Blake';

--4 List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.

select
	restaurant.name, review.review_text
from
	restaurant
inner join
	review
on
	review.restaurant_id = restaurant.id;

--5 Get the average stars by restaurant. The result should have the restaurant name and its average star rating.

select
	restaurant.name, avg(stars) as stars
from
	restaurant
inner join
	review
on
	review.restaurant_id = restaurant.id
group by
	restaurant.id;

--6 Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.

select
	restaurant.name, count(review) as num_reviews
from
	review
inner join
	restaurant
on
	review.restaurant_id = restaurant.id
group by
	restaurant.name;

--7 List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.

select
	restaurant.name, reviewer.name, review.review_text
from
	restaurant
inner join
	review
on
	review.restaurant_id = restaurant.id
inner join
	reviewer
on
	review.reviewer_id = reviewer.id;

--8 Get the average stars given by each reviewer. (reviewer name, average star rating)

select
	avg(stars) as stars, reviewer.name
from
	reviewer
inner join
	review
on
	review.reviewer_id = reviewer.id
group by
	reviewer.name;

--9 Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)

select
	min(stars) as stars, reviewer.name
from
	reviewer
inner join
	review
on
	review.reviewer_id = reviewer.id
group by
	reviewer.name;

--10 Get the number of restaurants in each category. (category name, restaurant count)
--11 Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
--12 Get the average star rating for a food category. (category name, average star rating)
