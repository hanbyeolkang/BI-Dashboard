WITH movie_diff AS (
    SELECT
        b.movieCd,
        b.showRange,
        b.audiCnt,
        LAG(b.audiCnt) OVER (PARTITION BY b.movieCd ORDER BY b.showRange) AS prev_audiCnt,
        COALESCE(b.audiCnt - LAG(b.audiCnt) OVER (PARTITION BY b.movieCd ORDER BY b.showRange), 0) AS diff_from_prev
    FROM raw_data.boxoffice b
)

SELECT
    showRange,
    SUM(diff_from_prev) AS total_diff_from_prev,
    SUM(audiCnt) AS total_audience
FROM movie_diff
GROUP BY showRange
ORDER BY showRange;
