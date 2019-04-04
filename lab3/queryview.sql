/* For users that have many followers, output the user's userID, the date of the user's earliest post, the date of that user's latest post, and that user's numberOfFollowers (as it appears in ManyFollowers). The attributes in your result should be called userID, earliestPostDate, latestPostDate and numberOfFollowers. */

SELECT cu.userID AS userID, MIN(cp.postDate) AS earliestPostDate, MAX(cp.postDate) AS latestPostDate, COUNT(m) AS numberOfFollowers
FROM ManyFollowers m, ChirpPosts cp, ChirpUsers cu
WHERE m.userID = cu.userID
AND m.userID = cp.posterID
GROUP BY cu.userID;

/* 120|105|08/12/2017 */
DELETE FROM ChirpFollowers
WHERE userID = 120
AND followerID = 105;

/* 103|111|04/12/2017 */
DELETE FROM ChirpFollowers
WHERE userID = 103
AND followerID = 111;

SELECT cu.userID AS userID, MIN(cp.postDate) AS earliestPostDate, MAX(cp.postDate) AS latestPostDate, COUNT(m) AS numberOfFollowers
FROM ManyFollowers m, ChirpPosts cp, ChirpUsers cu
WHERE m.userID = cu.userID
AND m.userID = cp.posterID
GROUP BY cu.userID;

/* Before deleting two tuples */

/*
  userid | earliestpostdate | latestpostdate | numberoffollowers 
--------+------------------+----------------+-------------------
    120 | 2016-03-07       | 2016-09-20     |                 4
    119 | 2016-08-07       | 2017-03-29     |                 4
    122 | 2016-05-18       | 2017-12-13     |                 5
    114 | 2016-01-25       | 2017-06-18     |                 4
    126 | 2016-03-18       | 2017-02-23     |                 3
    104 | 2017-02-04       | 2017-02-04     |                 1
    103 | 2016-12-24       | 2017-11-20     |                 3
    115 | 2016-02-11       | 2017-04-04     |                 4
    123 | 2016-06-05       | 2017-08-02     |                 4
    111 | 2016-12-13       | 2017-12-18     |                 4
    105 | 2016-07-14       | 2017-12-27     |                 5
    107 | 2016-08-12       | 2017-12-09     |                 4
    108 | 2017-12-24       | 2017-12-24     |                 1
(13 rows)

*/

/* After deleting two tuples */

/*

 userid | earliestpostdate | latestpostdate | numberoffollowers 
--------+------------------+----------------+-------------------
    120 | 2016-03-07       | 2016-09-20     |                 4
    119 | 2016-08-07       | 2017-03-29     |                 4
    122 | 2016-05-18       | 2017-12-13     |                 5
    114 | 2016-01-25       | 2017-06-18     |                 4
    126 | 2016-03-18       | 2017-02-23     |                 3
    104 | 2017-02-04       | 2017-02-04     |                 1
    115 | 2016-02-11       | 2017-04-04     |                 4
    123 | 2016-06-05       | 2017-08-02     |                 4
    111 | 2016-12-13       | 2017-12-18     |                 4
    105 | 2016-07-14       | 2017-12-27     |                 5
    107 | 2016-08-12       | 2017-12-09     |                 4
    108 | 2017-12-24       | 2017-12-24     |                 1
(12 rows)

*/
