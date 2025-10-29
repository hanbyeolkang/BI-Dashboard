SELECT
  date AS date,
  genre AS genre,
  SUM(total_audicnt) AS "SUM(total_audicnt)"
FROM adhoc.daily_genre
GROUP BY
  date,
  genre
ORDER BY
  "SUM(total_audicnt)" DESC
LIMIT 10000