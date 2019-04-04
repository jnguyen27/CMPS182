/* Query 5 */

SELECT DISTINCT cu.userID, cu.userName
FROM ChirpUsers cu, ChirpFollowers currentUser, ChirpFollowers userFollower, ChirpReads cr
WHERE currentUser.followerID = userFollower.userID
AND cr.posterID = userFollower.userID
AND cr.postReader = currentUser.userID
