
--p.s. все названия и связи сгенерированы с помощью нейронки, т.к. с фантазией плохо

INSERT INTO genre(name) VALUES
	('кантри'),
	('фолк'),
	('хип-хоп'),
	('R&B'),
	('поп'),
	('реп'),
	('рок');


INSERT INTO artist(name) VALUES
	('Johnny Cash'),
	('June Carter'),
	('Jay-Z'),
	('Beyoncé'),
	('Lady Gaga'),
	('Tony Bennett'),
	('Eminem'),
	('Rihanna'),
	('Rammstein');	


INSERT INTO album(name, release) VALUES
	('Everything Is Love', '2018-06-16'),
	('Cheek to Cheek', '2014-09-19'),
	('Herzeleid', '1995-05-05'),
	('Mutter', '2001-01-01'),
	('Reise, Reise', '2004-07-07');	
	

INSERT INTO song(album_song_id,name,time) VALUES
	(1,'Crazy in Love', 220),
	(6,'Love the Way You Lie', 198),
	(6,'The Monster', 245),
	(6,'Jackson', 180),
	(6,'It Aint Me Babe', 213),
	(2, 'Anything Goes', 192),
	(2,'I Cant Give You Anything But Love', 205),
	(3, 'Du Hast', 228),
	(4, 'Sonne', 250),
	(5, 'Ich will', 201);


INSERT INTO collection(name,release) VALUES
	('Закатные мелодии: Лучшее для расслабления', '2022-11-15'),
	('Городские ритмы: Современные хиты для городской жизни', '2023-04-10'),
	('Эмоциональная путешествия: Музыкальные истории для души', '2023-09-25'),
	('Танцевальная эйфория: Сборник для праздника', '2024-06-05'),
	('Музыка для приключений: Инструментальные композиции для вдохновения', '2024-12-20');

update album 
set name = 'Sehnsucht'
where album_id = 3


insert into artist_album(artist_id, album_id) values
	(3,1),
	(4,1),
	(5,2),
	(6,2),
	(7,3),
	(7,4);
	
insert into genre_artist(genre_id, artist_id) values
	(1,1),	
	(4,1),
	(5,1),
	(1,2),
	(2,2),
	(3,3),
	(4,3),
	(5,3),
	(6,3),
	(3,4),
	(4,4),
	(5,4),
	(7,4),
	(5,5),
	(1,5),
	(7,5),
	(5,6),
	(3,7),
	(5,7),
	(6,7),
	(7,7),
	(5,8),
	(4,8),
	(3,8),
	(7,9);

update collection 
set release = '2020-07-14'
where collection_id = 4

update collection 
set release = '2010-09-20'
where collection_id = 5
	
insert into song_collection(song_id, collection_id) values
	(3,1),
	(8,1),
	(5,1),
	(2,1),
	(10,1),
	(10,2),
	(4,2),
	(7,2),
	(1,2),
	(6,3),
	(9,3),
	(2,3),
	(5,3),
	(1,3),
	(1,4),
	(7,4),
	(4,4),
	(9,4),
	(8,5),
	(3,5),
	(6,5),
	(10,5);
	
INSERT INTO album(name, release) values
	('unknown', '2000-01-01');
	
INSERT INTO song(album_song_id,name, time) values
	(6, 'You Are My Sunshine', 250);
	
INSERT INTO artist(name) values
	('Многожанровый Мелодист'),
	('Гармонийный Вариатор');
	
insert into genre_artist(genre_id, artist_id) values
	(1,10),
	(2,10),
	(3,10),
	(4,10),
	(5,10),
	(6,10),
	(7,10),
	(1,11),
	(2,11),
	(3,11),
	(4,11),
	(5,11),
	(6,11),
	(7,11);

insert into album(name, release) values
	('Rammstein','2019-05-17');


insert into song(album_song_id,name, time) values
	(7,'Deutschland', 300),
	(7,'Ausländer',240);
	
	
	
	