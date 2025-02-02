SELECT p.brand, SUM(t.final_sale) AS total_sale_per_receipt
    FROM PUBLIC.transactions AS t
    JOIN PUBLIC.products AS p 
        ON t.barcode = p.barcode
WHERE p.category_2 = 'Dips & Salsa'
and final_quantity > 0
AND p.brand IS NOT NULL
GROUP BY p.brand
order by SUM(distinct t.final_sale) desc
limit 1
