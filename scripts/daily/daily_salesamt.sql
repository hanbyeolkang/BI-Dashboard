-- 일일 총 매출액

SELECT
  CAST(showrange AS VARCHAR) || ' (' || dayofweek_ko || ')' AS "날짜",
  SUM(totalsalesamt) AS "매출액"
FROM adhoc.daily_sum
GROUP BY
  CAST(showrange AS VARCHAR) || ' (' || dayofweek_ko || ')'
ORDER BY
  "매출액" DESC
LIMIT 10000