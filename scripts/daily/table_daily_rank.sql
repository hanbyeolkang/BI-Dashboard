-- 일일 영화별 랭킹 테이블

CREATE TABLE adhoc.daily_rank AS
SELECT 
    b.showrange,
    b.rank,
    11 - b.rank AS reverse_rank,
    m.movieCd,
    m.movieNm
FROM raw_data.boxoffice AS b
LEFT JOIN raw_data.movie_Info AS m ON b.movieCd = m.movieCd
ORDER BY b.showrange, b.rank;