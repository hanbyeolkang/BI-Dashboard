-- 일일 총 매출액

SELECT
  EXTRACT(DAY FROM showrange) AS "날짜",
  CAST(dayofweek_order AS VARCHAR) || '.' || dayofweek_ko AS "요일",
  max(totalsalesamt) AS "매출액" 
FROM adhoc.daily_sum
GROUP BY EXTRACT(DAY FROM showrange), CAST(dayofweek_order AS VARCHAR) || '.' || dayofweek_ko
ORDER BY "매출액" DESC
LIMIT 10000;