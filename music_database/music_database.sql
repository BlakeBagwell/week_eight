--1 What are tracks for a given album?

select
	song.name, album.name
from
	album
inner join
	track
on
	track.album_id = album.id

inner join
	song
on
	track.song_id = song.id

where
	album.id = 2;



--2 What are the albums produced by a given artist?

select
	*
from
	album, people
where
	album.people_id = people.id;


--3 What is the track with the longest duration?

select
	song.name, track.duration
from
	track
inner join
	song
on
	track.song_id = song.id
where
	track.duration = (
		select
			max(duration)
 		from track);

--4 What are the albums released in the 60s? 70s? 80s? 90s?

select
	album.name, album.year
from
	album
where
	album.year < 2000;

--5 How many albums did a given artist produce in the 90s?

select
	*
from
	people
inner join
	album
on
	album.people_id = people.id
where
	album.year > 1989 and album.year < 2000;


--6 What is each artist's latest album?

select
	max(album.year), people.name
from
	album
inner join
	people
on album.people_id = people.id
group by
	people.id;


--7 List all albums along with its total duration based on summing the duration of its tracks.

select
	sum(track.duration), album.name
from
	album
inner join
	track
on
	track.album_id = album.id
group by
	album.name;

--8 What is the album with the longest duration?


select
	*
from
	(select
		sum(track.duration) as album_duration, album.name
	from
		album
	inner join
		track
	on
		track.album_id = album.id
	group by
		album.name) as longest_album
order by
	album_duration desc
limit
	1;

--or

select
	sum(track.duration) as album_length, album.name
from album
inner join track
on track.album_id = album.id
group by album.id
order by album_length desc
limit 1;

--9 Who are the 5 most prolific artists based on the number of albums they have recorded?

select
	count(people.id), people.name	-- the idea is to look at albums and count how many times we see each people.id, that will yeild the amount of albums they have. Then we have to grou by people name, and show their count.
from
	album
inner join
	people on album.people_id = people.id
group by
	people.name
order by
	count desc
limit
	5;

--10 What are all the tracks a given artist has recorded?

select
	people.name, song.name
from
	people
inner join
	album on album.people_id = people.id
inner join
	track on track.album_id = album.id
inner join
	song on track.song_id = song.id
where
	people.id = 1;

--11 What are the top 5 most often recorded songs?

-- song, track, album

select
	count(song.id), song.name
from
	album
inner join
	track on track.album_id = album.id
inner join
	song on track.song_id = song.id
group by
	song.id
order by
	count(song.id) desc
limit
	5;

--12 Who are the top 5 song writers whose songs have been most often recorded?

-- so we need to look at songs, and count the songwriter ids and then group them by songwriter

select
	count(track.id), songwriter.name
from
	people as artist --simulated artist table
inner join
	album on album.people_id = artist.id
inner join
	track on track.album_id = album.id
inner join
	song on track.song_id = song.id
inner join
	people as songwriter on song.people_id = songwriter.id-- simulated songwriter table
group by
	songwriter.id
order by
	count desc
limit
	5;

--13 Who is the most prolific song writer based on the number of songs he has written?


select
	count(song.id), people.name
from
	people
inner join
	song on song.people_id = people.id
group by
	people.id
order by
	count desc
limit
	1;

-- 14 What songs has a given artist recorded?

select
	song.name
from
	people as artist --simulated artist table
inner join
	album on album.people_id = artist.id
inner join
	track on track.album_id = album.id
inner join
	song on track.song_id = song.id
inner join
	people as songwriter on song.people_id = songwriter.id-- simulated songwriter table
where artist.name = 'Pink Floyd'

;

--15 Who are the song writers whose songs a given artist has recorded?

-- a little explanation. The people table holds artists AND songwriters. However when we combine the people table and the album table. the inner join only puts together relevant data, meaning it will only pull the artists, since albums only have an artist id, the songwriter id at this point doesn't get included. But later when we inner join the song and people tables, songs have people ids that refer to their song writers, and no artists ids are included because no song has an artist id associated with it.

select
	artist.name as artist_name, songwriter.name as songwriter_name
from
	people as artist
inner join
	album on album.people_id = artist.id
inner join
	track on track.album_id = album.id
inner join
	song on track.song_id = song.id
inner join
	people as songwriter on song.people_id = songwriter.id
where
	artist.name = 'The Beatles';

--16 Who are the artists who have recorded a given song writer's songs?
