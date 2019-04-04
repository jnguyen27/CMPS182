/* Create an index named LookUpPosts over the posterID and postDate columns (in that order) of the ChirpPosts table */

CREATE INDEX LookUpPosts ON ChirpPosts(posterID, postDate);
