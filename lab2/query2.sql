/* Query 2 */

SELECT cu.userName, cp.thePost
FROM ChirpPosts cp, ChirpUsers cu
WHERE cp.censored = 'false'
AND cu.active = 'true'
AND cu.income > 50000
