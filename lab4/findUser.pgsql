CREATE OR REPLACE FUNCTION findUser (givenID integer)
RETURNS char(30) AS
$$

DECLARE
	result char(30);
	
BEGIN
	SELECT userName INTO result FROM ChirpUsers WHERE userID = givenID;
	RETURN result;
END; $$
LANGUAGE plpgsql

