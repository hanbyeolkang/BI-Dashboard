-- 일일 총 매출액, 관객수 테이블 생성 쿼리

CREATE TABLE adhoc.daily_sum AS
SELECT 
    b.showrange,
    CASE 
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 0 THEN '일'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 1 THEN '월'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 2 THEN '화'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 3 THEN '수'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 4 THEN '목'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 5 THEN '금'
        WHEN EXTRACT(DOW FROM b.showrange::DATE) = 6 THEN '토'
        ELSE '오류'
    END AS dayofweek_ko,
    SUM(b.salesamt) AS totalSalesAmt,
    SUM(b.audicnt) AS totalAudiCnt
FROM raw_data.boxoffice AS b
GROUP BY b.showrange
ORDER BY b.showrange;