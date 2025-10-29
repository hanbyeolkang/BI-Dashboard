SELECT
  days_after_release AS "개봉 후 일자",
  SUM(day_ratio) AS "관객 수 동원 비율"
FROM analytics.daily_avg_audience_ratio
GROUP BY
  days_after_release
ORDER BY
  "관객 수 동원 비율" DESC
LIMIT 10000