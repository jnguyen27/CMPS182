/* Query 3 */

SELECT FirstUser.userID as FirstUser, SecondUser.userID as SecondUser
FROM ChirpFollowers FirstUser, ChirpFollowers SecondUser
WHERE FirstUser.followerID = SecondUser.userID
AND SecondUser.followerID = FirstUser.userID 
