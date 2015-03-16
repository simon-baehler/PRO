CREATE TABLE user(
	id int(11) NOT NULL AUTO_INCREMENT,
	userName varchar (25) NOT NULL,
	passwd varchar (255) NOT NULL,
	eMail varchar (255) NOT NULL,
	admin boolean DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE TABLE type(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE music(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (100) NOT NULL,
	year DATE,
	type int (11) NOT NULL,
	`path` varchar(255) COLLATE utf8_unicode_ci,
	PRIMARY KEY (id),
	FOREIGN KEY (type) REFERENCES type(id)

);

CREATE TABLE playlist(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar (25) NOT NULL,
	public boolean DEFAULT 0,
	creator int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (creator) REFERENCES user(id)

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



CREATE TABLE userPlaylistFollow(
	id int(11) NOT NULL AUTO_INCREMENT,
	user_id int(11) NOT NULL,
	playlist_id int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

CREATE TABLE musicAlbum(
	id int (11) NOT NULL AUTO_INCREMENT,
	music int (11) NOT NULL,
	album int (11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (album) REFERENCES album(id)
);

CREATE TABLE musicArtist(
	id int (11) NOT NULL AUTO_INCREMENT,
	music int (11) NOT NULL,
	artist int (11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (artist) REFERENCES artist(id)
);

CREATE TABLE musicPlaylist(
	id int (11) NOT NULL AUTO_INCREMENT,
	music int (11) NOT NULL,
	playlist int (11) NOT NULL,
	adddate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (playlist) REFERENCES playlist(id)
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
	