SELECT
  movienm AS movienm,
  MAX(salesacc) AS "MAX(salesacc)"
FROM adhoc.cum_perform
GROUP BY
  movienm
ORDER BY
  "MAX(salesacc)" DESC
LIMIT 15