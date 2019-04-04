DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

ALTER ROLE duminguy SET SEARCH_PATH to Lab2;

/* For ChirpUsers(userID, userPassword, userName, joinDate, address, education, income, spouseID, active)
   Primary keys: userID */
CREATE TABLE ChirpUsers(
    userID INTEGER PRIMARY KEY,
    userPassword CHAR(8) NOT NULL,
    userName VARCHAR(30) NOT NULL,
    joinDate DATE,
    address VARCHAR(30),
    education CHAR(1),
    income DECIMAL(10, 2),
    spouseID INTEGER,
    active BOOLEAN,
    UNIQUE(userName, spouseID, joinDate, address)
);

/* For ChirpPosts(posterID, postNum, thePost, censored, postDate)
   Primary keys: posterID, postNum */
CREATE TABLE ChirpPosts(
    posterID INTEGER,
    postNum INTEGER,
    thePost VARCHAR(44) NOT NULL,
    censored BOOLEAN,
    postDate DATE,
    PRIMARY KEY(posterID, postNum)
);

/* For ChirpFollowers(userID, followerID, followStartDate)
   Primary keys: userID, followerID */
CREATE TABLE ChirpFollowers(
    userID INTEGER,
    followerID INTEGER,
    followStartDate DATE,
    PRIMARY KEY(userID, followerID)
);

/* For ChirpReads(posterID, postNum, postReader, timesRead, latestReadDate)
   Primary keys: posterID, postNum, postReader */
CREATE TABLE ChirpReads(
    posterID INTEGER,
    postNum INTEGER,
    postReader INTEGER,
    timesRead INTEGER,
    latestReadDate DATE,
    PRIMARY KEY(posterID, postNum, postReader)
);
