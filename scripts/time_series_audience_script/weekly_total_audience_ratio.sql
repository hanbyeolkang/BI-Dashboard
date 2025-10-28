WITH weekly_data AS (
    SELECT
        b.movieCd,
        FLOOR(DATEDIFF('day', m.openDt, b.showRange) / 7) + 1 AS open_week,
        SUM(b.audiCnt) AS week_audience,
        MAX(b.audiAcc) AS total_audience
    FROM raw_data.boxoffice b
    JOIN raw_data.movie_info m
        ON b.movieCd = m.movieCd
    GROUP BY b.movieCd, FLOOR(DATEDIFF('day', m.openDt, b.showRange) / 7) + 1
),
weekly_sum AS (
    SELECT
        open_week,
        SUM(week_audience) AS sum_week_audience,
        SUM(total_audience) AS sum_total_audience
    FROM weekly_data
    GROUP BY open_week
)

SELECT
    open_week,
    sum_week_audience,
    sum_total_audience,
    (sum_week_audience::FLOAT / sum_total_audience) AS week_ratio
FROM weekly_sum
where open_week >= 0
ORDER BY open_week;