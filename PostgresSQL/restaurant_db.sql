CREATE TABLE restaurant (
  id serial primary key,
  name varchar,
  distance real,
  stars real,
  category varchar,
  favorite_dish varchar,
  does_takeout char(1),
  last_visit date
);

delete from restaurant;

insert into restaurant values
  (default, 'Ru Sans', .25, 2.5, 'sushi', 'Sake Nigiri', 'N', '2017-03-02');

insert into restaurant values
  (default, 'Naan Stop', .2, 3, 'Indian', 'Wrap', 'N', '2017-03-22');

insert into restaurant values
  (default, 'Fellinis', 3, 3.5, 'Pizza', 'Pepperoni', 'Y', '2017-03-25');

select name from restaurant where stars < 3.5;
select favorite_dish from restaurant where stars > 3;
select id from restaurant where name = 'Naan Stop';
select * from restaurant where category = 'Pizza';
select * from restaurant where does_takeout = 'Y';
select * from restaurant where does_takeout = 'Y' and category = 'Pizza';
select * from restaurant where distance < 1;
select * from restaurant where last_visit betweem '2016-03-20' and '2017-03-20' and stars > 3;
