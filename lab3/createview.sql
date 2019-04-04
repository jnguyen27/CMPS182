/* Create a view named ManyFollowers. For each uesr in ChirpUsers, this view should provide userID and th enumber of followers that the user has. Don't count followers if their name is 'Voldemort' or 'Malfoy'. In your result, the second attribute should be called numberOfFollowers. But only include a tuple for a user if that user has at least 3 followers (who aren't named 'Voldemort' or 'Malfoy'). */

CREATE VIEW ManyFollowers AS
Select cu.userID, COUNT(*) AS numberOfFollowers
FROM ChirpUsers cu, ChirpUsers cu2, ChirpFollowers cf
WHERE cu.userID = cf.userID 
AND cf.followerID = cu2.userID
AND cu2.userName <> 'Voldemort'
AND cu2.userName <> 'Malfoy'
GROUP BY cu.userID
HAVING COUNT(*) > 2;
