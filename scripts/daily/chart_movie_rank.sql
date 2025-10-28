-- 영화별 랭킹

SELECT
  EXTRACT(DAY FROM showrange) AS "날짜",
  movienm AS movienm,
  AVG(reverse_rank) AS "순위(역)"
FROM adhoc.daily_rank
GROUP BY
  EXTRACT(DAY FROM showrange),
  movienm
ORDER BY
  "순위(역)" DESC
LIMIT 10000