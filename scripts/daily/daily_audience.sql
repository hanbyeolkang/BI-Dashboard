-- 일일 총 관객수

SELECT
  CAST(showrange AS VARCHAR) || ' (' || dayofweek_ko || ')' AS "날짜",
  SUM(totalaudicnt) AS "관객수"
FROM adhoc.daily_sum
GROUP BY
  CAST(showrange AS VARCHAR) || ' (' || dayofweek_ko || ')'
ORDER BY
  "관객수" DESC
LIMIT 10000