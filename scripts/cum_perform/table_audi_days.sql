CREATE TABLE adhoc.target_audi_days AS

WITH over30M AS (
  SELECT movieCd, showRange, audiAcc, ROW_NUMBER() OVER(PARTITION BY movieCd ORDER BY showRange) AS dayOver30M
  FROM raw_data.boxoffice
  WHERE audiAcc >= 300000
)
SELECT A.movieCd, B.movieNm, showRange, B.openDt, audiAcc, (DATEDIFF(DAY, B.openDt, showRange) + 1) AS dayAfterOpen
FROM over30M A
JOIN raw_data.movie_info B ON A.movieCd = B.movieCd
WHERE dayOver30M = 1 AND dayAfterOpen < 100;

-- 관객수가 많은 상위 5개의 영화의 경우 수집한 데이터보다 과거에 30만 관객을 달성함.
-- 해당 영화들에 대해서만 실제 값으로 임의 조작함.
UPDATE adhoc.target_audi_days
SET
  showRange = '2025-06-28',
  audiAcc = 348020,
  dayafteropen = 4
WHERE moviecd = 20254501;

--
UPDATE adhoc.target_audi_days
SET
  showRange = '2025-08-22',
  audiAcc = 543884,
  dayafteropen = 1
WHERE moviecd = 20253289;

--
UPDATE adhoc.target_audi_days
SET
  showRange = '2025-08-19',
  audiAcc = 300594,
  dayafteropen = 7
WHERE moviecd = 20210546;

--
UPDATE adhoc.target_audi_days
SET
  showRange = '2025-07-20',
  audiAcc = 388399,
  dayafteropen = 5
WHERE moviecd = 20254275;

--
UPDATE adhoc.target_audi_days
SET
  showRange = '2025-07-30',
  audiAcc = 462004,
  dayafteropen = 1
WHERE moviecd = 20241941;