-- 일일 총 관객수

SELECT
  EXTRACT(DAY FROM showrange) AS "날짜",
  CAST(dayofweek_order AS VARCHAR) || '.' || dayofweek_ko AS "요일",
  MAX(totalaudicnt) AS "관객수"
FROM adhoc.daily_sum
GROUP BY
  EXTRACT(DAY FROM showrange),
  CAST(dayofweek_order AS VARCHAR) || '.' || dayofweek_ko
ORDER BY "관객수" DESC
LIMIT 10000