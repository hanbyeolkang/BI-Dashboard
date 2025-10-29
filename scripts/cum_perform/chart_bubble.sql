SELECT
  movienm AS movienm,
  MAX(totaldays) AS "MAX(totaldays)",
  MAX(meanaud) AS "MAX(meanaud)",
  MAX(audiacc) AS "MAX(audiacc)"
FROM adhoc.cum_perform
WHERE
  (
    audiAcc > 100000
  )
GROUP BY
  movienm
LIMIT 1000