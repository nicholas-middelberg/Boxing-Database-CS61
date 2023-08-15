-- insert fighter countries into fighter table
INSERT INTO country (country_name)
SELECT country 
FROM fighters_all
GROUP BY country
ORDER BY country;

-- insert fighter stances into stance table
INSERT INTO stance (stance_name)
SELECT stance 
FROM fighters_all
GROUP BY stance
ORDER BY stance;

-- add middle_name and surname columns to fighter table
ALTER TABLE fighter
ADD middle_name VARCHAR(100),
ADD surname VARCHAR(100);

-- Insert data from fighters_all (imported cleaned csv) into fighter table
INSERT INTO fighter (first_name, last_name, middle_name, surname, stanceID, age_2022, height, reach, countryID) 
SELECT a.first_name, a.last_name, a.middle_name, a.surname, s.stanceID, a.age_2022, a.height, a.reach, c.countryID
FROM fighters_all a JOIN stance s ON a.stance = s.stance_name JOIN country c ON a.country = c.country_name;



-- Insert data from fighters_all (imported cleaned csv) into fighter_record table
INSERT INTO fighter_record (fighterID, wins, losses, draws, ko_rate) 
SELECT f.fighterID, a.wins, a.losses, a.draws, a.ko_rate
FROM fighters_all a JOIN fighter f ON a.first_name = f.first_name AND a.last_name = f.last_name
ORDER BY f.fighterID;

-- insert fight win types into win_type table
INSERT INTO win_type (win_type_name)
SELECT decision 
FROM fights_all
GROUP BY decision
ORDER BY decision;

-- add day, month and year columns to fight table
ALTER TABLE fight
ADD day INT,
ADD month VARCHAR(100),
ADD year INT;

-- drop date column from fight table
ALTER TABLE fight
DROP COLUMN date;

-- add op1_rounds_boxed and op2_rounds_boxed to fight table
ALTER TABLE fight
ADD op1_rounds_boxed INT,
ADD op2_rounds_boxed INT;

-- Insert data from fights_all (imported cleaned csv) into fight table
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
    ELSE fighterID_op2
END;

-- drop op_winner column from fight table
ALTER TABLE fight
DROP COLUMN op_winner;
