CREATE TABLE user(
	id int(11) NOT NULL AUTO_INCREMENT,
	userName varchar (255) NOT NULL UNIQUE,
	passwd varchar (255) NOT NULL,
	name varchar(255),
	lastname varchar(255),
	admin boolean DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE TABLE music_type(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (255) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE music(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (100) NOT NULL,
	year_creation int,
	music_type int (11) NOT NULL,
	up_year int,
	up_weekint tinyint,
	uploaded_by int,
	PRIMARY KEY (id),
	FOREIGN KEY (uploaded_by) REFERENCES user(id),
	FOREIGN KEY (music_type) REFERENCES music_type(id)

);

CREATE TABLE playlist(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (25) NOT NULL,
	public boolean DEFAULT 0,
	owner_id int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (owner_id) REFERENCES user(id)

);

CREATE TABLE artist(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE album(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (100) NOT NULL,
	PRIMARY KEY (id)
);



CREATE TABLE user_playlist_follow(
	id int(11) NOT NULL AUTO_INCREMENT,
	user_id int(11) NOT NULL,
	playlist_id int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

CREATE TABLE music_Album(
	music_id int (11) NOT NULL,
	album_id int (11) NOT NULL,
	PRIMARY KEY (music_id,album_id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE music_Artist(
	music_id int (11) NOT NULL,
	artist_id int (11) NOT NULL,
	PRIMARY KEY (music_id,artist_id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE music_Playlist(
	id int (11) NOT NULL AUTO_INCREMENT,
	music_id int (11) NOT NULL,
	playlist_id int (11) NOT NULL,
	ordering int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

CREATE VIEW Playlist_user AS
SELECT distinct playlist.name AS 'playlist', music.name AS 'Title' ,music.year_creation, music_type.name AS ' Type',artist.name AS 'Artist' ,album.name AS 'Album' FROM `playlist` 
	INNER JOIN music_playlist 
    	ON playlist.id = music_playlist.playlist_id 
    INNER JOIN music 
    	ON music_playlist.music_id = music.id 
    INNER JOIN music_album 
    	ON music.id = music_album.music_id 
    INNER JOIN album 
    	ON album.id = music_album.album_id 
    INNER JOIN music_artist 
    	ON music.id = music_artist.music_id 
    INNER JOIN artist 
    	ON music_artist.artist_id = artist.id 
    INNER JOIN music_type 
    	ON music.music_type = music_type.id
    INNER JOIN user_playlist_follow 
    	ON playlist.id = user_playlist_follow.playlist_id