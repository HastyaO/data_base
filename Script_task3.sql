--Количество исполнителей в каждом жанре

select g.name, count(ga.artist_id) as cnt from genre_artist ga
join genre g on ga.genre_id = g.genre_id 
group by g.name; 

--Количество треков, вошедших в альбомы 2019–2020 годов

select count(s.name)  from song s
left join album a on s.album_song_id = a.album_id
where a.release between  '2019-01-01' and  '2021-01-01'

--Средняя продолжительность треков по каждому альбому.

select a.name, avg(time) from song s 
left join album a on s.album_song_id = a.album_id
group by a.name 
order by avg(time);

--Все исполнители которые не выпустили альбомы в 2020 году
select a.name from artist a 
left join artist_album a2 on a.artist_id = a2.artist_album_id
left join album a3 on a2.artist_album_id = a3.album_id
where a.name not in (select a.name from artist_album where a3.release >= '2020.01.01' and a3.release < '2021.01.01')
order by a.name;

--Названия сборников, в которых присутствует конкретный исполнитель
select c.name from collection c 
left join song_collection sc on c.collection_id = sc.collection_id 
left join song s on sc.song_id = s.song_id 
left join album a on s.album_song_id = a.album_id 
left join artist_album aa on a.album_id = aa.album_id 
left join artist a2 on aa.artist_id = a2.artist_id 
where a2.name like '%J%';