CREATE OR REPLACE FUNCTION purgeBadFunction (censorLimit integer)
RETURNS integer AS
$$

DECLARE
    result integer;

BEGIN
    SELECT COUNT(cu.userID) INTO result
    FROM ChirpUsers cu, ChirpPosts cp
    WHERE cu.userID = cp.posterID
    AND cp.censored = true
    GROUP BY cu.userID
    HAVING COUNT(cp.censored) > censorLimit;

    RETURN RESULT;
END;$$
LANGUAGE plpgsql
