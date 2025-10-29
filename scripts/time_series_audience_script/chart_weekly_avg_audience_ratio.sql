SELECT
  open_week AS "개봉 후 주차",
  SUM(avg_audience_ratio) AS "관객 수 동원 비율"
FROM analytics.weekly_avg_audience_ratio
GROUP BY
  open_week
ORDER BY
  SUM(open_week) ASC
LIMIT 10000