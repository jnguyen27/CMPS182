/* For  each of the foreign key constraints specified in section 2.3, write one unit test:
	- An INSERT command that violates the foreign key constraint (and elicits an error) */

INSERT INTO ChirpPosts VALUES (130, 521, 'with longing, Oh, would', False, '03/29/2017');
INSERT INTO ChirpFollowers VALUES (130, 103, '11/11/2016');
INSERT INTO ChirpFollowers VALUES (104, 130, '11/11/2016');

/* Also, for each of the 3 general constraints, write 2 unit tests:
	-An UPDATE command that meets the constraint.
	-An UPDATE command that violates the constraint (and elcits an error). */

/* In ChirpReads, timesRead must be positive */

UPDATE ChirpReads
SET timesRead = 3
WHERE posterID = 106;

Update ChirpReads
SET timesRead = -5
WHERE posterID = 106;

/* In ChirpUsers, userID and spouseID must not be the same */

UPDATE ChirpUsers
SET spouseID = 125
WHERE userID = 116;

UPDATE ChirpUsers
SET spouseID = 116
WHERE userID = 116;

/* In ChirpUsers, if joinDate is NULL, then active must also be NULL */

UPDATE ChirpUsers
SET joinDate = NULL, active = NULL
WHERE joinDate = '11/1/15' AND active = False;

UPDATE ChirpUsers
SET joinDate = NULL, active = False
WHERE joinDate = '11/1/15' AND active = False;
