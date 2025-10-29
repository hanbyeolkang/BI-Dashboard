WITH merged AS (
    SELECT
        -- 날짜 문자열 예: '2025-10-28~2025-10-28' → 앞부분만 자름
        SUBSTRING(b.showrange, 1, 10) AS date,
        m.genre,
        b.audicnt
    FROM raw_data.boxoffice b
    JOIN raw_data.movie_info m
        ON b.moviecd = m.moviecd
),
genre_daily AS (
    SELECT
        date,
        genre,
        SUM(audicnt) AS total_audicnt
    FROM merged
    GROUP BY date, genre
)
SELECT
    date,
    genre,
    total_audicnt,
    RANK() OVER (PARTITION BY date ORDER BY total_audicnt DESC) AS rank
FROM genre_daily
ORDER BY date, rank;