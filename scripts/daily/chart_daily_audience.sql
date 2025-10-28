-- 일일 총 관객수

SELECT
  EXTRACT(DAY FROM showrange) AS "날짜",
  dayofweek_order AS dayofweek_order,
  dayofweek_ko AS dayofweek_ko,
  max(totalaudicnt) AS "관객수" 
FROM adhoc.daily_sum
GROUP BY EXTRACT(DAY FROM showrange), dayofweek_order, dayofweek_ko
ORDER BY "관객수" DESC
LIMIT 10000;