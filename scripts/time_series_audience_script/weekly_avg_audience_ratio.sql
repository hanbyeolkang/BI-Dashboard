WITH weekly_data AS (
    SELECT
        b.movieCd,
        m.movieNm,
        FLOOR(DATEDIFF('day', m.openDt, b.showRange) / 7) + 1 AS open_week,
        SUM(b.audiCnt) AS week_audience,
        MAX(b.audiAcc) AS total_audience
    FROM raw_data.boxoffice b
    JOIN raw_data.movie_info m
        ON b.movieCd = m.movieCd
    GROUP BY b.movieCd, m.movieNm, FLOOR(DATEDIFF('day', m.openDt, b.showRange) / 7) + 1
)

SELECT
    open_week,
    AVG(week_audience::FLOAT / total_audience) AS avg_audience_ratio,
    COUNT(movieCd) AS movie_count
FROM weekly_data
where open_week >= 0
GROUP BY open_week
ORDER BY open_week;