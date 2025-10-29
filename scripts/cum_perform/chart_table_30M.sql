SELECT
  movienm AS movienm,
  opendt AS opendt,
  showrange AS showrange,
  dayafteropen AS dayafteropen,
  audiacc AS audiacc
FROM adhoc.target_audi_days
ORDER BY
  dayafteropen ASC
LIMIT 10000