CREATE TABLE user(
	id int(11) NOT NULL AUTO_INCREMENT,
	userName varchar (255) NOT NULL UNIQUE,
	passwd varchar (255) NOT NULL,
	name varchar(255),
	subname varchar(255),
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

CREATE TABLE musicAlbum(
	music_id int (11) NOT NULL,
	album_id int (11) NOT NULL,
	PRIMARY KEY (music_id,album_id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE musicArtist(
	music_id int (11) NOT NULL,
	artist_id int (11) NOT NULL,
	PRIMARY KEY (music_id,artist_id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE musicPlaylist(
	id int (11) NOT NULL AUTO_INCREMENT,
	music_id int (11) NOT NULL,
	playlist_id int (11) NOT NULL,
	ordering int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music_id) REFERENCES music(id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

SELECT music.name,music.year,type.name,AR.name,album.name,musicplaylist.adddate FROM `playlist` 
	INNER JOIN musicplaylist ON playlist.id = musicplaylist.playlist 
    INNER JOIN music ON musicplaylist.music = music.id 
    INNER JOIN musicalbum ON music.id = musicalbum.music 
    INNER JOIN album ON album.id = musicalbum.album 
    INNER JOIN musicartist ON music.id = musicalbum.music 
    INNER JOIN artist AS AR ON musicartist.artist = AR.id 
    INNER JOIN type ON music.type = type.id
    INNER JOIN userplaylistfollow ON userplaylistfollow.playlist_id = playlist.id
    INNER JOIN user ON user.id = userplaylistfollow.user_id
	