/* The posterId field in ChirpPosts should reference the userID primary key in ChirpUsers */ 

ALTER TABLE ChirpPosts
ADD CONSTRAINT fk_posterid
FOREIGN KEY (posterID) REFERENCES ChirpUsers(userID);

/* The userID field in ChirpFollowers should reference the userID primary key in ChirpUsers */

ALTER TABLE ChirpFollowers
ADD CONSTRAINT fk_userid
FOREIGN KEY (userID) REFERENCES ChirpUsers(userID);

/* The followerID field in ChirpFollowers should reference the userID primary key in ChirpUsers */

ALTER TABLE ChirpFollowers
ADD CONSTRAINT fk_followerid
FOREIGN KEY (followerID) REFERENCES ChirpUsers(userID);
