-- insert missing countries from fighters_all into country table
INSERT INTO country (country_name)
SELECT a.country FROM country c RIGHT JOIN
(SELECT country
FROM fighters_all
GROUP BY country
ORDER BY country) a
ON a.country = c.country_name
WHERE c.country_name IS NULL;

-- Turn off safe update mode, delete data from fighter record, fight, and fighter in that order to satisfy foreign key constraints, then turn safe update back on
-- This is so that data can just be reinserted from fights_all and fighters_all using same statements as were used originally while preserving database structure
SET SQL_SAFE_UPDATES = 0;
DELETE FROM fighter_record;
DELETE FROM fight;
DELETE FROM fighter;
SET SQL_SAFE_UPDATES = 1;

UPDATE fighters_all
SET stance = 'Unknown'
WHERE stance IS NULL;

UPDATE fighters_all
SET country = 'Unknown'
WHERE country IS NULL;

UPDATE fighters_all
SET middle_name = 'NA'
WHERE middle_name IS NULL;

UPDATE fighters_all
SET surname = 'NA'
WHERE surname IS NULL;

UPDATE fighter
SET middle_name = 'NA'
WHERE middle_name IS NULL;

UPDATE fighter
SET surname = 'NA'
WHERE surname IS NULL;

-- Reinsert all fighters into fighter table
INSERT INTO fighter (first_name, last_name, middle_name, surname, stanceID, age_2022, height, reach, countryID) 
SELECT a.first_name, a.last_name, a.middle_name, a.surname, s.stanceID, a.age_2022, a.height, a.reach, c.countryID
FROM fighters_all a JOIN stance s ON a.stance = s.stance_name JOIN country c ON a.country = c.country_name;

-- Reinsert data from fighters_all into fighter_record table
INSERT INTO fighter_record (fighterID, wins, losses, draws, ko_rate) 
SELECT f.fighterID, a.wins, a.losses, a.draws, a.ko_rate
FROM fighters_all a JOIN fighter f ON a.first_name = f.first_name AND a.last_name = f.last_name AND a.middle_name = f.middle_name AND a.surname = f.surname
ORDER BY f.fighterID;

-- add op_winner column to fight table
ALTER TABLE fight
ADD op_winner VARCHAR(200);

-- Reinsert fights data into fight table
INSERT INTO fight (fighterID_op1, fighterID_op2, round, win_typeID, 
op_1_punch_power, op_2_punch_power, op_1_punch_resistance, op_2_punch_resistance, op_1_durability, op_2_durability,
op_1_round_KO_percentage, op_2_round_KO_percentage, op_1_been_KOed_percentage, op_2_been_KOed_percentage,
op_1_avg_weight, op_2_avg_weight, op_1_age_at_fight, op_2_age_at_fight, day, month, year, op1_rounds_boxed, op2_rounds_boxed, op_winner) 
SELECT f.fighterID, i.fighterID, a.round, w.win_typeID, a.opponent_1_estimated_punch_power, a.opponent_2_estimated_punch_power,
a.opponent_1_estimated_punch_resistance, a.opponent_2_estimated_punch_resistance, a.opponent_1_estimated_ability_to_take_punch,
a.opponent_2_estimated_ability_to_take_punch, a.opponent_1_round_ko_percentage, a.opponent_2_round_ko_percentage,
a.opponent_1_has_been_ko_percentage, a.opponent_2_has_been_ko_percentage, a.opponent_1_avg_weight, a.opponent_2_avg_weight,
(f.age_2022 - (2022-a.year)) as op1_age_at_fight, (i.age_2022 - (2022-a.year)) as op2_age_at_fight, a.day, a.month, a.year, a.opponent_1_rounds_boxed, a.opponent_2_rounds_boxed, a.winner
FROM fights_all a 
JOIN fighter f ON a.op1_first_name = f.first_name AND a.op1_last_name = f.last_name 
JOIN fighter i ON a.op2_first_name = i.first_name AND a.op2_last_name = i.last_name
JOIN win_type w ON w.win_type_name = a.decision
JOIN fights_all b ON b.MyUnknownColumn = a.MyUnknownColumn
ORDER BY f.fighterID;

-- update fighterID_winner column based on op_winner column
UPDATE fight
SET fighterID_winner = CASE
    WHEN op_winner = 'op_1' THEN fighterID_op1
    WHEN op_winner = 'op_2' THEN fighterID_op2
    ELSE NULL
END;

-- drop op_winner column from fight table
ALTER TABLE fight
DROP COLUMN op_winner;