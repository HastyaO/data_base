CREATE TABLE if not exists genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	UNIQUE (name)
);

create table if not exists artist (
	artist_id serial primary key,
	name varchar(255) not null,
	UNIQUE (name)
);

create table if not exists genre_artist (
	genre_artist_id serial primary key,
	genre_id integer not null,
	artist_id integer not null,
	constraint fk_genre foreign key (genre_id) references genre(genre_id) on delete cascade,
	constraint fk_artist foreign key (artist_id) references artist(artist_id) on delete cascade
);

create table if not exists album(
	album_id serial primary key,
	name varchar(255) not null,
	release date not null CHECK(release >= '1994-12-31'), 
	UNIQUE(name)
);

create table if not exists artist_album (
	artist_album_id serial primary key,
	artist_id integer not null,
	album_id integer not null,
	constraint fk_artist foreign key (artist_id) references artist(artist_id) on delete cascade,
	constraint fk_album foreign key (album_id) references album(album_id) on delete cascade
);

create table if not exists song (
	song_id serial primary key,
	album_song_id integer not null references album(album_id),
	name varchar(255) not null,
	time integer not null,
	UNIQUE (name)
);

create table if not exists collection (
	collection_id serial primary key,
	name varchar(255) not null,
	release date not null CHECK (release >= '1994-12-31'),
	UNIQUE (name, release)
);

create table if not exists song_collection (
	song_collection_id serial primary key,
	song_id integer not null,
	collection_id integer not null,
	constraint fk_song foreign key (song_id) references song(song_id) on delete cascade,
	constraint fk_collection foreign key (collection_id) references collection(collection_id) on delete cascade
);

