CREATE SCHEMA IF NOT EXISTS reporting;

CREATE OR REPLACE VIEW reporting.flight as
SELECT
    f.*,
    (CASE WHEN f.dep_delay_new > 0 then 1 else 0 end) as is_delayed
FROM
    flight f
WHERE
    f.cancelled != 1
;

CREATE OR REPLACE VIEW reporting.top_reliability_roads AS
SELECT
    tr_w_oa.*,
    da.name AS dest_airport_name
FROM
    (SELECT
        tr.*,
        oa.name as origin_airport_name
    FROM
        (SELECT 
            origin_airport_id, 
            dest_airport_id,
            year,
            COUNT(*) AS cnt,
            1 - SUM(is_delayed)::numeric/COUNT(*)::numeric as reliability,
            row_number() OVER (ORDER BY 1 - SUM(is_delayed)::numeric/COUNT(*)::numeric DESC) AS nb
        FROM 
            reporting.flight 
        GROUP BY 
            origin_airport_id, dest_airport_id, year
        HAVING
            COUNT(*) > 10000

        ) tr
    LEFT JOIN
        (SELECT
            DISTINCT al.origin_airport_id,
            al.name
        FROM
            airport_list al
            LEFT JOIN
            reporting.flight rf
            ON
            rf.origin_airport_id=al.origin_airport_id
        ) oa
    ON
        tr.origin_airport_id=oa.origin_airport_id
    ) tr_w_oa
LEFT JOIN
    (SELECT
        DISTINCT al.origin_airport_id,
        al.name
    FROM
        airport_list al
    LEFT JOIN
        reporting.flight rf
    ON
        rf.dest_airport_id=al.origin_airport_id
    ) da
ON
    tr_w_oa.dest_airport_id=da.origin_airport_id
;


CREATE OR REPLACE VIEW reporting.year_to_year_comparison AS
SELECT 
    year,
    month,
    COUNT(*) AS flights_amount,
    1 - SUM(is_delayed)::numeric/COUNT(*)::numeric as reliability
FROM 
    reporting.flight 
GROUP BY 
    year, month
;


CREATE OR REPLACE VIEW reporting.day_to_day_comparison AS
SELECT 
    year,
    day_of_week,
    COUNT(*) AS flights_amount
FROM 
    reporting.flight 
GROUP BY 
    year, day_of_week
;

CREATE OR REPLACE VIEW reporting.day_by_day_reliability AS
SELECT 
    TO_DATE(year::text || LPAD(month::text, 2, '0') || LPAD(day_of_month::text, 2, '0'), 'YYYYMMDD') as date,
    SUM(is_delayed)::numeric/COUNT(*)::numeric as reliability
FROM 
    reporting.flight 
GROUP BY 
    date