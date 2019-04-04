/* In ChirpReads, timesRead must be positive. Please give a name to this when you create it. We recommend that you use the name positive_reads, but you may use another name. (The other constraint don't need to have names.) */

ALTER TABLE ChirpReads ADD CONSTRAINT positive_reads CHECK(timesRead > 0);

/* In ChirpUsers, userID, and spouseID must not be the same. */

ALTER TABLE ChirpUsers ADD CHECK(userID <> spouseID);

/* In ChirpUsers, if joinDate is NULL, then active must also be NULL. */

ALTER TABLE ChirpUsers ADD CHECK((joinDate = NULL AND active = NULL) OR (joinDate <> NULL AND active <> NULL));
