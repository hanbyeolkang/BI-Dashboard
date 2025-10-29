SELECT
  movienm AS movienm,
  MAX(audiacc) AS "MAX(audiacc)"
FROM adhoc.target_audi_days
GROUP BY
  movienm
ORDER BY
  "MAX(audiacc)" DESC
LIMIT 10000;