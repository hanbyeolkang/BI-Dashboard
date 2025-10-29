## 전일 대비 관객 수 bar chart ##
SELECT
  DATE_TRUNC('DAY', showrange) AS showrange,
  SUM(total_diff_from_prev) AS "전일 대비 관객 수"
FROM analytics.total_diff_from_prev
GROUP BY
  DATE_TRUNC('DAY', showrange)
ORDER BY
  "전일 대비 관객 수" DESC
LIMIT 10000

## 당일 관객 수 line chart ##
SELECT
  DATE_TRUNC('DAY', showrange) AS showrange,
  SUM(total_audience) AS "당일 관객 수"
FROM analytics.total_diff_from_prev
GROUP BY
  DATE_TRUNC('DAY', showrange)
ORDER BY
  "당일 관객 수" DESC
LIMIT 10000