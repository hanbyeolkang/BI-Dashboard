-- 일일 영화별 랭킹 테이블 (9월 관객수 기준 상위10 영화 한정)

CREATE TABLE adhoc.daily_rank AS
SELECT
  b.showrange,
  b.rank,
  (11 - b.rank) AS reverse_rank,
  b.movieCd,
  m.movieNm
FROM raw_data.boxoffice AS b
JOIN raw_data.movie_info AS m ON b.movieCd = m.movieCd
JOIN (
  SELECT
    movieCd
    ,SUM(audiCnt) as sumAudiCnt  -- 9월 관객수 합
  FROM raw_data.boxoffice
  GROUP BY movieCd
  ORDER BY sumAudiCnt DESC
  LIMIT 10
) AS t ON b.movieCd = t.movieCd


ALTER TABLE adhoc.daily_rank    
ADD COLUMN audiCnt INT;


UPDATE adhoc.daily_rank AS r
SET audicnt = b.audicnt
FROM raw_data.boxoffice AS b
WHERE r.showrange = b.showrange
  AND r.rank = b.rank;