create table adhoc.daily_avg_audience_ratio as
WITH daily_data AS (
    SELECT
        b.movieCd,
        m.movieNm,
        DATEDIFF('day', m.openDt, b.showRange) AS days_after_release,
        SUM(b.audiCnt) AS day_audience,
        MAX(b.audiAcc) AS total_audience
    FROM raw_data.boxoffice b
    JOIN raw_data.movie_info m
        ON b.movieCd = m.movieCd
    GROUP BY b.movieCd, m.movieNm, DATEDIFF('day', m.openDt, b.showRange)
)
SELECT
    days_after_release,
    COUNT(movieCd) AS movie_count,
    SUM(day_audience) AS sum_day_audience,
    SUM(total_audience) AS sum_total_audience,
    (SUM(day_audience)::FLOAT / SUM(total_audience)) AS day_ratio
FROM daily_data
WHERE days_after_release BETWEEN 0 AND 13
GROUP BY days_after_release
ORDER BY days_after_release;
