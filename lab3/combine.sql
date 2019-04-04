/* If there is already a tuple in ChirpReads that has the same primary key, then update ChirpReads, adding 1 to timesRead and setting latestReadDate to be the readDate in the NewReads tuple . (We're assuming that NewReads always have a later value for readDate.) */

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE ChirpReads
SET timesRead = timesRead+1, latestReadDate = NewReads.readDate
FROM NewReads;

/* If there isn't already a tuple in ChirpReads that has the same primary key, then insert a tuple into the ChirpReads table corresponding to that tuple in the NewReads table, with timesRead set to 1 and latestReadDate set to the readDate in the NewReads tuple */

INSERT INTO ChirpReads(posterID, postNum, postReader, timesRead, latestReadDate)
SELECT posterID, postNum, postReader, 1, NewReads.readDate
FROM NewReads
WHERE NOT EXISTS(
SELECT * FROM ChirpReads WHERE ChirpReads.posterID = NewReads.posterID); 
COMMIT;

/* If there is already a tuple in ChirpReads that has the same primary key, then update ChirpReads, adding 1 to timesRead and setting latestReadDate to be the readDate in the NewReads tuple . (We're assuming that NewReads always have a later value for readDate.) */

/* BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE ChirpReads
SET timesRead = timesRead+1, latestReadDate = NewReads.readDate
FROM NewReads; */
