DROP TABLE IF EXISTS adhoc.cum_perform;

CREATE TABLE adhoc.cum_perform AS

WITH addRank AS (
  SELECT
    showRange, movieCd, salesAcc, audiAcc,
    ROW_NUMBER() OVER(PARTITION BY movieCd ORDER BY showRange DESC) as showRangeRank
  FROM raw_data.boxoffice
),
finCal AS (
  SELECT
    showRange, B.openDt, A.movieCd, B.movieNm, salesAcc, audiAcc,
    ABS(DATEDIFF(DAY, B.openDt, showRange) + 1) AS totalDays,
    ROUND(CAST(audiAcc AS FLOAT) / (totalDays), 3) AS meanAud
  FROM addRank A
  JOIN raw_data.movie_info B ON A.movieCd = B.movieCd
  WHERE showRangeRank = 1
)

SELECT * FROM finCal
WHERE totalDays < 100