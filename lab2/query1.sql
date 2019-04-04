/* Query 1 */

SELECT userName, joinDate 
FROM ChirpUsers
WHERE address LIKE '%West%'
ORDER BY joinDate
