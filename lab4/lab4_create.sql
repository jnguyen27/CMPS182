DROP SCHEMA Lab4 CASCADE;
CREATE SCHEMA Lab4;

ALTER ROLE duminguy SET SEARCH_PATH to Lab4;

CREATE TABLE ChirpUsers (
	userID INT,
	userPassword CHAR(8) NOT NULL,
	userName VARCHAR(30) NOT NULL UNIQUE,
	joinDate DATE,
	address VARCHAR(30),
	education CHAR(1),
	income DECIMAL(10,2),
	spouseID INT UNIQUE,
	active BOOLEAN,
	PRIMARY KEY(userID),
	UNIQUE(joinDate, address)
);

CREATE TABLE ChirpPosts (
	posterID INT,
	postNum INT,
	thePost VARCHAR(44) NOT NULL,
	censored BOOLEAN,
	postDate DATE,
	PRIMARY KEY(posterID, postNum)
);

CREATE TABLE ChirpFollowers (
	userID INT,
	followerID INT,
	followStartDate DATE,
	PRIMARY KEY(userID, followerID)
);

CREATE TABLE ChirpReads (
	posterID INT,
	postNum INT,
	postReader INT,
	timesRead INT,
	latestReadDate DATE,
	PRIMARY KEY(posterID, postNum, postReader)
);
