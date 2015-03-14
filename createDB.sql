CREATE TABLE user(
	id int(11) NOT NULL,
	userName varchar (25) NOT NULL,
	passwd varchar (255) NOT NULL,
	eMail varchar (255) NOT NULL,
	admin boolean DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE TABLE type(
	id int(11) NOT NULL,
	name varchar (25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE music(
	id int(11) NOT NULL,
	name varchar (100) NOT NULL,
	year DATE,
	type int (11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (type) REFERENCES type(id)

);

CREATE TABLE playlist(
	id int(11) NOT NULL,
	name varchar (25) NOT NULL,
	public boolean DEFAULT 0,
	creator int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (creator) REFERENCES user(id)

);

CREATE TABLE artist(
	id int(11) NOT NULL,
	name varchar (100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE album(
	id int(11) NOT NULL,
	name varchar (100) NOT NULL,
	PRIMARY KEY (id)
);



CREATE TABLE userPlaylistFollow(
	id int(11) NOT NULL,
	user_id int(11) NOT NULL,
	playlist_id int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

CREATE TABLE musicAlbum(
	id int (11) NOT NULL,
	music int (11) NOT NULL,
	album int (11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (album) REFERENCES album(id)
);

CREATE TABLE musicArtist(
	id int (11) NOT NULL,
	music int (11) NOT NULL,
	artist int (11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (artist) REFERENCES artist(id)
);

CREATE TABLE musicPlaylist(
	id int (11) NOT NULL,
	music int (11) NOT NULL,
	playlist int (11) NOT NULL,
	adddate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (music) REFERENCES music(id),
	FOREIGN KEY (playlist) REFERENCES playlist(id)
);


