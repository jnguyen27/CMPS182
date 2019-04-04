/* Query 4 */

/* Bill's userID = 112 */

/* IDs that read Bill's posts: 102, 103, 104, 106, 116, 117, 119, 120, 121, 122, 124, 126 */

/* Result of below: 104 (check), 126 (check), 121 (check), 102 (check), 106 (check), 120 (check), 116 (check), 122 (check), 124 (check), 103 (check), 117 (check), 119 (check) */

SELECT DISTINCT u.userName, u.address
FROM ChirpUsers u, ChirpUsers bill, ChirpReads r, ChirpPosts p
WHERE bill.userName LIKE '%Bill%'
AND r.posterID = bill.userID
AND r.postReader = u.userID 
