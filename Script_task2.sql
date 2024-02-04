--Название и продолжительность самого длительного трека
select (name, time) from song 
WHERE time >= (SELECT max(time) FROM song);

--Название треков, продолжительность которых не менее 3,5 минут
select (name) from song 
WHERE time >= 210; 

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name from collection 
WHERE release between  '2018-12-31' and  '2020-12-31'

--Исполнители, чьё имя состоит из одного слова
select name from artist 
WHERE name not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name from song 
WHERE name like '%мой%' or name like '%my%';
