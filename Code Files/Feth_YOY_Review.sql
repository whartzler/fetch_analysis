SELECT 
    EXTRACT(YEAR FROM created_date) AS year, 
    COUNT(DISTINCT id) AS user_count,
    TO_CHAR(
        ROUND(
            (COUNT(DISTINCT id) - LAG(COUNT(DISTINCT id)) OVER (ORDER BY EXTRACT(YEAR FROM created_date))) * 100.0 / 
            NULLIF(LAG(COUNT(DISTINCT id)) OVER (ORDER BY EXTRACT(YEAR FROM created_date)), 0), 
        2), 
        'FM999.00"%"'
    ) AS yoy_growth_percentage
FROM public.user
GROUP BY year
ORDER BY year;
