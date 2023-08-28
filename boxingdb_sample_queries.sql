/* 
Is there a relationship between fighter stats like height:reach ratio, 
knockout percentage, stance, country and a fighters' win rate? 
*/
SELECT r.ko_rate, s.stance_name, r.wins/(r.wins+r.losses+r.draws) AS win_rate, c.country_name, f.reach/(f.height*100) AS APE_index
FROM fighter f JOIN fighter_record r ON f.fighterID = r.fighterID JOIN country c ON f.countryID = c.countryID JOIN stance s ON f.stanceID = s.stanceID
WHERE r.wins > 10
ORDER BY r.ko_rate DESC;

-- Same question but input SELECT statement into MindsDB to train a model
SELECT r.ko_rate, s.stance_name, r.wins/(r.wins+r.losses+r.draws) AS win_rate, c.country_name, f.reach/(f.height*100) AS APE_index
FROM fighter f JOIN fighter_record r ON f.fighterID = r.fighterID JOIN country c ON f.countryID = c.countryID JOIN stance s ON f.stanceID = s.stanceID; 

-- try to improve model confidence by excluding super low or high ko rate
SELECT r.ko_rate, s.stance_name, r.wins/(r.wins+r.losses+r.draws) AS win_rate, c.country_name, f.reach/(f.height*100) AS APE_index
FROM fighter f JOIN fighter_record r ON f.fighterID = r.fighterID JOIN country c ON f.countryID = c.countryID JOIN stance s ON f.stanceID = s.stanceID
WHERE r.ko_rate != 0 AND r.ko_rate != 100; 



/*
What about knockout percentage and country (different boxing styles)
*/
SELECT AVG(r.ko_rate) AS average_ko_rate, SUM(r.wins) AS total_country_wins, c.country_name
FROM fighter f JOIN fighter_record r ON f.fighterID = r.fighterID JOIN country c ON f.countryID = c.countryID
GROUP BY c.country_name
ORDER BY AVG(r.ko_rate) DESC;

-- create model (don't have to aggregate by country to visualize here, still would have to check if this was correlated with number of wins or fights)
SELECT r.ko_rate, r.wins, r.losses, r.draws, c.country_name
FROM fighter f JOIN fighter_record r ON f.fighterID = r.fighterID JOIN country c ON f.countryID = c.countryID; 



/*
Do certain fighters have a tendency to win/lose by certain decisions, 
ie KO,TKO, unanimous decision, and in which round? How does this change based on opponent?
*/
SELECT CONCAT(f.first_name,' ', f.last_name) as fighter_name, t.win_type_name, w.num_of_wins, w.avg_round
FROM win_type t JOIN
(SELECT fighterID_winner, win_typeID, COUNT(win_typeID) as num_of_wins, AVG(round) as avg_round
FROM fight
GROUP BY fighterID_winner, win_typeID) w 
ON w.win_typeID = t.win_typeID JOIN fighter f ON w.fighterID_winner = f.fighterID
WHERE fighterID_winner IS NOT NULL
ORDER BY w.fighterID_winner;

SELECT CONCAT(i.first_name,' ', i.last_name) as fighter_name, t.win_type_name, f.round 
FROM fight f JOIN win_type t ON f.win_typeID = t.win_typeID
JOIN fighter i ON f.fighterID_winner = i.fighterID
WHERE f.fighterID_winner IS NOT NULL
ORDER BY f.fighterID_winner, t.win_type_name;



/*
How does weight difference, age, and record affect a bout decision
*/
SELECT (f.op_1_avg_weight - f.op_2_avg_weight) as weight_diff, 
(f.op_1_age_at_fight - f.op_2_age_at_fight) as age_diff, 
(f.op1_rounds_boxed - f.op2_rounds_boxed) as experience_diff,
(r1.wins - r2.wins) as win_diff,
CASE
        WHEN f.fighterID_winner = fighterID_op1 THEN 'op1'
        WHEN f.fighterID_winner = fighterID_op2 THEN 'op2'
        ELSE 'draw'
    END AS winner
FROM fight f JOIN fighter_record r1 ON f.fighterID_op1 = r1.fighterID 
JOIN fighter_record r2 ON f.fighterID_op2 = r2.fighterID
ORDER BY winner;

SELECT (f.op_1_avg_weight - f.op_2_avg_weight) as weight_diff, 
(f.op_1_age_at_fight - f.op_2_age_at_fight) as age_diff, 
(f.op1_rounds_boxed - f.op2_rounds_boxed) as experience_diff,
(r1.wins - r2.wins) as win_diff,
CASE
        WHEN f.fighterID_winner = fighterID_op1 THEN 'op1'
        WHEN f.fighterID_winner = fighterID_op2 THEN 'op2'
        ELSE 'draw'
    END AS winner
FROM fight f JOIN fighter_record r1 ON f.fighterID_op1 = r1.fighterID 
JOIN fighter_record r2 ON f.fighterID_op2 = r2.fighterID
ORDER BY winner;