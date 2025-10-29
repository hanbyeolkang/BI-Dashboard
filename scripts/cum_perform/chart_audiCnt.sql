SELECT
  movienm AS movienm,
  MAX(audiacc) AS "MAX(audiacc)"
FROM adhoc.cum_perform
GROUP BY
  movienm
ORDER BY
  "MAX(audiacc)" DESC
LIMIT 15