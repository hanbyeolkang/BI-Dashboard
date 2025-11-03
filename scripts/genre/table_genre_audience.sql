CREATE TABLE adhoc.genre_audience AS
SELECT 
    i.genre,
    b.moviecd,
    b.audiacc,
    b.salesacc
FROM raw_data.movie_info AS i
JOIN raw_data.boxoffice AS b
    ON i.moviecd = b.moviecd;
