
-- Naming the procedure
CREATE OR REPLACE PROCEDURE UPDATE_lEADERS_SCORE(IN in_School_ID INTEGER, IN in_Leaders_Score INTEGER)

LANGUAGE plpgsql AS 
$func$

BEGIN
	UPDATE chicago_public_schools
	SET leaders_score = in_Leaders_Score
	WHERE school_id = in_School_ID;

-- IF Statement to update the Leaders_Icon field

IF in_Leaders_Score > 0 AND in_Leaders_Score < 20 THEN
	UPDATE chicago_public_schools
	SET leaders_icon = 'Very_weak'
	WHERE school_id = in_School_ID;
	
	ELSIF in_Leaders_Score < 40 THEN
	UPDATE chicago_public_schools
	SET leaders_Icon = 'Weak'
	WHERE school_id = in_School_ID;
	
		
	ELSIF in_Leaders_Score < 60 THEN
	UPDATE chicago_public_schools
	SET leaders_Icon = 'Average'
	WHERE school_id = in_School_ID;
	
		
	ELSIF in_Leaders_Score < 80 THEN
	UPDATE chicago_public_schools
	SET leaders_Icon = 'Strong'
	WHERE school_id = in_School_ID;
	
		
	ELSIF in_Leaders_Score < 100 THEN
	UPDATE chicago_public_schools
	SET leaders_Icon = 'Very_strong'
	WHERE school_id = in_School_ID;
	
ELSE ROLLBACK;
END IF;
END
$func$;

	
	